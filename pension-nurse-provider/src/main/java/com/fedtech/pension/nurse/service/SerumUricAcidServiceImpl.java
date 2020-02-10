package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.SerumUricAcid;
import com.fedtech.pension.nurse.mapper.SerumUricAcidMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author fan
 */
@Service(interfaceClass = SerumUricAcidService.class, version = "1.0.0")
public class SerumUricAcidServiceImpl extends BaseServiceImpl<SerumUricAcid> implements SerumUricAcidService {

    @Autowired
    private SerumUricAcidMapper serumUricAcidMapper;

    @Override
    public BaseMapper<SerumUricAcid> getMapper() {
        return serumUricAcidMapper;
    }

    @Override
    public Integer serumUricAcid2Json(JSONObject jsonObject) {
        SerumUricAcid serumUricAcid = new SerumUricAcid();
        serumUricAcid = (SerumUricAcid)JSONObject.toJavaObject(jsonObject,SerumUricAcid.class);
        serumUricAcidMapper.insert(serumUricAcid);
        return serumUricAcid.getId();
    }
}
