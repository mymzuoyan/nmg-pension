package com.fedtech.pension.nurse.mapper;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.Temperature;

/**
 * @author miaoyueming
 */
public interface TemperatureMapper extends BaseMapper<Temperature> {

    /**
     * 体温数据新增(根据JSON格式新增)
     */
    public Integer temAddJson(JSON json);
}
