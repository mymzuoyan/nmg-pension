package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.MoneyFlow;


public interface MoneyflowService extends BaseService<MoneyFlow> {

    /**
     * 新增助老卡流水
     * @param moneyFlow
     * @return
     */
    boolean insertMoneyFlow(MoneyFlow moneyFlow);

    /**
     * 统计助老卡流水
     * @param date
     * @return
     */
    Integer countMoneyFlowBydate(String date);


}
