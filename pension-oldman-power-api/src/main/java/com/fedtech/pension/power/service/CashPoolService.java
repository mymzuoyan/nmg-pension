package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.CashPool;


public interface CashPoolService extends BaseService<CashPool> {


    /**
     * 新增、修改
     *
     * @param cashPool
     * @return
     */
    boolean updateCashPool(CashPool cashPool);
    /**
     *
     * @param cashPool
     * @return
     */
    CashPool selectByEntity(CashPool cashPool);

    /**
     * 充值
     * @param cashPool
     * @return
     */
    boolean updateServiceMoney(CashPool cashPool);


}
