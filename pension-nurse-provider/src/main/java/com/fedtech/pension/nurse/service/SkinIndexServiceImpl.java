package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.SkinIndex;
import com.fedtech.pension.nurse.mapper.SkinIndexMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author miaoyueming
 * @date 2019/6/24
 */

@Service(interfaceClass = SkinIndexService.class, version = "1.0.0")
public class SkinIndexServiceImpl extends BaseServiceImpl<SkinIndex> implements SkinIndexService {

    @Autowired
    private SkinIndexMapper skinIndexMapper;

    @Override
    public BaseMapper<SkinIndex> getMapper() {
        return skinIndexMapper;
    }

    /**
     * 皮肤指数数据新增(根据JSON格式新增)
     */
    @Override
    public Integer skinAddJson(JSON json) {
        SkinIndex skinIndex = new SkinIndex();
        JSONObject jsonObject = JSONObject.parseObject(json.toString());
        skinIndex = JSON.toJavaObject(jsonObject, SkinIndex.class);
        skinIndexMapper.insert(skinIndex);
        return skinIndex.getId();
    }
}
