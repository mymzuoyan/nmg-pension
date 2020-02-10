package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Ability;

public interface AbilityMapper extends BaseMapper<Ability> {

    /**
     * 获取老人能力评估表完成度记分规则
     *
     * @return
     */
    Ability findAbility();
}
