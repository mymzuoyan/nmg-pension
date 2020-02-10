package com.fedtech.pension.elderly.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.entity.ElderlyOperatingSubsidies;

/**
 * @author guxiangyang
 * @date 2019/11/22
 */
public interface ElderlyOperatingSubsidiesService  extends BaseService<ElderlyOperatingSubsidies> {


    void delByInsConSuld(Integer insConSuId);
}
