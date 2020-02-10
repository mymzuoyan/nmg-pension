package com.fedtech.pension.org.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgAssessment;

import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
public interface ServiceOrgAssessmentService extends BaseService<ServiceOrgAssessment> {

    /**
     * 根据组织id获取组织申请的评估
     *
     * @param id
     * @return
     */
    ServiceOrgAssessment selectByServiceOrgId(Integer id);

    /**
     * 数据统计
     *
     * @return
     */
    Map<String, List<Integer>> getStatistic(Integer areaId);
}
