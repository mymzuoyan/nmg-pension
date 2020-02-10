package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.BodyIndex;

/**
 * Created by miaoyueming on 2019/6/25.
 */
public interface BodyIndexService extends BaseService<BodyIndex> {

    /**
     * 身体指数数据新增(根据JSON格式新增)
     */
    public Integer bodyAddJson(JSON json);
}
