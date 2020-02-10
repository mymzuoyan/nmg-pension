package com.fedtech.pension.task.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.vo.ServiceOrgTaskVo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 * @date 2016/9/18
 */
public interface TaskReceiveService extends BaseService<TaskReceive> {

    /**
     * 根据工单Id来删除接受记录
     *
     * @param taskId
     * @return
     */
    boolean deleteByTaskId(Integer taskId);

    /**
     * 撤销工单
     *
     * @param id
     * @return
     */
    boolean cancelTask(Integer id);

    /**
     * 根据工单id来获取接受工单列表
     *
     * @param taskId
     * @return
     */
    TaskReceive selectByLastTask(Integer taskId);


    /**
     * 批量获取
     *
     * @param taskIds
     * @return
     */
    List<TaskReceive> selectByTaskIds(List<Integer> taskIds, PageRequest pageRequest);

    /**
     * 批量插入
     *
     * @param taskReceives
     * @return
     */
    boolean insertSomeAccord(List<TaskReceive> taskReceives);

    /**
     * 批量获取用户发送数量
     *
     * @param users
     * @return
     */
    Map<Integer, Integer> getReceiveCountByUids(List<User> users);

    /**
     * 根据taskId和receiverId 来更新状态
     *
     * @param taskId
     * @param receiverId
     * @param status
     * @return
     */
    boolean updateTaskStatus(Integer taskId, Integer receiverId, Integer status);

    /**
     * 获取订单状态（app）
     *
     * @param status
     * @return
     */
    Map<String, Integer> getTaskStatus(Integer status);

    /**
     * 订单详情
     *
     * @param id
     * @return
     */
    TaskReceive selectById(Integer id);

    /**
     * 获取今日订单
     *
     * @param userId
     * @param pageNum
     * @param length
     * @return
     */
    List<TaskReceive> getTaskByTime(Integer userId, Integer pageNum, Integer length);

    /**
     * 服务统计（年，月，周）
     *
     * @param map
     * @return
     */
    List<Map> getCountByTime(Map map);

    /**
     * 自定义服务统计
     *
     * @param flag
     * @param startTime
     * @param endTime
     * @return
     */
    List<Map> getCountByAnyTime(User user, Integer flag, Date startTime, Date endTime);

    /**
     * 上门服务--扫码
     *
     * @param scanCode
     * @param userId
     * @return
     */
    List<TaskReceive> scanCode(String scanCode, Integer userId);

    /**
     * 根据用户，状态，时间来获取工单数量
     *
     * @param user
     * @param status
     * @param startTime
     * @param endTime
     * @return
     */
    int getCountByUsersAndTimeAndStatus(User user, Integer status, Date startTime, Date endTime);

    int getCountByUsersAndTimeAndLevel(User user, Integer level, Date startTime, Date endTime);

    /**
     * 服务统计
     *
     * @return
     */
    List<Map> selectByCreatorIdOrReceiverId(Map map);

    /**
     * 根据接收人来获取工单
     *
     * @param uid
     * @return
     */
    List<TaskReceive> selectCountByReceiverId(Integer uid);

    /**
     * 通过taskId来改变工单状态
     *
     * @param taskReceive
     * @return
     */
    boolean updateByTaskId(TaskReceive taskReceive);

    /**
     * 根据发送人来获取工单 发送列表
     *
     * @param userId
     * @param pageNum
     * @param status
     * @param serviceType
     * @return
     */
    List<TaskReceive> selectByCreatorId(Integer userId, Integer pageNum, String status, String serviceType);

    /**
     * 根据接受人来获取工单 发送列表
     *
     * @param ids
     * @param pageNum
     * @param status
     * @param serviceType
     * @return
     */
    List<TaskReceive> selectByReceiveIds(List<Integer> ids, Integer pageNum, String status, String serviceType);

    /**
     * 根据taskId和角色id来获取工单
     *
     * @param taskId
     * @param roleId
     * @return
     */
    TaskReceive getTaskByTaskIdAndRole(Integer taskId, Integer roleId);

    /**
     * 获取最近30天的组织的工单数量
     *
     * @param ids
     * @return
     */
    List<ServiceOrgTaskVo> getTaskCountByLast30(List<Integer> ids);

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
