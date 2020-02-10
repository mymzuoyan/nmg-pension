package com.fedtech.commons.utils;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.util.StringUtils;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author gengqiang
 * @date 2018/1/2
 */
public class ExportExcelUtil {
    public static String getValue(String value, String fieldName) {
        String textValue = value;
        try {
            switch (fieldName) {
                case "elderTypeDictIds":
                    String names[] = {"", "城市三无/农村五保", "低保/低保边缘", "经济困难的失能/半失能老人", "70周岁及以上的计生特扶老人",
                            "百岁老人", "", "", "", "空巢", "独居", "其他"};
                    if (value.contains(",")) {
                        textValue = "";
                        for (String str : value.split(",")) {
                            textValue += names[Integer.parseInt(str)] + ",";
                        }
                        if (textValue.length() > 0) {
                            textValue = textValue.substring(0, textValue.length() - 1);
                        }
                    } else {
                        textValue = names[Integer.parseInt(value)];
                    }
                    break;
                case "fiveElderType":
                case "elderType":
                    String fiveElderTypeNames[] = {"城市三无/农村五保", "低保/低保边缘", "经济困难的失能/半失能老人", "70周岁及以上的计生特扶老人", "百岁老人", "其他"};
                    if (value.contains(",")) {
                        textValue = "";
                        for (String str : value.split(",")) {
                            textValue += fiveElderTypeNames[Integer.parseInt(str) - 1] + ",";
                        }
                        if (textValue.length() > 0) {
                            textValue = textValue.substring(0, textValue.length() - 1);
                        }
                    } else {
                        textValue = fiveElderTypeNames[Integer.parseInt(value) - 1];
                    }
                    break;
                case "childrenDictId":
                    String childrenDictIdNames[] = {"无", "二个", "三个及以上"};
                    textValue = childrenDictIdNames[Integer.parseInt(value)];
                    break;
                case "residenceDictId":
                    String residenceDictIdNames[] = {"其他", "与配偶住", "独居", "与子女共住", "与孙子女共住", "与兄弟姐妹共住", "与兄弟姐妹共住", "与父母或岳父母共住", "住养老院"};
                    textValue = residenceDictIdNames[Integer.parseInt(value)];
                    break;
                case "liveCondition":
                    String liveConditionNames[] = {"空巢", "独居", "与家人住", "住养老院", "其他"};
                    textValue = liveConditionNames[Integer.parseInt(value)];
                    break;
                case "sexDictId":
                    String sexDictIdNames[] = {"保密", "男", "女"};
                    textValue = sexDictIdNames[Integer.parseInt(value)];
                    break;
                case "sex":
                    String sexNames[] = {"保密", "男", "女"};
                    textValue = sexNames[Integer.parseInt(value)];
                    break;
                case "callertype":
                    String callertypeNames[] = {"", "固定", "移动"};
                    textValue = callertypeNames[Integer.parseInt(value)];
                    break;
                case "status":
                    String statusNames[] = {"未审核", "已审核", "平台导入"};
                    textValue = statusNames[Integer.parseInt(value)];
                    break;
                case "certificate":
                    String certificateNames[] = {"未发放证书", "已发放证书"};
                    textValue = certificateNames[Integer.parseInt(value)];
                    break;
                case "certificateType":
                    String certificateTypeNames[] = {"初级证书", "中级证书", "高级证书", "其他证书"};
                    textValue = certificateTypeNames[Integer.parseInt(value)];
                    break;
                case "regTypeDictId":
                    String regTypeDictIdNames[] = {"", "民非", "企业", "事业单位"};
                    textValue = regTypeDictIdNames[Integer.parseInt(value)];
                    break;
                case "privateOrgName":
                case "fullTimeEdu":
                case "familyCare":
                case "sign":
                case "care":
                    String privateOrgNameNames[] = {"否", "是"};
                    textValue = privateOrgNameNames[Integer.parseInt(value)];
                    break;
                case "gradeDictId":
                    String gradeDictIdNames[] = {"A", "AA", "AAA", "AAAA", "AAAA"};
                    textValue = gradeDictIdNames[Integer.parseInt(value)];
                    break;
                case "instProp":
                    String instProp[] = {"", "民办民营", "公办公营I", "公办公营II", "公助民营", "公办民营", "共建民营"};
                    textValue = instProp[Integer.parseInt(value)];
                    break;
                case "level":
                    String levelNames[] = {"", "", "", "3A", "4A", "5A"};
                    textValue = levelNames[Integer.parseInt(value)];
                    break;
                case "nurseLevel":
                    String nurseLevelNames[] = {"初级护理员", "中级护理员", "高级护理员", "其他"};
                    textValue = nurseLevelNames[Integer.parseInt(value)];
                    break;
                case "cardLevel":
                    String cardLevelNames[] = {"初级", "中级", "高级", "其他"};
                    textValue = cardLevelNames[Integer.parseInt(value)];
                    break;
                case "buffet":
                    if (value.equals("true")) {
                        textValue = "是";
                    } else {
                        textValue = "否";
                    }
                    break;
                case "shiStandard":
                    if (value.equals("2")) {
                        textValue = "待审核";
                    } else if (value.equals("1")) {
                        textValue = "审核通过";
                    } else if (value.equals("0")) {
                        textValue = "审核不通过";
                    }
                    break;
                case "infoIntegrity":
                    textValue = value + "%";
                    break;
                default:
                    textValue = value;
                    break;
            }
        } catch (Exception e) {
            textValue = value;
        }
        return textValue;
    }
    /**
     * 获取execl里的数据
     *
     * @return
     */
    public static String getCellValue(Cell cell) {
        String value = "";
        try {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_NUMERIC: {
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        //用于转化为日期格式

                        Date d = cell.getDateCellValue();

                        DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

                        value = formater.format(d);

                    } else {
                        value = String.valueOf(new DecimalFormat("#.#########").format(cell.getNumericCellValue()));
                    }
                    break;
                }
                case Cell.CELL_TYPE_STRING: {
                    value = cell.getStringCellValue();
                    break;
                }
                default: {
                    value = "";
                    break;
                }
            }
        } catch (Exception e) {
            value = "";
        }
        return value;
    }

    public static Date getDateByMonth(String time) {
        Date date = null;
        if (time.indexOf("(") != -1) {
            time = time.substring(0, time.indexOf("("));
        }

        String[] str = {"yyyy-MM", "yy-MM", "yyyy/MM", "yy/MM", "yyyy.MM", "yyyy年MM", "yy.MM", "yy年MM"};
        SimpleDateFormat sdf = null;
        for (int j = 0; j < str.length; j++) {
            sdf = new SimpleDateFormat(str[j]);
            try {
                date = sdf.parse(time);
                //System.out.println(date);
            } catch (ParseException e) {
                continue;
            }
        }
        return date;
    }

    public static Date getDateByTime(String time) {
        Date date = null;
        if (time.indexOf("(") != -1) {
            time = time.substring(0, time.indexOf("("));
        }

        String[] str = {"yyyy-MM-dd", "yy-MM-dd", "yyyy/MM/dd", "yy/MM/dd", "yyyy.MM.dd", "yyyy年MM月dd日", "yy.MM.dd", "yy年MM月dd日"};
        SimpleDateFormat sdf = null;
        for (int j = 0; j < str.length; j++) {
            sdf = new SimpleDateFormat(str[j]);
            try {
                date = sdf.parse(time);
                //System.out.println(date);
            } catch (ParseException e) {
                continue;
            }
        }
        return date;
    }


    /**
     * 截取数字
     *
     * @param content
     * @return
     */
    public static String getNumbers(String content) {
        Pattern pattern = Pattern.compile("\\d+(\\.\\d*)?");
        Matcher matcher = pattern.matcher(content);
        String result = "";
        while (matcher.find()) {
            result = matcher.group(0);
        }
        if (!StringUtils.isEmpty(result)) {
            if (content.contains("万")) {
                result = Double.parseDouble(result) * 10000 + "";
            }
        }
        return result;
    }

}
