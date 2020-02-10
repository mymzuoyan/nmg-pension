package com.fedtech.commons.utils;

import java.io.*;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

public class StringHelper {
    public String ArrayToString(String[] strArray, String splitFlag) {
        String tmpString = "";
        if (strArray.length == 0) {
            tmpString = "";
        } else {
            for (int i = 0; i < strArray.length; i++) {
                tmpString = tmpString + strArray[i];
                if (i < strArray.length - 1) {
                    tmpString = tmpString + splitFlag;
                }
            }
        }
        tmpString = tmpString.trim();
        return tmpString;
    }

    public String ArrayToString2(String[] strArray, String splitFlag) {
        String tmpString = "";
        if (strArray.length == 0) {
            tmpString = "''";
        } else {
            for (int i = 0; i < strArray.length; i++) {
                tmpString = tmpString + "'" + strArray[i] + "'";
                if (i < strArray.length - 1) {
                    tmpString = tmpString + splitFlag;
                }
            }
        }
        tmpString = tmpString.trim();
        return tmpString;
    }

    public static String getFileExt(String fileName) {
        String value = new String();
        int start = 0;
        int end = 0;
        if (fileName == null)
            return null;
        start = fileName.lastIndexOf(46) + 1;
        end = fileName.length();
        value = fileName.substring(start, end);
        if (fileName.lastIndexOf(46) > 0)
            return value;
        else
            return "";
    }

    public boolean isNumeric(String strData, boolean dotFlag) {
        if (strData == null) {
            return false;
        }
        char[] numbers = strData.toCharArray();
        for (int i = 0; i < numbers.length; i++) {
            if (dotFlag) {
                if (!Character.isDigit(numbers[i]))
                    return false;
            } else {
                if (!Character.isDigit(numbers[i]) && numbers[i] != '.')
                    return false;
            }
        }
        if (strData.lastIndexOf(46) != strData.indexOf(46))
            return false;
        return true;
    }

    public static String changeChinese(String chnString) {
        String strChinese = null;
        byte[] temp;
        if (chnString == null || chnString == "") {
            return new String("");
        }
        try {
            temp = chnString.getBytes("ISO-8859-1");
            strChinese = new String(temp);
        } catch (UnsupportedEncodingException e) {
            System.out.println(e);
        }
        return strChinese;
    }

    public static String changeSybase(String chnString) {
        String strChinese = null;
        byte[] temp;
        if (chnString == null || chnString == "") {
            return new String("");
        }
        try {
            temp = chnString.getBytes("gb2312");
            strChinese = new String(temp);
        } catch (UnsupportedEncodingException e) {
            System.out.println(e);
        }
        return strChinese;
    }

    public static String Replace(String source, String oldString,
                                 String newString) {
        StringBuffer output = new StringBuffer();

        int lengthOfSource = source.length(); // Դ�ַ���
        int lengthOfOld = oldString.length(); // ���滻�ַ���

        int posStart = 0; // ��ʼ����λ��
        int pos; // �������ַ��λ��?

        while ((pos = source.indexOf(oldString, posStart)) >= 0) {
            output.append(source.substring(posStart, pos));

            output.append(newString);
            posStart = pos + lengthOfOld;
        }
        if (posStart < lengthOfSource) {
            output.append(source.substring(posStart));
        }
        return output.toString();
    }

    public static String Left(String sourceString, int nLength) {
        if (sourceString == null || sourceString == ""
                || sourceString.length() <= nLength) {
            return sourceString;
        }
        return sourceString.substring(0, nLength);
    }

    public static String Reverse(String strReverse) {
        if (strReverse == null) {
            return strReverse;
        } else {
            StringBuffer tmpString = new StringBuffer(strReverse);

            tmpString = tmpString.reverse();

            return tmpString.toString();
        }
    }

    public static String Right(String sourceString, int nLength) {
        if (sourceString == null || sourceString == ""
                || sourceString.length() <= nLength) {
            return sourceString;
        }
        return sourceString.substring(sourceString.length() - nLength,
                sourceString.length());
    }

    public static String Mid(String sourceString, int nStart, int nLength) {
        try {
            if (sourceString == null || sourceString == "") {
                return sourceString;
            }
            int Length = sourceString.length();
            if (nStart > Length || nStart < 0) {
                return null;
            }
            if ((nStart + nLength) > Length)
                return sourceString.substring(nStart, Length);
            return sourceString.substring(nStart, nStart + nLength);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static String toSql(String str) {
        String sql = new String(str);
        return Replace(sql, "'", "''");
    }

    public static String toHtmlInput(String str) {
        if (str == null)
            return null;

        String html = new String(str);

        html = Replace(html, "&", "&amp;");
        html = Replace(html, "<", "&lt;");
        html = Replace(html, ">", "&gt;");

        return html;
    }

    public static String toHtml(String str) {
        if (str == null) {
            return null;
        }

        String html = new String(str);

        html = toHtmlInput(html);
        html = Replace(html, "\r\n", "\n");
        html = Replace(html, "\n", "<br>");
        html = Replace(html, "\t", "    ");
        html = Replace(html, " ", " &nbsp;");

        return html;
    }

    public static String notEmpty(Object value) {
        if (value == null) {
            value = "";
        }
        return String.valueOf(value);
    }

    public static String get(Map map, String keyName) {
        return notEmpty(map.get(keyName));
    }

    public static double getDouble(Map map, String keyName) {
        String str = notEmpty(map.get(keyName));
        if (str.equals(""))
            str = "0";
        return Double.parseDouble(str);
    }

    public static float getFloat(Map map, String keyName) {
        String str = notEmpty(map.get(keyName));
        if (str.equals(""))
            str = "0";
        return Float.parseFloat(str);
    }

    public static double getInt(Map map, String keyName) {
        String str = notEmpty(map.get(keyName));
        if (str.equals(""))
            str = "0";
        return Integer.parseInt(str);
    }

    /**
     * ��ȡmap��Ӧ�ļ�ֵ�������ֵΪ���򷵻ش�����Ϣ
     *
     * @param map
     * @param keyName
     * @param resultMap
     * @return
     */
    public static String getKeyValue(Map map, String keyName, Map resultMap) {
        String keyValue = notEmpty(map.get(keyName));
        if (keyValue.equals("")) {
            resultMap.put("errMsg", keyName + "��ֵ��ʧ��");
            resultMap.put("result", 0);
        }
        return keyValue;
    }

    /**
     * �滻�����ַ���
     *
     * @param sql
     * @param params
     */
    public String getSql(String sql, Object[] params) {
        //StringHelper str = new StringHelper();
        int idx = -1;
        int i = 0;
        String tmp = sql;
        while ((idx = tmp.indexOf("?")) > -1) {
            tmp = tmp.replaceFirst("\\?", "'" + StringHelper.toSql(StringHelper.notEmpty(params[i++]))
                    + "'");
        }
        return tmp;
    }

    public static String toUtf8String(String s) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 0 && c <= 255) {
                sb.append(c);
            } else {
                byte[] b;
                try {
                    b = Character.toString(c).getBytes("utf-8");
                } catch (Exception ex) {
                    System.out.println(ex);
                    b = new byte[0];
                }
                for (int j = 0; j < b.length; j++) {
                    int k = b[j];
                    if (k < 0)
                        k += 256;
                    sb.append("%" + Integer.toHexString(k).toUpperCase());
                }
            }
        }
        return sb.toString();
    }

    public static String ListToString(List list, String key, String split) {
        String str = "";
        for (int i = 0; i < list.size(); i++) {
            Map map = (Map) list.get(i);
            str += get(map, key) + split;
        }
        if (!"".equals(str))
            str = str.substring(0, str.lastIndexOf(split));
        return str;

    }

    public static String listToStringWithDistinct(List list, String key, String split) {
        String str = "";
        List<String> lst = new ArrayList<String>();
        for (int i = 0; i < list.size(); i++) {
            Map map = (Map) list.get(i);
            String value = get(map, key);
            if (!lst.contains(value) && !value.equals("")) {
                lst.add(value);
                str += value + split;
            }
        }
        if (!"".equals(str))
            str = str.substring(0, str.lastIndexOf(split));
        else
            str = "''";
        return str;
    }

    public static String listToStringWithDistinct2(List list, String key, String split) {
        String str = "";
        List<String> lst = new ArrayList<String>();
        for (int i = 0; i < list.size(); i++) {
            Map map = (Map) list.get(i);
            String value = get(map, key);
            if (!lst.contains(value) && !value.equals("")) {
                lst.add(value);
                str += value + split;
            }
        }
        if (!"".equals(str))
            str = str.substring(0, str.lastIndexOf(split));
        else
            str = "";
        return str;
    }

    public static String toUTF8(String str) {
        String s = str;
        try {
            StringBuffer result = new StringBuffer();
            for (int i = 0; i < s.length(); i++)
                if (s.charAt(i) > '\177') {
                    result.append("&#x");
                    String hex = Integer.toHexString(s.charAt(i));
                    StringBuffer hex4 = new StringBuffer(hex);
                    hex4.reverse();
                    int len = 4 - hex4.length();
                    for (int j = 0; j < len; j++)
                        hex4.append('0');

                    for (int j = 0; j < 4; j++)
                        result.append(hex4.charAt(3 - j));

                    result.append(';');
                } else {
                    result.append(s.charAt(i));
                }

            return result.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return s;
        }
    }

    public static String encoderByMd5(String str)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        byte[] unencodedPassword = str.getBytes();
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            return str;
        }
        md.reset();
        md.update(unencodedPassword);
        byte[] encodedPassword = md.digest();
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < encodedPassword.length; i++) {
            if ((encodedPassword[i] & 0xff) < 0x10) {
                buf.append("0");
            }
            buf.append(Long.toString(encodedPassword[i] & 0xff, 16));
        }
        return buf.toString();
    }

    public static String convertFileSize(long filesize) {
        String strUnit = "B";
        String strAfterComma = "";
        int intDivisor = 1;
        if (filesize >= 1024 * 1024) {
            strUnit = "MB";
            intDivisor = 1024 * 1024;
        } else if (filesize >= 1024) {
            strUnit = "KB";
            intDivisor = 1024;
        }
        if (intDivisor == 1)
            return filesize + strUnit;

        strAfterComma = "" + 100 * (filesize % intDivisor) / intDivisor;
        if (strAfterComma == "")
            strAfterComma = ".0";
        return filesize / intDivisor + "." + strAfterComma + strUnit;
    }

    public static List distinctList(List list, final String key, final String orderKey) {
        List<Map> lst = (List) byteClone(list);
        if (orderKey != null)
            Collections.sort(lst, new Comparator<Map>() {
                public int compare(Map m1, Map m2) {
                    if (m1.get(orderKey) instanceof Number) {
                        BigDecimal n1 = (BigDecimal) m1.get(orderKey);
                        BigDecimal n2 = (BigDecimal) m1.get(orderKey);
                        return n1.compareTo(n2);
                    } else {
                        String s1 = get(m1, orderKey);
                        String s2 = get(m2, orderKey);
                        return s1.compareTo(s2);
                    }
                }
            });
        String temp = null;
        for (Iterator<Map> iter = lst.iterator(); iter.hasNext(); ) {
            Map mapCur = iter.next();
            String curValue = get(mapCur, key);
            if (curValue.equals(temp))
                iter.remove();
            else
                temp = curValue;
        }
        return lst;
    }


    public static final Object byteClone(Object src) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(baos);
            out.writeObject(src);
            out.close();
            ByteArrayInputStream bin = new ByteArrayInputStream(baos
                    .toByteArray());
            ObjectInputStream in = new ObjectInputStream(bin);
            Object clone = in.readObject();
            in.close();
            return (clone);
        } catch (ClassNotFoundException e) {
            throw new InternalError(e.toString());
        } catch (StreamCorruptedException e) {
            throw new InternalError(e.toString());
        } catch (IOException e) {
            throw new InternalError(e.toString());
        }
    }
}