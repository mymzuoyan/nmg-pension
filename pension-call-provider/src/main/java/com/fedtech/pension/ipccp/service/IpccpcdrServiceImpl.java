package com.fedtech.pension.ipccp.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.pension.ipccp.entity.Ipccpcdr;
import com.fedtech.pension.ipccp.mapper.IpccpcdrMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/12/20
 */
@Service(interfaceClass = IpccpcdrService.class, version = "1.0.0")
public class IpccpcdrServiceImpl implements IpccpcdrService {

    @Autowired
    private IpccpcdrMapper ipccpcdrMapper;

    @Override
    public Ipccpcdr selectOneByAgentId(String agentID) {
        return ipccpcdrMapper.selectOneByAgentId(agentID);
    }
}
