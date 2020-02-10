package com.fedtech.pension.cdr.mapper;


import com.fedtech.pension.cdr.entity.Cdr;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
public interface CdrMapper {
    /**
     * 根据uniqueId来获取通话记录
     *
     * @param uniqueId
     * @return
     */
    Cdr selectByUniqueId(@Param("uniqueId") String uniqueId);

    List<Map<String ,Object>> selectAll();

    Integer selectStatusByAgent(@Param("agentnum") String agentnum);

    String selectCurPhone(@Param("agentnum") String agentnum);

    List<Map<String,Object>> selectMyRecord(@Param("agentnum") String agentnum, @Param("pstnnumber") String pstnnumber);

    List<Map<String,Object>> selectQueueData(@Param("queueName") String queueName);

    List<Map<String,Object>> selectGroups();

    Integer selectChatCount();

    Integer selectQueueCount();
}