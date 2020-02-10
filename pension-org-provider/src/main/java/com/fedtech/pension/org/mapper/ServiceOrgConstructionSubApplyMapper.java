package com.fedtech.pension.org.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgConstructionSubsidyApply;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 建设补助申请
 * @author miaoyueming
 * @date 2019/9/29
 */
public interface ServiceOrgConstructionSubApplyMapper extends BaseMapper<ServiceOrgConstructionSubsidyApply> {

    ServiceOrgConstructionSubsidyApply selectByServiceOrgId(@Param("serviceOrgId")Integer serviceOrgId);


    List<ServiceOrgConstructionSubsidyApply> selectAll();



}
