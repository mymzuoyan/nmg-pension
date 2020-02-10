package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.RespiratoryRate;
import com.fedtech.pension.nurse.mapper.RespiratoryRateMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author fan
 */
@Service(interfaceClass = RespiratoryRateService.class, version = "1.0.0")
public class RespiratoryRateServiceImpl extends BaseServiceImpl<RespiratoryRate> implements RespiratoryRateService {

    @Autowired
    private RespiratoryRateMapper respiratoryRateMapper;

    @Override
    public BaseMapper<RespiratoryRate> getMapper() {
        return respiratoryRateMapper;
    }

    @Override
    public Integer respiratoryRate2Json(JSONObject jsonObject) {
        RespiratoryRate respiratoryRate = new RespiratoryRate();
        respiratoryRate = (RespiratoryRate)JSONObject.toJavaObject(jsonObject,RespiratoryRate.class);
        respiratoryRateMapper.insert(respiratoryRate);
        return respiratoryRate.getId();
    }
}
