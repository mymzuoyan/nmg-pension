package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.CashPool;


public interface CashPoolMapper extends BaseMapper<CashPool> {


    /**
     *
     * @param cashPool
     * @return
     */
    CashPool selectByEntity(CashPool cashPool);

    Boolean updateServiceMoney(CashPool cashPool);

}
