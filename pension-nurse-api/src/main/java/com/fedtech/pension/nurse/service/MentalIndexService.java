package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.MentalIndex;

/**
 * Created by miaoyueming on 2019/6/25.
 */
public interface MentalIndexService extends BaseService<MentalIndex> {

    /**
     * 精神指数数据新增(根据JSON格式新增)
     */
    public Integer mentalAddJson(JSON json);
}
