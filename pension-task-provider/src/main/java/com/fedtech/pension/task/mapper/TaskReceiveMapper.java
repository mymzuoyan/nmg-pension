package com.fedtech.pension.task.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.vo.ServiceOrgTaskVo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
public interface TaskReceiveMapper extends BaseMapper<TaskReceive> {


    /**
     * 撤销
     *
     * @param taskId
     * @return
     */
    int deleteByTaskId(@Param("taskId") Integer taskId);

    /**
     * 批量获取
     *
     * @param taskIds
     * @return
     */
    List<TaskReceive> selectByTaskIds(@Param("taskIds") List<Integer> taskIds, @Param("page") PageRequest pageRequest);

    /**
     * 批量插入
     *
     * @param taskReceives
     * @return
     */
    int insertSomeAccord(@Param("taskReceives") List<TaskReceive> taskReceives);


    /**
     * 批量获取用户发送数量
     *
     * @param users
     * @return
     */
    List<Map<Integer, Object>> getReceiveCountByUids(@Param("users") List<User> users);

    /**
     * 查询用户任务列表
     *
     * @param userId
     * @param status
     * @param start
     * @param length
     * @return
     */
    List<TaskReceive> selectByReceiver(@Param("receiverId") Integer userId,
                                       @Param("status") String status,
                                       @Param("start") Integer start,
                                       @Param("length") Integer length,
                                       @Param("serviceType") String serviceType);

    /**
     * 更新状态
     *
     * @param taskId
     * @param receiverId
     * @param status
     * @return
     */
    int updateTaskStatus(@Param("taskId") Integer taskId, @Param("receiverId") Integer receiverId, @Param("status") Integer status);


    TaskReceive selectById(@Param("id") Integer id);

    /**
     * 分页
     *
     * @param userId
     * @param pageNum
     * @param length
     * @return
     */
    List<TaskReceive> getTaskByTime(@Param("receiverId") Integer userId, @Param("start") Integer pageNum, @Param("length") Integer length);

    /**
     * 获取年，月，天的数据
     *
     * @param map
     * @return
     */
    List<Map> getCountByTime(@Param("map") Map map);

    /**
     * 在特定范围获取年，月，天的数据
     *
     * @param flag
     * @param startTime
     * @param endTime
     * @return
     */
    List<Map> getCountByAnyTime(@Param("user") User user, @Param("flag") Integer flag, @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /**
     * 获取二维码所对应的工单
     *
     * @param scanCode
     * @param userId
     * @return
     */
    List<TaskReceive> scanCode(@Param("scanCode") String scanCode, @Param("userId") Integer userId);

    /**
     * 获取特定范围里的特定状态的特定人员的工单数量
     *
     * @param user
     * @param status
     * @param startTime
     * @param endTime
     * @return
     */
    int getCountByUsersAndTimeAndStatus(@Param("user") User user, @Param("status") Integer status, @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    /**
     * 获取特定范围里的特定满意度的特定人员的工单数量
     *
     * @param user
     * @param level
     * @param startTime
     * @param endTime
     * @return
     */
    int getCountByUsersAndTimeAndLevel(@Param("user") User user, @Param("level") Integer level, @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /**
     * 通过创建者Id或接受者Id获取订单详情
     *
     * @param map
     * @return
     */
    List<Map> selectByCreatorIdOrReceiverId(@Param("map") Map map);


    /**
     * 根据用户id获取受领工单及用户统计数据
     *
     * @param uid
     * @return
     */
    List<TaskReceive> selectCountByReceiverId(@Param("uid") Integer uid);

    /**
     * 更新
     *
     * @param taskReceive
     * @return
     */
    int updateByTaskId(TaskReceive taskReceive);

    /**
     * 获取组织派给服务人员的全部订单
     *
     * @param userId
     * @param status
     * @param serviceType
     * @param pageRequest
     * @return
     */
    List<TaskReceive> selectByCreatorId(@Param("uid") Integer userId, @Param("status") String status, @Param("serviceType") String serviceType, @Param("page") PageRequest pageRequest);

    /**
     * 获取组织下的服务人员的全部订单
     *
     * @param ids
     * @param status
     * @param serviceType
     * @param pageRequest
     * @return
     */
    List<TaskReceive> selectByReceiveIds(@Param("ids") List<Integer> ids, @Param("status") String status, @Param("serviceType") String serviceType, @Param("page") PageRequest pageRequest);


    /**
     * 根据taskId和角色来获取该工单的接受情况
     *
     * @param taskId
     * @return
     */
    TaskReceive getTaskByTaskIdAndRole(@Param("taskId") Integer taskId, @Param("roleId") Integer roleId);


    /**
     * 获取一个工单最新的接收
     *
     * @param taskId
     * @return
     */
    TaskReceive selectByLastTask(@Param("taskId") Integer taskId);

    /**
     * 获取时间间隔内的组织工单数量
     *
     * @param serviceOrgIds
     * @param startDate
     * @param endDate
     * @return
     */
    List<ServiceOrgTaskVo> getTaskCountByRange(@Param("serviceOrgIds") List<Integer> serviceOrgIds, @Param("startDate") Date startDate, @Param("endDate") Date endDate);


    /**
     * 获取特定条件下的金额
     *
     * @param taskReceive
     * @param startTime
     * @param endTime
     * @return
     */
    Double countMoney(@Param("taskReceive") TaskReceive taskReceive, @Param("startTime") Date startTime, @Param("endTime") Date endTime);


}