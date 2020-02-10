package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.BloodSugar;

/**
 *  血糖
 * @author gxy
 * @date 2019/6/24 - 13:15
 */
public interface BloodSugarService extends BaseService<BloodSugar> {

    /**
     * 老人血糖数据保存(根据JSON格式新增)
     *
     * @param jsonObjectBloodSugar
     * @return
     */
    int insertBloodSugar(JSONObject jsonObjectBloodSugar);
}
