package com.fedtech.pension.task.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.task.entity.TaskHandle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface TaskHandleMapper extends BaseMapper<TaskHandle> {
    /**
     * 获取一个工单处理流程
     *
     * @param taskId
     * @return
     */
    List<TaskHandle> getTaskHandles(@Param("taskId") Integer taskId);


    /**
     * 获取一个工单处理流程
     *
     * @param taskId
     * @return
     */
    TaskHandle getTaskHandleByStatus(@Param("taskId") Integer taskId, @Param("status") Integer status);
}