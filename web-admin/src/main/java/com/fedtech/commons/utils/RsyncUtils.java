package com.fedtech.commons.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;

public class RsyncUtils {

	private static final int MOD_ADLER = 65521;
	private static final int DIFF_LENGTH = 2;
	private static final int EXIST_INDEX_LENGTH = 4;

	public static String generateFileId() {
		StringBuffer id = new StringBuffer(8);
		for (int i = 0; i < 8; i++) {
			id.append((char) (Math.random() * 26 + 97));
		}
		return id.toString();
	}

	private static int sumbytes(byte[] buf, int len) {
		int sum = 0;
		for (int i = 0; i < len; i++)
			sum += buf[i];
		return sum;
	}

	private static String calRollingHash(byte[] buf) {
		if (buf == null)
			return "";

		int b = 0;
		int a = (sumbytes(buf, buf.length) + 1) % MOD_ADLER;
		for (int i = 0; i < buf.length; i++) {
			b += sumbytes(buf, i + 1) + 1;
		}
		b %= MOD_ADLER;

		return String.format("%08x", (b << 16) | a);
	}

	static String cal_MD5(byte[] buf) {
		if (buf == null)
			return "";
		MessageDigest messagedigest = null;
		try {
			messagedigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException nsaex) {
			System.err.println("Init fail: MessageDigest does not support MD5Util。");
			nsaex.printStackTrace();
		}
		messagedigest.update(buf);

		BigInteger bigInt = new BigInteger(1, messagedigest.digest());

		String hexMd5Str = bigInt.toString(16);
		for (int i = 0; i < 32 - bigInt.toString(16).length(); i++) {
			hexMd5Str = "0" + hexMd5Str;
		}
		return hexMd5Str;
	}

	public static HashMap<String, String> gen_hashmap(String fileId, byte[] raw_data, int block_size, int share) {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		StringBuffer rolling_strBuf = new StringBuffer();
		StringBuffer md5_strBuf = new StringBuffer();
		String bs = new String();
		bs = String.valueOf(block_size);
		int len = 0;
		int offset = 0;
		if (block_size != 0) {
			len = raw_data.length / block_size;
			offset = raw_data.length % block_size;
		}

		for (int i = 0; i < len; i++) {
			byte[] byte_block = new byte[block_size];
			System.arraycopy(raw_data, block_size * i, byte_block, 0, block_size);
			String rolling_str = calRollingHash(byte_block);
			rolling_strBuf.append(rolling_str);

			String md5_str = cal_MD5(byte_block);
			md5_strBuf.append(md5_str);

			if (i < len - 1) {
				rolling_strBuf.append(",");
				md5_strBuf.append(",");
			}
		}

		if (offset != 0) {
			if (len > 0) {
				rolling_strBuf.append(",");
				md5_strBuf.append(",");
			}
			byte[] byte_block_offset = new byte[offset];
			System.arraycopy(raw_data, raw_data.length - offset, byte_block_offset, 0, offset);

			String rollingHash = calRollingHash(byte_block_offset);
			rolling_strBuf.append(rollingHash);

			String md5Hash = cal_MD5(byte_block_offset);
			md5_strBuf.append(md5Hash);
		}
		hashMap.put("repo", fileId);

		if (offset != 0)
			hashMap.put("bc", String.valueOf(len + 1));
		else
			hashMap.put("bc", String.valueOf(len));
		hashMap.put("share", String.valueOf(share));
		hashMap.put("bs", bs);
		hashMap.put("ls", String.valueOf(offset));
		hashMap.put("md5", md5_strBuf.toString());
		hashMap.put("r", rolling_strBuf.toString());
		return hashMap;
	}

	public static byte[] produce_asm(byte[] raw_files, HashMap<String, String> hashmap) {
		if (raw_files == null)
			return null;
		ArrayList<byte[]> finalPack = new ArrayList<byte[]>();
		if (hashmap.get("r") == null || hashmap.get("r").equals("[]")) {
			return packData(-1, raw_files, raw_files.length);
		}
		int finalPacklen = 0;

		String rolling_list = hashmap.get("r");
		String md5_list = hashmap.get("md5");

		String[] rolling_array = rolling_list.split("[\\[|,|\"|\\]]+");
		String[] md5_array = md5_list.split("[\\[|,|\"|\\]]+");
		int block_size = Integer.valueOf(hashmap.get("bs"));
		HashMap<String, Integer> rolling_map = new HashMap<String, Integer>();
		HashMap<String, Integer> md5_map = new HashMap<String, Integer>();

		for (int i = 0; i < rolling_array.length; i++) {
			// Log.e("", rolling_array[i]+ " " + md5_array[i]);
			rolling_map.put(rolling_array[i], i - 1);
			md5_map.put(md5_array[i], i - 1);
		}
		byte[] block = new byte[block_size];
		int cursor = 0;
		int positionRec = 0;
		byte[] raw_bytes = raw_files;
		int raw_file_len = raw_files.length;
		String rollingHash, md5Hash;
		while (rolling_map.size() != 0) {
			if (cursor >= raw_file_len - block_size + 1) {
				break;
			}
			System.arraycopy(raw_bytes, cursor, block, 0, block_size);

			rollingHash = String.valueOf(calRollingHash(block));
			if (rolling_map.containsValue(rollingHash)) {
				md5Hash = cal_MD5(block);
				if (md5_map.containsKey(md5Hash)) {
					byte[] diffData = new byte[cursor - positionRec];
					if (cursor - positionRec != 0)
						System.arraycopy(raw_bytes, positionRec, diffData, 0, cursor - positionRec);

					// exsit
					byte[] part = packData(md5_map.get(md5Hash), diffData, cursor - positionRec);
					finalPacklen += part.length;
					finalPack.add(part);
					cursor += block_size;
					positionRec = cursor;
				} else {
					// not found
					cursor += 1;
				}
			} else {
				// not found
				cursor += 1;
			}

		}

		finalPacklen = lastPackCheck(finalPack, finalPacklen, rolling_map, md5_map, positionRec, raw_bytes, raw_file_len);
		return stickByteArray(finalPack, finalPacklen);
	}

	private static int lastPackCheck(ArrayList<byte[]> finalPack, int finalPacklen, HashMap<String, Integer> rolling_map,
			HashMap<String, Integer> md5_map, int positionRec, byte[] raw_bytes, int raw_file_len) {
		String rollingHash;
		String md5Hash;
		byte[] diffData;
		if (raw_file_len - positionRec != 0) {
			diffData = new byte[raw_file_len - positionRec];
			System.arraycopy(raw_bytes, positionRec, diffData, 0, raw_file_len - positionRec);
			rollingHash = String.valueOf(calRollingHash(diffData));
			if (rolling_map.size() != 0 && rolling_map.containsKey(rollingHash)) {
				md5Hash = cal_MD5(diffData);
				if (md5_map.containsKey(md5Hash)) {
					// exsit
					byte[] part = packData(md5_map.get(md5Hash), null, 0);
					finalPacklen += part.length;
					finalPack.add(part);
				} else {
					// not found
					byte[] part = packData(-1, diffData, raw_file_len - positionRec);
					finalPacklen += part.length;
					finalPack.add(part);
				}
			} else {
				// not found
				byte[] part = packData(-1, diffData, raw_file_len - positionRec);
				finalPacklen += part.length;
				finalPack.add(part);
			}
		}
		return finalPacklen;
	}

	private static byte[] packData(int idx, byte[] diffData, int datalen) {
		byte[] parts;
		int initPosition = 0;
		if (datalen != 0 && idx == -1)
			parts = new byte[1 + DIFF_LENGTH + datalen];
		else if (datalen != 0 && idx != -1) {
			initPosition = 1 + DIFF_LENGTH + datalen;
			parts = new byte[1 + DIFF_LENGTH + datalen + 1 + EXIST_INDEX_LENGTH];
		} else {
			parts = new byte[1 + EXIST_INDEX_LENGTH];
		}

		if (datalen != 0) {
			parts[0] = 'd';
			byte[] len = transferToBigEndian(datalen, DIFF_LENGTH);
			parts[1] = len[0];
			parts[2] = len[1];
			System.arraycopy(diffData, 0, parts, 3, datalen);
		}
		if (idx == -1)
			return parts;

		parts[initPosition] = 'e';
		for (int i = 0; i < EXIST_INDEX_LENGTH; i++) {
			parts[initPosition + i + 1] = transferToBigEndian(idx, EXIST_INDEX_LENGTH)[i];
		}
		return parts;
	}

	private static byte[] transferToBigEndian(long num, int count) {
		byte[] output = new byte[count];
		for (int i = count; i > 0; i--) {
			output[count - i] = (byte) ((num >> (8 * (i - 1))) & 0xff);
		}
		return output;
	}

	private static byte[] stickByteArray(ArrayList<byte[]> list, int packLen) {

		byte[] finalPack = new byte[packLen];
		int listLen = list.size();
		int cursor = 0;
		for (int i = 0; i < listLen; i++) {
			byte[] listItem = list.get(i);
			System.arraycopy(listItem, 0, finalPack, cursor, listItem.length);
			cursor += listItem.length;
		}
		return finalPack;
	}

	// for test only
	public static String stringToByteArray(byte[] finalData) {
		StringBuilder transferedString = new StringBuilder();
		for (int i = 0; i < finalData.length; i++) {
			transferedString.append(String.format("%02x", finalData[i]));

		}
		return transferedString.toString();
	}

	public static byte[] generateNewFile(byte[] raw_files, byte[] server_pack, int block_size) {
		if (server_pack == null)
			return null;
		int currentPosition = 0;
		int rawfilePosition = 0;
		StringBuffer new_file_buffer1 = new StringBuffer();
		// for(byte a : server_pack)
		// {
		// new_file_buffer1.append(a+" ");
		// }
		// CSSLog.showlog("", new_file_buffer1.toString()+"***********");

		byte[] new_file_buffer = new byte[0];
		int last_block_size = 0;
		int block_account = 0;
		if (block_size != 0) {
			last_block_size = raw_files.length % block_size;
			block_account = raw_files.length / block_size;
		}
		if (last_block_size != 0) {
			block_account += 1;
		}

		int packLen = server_pack.length;
		for (int i = 0; i < packLen; i++) {
			// for(int j = 0; j < new_file_buffer.length; j++)
			// {
			// CSSLog.showlog(" new_file_buffer.length ", new_file_buffer[j] +
			// new_file_buffer.length+" ");
			// }
			// 存在
			if (server_pack[i] == 'e') {
				int index = 0;
				for (int j = 0; j < EXIST_INDEX_LENGTH; j++) {
					index += (server_pack[currentPosition + j + 1] & 0xff) << (8 * (EXIST_INDEX_LENGTH - j - 1));
				}
				currentPosition += 1 + EXIST_INDEX_LENGTH;
				// 处理最后一个block
				if (last_block_size != 0 && index == block_account - 1) {
					byte[] tempBuffer = new byte[new_file_buffer.length];
					tempBuffer = new_file_buffer;
					new_file_buffer = new byte[new_file_buffer.length + last_block_size];

					if (tempBuffer.length != 0)
						System.arraycopy(tempBuffer, 0, new_file_buffer, 0, tempBuffer.length);

					if (raw_files.length >= (rawfilePosition + last_block_size))
						System.arraycopy(raw_files, rawfilePosition, new_file_buffer, new_file_buffer.length - last_block_size, last_block_size);
					break;
				}
				// 处理正常block
				else {
					byte[] tempBuffer = new byte[new_file_buffer.length];
					tempBuffer = new_file_buffer;
					new_file_buffer = new byte[new_file_buffer.length + block_size];
					if (tempBuffer.length != 0)
						System.arraycopy(tempBuffer, 0, new_file_buffer, 0, tempBuffer.length);
					if (raw_files.length > index * block_size)
						System.arraycopy(raw_files, index * block_size, new_file_buffer, new_file_buffer.length - block_size, block_size);
					rawfilePosition = (index + 1) * block_size;
				}
				i = currentPosition - 1;
			} else if (server_pack[i] == 'd') {
				int length = 0;
				for (int j = 0; j < DIFF_LENGTH; j++) {
					length += (server_pack[currentPosition + j + 1] & 0xff) << (8 * (DIFF_LENGTH - j - 1));
				}

				byte[] tempBuffer = new byte[new_file_buffer.length];
				tempBuffer = new_file_buffer;
				new_file_buffer = new byte[new_file_buffer.length + length];

				if (tempBuffer.length != 0)
					System.arraycopy(tempBuffer, 0, new_file_buffer, 0, tempBuffer.length);
				System.arraycopy(server_pack, currentPosition + 3, new_file_buffer, new_file_buffer.length - length, length);

				currentPosition += 1 + DIFF_LENGTH + length;
				rawfilePosition += block_size;
				i = currentPosition - 1;
			} else {
				try {
					throw new Exception("unknown prefix");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return new_file_buffer;
	}

}
