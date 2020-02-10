package com.fedtech.pension.task.service;


import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.task.entity.TaskHandle;

import java.util.List;

/**
 * Created by CoderQiang on 2017/4/5.
 */
public interface TaskHandleService extends BaseService<TaskHandle> {

    /**
     * 获取一个工单处理流程
     * @param taskId
     * @return
     */
    List<TaskHandle> getTaskHandles(Integer taskId);

    /**
     * 获取一个工单处理流程和工单详情
     * @param taskId
     * @return
     */
    JSONObject getTaskHandleList(Integer taskId);


    /**
     * 获取一个工单处理流程
     * @param taskId
     * @return
     */
    TaskHandle getTaskHandleByStatus(Integer taskId,Integer status);
}
