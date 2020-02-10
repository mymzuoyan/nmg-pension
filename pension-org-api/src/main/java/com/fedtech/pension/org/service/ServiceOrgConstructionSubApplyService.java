package com.fedtech.pension.org.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgConstructionSubsidyApply;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;

import java.util.List;

/**
 * 建设补助申请
 * @author miaoyueming
 * @date 2019/9/29
 */
public interface ServiceOrgConstructionSubApplyService extends BaseService<ServiceOrgConstructionSubsidyApply> {


    ServiceOrgConstructionSubsidyApply selectByServiceOrgId(Integer serviceOrgId);

    List<ServiceOrgConstructionSubsidyApply> selectAll();



}
