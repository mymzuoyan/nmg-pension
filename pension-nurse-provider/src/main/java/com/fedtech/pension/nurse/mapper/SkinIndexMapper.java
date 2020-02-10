package com.fedtech.pension.nurse.mapper;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.SkinIndex;

/**
 * @author miaoyueming
 */
public interface SkinIndexMapper extends BaseMapper<SkinIndex> {

    /**
     * 皮肤指数数据新增(根据JSON格式新增)
     */
    public Integer skinAddJson(JSON json);
}
