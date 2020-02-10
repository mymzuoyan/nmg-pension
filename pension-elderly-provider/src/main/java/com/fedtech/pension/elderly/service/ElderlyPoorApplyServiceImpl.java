package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ExportExcelUtil;
import com.fedtech.commons.utils.FileZip;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.ElderlyPoorApply;
import com.fedtech.pension.elderly.mapper.ElderlyPoorApplyMapper;
import com.fedtech.pension.elderly.quantity.PoorApplyStepQuantity;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by gengqiang on 2017/8/16.
 */
@Service(interfaceClass = ElderlyPoorApplyService.class, version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyPoorApplyServiceImpl extends BaseServiceImpl<ElderlyPoorApply> implements ElderlyPoorApplyService {

    private static Pattern NUMBER_PATTERN = Pattern.compile("^//d+(//.//d+)?$");


    @Autowired
    private ElderlyPoorApplyMapper mapper;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private UserService userService;


    @Override
    public BaseMapper<ElderlyPoorApply> getMapper() {
        return mapper;
    }

    @Override
    public String findByLastNumber(String number) {
        return mapper.findByLastNumber(number);
    }

    @Override
    public boolean insertPoorApply(ElderlyPoorApply apply, User handleUser) {
        if (super.insert(apply)) {
//            Message message = new Message();
//            message.setTitle("城乡特困人员申请审核");
//            User filter = new User();
//            List<Integer> uids = new ArrayList<>();
//            String content = "";
//            //初审(街道)通过
//            content = handleUser.getNick_name() + "已提交了老人：" + apply.getName() + "城乡特困人员申请，街道管理员请审核";
//            filter.setAreaName(apply.getRegion2());
//            uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
//            message.setContent(content);
//            message.setCreateTime(new Date());
//            message.setCreatorId(handleUser.getUid());
//            messageService.sendMessage(message, uids);
//            dwrService.sendMessgaeToUser2(uids, "2", "");
            return true;
        }
        return false;
    }

    @Override
    public String createApplyPreNumber(Integer areaId) {
        Area area = areaService.selectByPrimaryKey(areaId);
        String deptcode = area.getDistrictId();
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        String number = "";
        if (deptcode.length() >= 7) {
            number = deptcode.substring(0, 6) + year;
        } else
            number = "320102" + year;
        return number;
    }

    @Override
    public boolean handlePoorApply(ElderlyPoorApply apply, User handleUser) {
        if (apply.getStatus() == PoorApplyStepQuantity.CHUSHENUBUTONGGUO ||
                apply.getStatus() == PoorApplyStepQuantity.QUSHENHEBUTONGGUO) {
            apply.setResult(2);
        } else if (apply.getStatus() == PoorApplyStepQuantity.QUSHENHETONGGUO) {
            apply.setResult(1);
        }
        String handleName = handleUser.getNick_name();
        if (this.updateByPrimaryKeySelective(apply)) {
            //通知
            apply = this.selectByPrimaryKey(apply.getId());
//            Message message = new Message();
//            message.setTitle("城乡特困人员申请审核");
            User filter = new User();
            List<Integer> uids = new ArrayList<>();
            String content = "";
            switch (apply.getStatus()) {
                case 0:
                    //已登记
                    break;

                case 1:
                    //初审(街道)通过
                    content = apply.getRegion2() + "已初步审核通过了老人" + apply.getName() + "城乡特困人员申请，街道管理员请公示";
                    filter.setAreaName(apply.getRegion2());
                    uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                    break;
                case 2:
                    //街道初审不通过
                    content = apply.getRegion2() + "没有通过了老人" + apply.getName() + "城乡特困人员申请<br/>" +
                            "原因" + apply.getNote();
                    filter.setAreaName(apply.getRegion2());
                    uids.add(apply.getCreatorId());
                    break;
                case 3:
                    //公示／反馈
                    content = apply.getRegion2() + "已对老人" + apply.getName() + "城乡特困人员申请进行公示";
                    filter.setAreaName(apply.getRegion2());
                    uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                    break;
                case 4:
                    //公示无异议
                    content = apply.getRegion2() + "对老人" + apply.getName() + "城乡特困人员申请已公示,无异议，区管理员请审核";
                    filter.setAreaName(apply.getRegion1());
                    uids = userService.selectAllUserIdByRole(filter, RoleType.ReAdmin.getId());
                    break;

                case 5:
                    //公示有异议
                    content = apply.getRegion2() + "对老人" + apply.getName() + "城乡特困人员申请已公示,有异议，需街道复审";
                    filter.setAreaName(apply.getRegion2());
                    uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                    break;

                case 6:
                    //区审核通过
                    content = apply.getRegion1() + "通过了老人" + apply.getName() + "城乡特困人员申请";
                    filter.setAreaName(apply.getRegion2());
                    uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                    uids.add(apply.getCreatorId());
                    break;
                case 7:
                    //区审核通过
                    content = apply.getRegion1() + "没有通过了老人" + apply.getName() + "城乡特困人员申请<br/>" +
                            "原因" + apply.getNote();
                    filter.setAreaName(apply.getRegion2());
                    uids = userService.selectAllUserIdByRole(filter, RoleType.StAdmin.getId());
                    uids.add(apply.getCreatorId());
                    break;
            }
            content += "<a class=\"btn btn-circle btn-info\" href=\"”#”\" onclick=\"showInfo('" + apply.getId() + "')\" style=\"\n" +
                    "    float: right;\n" +
                    "    margin-top: 100px;\n" +
                    "\"><i class=\"fa\">查看详情</i></a>";
//            message.setContent(content);
//            message.setCreateTime(new Date());
//            message.setCreatorId(handleUser.getUid());
//            messageService.sendMessage(message, uids);
//            dwrService.sendMessgaeToUser2(uids, "2", "");
            return true;
        }
        return false;
    }

    @Override
    public synchronized String createApplyNewNumber(Integer areaId) {
        String number = "";
        try {
            number = this.createApplyPreNumber(areaId);
        } catch (Exception e) {
            return "-1";
        }
        String lastNum = this.findByLastNumber(number);
        if (ObjectUtils.isNotNull(lastNum)) {
            number = "" + (Long.parseLong(lastNum) + 1);
        } else {
            number += "00001";
        }
        return number;
    }

    @Override
    public Map<String, List<Long>> getStatistics(Integer type, Integer areaId, Integer startYear, Integer endYear) {
        Integer allcount = getMapper().countAll();
        int page = allcount % 100000 == 0 ? allcount / 100000 : allcount / 100000 + 1;
        PageRequest pageRequest = new PageRequest();
        List<Area> areas = areaService.selectByParentId(areaId);
        HashMap<String, List<Long>> result = new LinkedHashMap<>();
        if (page == 0)
            page = 1;
        for (int i = 0; i < page; i++) {
            if (page > 1) {
                pageRequest.setLength(100000);
                pageRequest.setStart(i * 100000);
            }
            List<ElderlyPoorApply> elderlyPoorApplies = getMapper().selectPageList(new ElderlyPoorApply(), pageRequest);
            Long[] Allcount = {0l, 0l, 0l, 0l};
            for (Area a : areas) {
                Long[] count = {0l, 0l, 0l, 0l};
                for (ElderlyPoorApply e : elderlyPoorApplies) {
                    String areaName = e.getRegion1() + e.getRegion2() + e.getRegion3();
                    Calendar c = Calendar.getInstance();
                    if (areaName.indexOf(a.getName()) >= 0 && c.get(Calendar.YEAR) >= startYear && c.get(Calendar.YEAR) <= endYear) {
                        count[0]++;
                        Allcount[0]++;
                        if (ObjectUtils.isNull(e.getResult())) {
                            e.setResult(0);
                        }
                        count[e.getResult() + 1]++;
                        Allcount[e.getResult() + 1]++;
                    }
                }
                result.put(a.getName(), Arrays.asList(count));
            }
            Area area = (Area) areaService.selectByParentId(areaId);
            result.put(area.getName(), Arrays.asList(Allcount));
        }
        return result;
    }

    @Override
    public void download(HttpServletRequest request, HttpServletResponse response, ElderlyPoorApply elderlyPoorApply, String host) {

        try {
            String downloadFilename = "老人头像.zip";//文件的名称
            downloadFilename = URLEncoder.encode(downloadFilename, "UTF-8");//转换中文否则可能会产生乱码
            response.setContentType("application/octet-stream");// 指明response的返回对象是文件流
            response.setHeader("Content-Disposition", "attachment;filename=" + downloadFilename);// 设置在下载框默认显示的文件名
            int length = 50000;
            PageRequest pageRequest = new PageRequest();
            Integer allcount = this.count(elderlyPoorApply);
            ZipOutputStream zos = new ZipOutputStream(response.getOutputStream());
            int page = allcount % length == 0 ? allcount / length : allcount / length + 1;
            for (int j = 0; j < page; j++) {
                if (page > 1) {
                    pageRequest.setLength(length);
                    pageRequest.setStart(j * length);
                }
                List<ElderlyPoorApply> elderlyPoorApplies = this.selectPageList(elderlyPoorApply, pageRequest).getData();
                Iterator<ElderlyPoorApply> it = elderlyPoorApplies.iterator();
                int index = 0;
                while (it.hasNext()) {
                    index++;
                    ElderlyPoorApply t = (ElderlyPoorApply) it.next();
                    if (ObjectUtils.isNotNull(t.getAvatar())) {
                        URL url = new URL(host + t.getAvatar());
                        zos.putNextEntry(new ZipEntry(t.getIdcardno() + ".png"));
                        //FileInputStream fis = new FileInputStream(new File(files[i]));
                        try {
                            InputStream fis = url.openConnection().getInputStream();
                            byte[] buffer = new byte[1024];
                            int r = 0;
                            while ((r = fis.read(buffer)) != -1) {
                                zos.write(buffer, 0, r);
                            }
                            fis.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            continue;
                        }
                    }
                }
            }
            zos.flush();
            zos.close();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void export(HttpServletRequest request,
                       HttpServletResponse response, ElderlyPoorApply elderlyPoorApply) throws Exception {
        response.setContentType("octets/stream");
        PageRequest pageRequest = new PageRequest();
        String fileName = "特困人员数据.zip";
        int length = 50000;
        String[] headers = {"所在区域", "所在街道", "所在社区", "编号", "姓名", "身份证号码", "性别", "民族", "户籍地址", "出生年月", "住址"};
        String[] fieldNames = {"region1", "region2", "region3", "number", "name", "idcardno", "sex", "nation", "regPlace", "birthday", "address"};
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/octet-stream;charset=UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        response.addHeader("Pargam", "no-cache");
        response.addHeader("Cache-Control", "no-cache");
        OutputStream out = response.getOutputStream();
        List<String> fileNames = new ArrayList();// 用于存放生成的文件名称s
        File zip = new File(fileName);// 压缩文件
        Integer allcount = this.count(elderlyPoorApply);
        int page = allcount % length == 0 ? allcount / length : allcount / length + 1;
        for (int j = 0; j < page; j++) {
            String file = "特困人员数据" + j
                    + ".xls";
            fileNames.add(file);
            FileOutputStream o = null;
            o = new FileOutputStream(file);
            // 声明一个工作薄
            SXSSFWorkbook workbook = new SXSSFWorkbook(5000);
            // 生成一个表格
            Sheet sheet = workbook.createSheet();

            workbook.setSheetName(0, "特困人员数据");
            // 设置表格默认列宽度为15个字节
            sheet.setDefaultColumnWidth((short) 15);
            // 产生表格标题行
            Row row = sheet.createRow(0);
            for (short i = 0; i < headers.length; i++) {
                Cell cell = row.createCell(i);
                HSSFRichTextString text = new HSSFRichTextString(headers[i]);
                cell.setCellValue(text);
            }
            if (page > 1) {
                pageRequest.setLength(length);
                pageRequest.setStart(j * length);
            }
            List<ElderlyPoorApply> elderlyPoorApplies = this.selectPageList(elderlyPoorApply, pageRequest).getData();
            Iterator<ElderlyPoorApply> it = elderlyPoorApplies.iterator();
            int index = 0;
            while (it.hasNext()) {
                index++;
                row = sheet.createRow(index);
                ElderlyPoorApply t = (ElderlyPoorApply) it.next();
                for (short i = 0; i < fieldNames.length; i++) {
                    Cell cell = row.createCell(i);
                    String fieldName = fieldNames[i];
                    String getMethodName = "get"
                            + fieldName.substring(0, 1).toUpperCase()
                            + fieldName.substring(1);
                    try {
                        Class tCls = t.getClass();
                        Method getMethod = tCls.getMethod(getMethodName,
                                new Class[]{});
                        Object value = getMethod.invoke(t, new Object[]{});
                        String textValue = null;
                        if (value instanceof Date) {
                            Date date = (Date) value;
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            textValue = sdf.format(date);
                        } else {
                            // 其它数据类型都当作字符串简单处理
                            if (value == null) {
                                textValue = "";
                            } else {
                                textValue = value.toString();
                            }
                        }
                        if (textValue != null) {
                            textValue = ExportExcelUtil.getValue(textValue, fieldName);
                            Matcher matcher = NUMBER_PATTERN.matcher(textValue);
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

    @Override
    public List<Integer> getNeedVerification() {
        return mapper.getNeedVerification();
    }
}
