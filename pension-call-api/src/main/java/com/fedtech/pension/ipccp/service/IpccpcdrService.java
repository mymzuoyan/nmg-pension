package com.fedtech.pension.ipccp.service;


import com.fedtech.pension.ipccp.entity.Ipccpcdr;

/**
 * @author gengqiang
 * @date 2017/12/20
 */
public interface IpccpcdrService {
    /**
     * 根据座席号回去队列
     *
     * @param AgentID
     * @return
     */
    Ipccpcdr selectOneByAgentId(String AgentID);
}
