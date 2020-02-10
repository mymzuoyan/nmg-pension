package com.fedtech.pension.nurse.mapper;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.NurseRequest;

/**
 * @author miaoyueming
 */
public interface NurseRequestMapper extends BaseMapper<NurseRequest> {

    /**
     * 请求数据新增(根据JSON格式新增)
     */
    public Integer RequestAddJson(JSON json);
}
