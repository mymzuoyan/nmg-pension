package com.fedtech.pension.call.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.sys.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2016/9/12.
 */
public interface MonitorService extends BaseService<Monitor> {

    /**
     * 添加座席人员
     *
     * @param user
     * @param groupId
     * @param groupName
     * @param queueName
     * @param telNum
     * @return
     */
    boolean addMonitor(User user, Integer groupId, String groupName, String queueName, String telNum);

    boolean addAgent(Monitor monitor);
    /**
     * 更新
     *
     * @param user
     * @param extension
     * @param groupId
     * @param oldGroupId
     * @param groupName
     * @param oldIsLeaer
     * @param isLeader
     * @return
     */
    boolean updateMonitor(User user, String extension, Integer groupId, Integer oldGroupId, String groupName, boolean oldIsLeaer, boolean isLeader);

    /**
     * 删除座席
     *
     * @param uid
     * @return
     */
    boolean deleteMonitor(Integer uid);

    /**
     * 查询座席
     *
     * @param userId
     * @return
     */
    Monitor selectByUserId(Integer userId);

    /**
     * 更新
     *
     * @param monitor
     * @return
     */
    boolean updateByUserId(Monitor monitor);

    Monitor selectByAgentNum(String agentnum);

    void updateAgent(Monitor monitor);

    Monitor selectByMonitorId(Integer id);

    boolean updateMonitor(Integer id, Integer uid, String queueName, String pstnnumber);

    List<Monitor> selectAll();

}
