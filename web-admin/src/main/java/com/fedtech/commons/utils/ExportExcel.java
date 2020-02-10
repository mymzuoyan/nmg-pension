package com.fedtech.commons.utils;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author coderqiang
 * @date 2017/1/11
 */
public class ExportExcel<T> {

    /**
     * 这是一个通用的方法，利用了JAVA的反射机制，可以将放置在JAVA集合中并且符号一定条件的数据以EXCEL 的形式输出到指定IO设备上
     *
     * @param title      表格标题名
     * @param headers    表格属性列名数组
     * @param fieldNames 字段名称数组
     * @param dataset    需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
     *                   javabean属性的数据类型有基本数据类型及String,Date,byte[](图片数据)
     * @param out        与输出设备关联的流对象，可以将EXCEL文档导出到本地文件或者网络中
     * @param pattern    如果有时间数据，设定输出格式。默认为"yyy-MM-dd"
     */
    @SuppressWarnings("unchecked")
    public void exportExcel(String title, String[] headers, String[] fieldNames,
                            Collection<T> dataset, OutputStream out, String pattern) {
        // 声明一个工作薄
        SXSSFWorkbook workbook = new SXSSFWorkbook();

        // 生成一个表格
        Sheet sheet = workbook.createSheet();

        workbook.setSheetName(0, title);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 15);
        // 产生表格标题行
        Row row = sheet.createRow(0);
        for (short i = 0; i < headers.length; i++) {
            Cell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
        Iterator<T> it = dataset.iterator();
        int index = 0;
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            T t = it.next();
            for (short i = 0; i < fieldNames.length; i++) {
                Cell cell = row.createCell(i);
                String fieldName = fieldNames[i];
                String getMethodName = "";
                if (fieldName.equals("")) {
                    HSSFRichTextString richString = new HSSFRichTextString(
                            "");
                    cell.setCellValue(richString);
                } else {
                    if (fieldName.equals("idcardType")) {
                        HSSFRichTextString richString = new HSSFRichTextString(
                                "");
                        cell.setCellValue("身份证");
                    } else {
                        getMethodName = "get"
                                + fieldName.substring(0, 1).toUpperCase()
                                + fieldName.substring(1);
                        try {
                            Class tCls = t.getClass();
                            Method getMethod = tCls.getMethod(getMethodName
                            );
                            Object value = getMethod.invoke(t);
                            String textValue = null;
                            if (value instanceof Date) {
                                Date date = (Date) value;
                                SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                                textValue = sdf.format(date);
                            } else if (fieldName.equals("areaName")) {
                                if (value != null) {
                                    textValue = value.toString();
                                    if (textValue.split(",").length >= 2) {
                                        textValue = textValue.split(",")[1];
                                    }
                                } else {
                                    textValue = "";
                                }
                            } else if (fieldName.equals("streetErr") || "errorStreet".equals(fieldName)) {
                                if (value != null) {
                                    textValue = value.toString();
                                } else {
                                    textValue = "";
                                }
                                if (StringUtils.isEmpty(textValue)) {
                                    tCls = t.getClass();
                                    getMethod = tCls.getMethod("getAreaName"
                                    );
                                    value = getMethod.invoke(t);
                                    if (value == null) {
                                        textValue = "";
                                    } else {
                                        textValue = value.toString();
                                    }
                                    if (textValue.split(",").length >= 3) {
                                        textValue = textValue.split(",")[2];
                                    } else {
                                        textValue = "";
                                    }
                                }
                            } else if (fieldName.equals("countryErr") || "errorCountry".equals(fieldName) || "communityErr".equals(fieldName)) {
                                if (value != null) {
                                    textValue = value.toString();
                                } else {
                                    textValue = "";
                                }
                                if (StringUtils.isEmpty(textValue)) {
                                    tCls = t.getClass();
                                    getMethod = tCls.getMethod("getAreaName"
                                    );
                                    value = getMethod.invoke(t);
                                    if (value == null) {
                                        textValue = "";
                                    } else {
                                        textValue = value.toString();
                                    }
                                    if (textValue.split(",").length >= 4) {
                                        textValue = textValue.split(",")[3];
                                    } else {
                                        textValue = "";
                                    }
                                }
                            } else if (fieldName.equals("idcardnoErr")) {
                                if (value != null) {
                                    textValue = value.toString();
                                } else {
                                    textValue = "";
                                }
                                if (StringUtils.isEmpty(textValue)) {
                                    tCls = t.getClass();
                                    getMethod = tCls.getMethod("getIdcardno"
                                    );
                                    value = getMethod.invoke(t);
                                    if (value == null) {
                                        textValue = "";
                                    } else {
                                        textValue = value.toString();
                                    }
                                }
                            } else {
                                // 其它数据类型都当作字符串简单处理
                                if (value == null) {
                                    textValue = "";
                                } else {
                                    textValue = value.toString();
                                }
                            }
                            if (textValue != null) {
                                textValue = getValue(textValue, fieldName);
                                Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                                Matcher matcher = p.matcher(textValue);
                                if (matcher.matches()) {
                                    cell.setCellValue(Double.parseDouble(textValue));
                                } else {
                                    HSSFRichTextString richString = new HSSFRichTextString(
                                            textValue);
                                    cell.setCellValue(richString);
                                }
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

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
     * 这是一个通用的方法，利用了JAVA的反射机制，可以将放置在JAVA集合中并且符号一定条件的数据以EXCEL 的形式输出到指定IO设备上
     *
     * @param title      表格标题名
     * @param headers    表格属性列名数组
     * @param fieldNames 字段名称数组
     * @param dataset    需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
     *                   javabean属性的数据类型有基本数据类型及String,Date,byte[](图片数据)
     * @param pattern    如果有时间数据，设定输出格式。默认为"yyy-MM-dd"
     */
    @SuppressWarnings("unchecked")
    public void exportMapExcel(HttpServletRequest request, HttpServletResponse response, String title, String[] headers, String[] fieldNames,
                               Map<String, List<T>> dataset, String pattern) throws IOException {
        String fileName = title + ".zip";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/octet-stream;charset=UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        response.addHeader("Pargam", "no-cache");
        response.addHeader("Cache-Control", "no-cache");
        OutputStream out = response.getOutputStream();
        List<String> fileNames = new ArrayList();// 用于存放生成的文件名称
        File zip = new File(fileName);// 压缩文件
        List<String> keys = new ArrayList(dataset.keySet());
        for (int j = 0; j < keys.size(); j++) {
            String file = keys.get(j)
                    + ".xls";
            fileNames.add(file);

            FileOutputStream o = null;
            o = new FileOutputStream(file);
            // 声明一个工作薄
            SXSSFWorkbook workbook = new SXSSFWorkbook(5000);
            // 生成一个表格
            Sheet sheet = workbook.createSheet();

            workbook.setSheetName(0, keys.get(j));
            // 设置表格默认列宽度为15个字节
            sheet.setDefaultColumnWidth((short) 15);
            // 产生表格标题行
            Row row = sheet.createRow(0);
            for (short i = 0; i < headers.length; i++) {
                Cell cell = row.createCell(i);
                HSSFRichTextString text = new HSSFRichTextString(headers[i]);
                cell.setCellValue(text);
            }
            List<T> elderlyMsgs = dataset.get(keys.get(j));
            Iterator<T> it = elderlyMsgs.iterator();
            int index = 0;
            while (it.hasNext()) {
                index++;
                row = sheet.createRow(index);
                T t = it.next();
                for (short i = 0; i < fieldNames.length; i++) {
                    Cell cell = row.createCell(i);
                    String fieldName = fieldNames[i];
                    String getMethodName = "get"
                            + fieldName.substring(0, 1).toUpperCase()
                            + fieldName.substring(1);
                    try {
                        Class tCls = t.getClass();
                        Method getMethod = tCls.getMethod(getMethodName
                        );
                        Object value = getMethod.invoke(t);
                        String textValue = null;
                        if (value instanceof Date) {
                            Date date = (Date) value;
                            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                            textValue = sdf.format(date);
                        } else {
                            // 其它数据类型都当作字符串简单处理
                            if (value == null)
                                textValue = "";
                            else
                                textValue = value.toString();
                        }
                        if (textValue != null) {
                            textValue = getValue(textValue, fieldName);
                            Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                            Matcher matcher = p.matcher(textValue);
                            if (matcher.matches()) {
                                // 是数字当作double处理
                                cell.setCellValue(Double.parseDouble(textValue));
                            } else {
                                HSSFRichTextString richString = new HSSFRichTextString(
                                        textValue);
                                cell.setCellValue(richString);
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            try {
                workbook.write(o);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } finally {
                if (o != null) {
                    o.flush();
                    o.close();
                }
            }
        }
        File srcfile[] = new File[fileNames.size()];

        for (int i = 0, n = fileNames.size(); i < n; i++) {

            srcfile[i] = new File(fileNames.get(i));

        }
        FileZip.ZipFiles(srcfile, zip);

        FileInputStream inStream = new FileInputStream(zip);

        byte[] buf = new byte[4096];

        int readLength;

        while (((readLength = inStream.read(buf)) != -1)) {

            out.write(buf, 0, readLength);

        }
        inStream.close();
        out.close();
    }


    /**
     * 导出map集合数据
     *
     * @param title
     * @param headers
     * @param fieldNames
     * @param dataset
     * @param out
     * @param pattern
     */
    public void exportMapExcel(String title, String[] headers, String[] fieldNames,
                               Collection<Map> dataset, OutputStream out, String pattern) {
        // 声明一个工作薄
        /*HSSFWorkbook workbook = new HSSFWorkbook();*/
        SXSSFWorkbook workbook = new SXSSFWorkbook();

        // 生成一个表格
        Sheet sheet = workbook.createSheet();

        workbook.setSheetName(0, title);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 15);
        // 产生表格标题行
        Row row = sheet.createRow(0);
        for (short i = 0; i < headers.length; i++) {
            if (headers[i] != null && !headers[i].equals("")) {
                Cell cell = row.createCell(i);
                HSSFRichTextString text = new HSSFRichTextString(headers[i]);
                cell.setCellValue(text);
            }
        }
        Iterator<Map> it = dataset.iterator();
        int index = 0;
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            Map t = it.next();
            for (short i = 0; i < fieldNames.length; i++) {
                String fieldName = fieldNames[i];
                if (fieldName != null && !fieldName.equals("")) {
                    Cell cell = row.createCell(i);
                    Object value = "";
                    if (fieldName.equals("id")) {
                        value = index;
                    } else {
                        value = t.get(fieldName);
                    }

                    try {
                        String textValue = null;
                        if (value instanceof Date) {
                            Date date = (Date) value;
                            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                            textValue = sdf.format(date);
                        } else {
                            // 其它数据类型都当作字符串简单处理
                            if (value == null)
                                textValue = "";
                            else
                                textValue = value.toString();
                        }
                        if (textValue != null) {
                            Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                            Matcher matcher = p.matcher(textValue);
                            if (matcher.matches()) {
                                // 是数字当作double处理
                                cell.setCellValue(Double.parseDouble(textValue));
                            } else {
                                HSSFRichTextString richString = new HSSFRichTextString(
                                        textValue);
                                cell.setCellValue(richString);
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
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
