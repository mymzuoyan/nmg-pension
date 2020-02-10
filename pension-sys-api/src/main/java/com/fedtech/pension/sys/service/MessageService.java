package com.fedtech.pension.sys.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.Message;

import java.util.List;

/**
 * Created by CoderQiang on 2017/1/20.
 */
public interface MessageService extends BaseService<Message> {


    /**
     * 添加消息
     * @param record
     * @param currentId
     * @return
     */
    boolean insert(Message record, Integer currentId);

    /**
     * 获取未读消息列表
     * @param message
     * @param pageRequest
     * @return
     */
    List<Message> selectUnRead(Message message, PageRequest pageRequest);

    /**
     * 获取未读消息数量
     * @param message
     * @return
     */
    Integer countUnRead(Message message);

    /**
     * 发送消息
     * @param message
     * @param userId
     * @return
     */
    boolean sendMessage(Message message, List<Integer> userId);

    /**
     * 批量删除消息
     * @param idList
     * @return
     */
    boolean deleteSomeMessage(List<Integer> idList);


}
