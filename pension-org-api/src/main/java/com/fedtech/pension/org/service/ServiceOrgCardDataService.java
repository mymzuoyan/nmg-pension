package com.fedtech.pension.org.service;

import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.pension.org.entity.ServiceOrgCardData;

import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 * @date 2018/4/24
 */

public interface ServiceOrgCardDataService extends BaseService<ServiceOrgCardData> {

    /**
     * 获取民政消费数据
     * @return
     */
    JsonResult getServiceOrgCardData();

    boolean insertSomeMsg (List<Map> dataList);
}
