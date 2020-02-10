package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.CashPool;
import com.fedtech.pension.power.mapper.CashPoolMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = CashPoolService.class, version = "1.0.0")
public class CashPoolServiceImpl extends BaseServiceImpl<CashPool> implements CashPoolService {
    @Autowired
    private CashPoolMapper cashPoolMapper;

    @Override
    public BaseMapper<CashPool> getMapper() {
        return cashPoolMapper;
    }

    @Override
    public boolean updateCashPool(CashPool oldManCard) {
        if (null != oldManCard) {
            if (oldManCard.getId() != null)
                return 1 == cashPoolMapper.updateByPrimaryKeySelective(oldManCard);
            else {
                return 1 == cashPoolMapper.insert(oldManCard);
            }
        }
        return true;
    }

    @Override
    public CashPool selectByEntity(CashPool oldManCard) {
                return  cashPoolMapper.selectByEntity(oldManCard);
    }

    @Override
    public boolean updateServiceMoney(CashPool oldManCard) {
        if (null != oldManCard) {
            cashPoolMapper.updateServiceMoney(oldManCard);
        }
        return true;
    }


}
