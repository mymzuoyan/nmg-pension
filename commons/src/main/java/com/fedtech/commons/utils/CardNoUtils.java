package com.fedtech.commons.utils;

import java.util.Calendar;

/**
 * @author lil
 * @date 2019/10/29 14:36
 */
public class CardNoUtils {

    /**
     * 检验身份证是否合法
     * @return
     */
    public static boolean isLegal(String idCard){
        boolean bool = false;
        int sum = 0;
        char checkBit[]={'1','0','X','9','8','7','6','5','4','3','2'};
        int []add={7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
        char []stringArr = idCard.toCharArray();
        for (int i=0;i<17;i++){
            sum +=add[i]*(stringArr[i]-'0');
        }
        if (stringArr[17]==checkBit[sum%11]){
            bool = true;
        }
        return bool;
    }

    /**
     * 获取年龄
     * @param idCard 身份编号
     * @return 年龄
     */
    public static int getAgeByIdCard(String idCard) {
        int iAge = 0;
        Calendar cal = Calendar.getInstance();
        String year = idCard.substring(6, 10);
        int iCurrYear = cal.get(Calendar.YEAR);
        iAge = iCurrYear - Integer.valueOf(year);
        return iAge;
    }

    /**
     * 获取生日
     * @param idCard 身份编号
     * @return 生日(yyyyMMdd)
     */
    public static String getBirthByIdCard(String idCard) {
        return idCard.substring(6, 10) + "-" + idCard.substring(10, 12) + "-" + idCard.substring(12, 14);
    }

    /**
     * 获取性别
     * @param idCard 身份编号
     * @return 性别(1-男，2-女，0-未知)
     */
    public static Integer getGenderByIdCard(String idCard) {
        Integer gender = null;
        String sCardNum = idCard.substring(16, 17);
        if (Integer.parseInt(sCardNum) % 2 != 0) {
            gender = 1;//男
        } else {
            gender = 2;//女
        }
        return gender;
    }
}
