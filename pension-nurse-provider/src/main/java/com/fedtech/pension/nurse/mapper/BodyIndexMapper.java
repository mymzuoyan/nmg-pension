package com.fedtech.pension.nurse.mapper;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.BodyIndex;

/**
 * @author miaoyueming
 */
public interface BodyIndexMapper extends BaseMapper<BodyIndex> {

    /**
     * 身体指数数据新增(根据JSON格式新增)
     */
    public Integer bodyAddJson(JSON json);
}
