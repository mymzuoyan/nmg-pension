package com.fedtech.pension.task.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskPlan;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/9/18.
 */
public interface TaskPlanService extends BaseService<TaskPlan> {


    /**
     * 根据订单编号获取task
     *
     * @param number
     * @return
     */
    List<TaskPlan> findByNumber(String number);

    /**
     * 根据订单编号与创建人获取task
     *
     * @param number
     * @param creatorId
     * @return
     */
    List<TaskPlan> findByNumberAndCreatorId(String number, Integer creatorId);


    /**
     * 根据接收人分页查询
     *
     * @param taskPlan
     * @param pageRequest
     * @param receiveId
     * @return
     */
    PageResponse<TaskPlan> selectPageListByReceiveId(TaskPlan taskPlan, PageRequest pageRequest, Integer receiveId);


    /**
     * 查询用户发送列表
     *
     * @param userId
     * @param status
     * @param start
     * @param length
     * @return
     */
    List<TaskPlan> selectListByCreator(Integer userId,
                                       Integer status,
                                       int start,
                                       int length);

    /**
     * 根据时间返回完整map
     *
     * @return
     * @throws Exception
     */
    Map<String, Integer> judgeDate(TaskPlan taskPlan, Map<String, Map<String, Integer>> map) throws Exception;

    /**
     * 根据月份统计工单总量
     *
     * @param taskPlans
     * @return
     * @throws Exception
     */
    Map<String, Integer> judgeDate(List<TaskPlan> taskPlans, Date startTime, Date endTime) throws Exception;

    /**
     * 根据服务时间统计工单总量
     *
     * @param taskPlans
     * @param startTime
     * @param endTime
     * @return
     */
    Long getDateByRange(List<TaskPlan> taskPlans, long startTime, long endTime);

    /**
     * 通过服务时间统计工单
     *
     * @param taskPlan
     * @return
     */
    Map<String, Integer> statisticByTime(TaskPlan taskPlan) throws Exception;

    /**
     * 返回所需map
     * @param map
     * @param key
     * @param taskPlan
     * @return
     */
    Map<String, Object> resultObjectMap(Map<String, Object> map, String key, TaskPlan taskPlan);

    /**
     * 统计每日的工单
     * @param starDate
     * @param endDate
     * @return
     */
    List<TaskPlan> countPool(String starDate, String endDate);



    /**
     * task按区统计
     *
     * @param city
     * @return
     */
    int taskCountByCity(String city);
    List<TaskPlan> countPool(String starDate, String endDate, String areaName, String orgName);
}