package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.MoneyFlow;
import com.fedtech.pension.power.mapper.MoneyFlowMapper;
import org.springframework.beans.factory.annotation.Autowired;


@Service(interfaceClass = MoneyflowService.class, version = "1.0.0")
public class MoneyFlowServiceImpl extends BaseServiceImpl<MoneyFlow> implements MoneyflowService {

    @Autowired
    private MoneyFlowMapper moneyFlowMapper;

    @Override
    public BaseMapper<MoneyFlow> getMapper() {
        return moneyFlowMapper;
    }


    @Override
    public boolean insertMoneyFlow(MoneyFlow moneyFlow) {
        moneyFlowMapper.insert(moneyFlow);
        return true;
    }

    @Override
    public Integer countMoneyFlowBydate(String date) {
        return moneyFlowMapper.countMoneyFlowBydate(date);
    }
}
