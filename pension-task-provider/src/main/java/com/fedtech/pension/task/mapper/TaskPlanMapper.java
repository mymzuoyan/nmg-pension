package com.fedtech.pension.task.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskPlan;
import com.fedtech.pension.task.vo.ServiceOrgTaskMoneyVo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface TaskPlanMapper extends BaseMapper<TaskPlan> {


    /**
     * 根据订单编号获取task
     *
     * @param number
     * @return
     */
    List<TaskPlan> findByNumber(@Param("number") String number);
    /**
     * 根据订单编号与创建人获取task
     *
     * @param number
     * @param creatorId
     * @return
     */
    List<TaskPlan> findByNumberAndCreatorId(@Param("number") String number, @Param("creatorId") Integer creatorId);

    /**
     * 根据接收人分页查询
     *
     * @param task
     * @param pageRequest
     * @param receiverId
     * @return
     */
    List<TaskPlan> selectPageListByReceiveId(@Param("filter") TaskPlan task, @Param("page") PageRequest pageRequest, @Param("receiverId") Integer receiverId);

    /**
     * 获取接收人的工单数量
     *
     * @param receiverId
     * @return
     */
    int countTaskByReceiveId(@Param("filter") TaskPlan task, @Param("receiverId") Integer receiverId);


    /**
     * 批量获取用户发送数量
     *
     * @param users
     * @return
     */
    List<Map<Integer, Object>> getSendCountByUids(@Param("users") List<User> users);


    /**
     * 分页获取未完成订单
     *
     * @param userId
     * @param start
     * @param length
     * @return
     */
    List<TaskPlan> selectUnDoTask(@Param("userId") Integer userId, @Param("start") int start, @Param("length") int length);

    /**
     * 获取未完成的订单数量
     *
     * @param userId
     * @return
     */
    Integer countUnDoTask(@Param("userId") Integer userId);


    /**
     * 根据身份证和taskid来和获取工单
     *
     * @param idcard
     * @param id
     * @return
     */
    int getTaskCountByIdCard(@Param("idcard") String idcard, @Param("id") Integer id);

    /**
     * 服务类型统计
     *
     * @return
     */

    List<Map<String, Object>> getTaskServiceTypeStatistics();

    /**
     * 根据订单编号更新订单信息
     *
     * @return
     */
    int updateTaskByNumber(TaskPlan task);


    /**
     * 获取特定条件下的金额
     *
     * @param task
     * @param startTime
     * @param endTime
     * @return
     */
    Double countMoney(@Param("task") TaskPlan task, @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    /**
     * 配合分页统计
     *
     * @param filter
     * @return
     */
    Integer countByOrgMoney(ServiceOrgTaskMoneyVo filter);

    /**
     * 分页获取组织财务情况
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    List<ServiceOrgTaskMoneyVo> selectPageListByOrgMoney(@Param("filter") ServiceOrgTaskMoneyVo filter, @Param("page") PageRequest pageRequest);


    /**
     * 通过服务时间统计工单
     *
     * @param taskPlan
     * @return
     */
    @MapKey("time")
    Map<String, Map<String, Integer>> statisticByTime(@Param("filter") TaskPlan taskPlan);


    /**
     * 统计每日的工单
     * @param starDate
     * @param endDate
     * @return
     */
    List<TaskPlan> countPool(@Param("starDate") String starDate, @Param("endDate") String endDate);


    /**
     * 统计地方数据
     * @param city
     * @return
     */
    int taskCountByCity(@Param("city") String city);

    List<TaskPlan> countPool(@Param("starDate") String starDate, @Param("endDate") String endDate,
                             @Param("areaName") String areaName, @Param("orgName") String orgName);
}