package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Wcdfzsz;

public interface WcdfzszMapper extends BaseMapper<Wcdfzsz> {

    /**
     * 获取老人能力评估表完成度记分规则
     *
     * @return
     */
    Wcdfzsz findWcdfzsz();
}
