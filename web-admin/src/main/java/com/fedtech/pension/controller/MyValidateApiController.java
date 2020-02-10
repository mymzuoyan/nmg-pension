package com.fedtech.pension.controller;

import com.fedtech.commons.data.JsonResult;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.org.entity.UserFuWu;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Hashtable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author zhnn
 * @date 2017/2/23
 */
@RequestMapping("/admin/api/validate/")
@Controller
public class MyValidateApiController extends BaseController {
    /*********************************** 身份证验证开始 ****************************************/
    /**
     * 身份证号码验证 ：
     * 1、号码的结构 公民身份号码是特征组合码，由十七位数字本体码和一位校验码组成。
     * 排列顺序从左至右依次为：六位数字地址码，八位数字出生日期码，三位数字顺序码和一位数字校验码。
     * 2、地址码(前六位数)表示编码对象常住户口所在县(市、旗、区)的行政区划代码，按GB/T2260的规定执行。
     * 3、出生日期码（第七位至十四位）表示编码对象出生的年、月、日，按GB/T7408的规定执行，年、月、日代码之间不用分隔符。
     * 4、顺序码（第十五位至十七位）表示在同一地址码所标识的区域范围内，对同年、同月、同日出生的人编定的顺序号，
     * 顺序码的奇数分配给男性，偶数分配给女性。
     * 5、校验码（第十八位数） （1）十七位数字本体码加权求和公式 S = Sum(Ai * Wi), i =
     * 0, ... , 16 ，先对前17位数字的权求和 Ai:表示第i位置上的身份证号码数字值 Wi:表示第i位置上的加权因子 Wi: 7 9 10
     * 5 8 4 2 1 6 3 7 9 10 5 8 4 2 （2）计算模 Y = mod(S, 11) （3）通过模得到对应的校验码 Y: 0 1
     * 2 3 4 5 6 7 8 9 10 校验码: 1 0 X 9 8 7 6 5 4 3 2
     */

    /**
     * 功能：身份证的有效验证
     *
     * @param idStr 身份证号
     * @return 有效：返回"" 无效：返回String信息
     */
    @RequestMapping("idCard")
    @ResponseBody
    public JsonResult IDCardValidate(@RequestParam("idStr") String idStr, @RequestParam("flag") String flag) {
        idStr = idStr.toLowerCase();
        JsonResult result = new JsonResult();
        try {
            String errorInfo = "";// 记录错误信息
            // ValCodeArr:校验码列表
            String[] ValCodeArr = {"1", "0", "x", "9", "8", "7", "6", "5",
                    "4", "3", "2"};
            // Wi:第i位置上的加权因子
            String[] Wi = {"7", "9", "10", "5", "8", "4", "2", "1", "6", "3",
                    "7", "9", "10", "5", "8", "4", "2"};
            String Ai = "";
            // ================ 判断身份证号码的长度是否正确（15位或18位） ================//
            if (idStr.length() != 15 && idStr.length() != 18) {
                errorInfo = "身份证号码长度应该为15位或18位。";
                result.markError(errorInfo);
                return result;
            }
            // ================ 数字 除最后一位其他都是数字组成 ================//
            // 分两种情况15位的和18位的，截取除最后一位的字符串
            if (idStr.length() == 18) {
                Ai = idStr.substring(0, 17);
            } else if (idStr.length() == 15) {
                Ai = idStr.substring(0, 6) + "19" + idStr.substring(6, 15);
            }
            // 调用isNumeric方法判断字符串是否都是数字组成
            if (isNumeric(Ai) == false) {
                errorInfo = "身份证15位号码都应为数字 ; 18位号码除最后一位外，都应为数字。";
                result.markError(errorInfo);
                return result;
            }

            // ================ 截取身份证出生年月检验是否有效 ================//
            String strYear = Ai.substring(6, 10);// 年份
            String strMonth = Ai.substring(10, 12);// 月份
            String strDay = Ai.substring(12, 14);// 月份
            // 检验格式是否正确
            if (isDate(strYear + "-" + strMonth + "-" + strDay) == false) {
                errorInfo = "身份证生日无效。";
                result.markError(errorInfo);
                return result;
            }
            // 检验生日是否在有效期内
            // GregorianCalendar类提供了世界上大多数国家/地区使用的标准日历系统
            GregorianCalendar gc = new GregorianCalendar();
            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
            if ((gc.get(Calendar.YEAR) - Integer.parseInt(strYear)) > 150
                    || (gc.getTime().getTime() - s.parse(
                    strYear + "-" + strMonth + "-" + strDay).getTime()) < 0) {
                errorInfo = "身份证生日不在有效范围。";
                result.markError(errorInfo);
                return result;
            }
            if (Integer.parseInt(strMonth) > 12
                    || Integer.parseInt(strMonth) == 0) {
                errorInfo = "身份证月份无效";
                result.markError(errorInfo);
                return result;
            }
            if (Integer.parseInt(strDay) > 31 || Integer.parseInt(strDay) == 0) {
                errorInfo = "身份证日期无效";
                result.markError(errorInfo);
                return result;
            }
            // ================ 地区码是否有效 ================//
            Hashtable h = GetAreaCode();
            if (h.get(Ai.substring(0, 2)) == null) {
                errorInfo = "身份证地区编码错误！";
                result.markError(errorInfo);
                return result;
            }
            // ================ 判断最后一位的值 ================//
            // 对前17位数字本体码加权求和 公式为：S = Sum(Ai * Wi)
            int TotalmulAiWi = 0;
            for (int i = 0; i < 17; i++) {
                TotalmulAiWi = TotalmulAiWi
                        + Integer.parseInt(String.valueOf(Ai.charAt(i)))
                        * Integer.parseInt(Wi[i]);
            }
            int modValue = TotalmulAiWi % 11;
            String strVerifyCode = ValCodeArr[modValue];
            Ai = Ai + strVerifyCode;

            if (idStr.length() == 18) {
                if (Ai.equals(idStr) == false) {
                    errorInfo = "身份证无效，不是合法的身份证号码";
                    result.markError(errorInfo);
                    return result;
                }
            }
            Object object = autoAnalysisIdentity(idStr, flag);
            result.markSuccess("身份证正确", object);
            return result;
        } catch (Exception e) {
            // 异常错误日志
            result.markError("身份证验证方法异常");
            System.out.println("身份证验证方法异常:" + e.getMessage());
            return result;
        }
    }

    /**
     * 功能：设置地区编码
     *
     * @return Hashtable 对象
     */
    @SuppressWarnings("unchecked")
    private Hashtable GetAreaCode() {
        Hashtable hashtable = new Hashtable();
        hashtable.put("11", "北京");
        hashtable.put("12", "天津");
        hashtable.put("13", "河北");
        hashtable.put("14", "山西");
        hashtable.put("15", "内蒙古");
        hashtable.put("21", "辽宁");
        hashtable.put("22", "吉林");
        hashtable.put("23", "黑龙江");
        hashtable.put("31", "上海");
        hashtable.put("32", "江苏");
        hashtable.put("33", "浙江");
        hashtable.put("34", "安徽");
        hashtable.put("35", "福建");
        hashtable.put("36", "江西");
        hashtable.put("37", "山东");
        hashtable.put("41", "河南");
        hashtable.put("42", "湖北");
        hashtable.put("43", "湖南");
        hashtable.put("44", "广东");
        hashtable.put("45", "广西");
        hashtable.put("46", "海南");
        hashtable.put("50", "重庆");
        hashtable.put("51", "四川");
        hashtable.put("52", "贵州");
        hashtable.put("53", "云南");
        hashtable.put("54", "西藏");
        hashtable.put("61", "陕西");
        hashtable.put("62", "甘肃");
        hashtable.put("63", "青海");
        hashtable.put("64", "宁夏");
        hashtable.put("65", "新疆");
        hashtable.put("71", "台湾");
        hashtable.put("81", "香港");
        hashtable.put("82", "澳门");
        hashtable.put("91", "国外");
        return hashtable;
    }

    /**
     * 功能：判断字符串是否为数字
     *
     * @param str
     * @return
     */
    private boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        return isNum.matches();
    }

    /**
     * 功能：判断字符串是否为日期格式
     *
     * @param strDate
     * @return
     */
    public static boolean isDate(String strDate) {
        Pattern pattern = Pattern
                .compile("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\s(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
        Matcher m = pattern.matcher(strDate);
        return m.matches();
    }
    /*********************************** 身份证验证结束 ****************************************/

    /**
     * 分析身份证生日及年龄及性别
     *
     * @param idStr
     * @return
     */
    public Object autoAnalysisIdentity(String idStr, String flag) {
        try {
            if (idStr == null || idStr.equals("")) {
                // 打印错误日志
                return null;
            }
            // 计算性别
            String gender = getGender(idStr);

            // 计算年龄
            if (idStr.length() == 15) {
                idStr = idStr.substring(0, 6) + "19" + idStr.substring(6, 15);
            }
            SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
            String birthday = idStr.substring(6, 10) + "-" + idStr.substring(10, 12) + "-" + idStr.substring(12, 14);
            int nAge = getAge(sFormat.parse(birthday));

            if (flag.equals("elder")) {
                ElderlyMsg elderlyMsg = new ElderlyMsg();
                elderlyMsg.setAge(nAge);
                elderlyMsg.setBirthday(birthday);
                if (gender.equals("男")) {
                    elderlyMsg.setSexDictId(1);
                } else if (gender.equals("女")) {
                    elderlyMsg.setSexDictId(2);
                }
                return elderlyMsg;
            }
            if (flag.equals("fuwu")) {
                UserFuWu userFuWu = new UserFuWu();
                userFuWu.setAge(nAge);
                userFuWu.setGender(gender);
                return userFuWu;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 根据身份证号计算年龄
     *
     * @param birthDate
     * @return
     */
    public static int getAge(Date birthDate) {

        int age = 0;

        Date now = new Date();

        SimpleDateFormat format_y = new
                SimpleDateFormat("yyyy");
        SimpleDateFormat format_M = new
                SimpleDateFormat("MM");
        SimpleDateFormat format_d = new
                SimpleDateFormat("dd");

        String birth_year =
                format_y.format(birthDate);
        String this_year =
                format_y.format(now);

        String birth_month =
                format_M.format(birthDate);
        String this_month =
                format_M.format(now);

        String birth_day =
                format_d.format(birthDate);
        String this_day =
                format_d.format(now);

        // 初步，估算
        age = Integer.parseInt(this_year) - Integer.parseInt(birth_year);

        // 如果未到出生月份，则age - 1
        if (birth_month.compareTo(this_month) >= 0) {
            // 如果到出生月份，未到出生日期 ，则age-1
            if (birth_month.compareTo(this_month) == 0) {
                if (birth_day.compareTo(this_day) > 0) {
                    age -= 1;
                }
            } else {
                age -= 1;
            }
        }

        if (age < 0)
            age = 0;
        return age;
    }

    /**
     * 计算性别
     *
     * @param idStr
     * @return
     */
    public String getGender(String idStr) {
        String gender = "";
        if (idStr.length() == 15) {
            gender = idStr.substring(14, 15);
        } else {
            gender = idStr.substring(16, 17);
        }
        if (Integer.parseInt(gender) % 2 == 0) {
            gender = "女";
        } else {
            gender = "男";
        }
        return gender;
    }

    @Test
    public void test(){

        System.out.println(((ElderlyMsg)autoAnalysisIdentity("320104370324242","elder")).getAge());
    }

}
