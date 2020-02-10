package com.fedtech.pension.nurse.service;


import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.RespiratoryRate;

/**
 * @author fan
 */
public interface RespiratoryRateService extends BaseService<RespiratoryRate> {

    /**
     * 接受JSON数据存入数据库
     * @param jsonObject
     * @return
     */
    public Integer respiratoryRate2Json(JSONObject jsonObject);
}
