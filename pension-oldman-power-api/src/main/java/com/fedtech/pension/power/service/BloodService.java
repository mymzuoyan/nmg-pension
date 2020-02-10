package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Blood;

public interface BloodService extends BaseService<Blood> {

    /**
     * 新增用户血压信息
     *
     * @param blood
     * @return
     */
    boolean updateBlood(Blood blood);
    /**
     * 根据memberID获取Enroll
     *
     * @param testRecordID
     * @return
     */
    Blood selectBytestRecordID(String testRecordID);
}
