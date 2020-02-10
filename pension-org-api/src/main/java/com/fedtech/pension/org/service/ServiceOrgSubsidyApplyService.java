package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgSubsidyApply;
import com.fedtech.pension.org.vo.ServiceOrgSubsidyApplyStatistic;

import java.util.List;

/**
 * @author gengqiang
 * @date 2018/1/19
 */
public interface ServiceOrgSubsidyApplyService extends BaseService<ServiceOrgSubsidyApply> {


    /**
     * 获取统计数据
     *
     * @param filter
     * @return
     */
    List<ServiceOrgSubsidyApplyStatistic> getStatistics(ServiceOrgSubsidyApplyStatistic filter);

}
