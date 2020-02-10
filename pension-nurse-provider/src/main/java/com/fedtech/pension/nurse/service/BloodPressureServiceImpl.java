package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.BloodPressure;
import com.fedtech.pension.nurse.mapper.BloodPressureMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  血压
 * @author gxy
 * @date 2019/6/24 - 13:22
 */
@Service(interfaceClass = BloodPressureService.class, version = "1.0.0")
public class BloodPressureServiceImpl extends BaseServiceImpl<BloodPressure> implements BloodPressureService {

    @Autowired
   private BloodPressureMapper bloodPressureMapper;

    @Override
    public BaseMapper<BloodPressure> getMapper() {
        return bloodPressureMapper;
    }


    @Override
    public int insertBloodPressure(JSONObject jsonObjectBloodPressure) {

        BloodPressure bloodPressure = new BloodPressure();
        bloodPressure= (BloodPressure)JSONObject.toJavaObject(jsonObjectBloodPressure,bloodPressure.getClass());
        bloodPressureMapper.insert(bloodPressure);
            return bloodPressure.getId();
        }
    }


