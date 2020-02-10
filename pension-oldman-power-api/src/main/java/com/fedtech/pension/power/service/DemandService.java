package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Demand;

public interface DemandService extends BaseService<Demand> {
    /**
     * 新增、修改老人需求评估完成度分值设置
     *
     * @param demand
     * @return
     */
    boolean update(Demand demand);

    /**
     * 获取老人需求评估完成度分值设置
     *
     * @return
     */
    Demand selectDemand();
}
