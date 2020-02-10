package com.fedtech.pension.task.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserState;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.vo.ServiceOrgTaskMoneyVo;
import org.apache.ibatis.annotations.Param;

import java.text.ParseException;
import java.util.*;

/**
 * @author Administrator
 * @date 2016/9/18
 */
public interface TaskService extends BaseService<Task> {

    /**
     * 电子钱包 查看列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<Task> selectPageListForWallet(Task filter, PageRequest pageRequest);

    /**
     * 电子钱包 列表数量
     *
     * @param task
     * @return
     */
    int countForWallet(Task task);

    /**
     * 获取统计
     *
     * @return
     */
    Properties getCount();

    /**
     * 获取缓存
     *
     * @param id
     * @return
     */
    Task getCache(Integer id);

    /**
     * 获取缓存
     *
     * @return
     */
    HashMap getHashFromCache();


    /**
     * 更新缓存
     *
     * @param cache
     */
    void updateCache(Task cache);


    /**
     * 根据订单编号获取task
     *
     * @param number
     * @return
     */
    Task findByNumber(String number);


    /**
     * 发布工单(确定接收人)
     *
     * @param task
     * @param receiverId
     * @return
     */
    boolean sendTask(Task task, String receiverId, Integer type, Integer creatorId, Integer senderType) throws Exception;

    /**
     * 发布工单(不确定接收人)
     *
     * @param task
     * @param creatorId
     * @return
     */
    boolean sendTask(Task task, Integer creatorId);

    /**
     * 发布工单(接单派单给服务对象或服务人员)
     *
     * @param task
     * @return
     */
    boolean sendTasktoUser(Task task, Integer creatorId, String name, Integer receiveId, Integer type);

    /**
     * 调度工单
     *
     * @param taskId
     * @param receiver
     * @return
     */
    boolean dispatchTask(Integer taskId, User receiver, String receiverName, Integer creatorId);


    /**
     * 删除缓存
     *
     * @param taskId
     */
    void deleteTaskCache(Integer taskId);

    /**
     * 删除地图缓存
     *
     * @param taskId
     */
    void removeTaskCacheFromMap(Integer taskId);

    /**
     * 地图展示工单
     *
     * @param isZuZhi
     * @param serviceOrgId
     * @return
     */
    Map<Integer, Task> getDemands(boolean isZuZhi, Integer serviceOrgId);


    /**
     * 获取服务人员列表（带有工单信息，地理位置信息）
     *
     * @return
     */
    List<UserState> getServiceUsers();

    /**
     * 获取服务人员列表（带有工单信息，地理位置信息）
     *
     * @return
     */
    List<UserState> getServiceUsers(Integer serviceOrgId);


    /**
     * 根据接收人分页查询
     *
     * @param task
     * @param pageRequest
     * @param receiveId
     * @return
     */
    PageResponse<Task> selectPageListByReceiveId(Task task, PageRequest pageRequest, Integer receiveId);

    /**
     * 获取接收人的工单数量
     *
     * @param receiverId
     * @return
     */
    int countTaskByReceiveId(Task task, Integer receiverId);

    /**
     * 批量获取用户发送数量
     *
     * @param users
     * @return
     */
    Map<Integer, Integer> getSendCountByUids(List<User> users);

    /**
     * 查询用户任务列表
     *
     * @param userId
     * @param status
     * @param start
     * @param length
     * @return
     */
    List<TaskReceive> selectListByReceiver(Integer userId,
                                           String status,
                                           Integer start,
                                           Integer length,
                                           String serviceType);


    /**
     * 查询组织用户抢单列表
     *
     * @param userId
     * @param status
     * @param pageNum
     * @param length
     * @param serviceType
     * @param sort
     * @param roleId
     * @return
     */
    List<TaskReceive> getRobTaskList(Integer userId,
                                     Integer status,
                                     Integer pageNum,
                                     Integer length,
                                     String serviceType,
                                     String sort,
                                     Integer roleId);

    /**
     * 查询用户发送列表
     *
     * @param userId
     * @param status
     * @param start
     * @param length
     * @return
     */
    List<Task> selectListByCreator(Integer userId,
                                   Integer status,
                                   int start,
                                   int length);


    /**
     * 根据状态与支付类型查询用户发送列表
     *
     * @param userId
     * @param status
     * @param payType
     * @param start
     * @param length
     * @return
     */
    List<Task> selectListByCreator(Integer userId,
                                   Integer status,
                                   Integer payType,
                                   int start,
                                   int length);


    /**
     * 获取未完成的订单
     *
     * @param userId
     * @param start
     * @param length
     * @return
     */
    List<Task> selectUnDoTask(Integer userId,
                              int start,
                              int length);


    /**
     * 获取未完成的订单数量
     *
     * @param userId
     * @return
     */
    Integer countUnDoTask(Integer userId);


    /**
     * 评价task
     *
     * @param task
     * @return
     */
    boolean evaluateTask(Task task);


    /**
     * 根据身份证和taskid来查询是否有工单
     *
     * @param idcard
     * @param id
     * @return
     */
    boolean hasTaskByIdAndIdCard(String idcard, Integer id);


    /**
     * 对服务记录进行数据分析
     *
     * @param receiverServiceOrg
     * @param dataType
     * @param timeType
     * @param startTime
     * @param end
     * @return
     * @throws ParseException
     */
    Map<String, Map<String, Object>> getTaskInfoStatistics(String receiverServiceOrg, String dataType, String timeType, String startTime, String end) throws ParseException;

    /**
     * 对服务记录进行数据分析
     *
     * @param receiverServiceOrg
     * @param serviceType
     * @param dataType
     * @param timeType
     * @param startTime
     * @param endTime
     * @return
     * @throws ParseException
     */
    Map<String, Map<String, Object>> getTaskInfoStatisticsByServiceType(String receiverServiceOrg, Integer receiverId, String serviceType, String dataType, String timeType, String startTime, String endTime) throws ParseException;


    /**
     * 服务类型统计
     *
     * @return
     */
    Map<String, Long> getTaskServiceTypeStatistics();

    /**
     * 获取特定类型特定范围内的数据数量
     *
     * @param infos
     * @param serviceType
     * @param startTime
     * @param endTime
     * @return
     */
    Long getDateByRange(List<Task> infos, String serviceType, long startTime, long endTime);

    /**
     * 获取特定满意度特定范围内的数据数量
     *
     * @param infos
     * @param evaluateStar
     * @param startTime
     * @param endTime
     * @return
     */
    Long getDateByRange(List<Task> infos, Integer evaluateStar, long startTime, long endTime);

    /**
     * 对于平台老人进行预处理放到关联库中
     *
     * @param elderId
     * @return
     */
    int preHandleTaskElder(Integer elderId);


    /**
     * 请求支付
     *
     * @return
     */
    boolean requestPay(Task task);


    /**
     * 生成订单信息
     *
     * @param task
     * @return
     */
    String createPaymentInfo(Task task, String ip);


    /**
     * 根据订单编号更新订单信息
     *
     * @return
     */
    boolean updateTaskByNumber(Task task);


    /**
     * 获取特定条件下的总金额
     *
     * @param task
     * @param startTime
     * @param endTime
     * @return
     */
    Double countMoney(Task task, Date startTime, Date endTime);


    /**
     * 分页获取组织财务情况
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<ServiceOrgTaskMoneyVo> selectPageListByOrgMoney(ServiceOrgTaskMoneyVo filter, PageRequest pageRequest);

    /**
     * task按区统计
     *
     * @param city
     * @return
     */
    int taskCountByCity(String city);

    /**
     * 区别 今年 今日
     *
     * @param
     * @return
     */
    List<Task> selectCountByServiceType(String serviceType);

    /**
     * 企业工单分页
     *
     * @param task
     * @param pageRequest
     * @return
     */
    PageResponse<Task> selectRecordList(Task task, PageRequest pageRequest);

    /**
     * 批量插入
     *
     * @param tasks
     * @return
     */
    boolean insertSomeTask(List<Task> tasks);

    /**
     * 统计每日的工单
     *
     * @param starDate
     * @param endDate
     * @return
     */
    List<Task> countPool(String starDate, String endDate, String areaName, String orgName);
}
