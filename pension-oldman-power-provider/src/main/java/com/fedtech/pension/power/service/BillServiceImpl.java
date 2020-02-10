package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.config.RedisTemplateUtil;
import com.fedtech.pension.power.constant.Global;
import com.fedtech.pension.power.entity.Bill;
import com.fedtech.pension.power.mapper.BillMapper;
import com.fedtech.pension.power.statistics.ServiceData;
import com.fedtech.pension.power.statistics.ServiceElderlyData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;

@Service(interfaceClass = BillService.class, version = "1.0.0")
public class BillServiceImpl extends BaseServiceImpl<Bill> implements BillService {

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    @Autowired
    private BillMapper billMapper;

    @Override
    public BaseMapper<Bill> getMapper() {
        return billMapper;
    }

    @Override
    public boolean invalidBill(Bill bill) {
        if (null != bill) {
            return 1 == billMapper.invalidBill(bill);
        }
        return false;
    }

    @Override
    public void updateBillAccount(Bill filter) {
        billMapper.updateBillAccount(filter);
    }


    @Override
    public Bill insertBackId(Bill record) {
        record = super.insertBackId(record);
        doStatistic(record);
        return record;

    }


    @Override
    public void doStatistic(Bill bill) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String areaName = bill.getAreaName();
        if (!StringUtils.isEmpty(areaName)) {
            if (areaName.split(",").length > 1) {
                areaName = areaName.split(",")[1];
            }
        } else {
            return;
        }
        //添加到缓存
        HashMap<String, LinkedList<ServiceData>> serviceDataHash = (HashMap<String, LinkedList<ServiceData>>) redisTemplateUtil.getHash(Global.KEY_SERVICE_DATA);
        LinkedList<ServiceData> serviceDatas = serviceDataHash.get(Global.NORMAL_SERVICE_DATA);
        if (ObjectUtils.isNotNull(serviceDatas)) {
            //出一个
            if (serviceDatas.size() >= 5) {
                serviceDatas.remove(0);
            }
        } else {
            serviceDatas = new LinkedList<>();
        }
        //进一个
        ServiceData serviceData = new ServiceData();
        serviceData.setNumber(bill.getFlowNumber());
        serviceData.setArea(areaName);
        serviceData.setItemName(bill.getItemName());
        serviceData.setServiceOrgName(bill.getOrgName());
        serviceData.setServiceTime(bill.getDissipate());
        serviceData.setSource(Global.SERVICE_DATA_SOURCE_CARD);
        serviceDatas.add(serviceData);
        serviceDataHash.put(Global.NORMAL_SERVICE_DATA, serviceDatas);


        HashMap<String, HashMap<String, ServiceElderlyData>> serviceStatisticDatas = (HashMap<String, HashMap<String, ServiceElderlyData>>) redisTemplateUtil.getHash(Global.KEY_SERVICE_STATISTICS_DATA);
        if (ObjectUtils.isNull(serviceStatisticDatas)) {
            serviceStatisticDatas = new HashMap<>();
        }
        HashMap<String, ServiceElderlyData> serviceElderlyDatas = serviceStatisticDatas.get(areaName);
        if (ObjectUtils.isNull(serviceElderlyDatas)) {
            serviceElderlyDatas = new HashMap<>();
        }
        ServiceElderlyData serviceElderlyData = serviceElderlyDatas.get(bill.getIdcardno());
        if (ObjectUtils.isNull(serviceElderlyData)) {
            serviceElderlyData = new ServiceElderlyData();
        }
        serviceElderlyData.setIdcardno(bill.getIdcardno());
        Date lastDate = serviceElderlyData.getLastDate();
        try {
            serviceElderlyData.setLastDate(df.parse(bill.getDissipate()));
        } catch (ParseException e) {
            e.printStackTrace();
            serviceElderlyData.setLastDate(new Date());
        }
        if (ObjectUtils.isNotNull(lastDate)) {
            if (serviceElderlyData.getLastDate().getTime() - lastDate.getTime() <= 20 * 60 * 1000) {
                //  可疑数据
                //添加到缓存
                LinkedList<ServiceData> suspiciousServiceDatas = serviceDataHash.get(Global.SUSPICIOUS_SERVICE_DATA);

                if (ObjectUtils.isNotNull(suspiciousServiceDatas)) {
                    //出一个
                    if (suspiciousServiceDatas.size() >= 5) {
                        suspiciousServiceDatas.remove(0);
                    }
                } else {
                    suspiciousServiceDatas = new LinkedList<>();
                }
                suspiciousServiceDatas.add(serviceData);
                serviceDataHash.put(Global.SUSPICIOUS_SERVICE_DATA, suspiciousServiceDatas);
            }
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        int nowYear = calendar.getWeekYear();
        int nowDay = calendar.get(Calendar.DAY_OF_MONTH);
        calendar.setTime(serviceElderlyData.getLastDate());
        if (nowYear == calendar.getWeekYear()) {
            serviceElderlyData.setYearCount(serviceElderlyData.getYearCount() + 1);
            serviceElderlyData.setCardYearCount(serviceElderlyData.getCardYearCount() + 1);
        }
        if (nowDay == calendar.get(Calendar.DAY_OF_MONTH)) {
            serviceElderlyData.setDayCount(serviceElderlyData.getDayCount() + 1);
            serviceElderlyData.setCardDayCount(serviceElderlyData.getCardDayCount() + 1);
        }
        serviceElderlyDatas.put(bill.getIdcardno(), serviceElderlyData);
        serviceStatisticDatas.put(areaName, serviceElderlyDatas);


        redisTemplateUtil.setHash(Global.KEY_SERVICE_DATA, serviceDataHash);
        redisTemplateUtil.setHash(Global.KEY_SERVICE_STATISTICS_DATA, serviceStatisticDatas);
    }

}
