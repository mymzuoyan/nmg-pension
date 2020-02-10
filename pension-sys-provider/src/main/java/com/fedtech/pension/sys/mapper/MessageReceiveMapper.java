package com.fedtech.pension.sys.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.MessageReceive;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface MessageReceiveMapper extends BaseMapper<MessageReceive> {

    /**
     * 查询
     *
     * @param uid
     * @param id
     * @return
     */
    MessageReceive selectOneByUser(@Param("uid") Integer uid, @Param("id") Integer id);

    /**
     * 更新
     *
     * @param messageReceive
     * @return
     */
    int updateByMessageIdAndReceiverId(MessageReceive messageReceive);

    /**
     * 批量插入
     *
     * @param messageReceives
     * @return
     */
    int insertSomeAccord(@Param("messageReceives") List<MessageReceive> messageReceives);

    /**
     * 删除
     *
     * @param idList
     * @return
     */
    int deleteSomeMessageReceive(@Param("idList") List<Integer> idList);
}