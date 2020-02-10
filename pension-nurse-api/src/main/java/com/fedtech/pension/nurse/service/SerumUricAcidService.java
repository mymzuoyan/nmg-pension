package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.SerumUricAcid;

/**
 * @author fan
 */
public interface SerumUricAcidService extends BaseService<SerumUricAcid> {

    /**
     * 接受JSON数据存入数据库
     * @param jsonObject
     * @return
     */
    public Integer serumUricAcid2Json(JSONObject jsonObject);

}
