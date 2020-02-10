package com.fedtech.pension.call.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.call.entity.ReturnVisit;

/**
 * @author CoderQiang
 * @date 2017/2/9
 */
public interface ReturnVisitService extends BaseService<ReturnVisit> {
    /**
     * 更新回访者是visitorId的状态
     *
     * @param status
     * @param visitorId
     * @return
     */
    boolean updateStatusByVisitorId(Integer status, Integer visitorId);

    /**
     * 更新结果
     *
     * @param visitResult
     * @param callInfoId
     * @return
     */
    boolean updateResultByCallInfoId(Integer visitResult, Integer callInfoId);
}
