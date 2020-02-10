package com.fedtech.pension.call.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.call.entity.CallInfo;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.vo.MonitorInfo;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author CodingQiang
 * @date 2016/10/14
 */
public interface CallInfoService extends BaseService<CallInfo> {


    /**
     * 获取缓存
     *
     * @param agentId
     */
    MonitorInfo getMonitorInfo(String agentId);

    /**
     * 存缓存
     *
     * @param agentId
     * @param monitorInfo
     */
    void putMonitorInfo(String agentId, MonitorInfo monitorInfo);


    /**
     * 获取
     *
     * @param uniqueId
     * @return
     */
    CallInfo selectByUniqueId(String uniqueId);

    /**
     * 对通话纪录进行数据分析
     *
     * @param monitorAddress
     * @param dataType
     * @param timeType
     * @param startTime
     * @param end
     * @return
     * @throws ParseException
     */
    Map<String, Map<String, Integer>> getCallInfoStatistics(String monitorAddress, String dataType, String timeType, String startTime, String end) throws ParseException;

    /**
     * 获取特定队列特定范围内的数据数量
     *
     * @param infos
     * @param queueName
     * @param startTime
     * @param endTime
     * @return
     */
    int getDateByRange(List<CallInfo> infos, String queueName, long startTime, long endTime);

    /**
     * 获取特定满意度特定范围内的数据数量
     *
     * @param infos
     * @param evaluateStar
     * @param startTime
     * @param endTime
     * @return
     */
    int getDateByRange(List<CallInfo> infos, int evaluateStar, long startTime, long endTime);

    /**
     * 获取特定用户的特定类型的数量
     *
     * @param monitors
     * @param type
     * @return
     */
    Map<String, Long> countByMonitors(List<Monitor> monitors, Integer type);

    /**
     * 获取特定用户的特定类型特定时间内工单的数量
     *
     * @param monitors
     * @param type
     * @param startTime
     * @param endTime
     * @return
     */
    Map<String, Long> countByMonitorsByTime(List<Monitor> monitors,
                                            Integer type,
                                            Date startTime,
                                            Date endTime);

    /**
     * 当月 满意度 统计
     *
     * @return
     */
    Map<String, Integer> getEvaluateStatisticsByMonth();


    /**
     * 当前30天的呼叫量
     *
     * @return
     */
    Map<String, Integer> getDataByDate();

    /**
     * 批量获取uniquedId相关的处理记录
     *
     * @param uniqueIds
     * @return
     */
    List<CallInfo> selectLinkedCall(List<String> uniqueIds);

}
