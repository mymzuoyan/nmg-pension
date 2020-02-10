package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.BodyIndex;
import com.fedtech.pension.nurse.mapper.BodyIndexMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author miaoyueming
 * @date 2019/6/24
 */

@Service(interfaceClass = BodyIndexService.class, version = "1.0.0")
public class BodyIndexServiceImpl extends BaseServiceImpl<BodyIndex> implements BodyIndexService {

    @Autowired

    private BodyIndexMapper bodyIndexMapper;

    @Override
    public BaseMapper<BodyIndex> getMapper() {
        return bodyIndexMapper;
    }

    /**
     * 身体指数数据新增(根据JSON格式新增)
     */
    @Override
    public Integer bodyAddJson(JSON json) {
        BodyIndex bodyIndex = new BodyIndex();
        JSONObject jsonObject = JSONObject.parseObject(json.toString());
        bodyIndex = JSON.toJavaObject(jsonObject, BodyIndex.class);
        bodyIndexMapper.insert(bodyIndex);
        return bodyIndex.getId();
    }
}
