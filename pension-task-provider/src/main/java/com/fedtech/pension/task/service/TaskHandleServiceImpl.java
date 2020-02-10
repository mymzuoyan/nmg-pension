package com.fedtech.pension.task.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskHandle;
import com.fedtech.pension.task.mapper.TaskHandleMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 *
 * @author CoderQiang
 * @date 2017/4/5
 */
@Service(interfaceClass = TaskHandleService.class, version = "1.0.0")
public class TaskHandleServiceImpl extends BaseServiceImpl<TaskHandle> implements TaskHandleService {

    @Autowired
    private TaskHandleMapper taskHandleMapper;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Override
    public BaseMapper<TaskHandle> getMapper() {
        return taskHandleMapper;
    }

    @Override
    public JSONObject getTaskHandleList(Integer taskId) {
        JSONObject result = new JSONObject();
        Task task = taskService.selectByPrimaryKey(taskId);
        if (ObjectUtils.isNotNull(task)) {
            result.put("task", task);
            result.put("handle", taskHandleMapper.getTaskHandles(taskId));
            return result;
        }
        return null;
    }

    @Override
    public List<TaskHandle> getTaskHandles(Integer taskId) {
        return taskHandleMapper.getTaskHandles(taskId);
    }

    @Override
    public TaskHandle getTaskHandleByStatus(Integer taskId, Integer status) {
        return taskHandleMapper.getTaskHandleByStatus(taskId, status);
    }
}
