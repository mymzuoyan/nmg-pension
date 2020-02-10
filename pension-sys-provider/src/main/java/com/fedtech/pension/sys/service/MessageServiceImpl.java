package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.entity.MessageReceive;
import com.fedtech.pension.sys.mapper.MessageMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/1/20
 */
@Service(interfaceClass = MessageService.class, version = "1.0.0")
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private MessageReceiveService messageReceiveService;

    @Override
    public BaseMapper<Message> getMapper() {
        return messageMapper;
    }

    @Override
    public boolean insert(Message record, Integer currentId) {
        if (super.insert(record)) {
            MessageReceive messageReceive = new MessageReceive();
            messageReceive.setMessageId(record.getId());
            messageReceive.setReceiverId(currentId);
            messageReceive.setRead(1);
            messageReceive.setReadTime(new Date());
            return messageReceiveService.insert(messageReceive);
        }
        return false;
    }

    @Override
    public List<Message> selectUnRead(Message message, PageRequest pageRequest) {
        return messageMapper.selectUnRead(message, pageRequest);
    }

    @Override
    public Integer countUnRead(Message message) {
        return messageMapper.countUnRead(message);
    }

    @Override
    public boolean sendMessage(Message message, List<Integer> userIds) {
        if (this.insert(message)) {
            List<MessageReceive> messageReceives = new ArrayList<>();
            for (Integer id : userIds) {
                MessageReceive messageReceive = new MessageReceive();
                messageReceive.setMessageId(message.getId());
                messageReceive.setReceiverId(id);
                messageReceive.setRead(0);
                messageReceives.add(messageReceive);
            }
            return messageReceiveService.insertSomeAccord(messageReceives);
        }
        return false;
    }

    @Override
    public boolean deleteSomeMessage(List<Integer> idList) {
        if (messageMapper.deleteSomeMessage(idList) > 0) {
            return true;
        }
        return false;
    }
}
