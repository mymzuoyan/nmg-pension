package com.fedtech.pension.nurse.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.BloodFat;
import com.fedtech.pension.nurse.mapper.BloodFatMapper;
import org.springframework.beans.factory.annotation.Autowired;


/**
 *  血脂
 * @author gxy
 * @date 2019/6/24 - 13:21
 */
@Service(interfaceClass = BloodFatService.class, version = "1.0.0")
public class BloodFatServiceImpl extends BaseServiceImpl<BloodFat> implements BloodFatService {

    @Autowired
    private BloodFatMapper bloodFatMapper;



    @Override
    public BaseMapper<BloodFat> getMapper() {
        return bloodFatMapper;
    }


    @Override
    public int insertBloodFat(JSONObject jsonObjectBlooadFat) {
        BloodFat bloodFat = new BloodFat();
        bloodFat= (BloodFat)JSONObject.toJavaObject(jsonObjectBlooadFat,bloodFat.getClass());
        bloodFatMapper.insert(bloodFat);
             return bloodFat.getId();
    }
}
