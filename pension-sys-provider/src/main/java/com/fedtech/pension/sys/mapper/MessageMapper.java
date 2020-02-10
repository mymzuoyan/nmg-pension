package com.fedtech.pension.sys.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper extends BaseMapper<Message> {

    /**
     * 获取未读消息列表
     *
     * @param message
     * @param pageRequest
     * @return
     */
    List<Message> selectUnRead(@Param("filter") Message message, @Param("page") PageRequest pageRequest);

    /**
     * 获取未读消息数量
     *
     * @param message
     * @return
     */
    Integer countUnRead(Message message);

    /**
     * 批量删除消息
     *
     * @param idList
     * @return
     */
    int deleteSomeMessage(@Param("idList") List<Integer> idList);

}