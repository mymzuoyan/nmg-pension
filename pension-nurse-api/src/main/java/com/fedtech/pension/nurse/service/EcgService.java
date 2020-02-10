package com.fedtech.pension.nurse.service;


import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.Ecg;

/**
 * @author fan
 */
public interface EcgService extends BaseService<Ecg> {

    /**
     * 接受JSON数据存入数据库
     * @param jsonObject
     * @return
     */
    public Integer ecg2Json(JSONObject jsonObject);

}
