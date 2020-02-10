package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.Temperature;

/**
 * Created by miaoyueming on 2019/6/25.
 */
public interface TemperatureService extends BaseService<Temperature> {

    /**
     * 体温数据新增(根据JSON格式新增)
     */
    public Integer temAddJson(JSON json);
}
