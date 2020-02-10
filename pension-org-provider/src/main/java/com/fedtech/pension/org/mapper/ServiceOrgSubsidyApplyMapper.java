package com.fedtech.pension.org.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgSubsidyApply;
import com.fedtech.pension.org.vo.ServiceOrgSubsidyApplyStatistic;

import java.util.List;

/**
 * @author gengqiang
 */
public interface ServiceOrgSubsidyApplyMapper extends BaseMapper<ServiceOrgSubsidyApply> {


    /**
     * 统计分析
     * @param query0
     * @return
     */
    List<ServiceOrgSubsidyApplyStatistic> statistic(ServiceOrgSubsidyApplyStatistic query0);
}