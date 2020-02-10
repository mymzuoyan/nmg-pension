package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.Temperature;
import com.fedtech.pension.nurse.mapper.TemperatureMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author miaoyueming
 * @date 2019/6/24
 */

@Service(interfaceClass = TemperatureService.class, version = "1.0.0")
public class TemperatureServiceImpl extends BaseServiceImpl<Temperature> implements TemperatureService {

    @Autowired
    private TemperatureMapper temperatureMapper;

    @Override
    public BaseMapper<Temperature> getMapper() {
        return temperatureMapper;
    }

    /**
     * 体温数据新增(根据JSON格式新增)
     */
    @Override
    public Integer temAddJson(JSON json) {
        Temperature temperature = new Temperature();
        JSONObject jsonObject = JSONObject.parseObject(json.toString());
        temperature = JSON.toJavaObject(jsonObject, Temperature.class);
        temperatureMapper.insert(temperature);
        return temperature.getId();
    }
}
