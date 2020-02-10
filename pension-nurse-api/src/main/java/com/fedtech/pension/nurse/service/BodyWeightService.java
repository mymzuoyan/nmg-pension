package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.BodyWeight;

/**
 *  体重
 * @author gxy
 * @date 2019/6/24 - 13:15
 */
public interface BodyWeightService extends BaseService<BodyWeight> {

    /**
     * 老人体重数据保存(根据JSON格式新增)
     *
     * @param jsonObjectBodyWeight
     * @return
     */
    int insertBodyWeight(JSONObject jsonObjectBodyWeight);
}
