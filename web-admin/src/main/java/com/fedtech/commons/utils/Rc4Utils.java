package com.fedtech.commons.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.TreeMap;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 * Created by yy on 2016/1/11.
 */
public class Rc4Utils {

	private static String CHARSET = "UTF-8";
	// hmacsha1 related
	private static final String EMPTY_STRING = "";
	private static final String CARRIAGE_RETURN = "\r\n";
	private static final String HMAC_SHA1 = "HmacSHA1";

	public static String doRc4(String appkey, String appsecret, TreeMap<String, String> treeMap) {
		String paramString = joinString(treeMap, false);
		String a = RsyncUtils
				.stringToByteArray(new RC4(charToByteArray(appsecret.toCharArray())).encrypt(charToByteArray(paramString.toCharArray())));
		String signature = getSignature(paramString, appsecret, "");

		TreeMap<String, String> dict = new TreeMap<String, String>();
		dict.put("k", appkey);
		dict.put("a", a);
		dict.put("h", signature);
		dict.put("v", "1");

		return joinString(dict, false);
	}

	public static byte[] charToByteArray(char[] charArray) {

		byte[] input = new byte[charArray.length];
		int i = 0;
		for (char ch : charArray) {
			input[i] = (byte) ch;
			i++;
		}
		return input;
	}

	/**
	 * byte[]转int
	 * 
	 * @param bytes
	 * @return
	 */
	public static long byteArrayToInt(byte[] bytes) {
		long value = 0;
		// 由高位到低位
		for (int i = 0; i < bytes.length; i++) {
			int shift = (bytes.length - 1 - i) * 8;
			System.out.println("shift = " + shift);
			value += (bytes[i] & 0x000000FF) << shift;// 往高位游
		}
		return value;
	}

	/**
	 * 
	 * @param i
	 * @return
	 */
	public static byte[] intToByteArray(long i) {
		String num = "" + i;
		byte[] result = new byte[num.length()];
		for (int j = 0; j < result.length; j++) {
			int shift = (result.length - 1 - j) * 8;
			System.out.println("shift = " + shift);
			result[j] = (byte) ((i >> shift) & 0x000000FF);
		}
		return result;
	}

	private static String joinString(TreeMap<String, String> dict, boolean encode) {
		if (dict == null)
			return null;
		StringBuffer content = new StringBuffer();
		int i = 0;
		int size = dict.size();
		for (Map.Entry<String, String> entry : dict.entrySet()) {
			if (entry.getValue() == null)
				return null;
			if (encode)
				try {
					content.append(String.format("%s=%s", URLEncoder.encode(entry.getKey(), CHARSET), URLEncoder.encode(entry.getValue(), CHARSET)));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			else {
				content.append(String.format("%s=%s", entry.getKey(), entry.getValue()));
			}
			i++;
			if (i == size)
				break;
			content.append("&");
		}
		return content.toString();
	}

	/**
	 * {@inheritDoc}
	 */
	private static String getSignature(String baseString, String apiSecret, String tokenSecret) {
		try {
			return doSign(baseString, apiSecret);
		} catch (Exception e) {
			return null;
		}
	}

	private static String doSign(String toSign, String keyString) throws Exception {
		SecretKeySpec key = new SecretKeySpec((keyString).getBytes(CHARSET), HMAC_SHA1);
		Mac mac = Mac.getInstance(HMAC_SHA1);
		mac.init(key);
		byte[] bytes = mac.doFinal(toSign.getBytes(CHARSET));
		return RsyncUtils.stringToByteArray(bytes).replace(CARRIAGE_RETURN, EMPTY_STRING);
	}
}
