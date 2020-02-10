package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSON;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.NurseRequest;

/**
 * Created by miaoyueming on 2019/6/26.
 */
public interface NurseRequestService extends BaseService<NurseRequest> {

    /**
     * 请求数据新增(根据JSON格式新增)
     */
    public Integer requestAddJson(JSON json);
}
