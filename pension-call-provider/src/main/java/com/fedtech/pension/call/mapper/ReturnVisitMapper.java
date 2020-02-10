package com.fedtech.pension.call.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.call.entity.ReturnVisit;
import org.apache.ibatis.annotations.Param;

/**
 * Created by CoderQiang on 2017/2/9.
 */
public interface ReturnVisitMapper extends BaseMapper<ReturnVisit> {

    /**
     * 更新回访者是visitorId的状态
     *
     * @param status
     * @param visitorId
     * @return
     */
    int updateStatusByVisitorId(@Param("status") Integer status, @Param("visitorId") Integer visitorId);

    /**
     * 更新 回访结果
     *
     * @param visitResult
     * @param callInfoId
     * @return
     */
    int updateResultByCallInfoId(@Param("visitResult") Integer visitResult, @Param("callInfoId") Integer callInfoId);
}
