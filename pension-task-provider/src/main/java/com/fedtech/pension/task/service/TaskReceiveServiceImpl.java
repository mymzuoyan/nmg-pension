package com.fedtech.pension.task.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.mapper.TaskReceiveMapper;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.quantity.TaskReceiveQuantity;
import com.fedtech.pension.task.vo.ServiceOrgTaskVo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * @author Administrator
 * @date 2016/9/18
 */
@Service(interfaceClass = TaskReceiveService.class, version = "1.0.0")
public class TaskReceiveServiceImpl extends BaseServiceImpl<TaskReceive> implements TaskReceiveService {

    @Autowired
    private TaskReceiveMapper mapper;
    @Reference(version = "1.0.0", check = false)
    private TaskService taskService;

    @Override
    public BaseMapper<TaskReceive> getMapper() {
        return mapper;
    }


    @Override
    public boolean deleteByTaskId(Integer taskId) {
        if (taskId != null) {
            return mapper.deleteByTaskId(taskId) > 0;
        }
        return false;
    }

    @Override
    public boolean cancelTask(Integer id) {
        TaskReceive taskReceive = this.selectByPrimaryKey(id);
        if (this.deleteByPrimaryKey(id)) {
            //更新状态
            if (this.updateTaskStatus(taskReceive.getTaskId(), taskReceive.getCreatorId(), TaskReceiveQuantity.RESPONSE)) {
                Task old = taskService.selectByPrimaryKey(taskReceive.getTaskId());
                if (ObjectUtils.isNotNull(old)) {
                    old.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
                    return taskService.updateByPrimaryKeySelective(old);
                }
            }
        }
        return false;
    }

    @Override
    public boolean insertSomeAccord(List<TaskReceive> taskReceives) {
        if (taskReceives != null) {
            return mapper.insertSomeAccord(taskReceives) > 0;
        }
        return false;
    }

    @Override
    public Map<Integer, Integer> getReceiveCountByUids(List<User> users) {
        if (users.size() == 0) {
            return null;
        }
        List<Map<Integer, Object>> regionMap = mapper.getReceiveCountByUids(users);
        Map<Integer, Integer> result = new HashMap<Integer, Integer>();
        for (Map<Integer, Object> map : regionMap) {
            Integer sendCount = null;
            Integer uid = null;
            for (Map.Entry<Integer, Object> entry : map.entrySet()) {
                if ("receiveCount".equals(entry.getKey())) {
                    sendCount = Integer.parseInt(entry.getValue().toString());
                } else if ("uid".equals(entry.getKey())) {
                    uid = Integer.parseInt(entry.getValue().toString());
                }
            }
            result.put(uid, sendCount);
        }
        return result;
    }

    @Override
    public boolean updateTaskStatus(Integer taskId, Integer receiverId, Integer status) {
        if (null != taskId) {
            return 1 == mapper.updateTaskStatus(taskId, receiverId, status);
        }
        return false;
    }

    @Override
    public Map<String, Integer> getTaskStatus(Integer status) {
        Map<String, Integer> map = new HashMap();
        int[] taskStatus = {TaskQuantity.DETELED, TaskQuantity.NOT_RESPONSE, TaskQuantity.SERVICEORG_RESPONSE, TaskQuantity.SERVICEORG_DISPATCH, TaskQuantity.SERVICEORG_REFUSE, TaskQuantity.SERVICEUSER_RESPONSE, TaskQuantity.SERVICEUSER_REGISTER, TaskQuantity.SERVICEUSER_REFUSE, TaskQuantity.PAY, TaskQuantity.COMPLETE, TaskQuantity.EVALUATED};
        int[] taskReceiveStatus = {TaskReceiveQuantity.REFUSE, TaskReceiveQuantity.NOT_RESPONSE, TaskReceiveQuantity.RESPONSE, TaskReceiveQuantity.DISPATCH, TaskReceiveQuantity.COMPLETE};
        map.put("taskStatus", taskStatus[status]);
        if (taskStatus[status] == 0 || taskStatus[status] == 1 || taskStatus[status] == 2 || taskStatus[status] == 3) {
            map.put("taskReceiveStatus", taskReceiveStatus[status]);
        } else if (taskStatus[status] == 8 || taskStatus[status] == 9) {
            map.put("taskReceiveStatus", taskReceiveStatus[4]);
        } else {
            map.put("taskReceiveStatus", taskReceiveStatus[2]);
        }
        return map;
    }

    @Override
    public TaskReceive selectById(Integer id) {
        TaskReceive taskReceive = mapper.selectById(id);
        return taskReceive;
    }

    @Override
    public List<TaskReceive> getTaskByTime(Integer userId, Integer pageNum, Integer length) {
        if (pageNum == 0) {
            pageNum = 1;
        }
        List<TaskReceive> trs = mapper.getTaskByTime(userId, (pageNum - 1) * length, length);
        return trs;
    }

    @Override
    public List<Map> getCountByTime(Map map) {
        return mapper.getCountByTime(map);
    }

    @Override
    public List<Map> getCountByAnyTime(User user, Integer flag, Date startTime, Date endTime) {
        return mapper.getCountByAnyTime(user, flag, startTime, endTime);
    }

    @Override
    public List<TaskReceive> scanCode(String scanCode, Integer userId) {
        return mapper.scanCode(scanCode, userId);
    }


    @Override
    public int getCountByUsersAndTimeAndStatus(User user, Integer status, Date startTime, Date endTime) {
        return mapper.getCountByUsersAndTimeAndStatus(user, status, startTime, endTime);
    }

    @Override
    public int getCountByUsersAndTimeAndLevel(User user, Integer level, Date startTime, Date endTime) {
        return mapper.getCountByUsersAndTimeAndLevel(user, level, startTime, endTime);
    }

    @Override
    public List<Map> selectByCreatorIdOrReceiverId(Map map) {

        return mapper.selectByCreatorIdOrReceiverId(map);
    }

    @Override
    public List<TaskReceive> selectCountByReceiverId(Integer uid) {
        return mapper.selectCountByReceiverId(uid);
    }

    @Override
    public boolean updateByTaskId(TaskReceive taskReceive) {
        return mapper.updateByTaskId(taskReceive) > 0;
    }

    @Override
    public List<TaskReceive> selectByCreatorId(Integer userId, Integer pageNum, String status, String serviceType) {
        PageRequest pageRequest = new PageRequest();
        if (pageNum != null && pageNum > 0) {
            pageRequest.setStart((pageNum - 1) * 5);
            pageRequest.setLength(5);
        }
        return mapper.selectByCreatorId(userId, status, serviceType, pageRequest);
    }


    @Override
    public List<TaskReceive> selectByReceiveIds(List<Integer> ids, Integer pageNum, String status, String serviceType) {
        PageRequest pageRequest = new PageRequest();
        if (pageNum != null && pageNum > 0) {
            pageRequest.setStart((pageNum - 1) * 5);
            pageRequest.setLength(5);
        }
        return mapper.selectByReceiveIds(ids, status, serviceType, pageRequest);
    }

    @Override
    public List<TaskReceive> selectByTaskIds(List<Integer> taskIds, PageRequest pageRequest) {
        return mapper.selectByTaskIds(taskIds, pageRequest);
    }


    @Override
    public TaskReceive getTaskByTaskIdAndRole(Integer taskId, Integer roleId) {
        return mapper.getTaskByTaskIdAndRole(taskId, roleId);
    }

    @Override
    public TaskReceive selectByLastTask(Integer taskId) {
        return mapper.selectByLastTask(taskId);
    }


    @Override
    public List<ServiceOrgTaskVo> getTaskCountByLast30(List<Integer> ids) {
        Calendar cal = Calendar.getInstance();
        //n为推迟的周数，1本周，-1向前推迟一周，2下周，依次类推
        int n = -1;
        cal.add(Calendar.DATE, n * 30);
        return mapper.getTaskCountByRange(ids, cal.getTime(), new Date());
    }

    @Override
    public Double countMoney(TaskReceive taskReceive, Date startTime, Date endTime) {
        return mapper.countMoney(taskReceive, startTime, endTime);
    }
}

