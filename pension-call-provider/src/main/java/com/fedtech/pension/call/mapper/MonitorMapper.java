package com.fedtech.pension.call.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.call.entity.Monitor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface MonitorMapper extends BaseMapper<Monitor> {

    /**
     * 更新
     *
     * @param monitor
     * @return
     */
    int updateByUserId(Monitor monitor);

    /**
     * 删除
     *
     * @param userId
     * @return
     */
    int deleteMonitor(@Param("userId") Integer userId);

    /**
     * 查询
     *
     * @param userId
     * @return
     */
    Monitor selectByUserId(@Param("userId") Integer userId);

    Monitor selectByAgentNum(@Param("agentnum") String agentnum);

    int insertAgent(Monitor monitor);

    void updateAgent(Monitor monitor);

    Monitor selectByMonitorId(@Param("id") Integer id);

    int updateMonitorUser(@Param("id") Integer id, @Param("uid") Integer uid, @Param("queueName") String queueName, @Param("pstnnumber") String pstnnumber);

    List<Monitor> selectAll();
}