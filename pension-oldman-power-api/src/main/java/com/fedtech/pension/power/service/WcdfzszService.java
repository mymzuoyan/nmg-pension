package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Wcdfzsz;


public interface WcdfzszService extends BaseService<Wcdfzsz> {

    /**
     * 新增、修改老人能力评估完成度分值设置
     *
     * @param wcdfzsz
     * @return
     */
    boolean updateWcdfzsz(Wcdfzsz wcdfzsz);

    /**
     * 获取老人能力评估完成度分值设置
     *
     * @return
     */
   Wcdfzsz selectWcdfzsz();
}
