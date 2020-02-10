package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.BloodSugar;
import com.fedtech.pension.nurse.mapper.BloodSugarMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  血糖
 * @author gxy
 * @date 2019/6/24 - 13:23
 */
@Service(interfaceClass = BloodSugarService.class, version = "1.0.0")
public class BloodSugarServiceImpl extends BaseServiceImpl<BloodSugar> implements BloodSugarService {

    @Autowired
    private BloodSugarMapper bloodSugarMapper;

    @Override
    public BaseMapper<BloodSugar> getMapper() {
        return bloodSugarMapper;
    }


    @Override
    public int insertBloodSugar(JSONObject jsonObjectBloodSugar) {
        BloodSugar bloodSugar = new BloodSugar();
        bloodSugar= (BloodSugar)JSONObject.toJavaObject(jsonObjectBloodSugar,bloodSugar.getClass());
        bloodSugarMapper.insert(bloodSugar);
             return bloodSugar.getId();
    }
}
