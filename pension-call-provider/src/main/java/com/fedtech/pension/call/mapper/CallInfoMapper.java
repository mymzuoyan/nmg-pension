package com.fedtech.pension.call.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.call.entity.CallInfo;
import com.fedtech.pension.call.entity.Monitor;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
public interface CallInfoMapper extends BaseMapper<CallInfo> {

    /**
     * 获取通话信息
     *
     * @param uniqueId
     * @return
     */
    CallInfo selectByUniqueId(@Param("uniqueId") String uniqueId);

    /**
     * 统计
     *
     * @param monitors
     * @param type
     * @return
     */
    List<Map> countByMonitors(@Param("monitors") List<Monitor> monitors, @Param("type") Integer type);

    /**
     * 统计
     *
     * @param monitors
     * @param type
     * @param startTime
     * @param endTime
     * @return
     */
    List<Map> countByMonitorsByTime(@Param("monitors") List<Monitor> monitors,
                                    @Param("type") Integer type,
                                    @Param("startTime") Date startTime,
                                    @Param("endTime") Date endTime);

    /**
     * 批量获取uniquedId相关的处理记录
     *
     * @param uniqueIds
     * @return
     */
    List<CallInfo> selectLinkedCall(@Param("uniqueIds") List<String> uniqueIds);


}