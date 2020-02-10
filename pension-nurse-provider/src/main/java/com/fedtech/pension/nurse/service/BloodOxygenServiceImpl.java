package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.BloodOxygen;
import com.fedtech.pension.nurse.mapper.BloodOxygenMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author fan
 */
@Service(interfaceClass = BloodOxygenService.class, version = "1.0.0")
public class BloodOxygenServiceImpl extends BaseServiceImpl<BloodOxygen> implements BloodOxygenService {

    @Autowired
    private BloodOxygenMapper oxygenMapper;

    @Override
    public BaseMapper<BloodOxygen> getMapper() {
        return oxygenMapper;
    }

    @Override
    public Integer bloodOxygen2Json(JSONObject jsonObject) {
        BloodOxygen bloodOxygen = new BloodOxygen();
        bloodOxygen = (BloodOxygen)JSONObject.toJavaObject(jsonObject,BloodOxygen.class);
        oxygenMapper.insert(bloodOxygen);
        return bloodOxygen.getId();
    }
}
