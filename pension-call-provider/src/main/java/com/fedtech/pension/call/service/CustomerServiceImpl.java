package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ExportExcelUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.call.entity.Customer;
import com.fedtech.pension.call.mapper.CustomerMapper;
import com.fedtech.pension.call.vo.CustomerVisitVo;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrator
 * @date 2016/9/12
 */
@Service(interfaceClass = CustomerService.class, version = "1.0.0")
public class CustomerServiceImpl extends BaseServiceImpl<Customer> implements CustomerService {

    @Autowired
    private CustomerMapper mapper;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Override
    public BaseMapper<Customer> getMapper() {
        return mapper;
    }

    @Override
    public PageResponse<Customer> selectCustomerPageList(Integer groupId, PageRequest pageRequest) {
        PageResponse<Customer> pageResponse = new PageResponse<Customer>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setRecordsTotal(mapper.countUser(groupId));
        pageResponse.setRecordsFiltered(pageResponse.getRecordsTotal());
        pageResponse.setData(mapper.selectCustomerPageList(groupId, pageRequest));
        return pageResponse;
    }

    @Override
    public Customer selectByElderId(Integer elderId) {
        return mapper.selectByElderId(elderId);
    }

    @Override
    public Customer selectByCallNum(String callNum) {
        return mapper.selectByCallNum(callNum);
    }


    @Override
    public List<Customer> selectByCallNums(List<String> callNums) {
        return mapper.selectByCallNums(callNums);
    }


    @Override
    public PageResponse<CustomerVisitVo> selectVisitPageList(CustomerVisitVo filter, PageRequest pageRequest) {
        PageResponse<CustomerVisitVo> pageResponse = new PageResponse<CustomerVisitVo>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectVisitPageList(filter, pageRequest));
        pageResponse.setRecordsFiltered(mapper.countVisit(filter));
        return pageResponse;
    }


    @Override
    public JsonResult importExcel(MultipartFile file, Integer uid) throws IOException, InvalidFormatException {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<Customer> customers = new ArrayList<Customer>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix) || "xlsx".equals(suffix)) {
                wb = WorkbookFactory.create(is);
            } else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            Customer customer = null;
            ElderlyMsg elderlyMsg = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                customer = new Customer();
                elderlyMsg = new ElderlyMsg();
                // 身份证号
                String idcardno = ExportExcelUtil.getCellValue(row.getCell(11));
                if (!StringUtils.isEmpty(idcardno)) {
                    ElderlyMsg elderlyMsg1 = elderlyMsgService.selectByCardNo(idcardno);
                    if (ObjectUtils.isNotNull(elderlyMsg1)) {
                        int elderId = elderlyMsg1.getId();
                        elderlyMsg.setId(elderId);
                        customer.setElderId(elderId);
                        //区
                        try {
                            String areaName = ExportExcelUtil.getCellValue(row.getCell(1));
                            if (!StringUtils.isEmpty(areaName)) {
                                Area area = areaService.getAreaByNameFromCache(areaName);
                                if (ObjectUtils.isNotNull(area)) {
                                    elderlyMsg.setAreaId(area.getId());
                                    customer.setAreaId(area.getId());
                                } else {
                                    b = false;
                                    errorReasons.add(String.format("第%d行区域有误，请检查后重新添加", i + 1));
                                    continue;
                                }
                            } else {
                                b = false;
                                errorReasons.add(String.format("第%d行区域为空，请检查后重新添加", i + 1));
                                continue;
                            }
                        } catch (NullPointerException e) {
                            b = false;
                            errorReasons.add(String.format("第%d行区域为空，请检查后重新添加", i + 1));
                            continue;
                        }

                        //街道
                        String streetName = ExportExcelUtil.getCellValue(row.getCell(2)); //街道
                        if (!StringUtils.isEmpty(streetName)) {
                            Area area = areaService.getAreaByNameFromCache(streetName);
                            if (ObjectUtils.isNotNull(area)) {
                                elderlyMsg.setAreaId(area.getId());
                            }
                        }

                        //社区
                        String countryName = ExportExcelUtil.getCellValue(row.getCell(3)); //社区
                        if (!StringUtils.isEmpty(countryName)) {
                            Area area = areaService.getAreaByNameFromCache(countryName);
                            if (ObjectUtils.isNotNull(area)) {
                                elderlyMsg.setAreaId(area.getId());
                            }
                        }

                        // 老人信息
                        if (!StringUtils.isEmpty(ExportExcelUtil.getCellValue(row.getCell(8)))) {
                            elderlyMsg.setElderName(ExportExcelUtil.getCellValue(row.getCell(8)));
                        }

                        // 地址
                        if (!StringUtils.isEmpty(ExportExcelUtil.getCellValue(row.getCell(10)))) {
                            elderlyMsg.setRealAddress(ExportExcelUtil.getCellValue(row.getCell(10)));
                        }
                        // 联系方式
                        if (!StringUtils.isEmpty(ExportExcelUtil.getCellValue(row.getCell(12)))) {
                            elderlyMsg.setMobile(ExportExcelUtil.getCellValue(row.getCell(12)));
                        }
                        // 老人类别
                        /*String elderType = ExportExcelUtil.getCellValue(row.getCell(14));
                        String[] elderTypes={"A农村五保、城市三无老人","B低保及低保边缘老人","C经济困难的失能、半失能老人","D70周岁的计生特扶老人","E百岁老人"};
                        for (int j = 0; j < elderType.split(""); j++) {

                        }
                        elderlyMsg.setElderTypeDictIds();*/
                        elderlyMsgService.updateByPrimaryKeySelective(elderlyMsg);
                        // 服务人员
                        customer.setServicePer(ExportExcelUtil.getCellValue(row.getCell(4)));
                        // 联系电话
                        customer.setServiceMobile(ExportExcelUtil.getCellValue(row.getCell(5)));
                        // 工作类型：社工/养老服务员/其他
                        customer.setServiceWorkType(ExportExcelUtil.getCellValue(row.getCell(6)));
                        // 所属单位（或社区居家养老服务组织）
                        customer.setServiceWorkUnit(ExportExcelUtil.getCellValue(row.getCell(7)));
                        // 所属单位（或社区居家养老服务组织）
                        customer.setInstallNeed(ExportExcelUtil.getCellValue(row.getCell(15)));
                        // 呼叫器状态
                        String beeperStatus = ExportExcelUtil.getCellValue(row.getCell(16));
                        if (beeperStatus.equals("已安装")) {
                            customer.setBeeperStatus(1);//已安装呼叫器
                        } else if (beeperStatus.equals("未安装")) {
                            customer.setBeeperStatus(0);//未安装呼叫器
                        }

                        // 呼叫器名称
                        String beeperName = ExportExcelUtil.getCellValue(row.getCell(17));
                        customer.setBeeperName(beeperName);

                        customer.setCreatorId(uid);
                        customer.setCreateTime(new Date());
                        customer.setStatus(1);

                        customers.add(customer);
                    } else {
                        b = false;
                        errorReasons.add(String.format("第%d行老人不存在有误，请检查后重新添加", i + 1));
                        continue;
                    }
                }

                if (customers.size() == 500) {
                    if (this.insertSome(customers)) {
                        customers.clear();
                    } else {
                        result.markError("导入失败");
                        result.setData(errorReasons);
                        break;
                    }
                }
            }

        } else {
            result.markError("文件内容为空！");
        }
        if (customers.size() > 0 && this.insertSome(customers)) {
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }
}
