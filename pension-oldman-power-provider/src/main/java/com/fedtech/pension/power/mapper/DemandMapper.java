package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Demand;

public interface DemandMapper extends BaseMapper<Demand> {

    /**
     * 获取老人需求评估表完成度记分规则
     *
     * @return
     */
    Demand findDemand();
}
