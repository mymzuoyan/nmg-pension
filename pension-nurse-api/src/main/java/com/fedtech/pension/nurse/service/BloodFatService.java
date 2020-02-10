package com.fedtech.pension.nurse.service;

import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.BloodFat;

/**
 *  血脂
 * @author gxy
 * @date 2019/6/24 - 13:14
 */
public interface BloodFatService extends BaseService<BloodFat> {

    /**
     * 老人血脂数据保存(根据JSON格式新增)
     *
     * @param jsonObjectBlooadFat
     * @return
     */
    int insertBloodFat(JSONObject jsonObjectBlooadFat);
}
