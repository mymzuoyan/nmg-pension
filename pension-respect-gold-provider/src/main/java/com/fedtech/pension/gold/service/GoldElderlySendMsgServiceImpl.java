package com.fedtech.pension.gold.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.gold.entity.GoldElderlySendMsg;
import com.fedtech.pension.gold.mapper.GoldElderlySendMsgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.text.SimpleDateFormat;

/**
 *
 * @author DMJ
 * @date 2019/3/15
 */
@Service(interfaceClass = GoldElderlySendMsgService.class,version = "1.0.0")
@org.springframework.stereotype.Service
@Component
public class GoldElderlySendMsgServiceImpl extends BaseServiceImpl<GoldElderlySendMsg> implements GoldElderlySendMsgService{

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version ="1.0.0")
    private GoldElderlySendMsgService goldElderlySendMsgService;

    @Autowired
    private GoldElderlySendMsgMapper goldElderlySendMsgMapper;

    @Override
    public BaseMapper<GoldElderlySendMsg> getMapper() {
        return goldElderlySendMsgMapper;
    }
}
