package com.fedtech.pension.ipccp.mapper;


import com.fedtech.pension.ipccp.entity.Ipccpcdr;

/**
 * @author gengqiang
 */
public interface IpccpcdrMapper {

    /**
     * 根据座席号回去队列
     *
     * @param agentID
     * @return
     */
    Ipccpcdr selectOneByAgentId(String agentID);
}