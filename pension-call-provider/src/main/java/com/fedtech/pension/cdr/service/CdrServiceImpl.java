package com.fedtech.pension.cdr.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.pension.cdr.entity.Cdr;
import com.fedtech.pension.cdr.mapper.CdrMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @author CodingQiang
 * @date 2016/10/18
 */
@Service(interfaceClass = CdrService.class, version = "1.0.0")
public class CdrServiceImpl implements CdrService {

    @Autowired
    private CdrMapper mapper;

    @Override
    public Cdr selectByUniqueId(String uniqueId) {
        return mapper.selectByUniqueId(uniqueId);
    }

    @Override
    public List<Map<String ,Object>> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public Integer selectStatusByAgent(String agentunm) {
        return mapper.selectStatusByAgent(agentunm);
    }

    @Override
    public String selectCurPhone(String agentnum) {
        return mapper.selectCurPhone(agentnum);
    }

    @Override
    public List<Map<String,Object>> selectMyRecord(String agentnum,String pstnnumber) {
        return mapper.selectMyRecord(agentnum,pstnnumber);
    }

    @Override
    public List<Map<String, Object>> selectQueueData(String queueName) {
        return mapper.selectQueueData(queueName);
    }

    @Override
    public List<Map<String, Object>> selectGroups() {
        return mapper.selectGroups();
    }

    @Override
    public Integer selectChatCount() {
        return mapper.selectChatCount();
    }

    @Override
    public Integer selectQueueCount() {
        return mapper.selectQueueCount();
    }
}
