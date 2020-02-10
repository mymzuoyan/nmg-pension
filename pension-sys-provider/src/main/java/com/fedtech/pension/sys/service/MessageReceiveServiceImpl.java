package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.sys.entity.MessageReceive;
import com.fedtech.pension.sys.mapper.MessageReceiveMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/1/20
 */
@Service(interfaceClass = MessageReceiveService.class, version = "1.0.0")
@org.springframework.stereotype.Service
public class MessageReceiveServiceImpl extends BaseServiceImpl<MessageReceive> implements MessageReceiveService {

    @Autowired
    private MessageReceiveMapper messageReceiveMapper;

    @Override
    public BaseMapper<MessageReceive> getMapper() {
        return messageReceiveMapper;
    }

    @Override
    public MessageReceive selectOneByUser(Integer uid, Integer id) {
        return messageReceiveMapper.selectOneByUser(uid, id);
    }

    @Override
    public boolean insertSomeAccord(List<MessageReceive> messageReceives) {
        if (ObjectUtils.isNotNull(messageReceives)) {
            return messageReceiveMapper.insertSomeAccord(messageReceives) > 0;
        }
        return false;
    }

    @Override
    public boolean updateByMessageIdAndReceiverId(MessageReceive messageReceive) {
        if (ObjectUtils.isNotNull(messageReceive)) {
            return messageReceiveMapper.updateByMessageIdAndReceiverId(messageReceive) > 0;
        }
        return false;
    }

    @Override
    public boolean deleteSomeMessageReceive(List<Integer> idList) {
        if (messageReceiveMapper.deleteSomeMessageReceive(idList) > 0) {
            return true;
        }
        return false;
    }
}
