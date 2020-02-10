package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.Ecg;
import com.fedtech.pension.nurse.mapper.EcgMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author fan
 */
@Service(interfaceClass = EcgService.class, version = "1.0.0")
public class EcgServiceImpl extends BaseServiceImpl<Ecg> implements EcgService {

    @Autowired
    private EcgMapper ecgMapper;

    @Override
    public BaseMapper<Ecg> getMapper() {
        return ecgMapper;
    }

    @Override
    public Integer ecg2Json(JSONObject jsonObject) {
        Ecg ecg = new Ecg();
        ecg = (Ecg)JSONObject.toJavaObject(jsonObject,Ecg.class);
        ecgMapper.insert(ecg);
        return ecg.getId();
    }
}
