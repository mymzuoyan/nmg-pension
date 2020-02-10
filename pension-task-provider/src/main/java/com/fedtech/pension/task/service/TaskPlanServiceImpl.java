package com.fedtech.pension.task.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskPlan;
import com.fedtech.pension.task.entity.TaskReceivePlan;
import com.fedtech.pension.task.mapper.TaskPlanMapper;
import com.fedtech.pension.task.mapper.TaskReceivePlanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2016/9/18.
 */
@Service(version = "1.0.0", interfaceClass = TaskPlanService.class, timeout = 5000, retries = 0)
public class TaskPlanServiceImpl extends BaseServiceImpl<TaskPlan> implements TaskPlanService {

    @Autowired
    private TaskPlanMapper mapper;

    @Autowired
    private TaskReceivePlanMapper taskReceivePlanMapper;

    @Override
    public BaseMapper<TaskPlan> getMapper() {
        return mapper;
    }

    SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    @Override
    public List<TaskPlan> findByNumber(String number) {
        return mapper.findByNumber(number);
    }

    @Override
    public List<TaskPlan> findByNumberAndCreatorId(String number, Integer creatorId) {
        return mapper.findByNumberAndCreatorId(number, creatorId);
    }

    @Override
    public TaskPlan insertBackId(TaskPlan record) {
        record = super.insertBackId(record);
        TaskReceivePlan taskReceivePlan = new TaskReceivePlan();
        taskReceivePlan.setTaskId(record.getId());
        taskReceivePlan.setReceiverId(record.getReceiverId());
        taskReceivePlan.setCreatorId(record.getReceiverId());
        taskReceivePlan.setUpdateTime(new Date());
        taskReceivePlanMapper.insert(taskReceivePlan);
        return record;
    }

    @Override
    @Transactional
    public boolean insert(TaskPlan record) {
        if (super.insert(record)) {
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public boolean updateByPrimaryKeySelective(TaskPlan record) {
        if (super.updateByPrimaryKeySelective(record)) {
            return true;
        }
        return false;
    }

    @Override
    public PageResponse<TaskPlan> selectPageListByReceiveId(TaskPlan task, PageRequest pageRequest, Integer receiveId) {
        PageResponse<TaskPlan> pageResponse = new PageResponse<TaskPlan>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setRecordsTotal(mapper.countTaskByReceiveId(task, receiveId));
        pageResponse.setRecordsFiltered(mapper.countTaskByReceiveId(task, receiveId));
        return pageResponse;
    }


    @Override
    public List<TaskPlan> selectListByCreator(Integer userId, Integer status, int page, int length) {
        TaskPlan task = new TaskPlan();
        task.setCreatorId(userId);
        if (status != null) {
            task.setStatus(status);
        }
        task.setSource("app");
        PageRequest pageRequest = new PageRequest();
        if (page > 0 && length > 0) {
            pageRequest.setLength(length);
            pageRequest.setStart((page - 1) * length);
        }
        pageRequest.setOrderField("id");
        pageRequest.setOrderDir("DESC");
        return mapper.selectPageList(task, pageRequest);
    }


    /**
     * 返回区域汇总表值
     *
     * @param map
     * @param key
     * @param taskPlan
     * @return
     */
    @Override
    public Map<String, Object> resultObjectMap(Map<String, Object> map, String key, TaskPlan taskPlan) {
        Set<Integer> countSet = new HashSet<>();
        if (ObjectUtils.isNotNull(map.get(key))) {
            if (key.indexOf("Elder") >= 0) {
                countSet = (Set<Integer>) map.get(key);
                countSet.add(taskPlan.getElderId());
                map.put(key, countSet);
            } else {
                map.put(key, (Integer) map.get(key) + 1);
            }

        } else {
            if (key.indexOf("Elder") >= 0) {
                countSet.add(taskPlan.getElderId());
                map.put(key, countSet);
            } else {
                map.put(key, 1);
            }

        }
        return map;
    }

    @Override
    public List<TaskPlan> countPool(String starDate, String endDate, String areaName, String orgName) {
        return mapper.countPool(starDate,endDate,areaName,orgName);
    }

    @Override
    public Map<String, Integer> judgeDate(TaskPlan taskPlan, Map<String, Map<String, Integer>> map) throws Exception {
        long start = 0;
        long end = 0;
        int startMonth = 0;
        int startYear = 0;
        int startDay = 0;
        int endMonth = 0;
        int endYear = 0;
        int endDay = 0;
        SimpleDateFormat df = null;
        Map<String, Integer> result = new LinkedHashMap<>();
        Calendar calendar = Calendar.getInstance();
        boolean flag = false;
        switch (taskPlan.getTimeType()) {
            case "year":
                df = new SimpleDateFormat("yyyy");
                calendar.setTime(taskPlan.getStartTime());
                startYear = calendar.get(Calendar.YEAR);
                calendar.setTime(taskPlan.getEndTime());
                endYear = calendar.get(Calendar.YEAR);
                while (endYear >= startYear) {
                    if (ObjectUtils.isNotNull(map.get(startYear))) {
                        result.put(startYear + "", map.get(startYear).get("count"));
                    } else {
                        result.put(startYear + "", 0);
                    }
                    startYear++;
                }
                break;
            case "month":
                df = new SimpleDateFormat("yyyy-MM");
                calendar.setTime(taskPlan.getStartTime());
                startMonth = calendar.get(Calendar.MONTH) + 1;
                startYear = calendar.get(Calendar.YEAR);
                int days[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0))
                    days[1] = 29;

                start = taskPlan.getStartTime().getTime();
                end = taskPlan.getEndTime().getTime();
                while (end >= start) {
                    if (ObjectUtils.isNotNull(map.get(df.format(new Date(start))))) {
                        result.put(df.format(new Date(start)) + "", map.get(df.format(new Date(start))).get("count"));
                    } else {
                        result.put(df.format(new Date(start)) + "", 0);
                    }
                    start += 1000L * 60 * 60 * 24 * days[startMonth];
                    startMonth++;
                    startMonth = startMonth % 12;
                }
                break;
            case "day":
                df = new SimpleDateFormat("yyyy-MM-dd");
                start = taskPlan.getStartTime().getTime();
                end = taskPlan.getEndTime().getTime();
                while (end >= start) {
                    if (ObjectUtils.isNotNull(map.get(df.format(new Date(start))))) {
                        result.put(df.format(new Date(start)) + "", map.get(df.format(new Date(start))).get("count"));
                    } else {
                        result.put(df.format(new Date(start)) + "", 0);
                    }
                    start += 1000L * 60 * 60 * 24;
                }
                break;
        }
        return result;
    }

    @Override
    public Map<String, Integer> judgeDate(List<TaskPlan> taskPlans, Date startTime, Date endTime) throws Exception {
        long start = 0;
        long end = 0;
        int startMonth = 0;
        int startYear = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
        Map<String, Integer> result = new LinkedHashMap<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startTime);
        startMonth = calendar.get(Calendar.MONTH) + 1;
        startYear = calendar.get(Calendar.YEAR);
        calendar.setTime(endTime);
        int days[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0)) {
            days[2] = 29;
        }
        start = startTime.getTime();
        end = endTime.getTime();
        while (end >= start) {
            result.put(df.format(new Date(start)), this.getDateByRange(taskPlans, start, start + 1000L * 60 * 60 * 24 * days[startMonth]).intValue());
            start += 1000L * 60 * 60 * 24 * days[startMonth];
            startMonth++;
            startMonth = startMonth % 12;
        }

        return result;
    }

    @Override
    public Long getDateByRange(List<TaskPlan> taskPlans, long startTime, long endTime) {
        Long count = 0L;
        for (TaskPlan taskPlan : taskPlans) {
            if (taskPlan.getServiceTime().getTime() >= startTime && taskPlan.getServiceTime().getTime() <= endTime) {
                count++;
            }
        }
        return count;
    }


    @Override
    public Map<String, Integer> statisticByTime(TaskPlan taskPlan) throws Exception {
        Map<String, Map<String, Integer>> map = mapper.statisticByTime(taskPlan);
        if (taskPlan.getTimeType().equals("month")) {
            if (ObjectUtils.isNotNull(taskPlan.getStartTime()) && ObjectUtils.isNotNull(taskPlan.getEndTime())) {
                if (!new SimpleDateFormat("yyyy").format(taskPlan.getStartTime()).equals(new SimpleDateFormat("yyyy").format(taskPlan.getEndTime()))) {
                    return judgeDate(getMapper().selectPageList(new TaskPlan(), new PageRequest()), taskPlan.getStartTime(), taskPlan.getEndTime());
                }
            }
        }
        return judgeDate(taskPlan, map);
    }


    @Override
    public int taskCountByCity(String city) {
        return mapper.taskCountByCity(city);
    }


    @Override
    public List<TaskPlan> countPool(String starDate, String endDate) {
        return mapper.countPool(starDate,endDate);
    }
}
