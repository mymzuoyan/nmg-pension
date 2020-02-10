package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.BloodPressure;

/**
 *  血压
 * @author gxy
 * @date 2019/6/24 - 13:15
 */
public interface BloodPressureService extends BaseService<BloodPressure> {

    /**
     * 老人血压数据保存(根据JSON格式新增)
     *
     * @param jsonObjectBloodPressure
     * @return
     */
    int insertBloodPressure(JSONObject jsonObjectBloodPressure);
}
