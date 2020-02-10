package com.fedtech.pension.org.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgAssessment;
import org.apache.ibatis.annotations.Param;

/**
 * @author gengqiang
 */
public interface ServiceOrgAssessmentMapper extends BaseMapper<ServiceOrgAssessment> {

    ServiceOrgAssessment selectByServiceOrgId(@Param("id")Integer id);
}
