package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.MentalIndex;
import com.fedtech.pension.nurse.mapper.MentalIndexMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author miaoyueming
 * @date 2019/6/24
 */

@Service(interfaceClass = MentalIndexService.class, version = "1.0.0")
public class MentalIndexServiceImpl extends BaseServiceImpl<MentalIndex> implements MentalIndexService {

    @Autowired

    private MentalIndexMapper mentalIndexMapper;

    @Override
    public BaseMapper<MentalIndex> getMapper() {
        return mentalIndexMapper;
    }

    /**
     * 精神指数数据新增(根据JSON格式新增)
     */
    @Override
    public Integer mentalAddJson(JSON json) {
        MentalIndex mentalIndex = new MentalIndex();
        JSONObject jsonObject = JSONObject.parseObject(json.toString());
        mentalIndex = JSON.toJavaObject(jsonObject, MentalIndex.class);
        mentalIndexMapper.insert(mentalIndex);
        return mentalIndex.getId();
    }
}
