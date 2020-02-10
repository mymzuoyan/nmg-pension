package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Demand;
import com.fedtech.pension.power.mapper.DemandMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = DemandService.class, version = "1.0.0")
public class DemandServiceImpl extends BaseServiceImpl<Demand> implements DemandService {
    @Autowired
    private DemandMapper demandMapper;
    @Override
    public BaseMapper<Demand> getMapper() {
        return demandMapper;
    }
    @Override
    public Demand selectDemand() {
        return demandMapper.findDemand();
    }

    @Override
    public boolean update(Demand demand) {
          if(null!=demand)
          {
              if(demand.getId()!=null)
              {
                  return 1 == demandMapper.updateByPrimaryKeySelective(demand);
              }
              else
              {
                  return 1 == demandMapper.insert(demand);
              }
          }
        return true;
    }



}
