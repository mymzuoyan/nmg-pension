package com.fedtech.pension.sys.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.MessageReceive;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/1/20
 */
public interface MessageReceiveService extends BaseService<MessageReceive> {

    /**
     * 查询
     * @param uid
     * @param id
     * @return
     */
    MessageReceive selectOneByUser(Integer uid, Integer id);

    /**
     * 批量插入
     * @param messageReceives
     * @return
     */
    boolean insertSomeAccord(List<MessageReceive> messageReceives);

    /**
     * 更新
     * @param messageReceive
     * @return
     */
    boolean updateByMessageIdAndReceiverId(MessageReceive messageReceive);

    /**
     * 删除
     * @param idList
     * @return
     */
    boolean deleteSomeMessageReceive(List<Integer> idList);
}
