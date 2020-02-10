package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Ability;

public interface AbilityService extends BaseService<Ability> {
    /**
     * 新增、修改老人能力评估完成度分值设置
     *
     * @param ability
     * @return
     */
    boolean update(Ability ability);

    /**
     * 获取老人能力评估完成度分值设置
     *
     * @return
     */
    Ability selectAbility();
}
