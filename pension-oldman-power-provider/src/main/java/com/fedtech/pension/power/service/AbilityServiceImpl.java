package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Ability;
import com.fedtech.pension.power.mapper.AbilityMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = AbilityService.class, version = "1.0.0")
public class AbilityServiceImpl extends BaseServiceImpl<Ability> implements AbilityService {
    @Autowired
    private AbilityMapper abilityMapper;
    @Override
    public BaseMapper<Ability> getMapper() {
        return abilityMapper;
    }


    @Override
    public boolean update(Ability ability) {
          if(null!=ability)
          {
              if(ability.getId()!=null)
              {
                  return 1 == abilityMapper.updateByPrimaryKeySelective(ability);
              }
              else
              {
                  return 1 == abilityMapper.insert(ability);
              }
          }
        return true;
    }

    @Override
    public Ability selectAbility() {
        return abilityMapper.findAbility();
    }
}
