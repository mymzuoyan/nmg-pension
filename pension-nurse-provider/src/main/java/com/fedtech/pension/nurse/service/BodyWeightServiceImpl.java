package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.BodyWeight;
import com.fedtech.pension.nurse.mapper.BodyWeightMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  体重
 * @author gxy
 * @date 2019/6/24 - 13:23
 */
@Service(interfaceClass = BodyWeightService.class, version = "1.0.0")
public class BodyWeightServiceImpl extends BaseServiceImpl<BodyWeight> implements BodyWeightService {

    @Autowired
    private BodyWeightMapper bodyWeightMapper;

    @Override
    public BaseMapper<BodyWeight> getMapper() {
        return bodyWeightMapper;
    }


    @Override
    public int insertBodyWeight(JSONObject jsonObjectBodyWeight) {
        BodyWeight bodyWeight = new BodyWeight();
        bodyWeight= (BodyWeight)JSONObject.toJavaObject(jsonObjectBodyWeight,bodyWeight.getClass());
        bodyWeightMapper.insert(bodyWeight);
             return bodyWeight.getId();
    }
}
