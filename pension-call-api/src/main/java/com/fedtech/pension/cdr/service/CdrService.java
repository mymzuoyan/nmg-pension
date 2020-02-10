package com.fedtech.pension.cdr.service;


import com.fedtech.pension.cdr.entity.Cdr;

import java.util.List;
import java.util.Map;

/**
 * @author CodingQiang
 * @date 2016/10/18
 */
public interface CdrService {

    /**
     * @param uniqueId
     * @return
     */
    Cdr selectByUniqueId(String uniqueId);

    List<Map<String,Object>> selectAll();

    Integer selectStatusByAgent(String agentnum);

    String selectCurPhone(String agentnum);

    List<Map<String,Object>> selectMyRecord(String agentnum, String pstnnumber);

    List<Map<String,Object>> selectQueueData(String queueName);

    List<Map<String,Object>> selectGroups();

    Integer selectChatCount();

    Integer selectQueueCount();
}
