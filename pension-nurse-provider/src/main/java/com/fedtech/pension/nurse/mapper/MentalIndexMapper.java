package com.fedtech.pension.nurse.mapper;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.MentalIndex;

/**
 * @author miaoyueming
 */
public interface MentalIndexMapper extends BaseMapper<MentalIndex> {

    /**
     * 精神指数数据新增(根据JSON格式新增)
     */
    public Integer mentalAddJson(JSON json);
}
