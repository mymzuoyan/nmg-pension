package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Enroll;

public interface EnrollService extends BaseService<Enroll> {

    /**
     * 新增、修改老人能力评估完成度分值设置
     *
     * @param enroll
     * @return
     */
    boolean updateEnroll(Enroll enroll);
    /**
     * 根据memberID获取Enroll
     *
     * @param memberID
     * @return
     */
    Enroll selectBymemberID(String memberID);

}
