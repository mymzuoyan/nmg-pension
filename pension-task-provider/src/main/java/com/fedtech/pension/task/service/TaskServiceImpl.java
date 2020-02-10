package com.fedtech.pension.task.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.data.Point;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.GeoUtils;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.commons.utils.WXpayKeys;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.UserFuWu;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.org.service.UserFuwuService;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserState;
import com.fedtech.pension.sys.quantity.MessageQuantity;
import com.fedtech.pension.sys.service.MessageService;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskHandle;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.mapper.TaskMapper;
import com.fedtech.pension.task.mapper.TaskReceiveMapper;
import com.fedtech.pension.task.quantity.JPushQuantity;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.quantity.TaskReceiveQuantity;
import com.fedtech.pension.task.redis.RedisDemandInfoUtil;
import com.fedtech.pension.task.redis.RedisDispatchCountUtil;
import com.fedtech.pension.task.redis.RedisServiceOrgLocationUtil;
import com.fedtech.pension.task.redis.RedisUserStateUtil;
import com.fedtech.pension.task.vo.ServiceOrgTaskMoneyVo;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.bean.result.WxPayUnifiedOrderResult;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.fedtech.commons.utils.AlipayKeys.*;

/**
 * @author gengqiang
 * @date 2016/9/18
 */
@Service(version = "1.0.0", interfaceClass = TaskService.class, timeout = 5000, retries = 0)
public class TaskServiceImpl extends BaseServiceImpl<Task> implements TaskService {

    @Autowired
    private TaskMapper mapper;

    @Reference(version = "1.0.0", check = false)
    private TaskReceiveService taskReceiveService;

    @Autowired
    private TaskReceiveMapper taskReceiveMapper;

    @Reference(version = "1.0.0", check = false)
    private UserService userService;

    @Reference(version = "1.0.0", check = false)
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0", check = false)
    private MessageService messageService;

    @Reference(version = "1.0.0", check = false)
    private TaskHandleService taskHandleService;

    @Reference(version = "1.0.0", check = false)
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0", check = false)
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0", check = false)
    private JpushService jpushService;

    @Reference(version = "1.0.0", check = false)
    private UserLinkElderService userLinkElderService;

    @Autowired
    private RedisDemandInfoUtil redisDemandInfoUtil;
    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;

    @Autowired
    private RedisDispatchCountUtil redisDispatchCountUtil;

    @Autowired
    private RedisUserStateUtil redisUserStateUtil;

    @Resource(name = "wxPayService")
    private WxPayService wxPayService;

    private static String SORT_DISTANCE = "distance";

    private static String SORT_SERVICETIME = "serviceTime";

    @Override
    public BaseMapper<Task> getMapper() {
        return mapper;
    }

    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmssSSS");
    SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    @Override
    public PageResponse<Task> selectPageListForWallet(Task filter, PageRequest pageRequest) {
        PageResponse<Task> pageResponse = new PageResponse<Task>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectPageListForWallet(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(mapper.countForWallet(filter));
        return pageResponse;
    }

    @Override
    public int countForWallet(Task task) {
        return mapper.countForWallet(task);
    }

    @Override
    public Properties getCount() {
        Properties properties = new Properties();
        String[] keys = {"app", "web", "tel", "beeper", "today_app", "today_web", "today_beeper", "today_tel"};
        for (String key : keys) {
            properties.put(key, redisDispatchCountUtil.getValue(key));
        }
        return properties;
    }

    @Override
    public Task getCache(Integer id) {
        return (Task) redisDemandInfoUtil.getDemandInfo(id);
    }

    @Override
    public HashMap getHashFromCache() {
        return redisDemandInfoUtil.getHasMap();
    }

    @Override
    public void updateCache(Task cache) {
        redisDemandInfoUtil.putDemandInfo(cache.getId(), cache);
    }

    @Override
    public Task findByNumber(String number) {
        return mapper.findByNumber(number);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insert(Task record) {
        //生成订单编号
        record.setNumber(df.format(new Date()));
        if (super.insert(record)) {
            //添加处理记录
            TaskHandle t = new TaskHandle();
            if (ObjectUtils.isNotNull(record.getCreatorPhone())) {
                t.setHandleName(record.getCreatorPhone());
            } else {
                t.setHandleName(record.getCreatorName());
            }
            t.setHandleTime(new Date());
            t.setHandleStatus(record.getStatus());
            t.setTaskId(record.getId());
            return taskHandleService.insert(t);
        }
        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateByPrimaryKeySelective(Task record) {
        if (super.updateByPrimaryKeySelective(record)) {
            //添加处理记录
            TaskHandle t = new TaskHandle();
            t.setTaskId(record.getId());
            if (ObjectUtils.isNotNull(record.getStatus())) {
                Integer status = record.getStatus();
                if (Objects.equals(status, TaskQuantity.SERVICEORG_RESPONSE) || Objects.equals(status, TaskQuantity.SERVICEORG_DISPATCH) ||
                        Objects.equals(status, TaskQuantity.SERVICEORG_REFUSE)) {
                    t.setHandleName(record.getReceiverServiceOrg());
                } else if (Objects.equals(status, TaskQuantity.EVALUATED)) {
                    t.setHandleName(record.getCreatorName());
                } else {
                    t.setHandleName(record.getReceiverName());
                }
                t.setHandleTime(new Date());
                t.setHandleStatus(record.getStatus());
                return taskHandleService.insert(t);
            }
        }
        return false;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean sendTask(Task task, String receiverId, Integer type, Integer creatorId, Integer senderType) throws Exception {
        boolean b = false;
        List<TaskReceive> taskReceives = new ArrayList<TaskReceive>();
        List<String> receiverIds = new ArrayList<>();
        List<Integer> uids = new ArrayList<>();
        boolean isHas = false;
        if (ObjectUtils.isNotNull(task.getId())) {
            Task newTask = new Task();
            newTask.setId(task.getId());
            newTask.setStatus(TaskQuantity.SERVICEORG_DISPATCH);
            if (this.updateByPrimaryKeySelective(newTask)) {
                //更新原有的接受工单状态
                isHas = taskReceiveService.updateTaskStatus(task.getId(), creatorId, TaskReceiveQuantity.DISPATCH);
                //更新缓存
                Task cache = (Task) redisDemandInfoUtil.getDemandInfo(task.getId());
                if (ObjectUtils.isNotNull(cache)) {
                    cache.setStatus(TaskQuantity.SERVICEORG_DISPATCH);
                    redisDemandInfoUtil.putDemandInfo(task.getId(), cache);
                }
            }
        } else {
            //查看是否有地理信息
            isHas = this.insert(task);
            Task task1 = this.selectByPrimaryKey(task.getId());
            task1.setCreatorPhone(task1.getElderMobile());
            redisDemandInfoUtil.putDemandInfo(task.getId(), task1);
        }
        if (isHas) {
            String[] rids = receiverId.split(",");
            for (String s : rids) {
                //人员
                Integer userId = Integer.parseInt(s);
                TaskReceive taskReceive = new TaskReceive();
                taskReceive.setCreateTime(new Date());
                taskReceive.setReceiverId(userId);
                taskReceive.setTaskId(task.getId());
                taskReceive.setStatus(TaskReceiveQuantity.NOT_RESPONSE);
                taskReceive.setCreatorId(creatorId);
                taskReceives.add(taskReceive);
                receiverIds.add(userId + "");
                uids.add(userId);
            }
            if (taskReceives.size() == 0) {
                throw new Exception();
            }

            JSONObject jsonObject = new JSONObject();
            //拼接推送数据

            jsonObject.put("task", task);
            jsonObject.put("rob", 1);// 接单标识
            if (senderType == 2) {
                //组织管理员
                if (ObjectUtils.isNotNull(type)) {
                    type = 1;
                }
                if (type == 1) {
                    //强制推送
                    if (taskReceiveService.insertSomeAccord(taskReceives)) {
                        b = true;
                    }
                } else {
                    //非强制推送
                    TaskReceive taskReceive = new TaskReceive();
                    taskReceive.setCreateTime(new Date());
                    taskReceive.setReceiverId(0);
                    taskReceive.setTaskId(task.getId());
                    taskReceive.setCreatorId(creatorId);
                    taskReceive.setStatus(TaskReceiveQuantity.NOT_RESPONSE);
                    if (taskReceiveService.insert(taskReceive)) {
                        b = true;
                    }
                }

                //推送到服务人员的app
                jpushService.sendUserMessage(receiverIds, "您有新的工单待处理", JSON.toJSONString(jsonObject), JPushQuantity.SERVICEUSER);

                if (ObjectUtils.isNotNull(uids)) {
                    Message message = new Message();
                    message.setTitle("推送消息");
                    message.setCreateTime(new Date());
                    message.setCreatorId(creatorId);
                    message.setType(MessageQuantity.APPNOTICE);
                    jsonObject.put("content", "您有新的工单待处理");
                    message.setContent(jsonObject.toString());
                    message.setAttach(TaskQuantity.SERVICEORG_DISPATCH + "");
                    messageService.sendMessage(message, uids);
                }
            } else {
                if (taskReceiveService.insertSomeAccord(taskReceives)) {
                    b = true;
                }
                if (StringUtils.isEmpty(type)) {
                    //推送到服务组织的app
                    jpushService.sendUserMessage(receiverIds, "您有新的工单待处理", JSON.toJSONString(jsonObject), JPushQuantity.SERVICEADMIN);

                    if (ObjectUtils.isNotNull(uids)) {
                        Message message = new Message();
                        message.setTitle("推送消息");
                        message.setCreateTime(new Date());
                        message.setCreatorId(creatorId);
                        message.setType(MessageQuantity.APPNOTICE);
                        jsonObject.put("content", "您有新的工单待处理");
                        message.setContent(jsonObject.toString());
                        message.setAttach(TaskQuantity.NOT_RESPONSE + "");
                        messageService.sendMessage(message, uids);
                    }
                }
            }
        }
        return b;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean sendTask(Task task, Integer creatorId) {
        if (this.insert(task)) {
            TaskReceive tr = new TaskReceive();
            tr.setCreateTime(new Date());
            tr.setReceiverId(0);
            tr.setTaskId(task.getId());
            tr.setCreatorId(creatorId);
            Point center = new Point();
            center.setLat(task.getLat());
            center.setLng(task.getLng());
            List<Integer> receiverOrgs = new ArrayList<>();//在3公里之内的组织id
            List<Integer> uids = new ArrayList<>();//创建消息
            List<Integer> serviceAdmins = new ArrayList<>();//获取3公里之内的组织管理员
            List<Integer> serviceObjects = new ArrayList<>();//获取3公里之内的服务人员
            List<String> serviceAdminIds = new ArrayList<>();//推送3公里之内的组织管理员
            List<String> serviceObjectIds = new ArrayList<>();//推送3公里之内的服务人员
            if (taskReceiveService.insert(tr)) {
                //推送3公里之内所有的用户
                HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
                Set<Integer> ids = hashMap.keySet();
                Point point = new Point();
                for (Integer id : ids) {
                    ServiceOrgLocation sl = (ServiceOrgLocation) hashMap.get(id);
                    if (ObjectUtils.isNotNull(sl.getServiceProjectName())) {
                        if (sl.getServiceProjectName().indexOf(task.getServiceType()) >= 0) {
                            if (ObjectUtils.isNotNull(sl.getLat())) {
                                point.setLng(sl.getLng());
                                point.setLat(sl.getLat());
                                if (GeoUtils.isPointInCircle(point, center, Keys.PUSHRANGE)) {
                                    receiverOrgs.add(sl.getServiceOrgId());
                                }
                            }
                        }
                    }
                }
                if (ObjectUtils.isNotNull(receiverOrgs)) {
                    for (Integer serviceOrgId : receiverOrgs) {
                        User filter = new User();
                        filter.setServiceOrgId(serviceOrgId + "");
                        List<Integer> roles = new ArrayList<>();
                        roles.add(RoleType.ZuAdmin.getId());
//                        roles.add(RoleType.ServiceUser.getId());
                        //派单   获取组织id
                        serviceAdmins = userService.selectAllUserIdByRoles(filter, roles);
                        if (ObjectUtils.isNotNull(serviceAdmins)) {
                            for (Integer id : serviceAdmins) {
                                serviceAdminIds.add(id + "");
                                uids.add(id);
                            }
                        }
                        // 获取服务人员id
                        List<User> users = userService.selectFuwuUserByOrgId(serviceOrgId, task.getServiceType(), null, null);
                        for (int i = 0; i < users.size(); i++) {
                            serviceObjects.add(users.get(i).getUid());
                            serviceObjectIds.add(users.get(i).getUid() + "");
                            uids.add(users.get(i).getUid());
                        }
                    }
                }
                //拼接推送数据
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("task", task);
                jsonObject.put("rob", 0);// 抢单标识
                if (ObjectUtils.isNotNull(serviceAdminIds)) {
                    //推送到服务组织管理员的app
                    jpushService.sendUserMessage(serviceAdminIds, "您有新的抢单消息待处理", JSON.toJSONString(jsonObject), JPushQuantity.SERVICEADMIN);
                }
                if (ObjectUtils.isNotNull(serviceObjectIds)) {
                    //推送到服务人员的app
                    jpushService.sendUserMessage(serviceObjectIds, "您有新的抢单消息待处理", JSON.toJSONString(jsonObject), JPushQuantity.SERVICEUSER);
                }

                // 添加消息
                if (ObjectUtils.isNotNull(uids)) {
                    Message message = new Message();
                    message.setTitle("推送消息");
                    message.setCreateTime(new Date());
                    message.setCreatorId(creatorId);
                    message.setType(MessageQuantity.APPNOTICE);
                    jsonObject.put("content", "您有新的抢单消息待处理");
                    message.setContent(jsonObject.toString());
                    message.setAttach(TaskQuantity.NOT_RESPONSE + "");
                    messageService.sendMessage(message, uids);
                }

                redisDemandInfoUtil.putDemandInfo(task.getId(), task);
                redisDispatchCountUtil.add("app", 1L);
                return true;
            }

        }
        return false;
    }


    @Override
    public boolean sendTasktoUser(Task task, Integer creatorId, String name, Integer receiveId, Integer type) {
        JSONObject jsonObject = new JSONObject();
        task = mapper.selectByPrimaryKey(task.getId());
        List<String> receivers = new ArrayList<>();
        receivers.add(receiveId.toString());
        Message message = new Message();
        message.setTitle("推送消息");
        message.setCreateTime(new Date());
        message.setCreatorId(creatorId);
        message.setType(MessageQuantity.APPNOTICE);
        jsonObject.put("task", task);
        List<Integer> uids = new ArrayList<>();
        if (type == 0) {// 组织派单推送给服务人员 （服务对象评价推送给服务人员 服务对象发单推送给服务人员 此处不处理）
            jsonObject.put("content", name + "派给您一个新的工单！");
            message.setContent(jsonObject.toString());
            message.setAttach(TaskQuantity.SERVICEORG_DISPATCH + "");
            uids.add(receiveId);
            messageService.sendMessage(message, uids);
            jpushService.sendUserMessage(receivers, name + "派给您一个新的工单！", JSON.toJSONString(jsonObject), type);
        }
        if (type == 1) { // （服务对象发单推送给服务组织 此处不处理）
            jsonObject.put("content", name + "拒绝了您的工单");
            message.setContent(jsonObject.toString());
            message.setAttach(TaskQuantity.SERVICEUSER_REFUSE + "");
            uids.add(receiveId);
            messageService.sendMessage(message, uids);
            //推送到服务组织的app
            jpushService.sendUserMessage(receivers, name + "拒绝了您的工单", JSON.toJSONString(jsonObject), type);
        }
        int[] taskStatus = {TaskQuantity.DETELED, TaskQuantity.NOT_RESPONSE, TaskQuantity.SERVICEORG_RESPONSE, TaskQuantity.SERVICEORG_DISPATCH, TaskQuantity.SERVICEORG_REFUSE, TaskQuantity.SERVICEUSER_RESPONSE, TaskQuantity.SERVICEUSER_REGISTER, TaskQuantity.SERVICEUSER_REFUSE, TaskQuantity.PAY, TaskQuantity.COMPLETE, TaskQuantity.EVALUATED};
        String[] taskMsg = {"", "", "接受了您编号为" + task.getNumber() + "的工单！", "派遣了您编号为" + task.getNumber() + "的工单！", "拒绝了编号为" + task.getNumber() + "您的订单！", "接受了您编号为" + task.getNumber() + "的工单！", "已签到！", "拒绝了您编号为" + task.getNumber() + "的工单！", "完成了您的工单,请您尽快付款！", "完成了您编号为" + task.getNumber() + "的工单！", "评价了您编号为" + task.getNumber() + "的工单！"};
        if (type == 2) {// 服务组织接单派单拒单发送给服务对象 服务组织接单上门完成拒单发送给服务对象
            jsonObject.put("content", name + taskMsg[task.getStatus()]);
            message.setContent(jsonObject.toString());
            message.setAttach(taskStatus[task.getStatus()] + "");
            uids.add(task.getCreatorId());
            receivers.clear();
            receivers.add(task.getCreatorId().toString());
            messageService.sendMessage(message, uids);
            //推送到服务对象的app
            jpushService.sendUserMessage(receivers, name + taskMsg[task.getStatus()], JSON.toJSONString(jsonObject), type);
        }
        if (type == 4) {// 服务人员接受付款成功之后的推送
            jsonObject.put("content", "服务对象已支付您的工单");
            message.setContent(jsonObject.toString());
            message.setAttach(TaskQuantity.COMPLETE + "");
            uids.add(receiveId);
            messageService.sendMessage(message, uids);
            jpushService.sendUserMessage(receivers, "服务对象已支付您的工单", JSON.toJSONString(jsonObject), JPushQuantity.SERVICEUSER);
        }

        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean dispatchTask(Integer taskId, User receiver, String receiverName, Integer creatorId) {
        if (taskReceiveService.deleteByTaskId(taskId)) {
            TaskReceive taskReceive = new TaskReceive();
            taskReceive.setTaskId(taskId);
            taskReceive.setReceiverId(receiver.getUid());
            taskReceive.setCreateTime(new Date());
            taskReceive.setCreatorId(creatorId);
            taskReceive.setStatus(TaskReceiveQuantity.NOT_RESPONSE);
            if (taskReceiveService.insert(taskReceive)) {
                //调整状态
                Task task = (Task) redisDemandInfoUtil.getDemandInfo(taskId);
                if (ObjectUtils.isNotNull(task)) {
                    task.setStatus(TaskQuantity.ADMIN_DISPATCH);
                    task.setReceiverName(receiver.getServiceOrgName());
                    task.setServiceOrgId(receiver.getServiceOrgId());
                    if (this.updateByPrimaryKeySelective(task)) {
                        //更新缓存
                        Task cache = (Task) redisDemandInfoUtil.getDemandInfo(taskId);
                        if (ObjectUtils.isNotNull(cache)) {
                            cache.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
                            cache.setReceiverName(receiverName);
                            redisDemandInfoUtil.putDemandInfo(taskId, task);
                        }
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override
    public void deleteTaskCache(Integer taskId) {
        redisDemandInfoUtil.removeDemandInfo(taskId);
    }

    @Override
    public void removeTaskCacheFromMap(Integer taskId) {
        Task cache = (Task) redisDemandInfoUtil.getDemandInfo(taskId);
        cache.setMapStatus(2);
        redisDemandInfoUtil.putDemandInfo(taskId, cache);
    }

    @Override
    public Map<Integer, Task> getDemands(boolean isZuZhi, Integer serviceOrgId) {
        Map<Integer, Task> result = new HashMap<>();
        HashMap hashMap = redisDemandInfoUtil.getHasMap();
        ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(serviceOrgId);
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            Task task = (Task) hashMap.get(id);
            if (isZuZhi) {
                if (Objects.equals(task.getStatus(), TaskQuantity.NOT_RESPONSE)) {
                    if (serviceOrgLocation.getServiceProjectName().contains(task.getServiceType())) {
                        result.put(id, task);
                    }
                } else if (Objects.equals(task.getStatus(), TaskQuantity.SERVICEORG_RESPONSE) || Objects.equals(task.getStatus(), TaskQuantity.SERVICEORG_DISPATCH)) {
                    if (serviceOrgLocation.getServiceOrgName().equals(task.getReceiverServiceOrg())) {
                        result.put(id, task);
                    }
                }

            } else {
                result.put(id, task);
            }
        }
        return result;
    }

    @Override
    public List<UserState> getServiceUsers() {
        List<UserState> userStates = new ArrayList<>();
        HashMap hashMap = redisUserStateUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            UserState userState = (UserState) hashMap.get(id);
            userStates.add(userState);
        }
        return userStates;
    }

    @Override
    public List<UserState> getServiceUsers(Integer serviceOrgId) {
        List<UserState> userStates = new ArrayList<>();
        HashMap hashMap = redisUserStateUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            UserState userState = (UserState) hashMap.get(id);
            if (serviceOrgId.equals(userState.getServiceOrgId())) {
                userStates.add(userState);
            }
        }
        return userStates;
    }

    @Override
    public PageResponse<Task> selectPageListByReceiveId(Task task, PageRequest pageRequest, Integer receiveId) {
        PageResponse<Task> pageResponse = new PageResponse<Task>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setRecordsTotal(mapper.countTaskByReceiveId(task, receiveId));
        pageResponse.setRecordsFiltered(mapper.countTaskByReceiveId(task, receiveId));
        pageResponse.setData(mapper.selectPageListByReceiveId(task, pageRequest, receiveId));
        return pageResponse;
    }

    @Override
    public int countTaskByReceiveId(Task task, Integer receiverId) {
        return mapper.countTaskByReceiveId(task, receiverId);
    }

    @Override
    public Map<Integer, Integer> getSendCountByUids(List<User> users) {
        if (users.size() == 0) {
            return null;
        }
        List<Map<Integer, Object>> regionMap = mapper.getSendCountByUids(users);
        Map<Integer, Integer> result = new HashMap<Integer, Integer>();
        for (Map<Integer, Object> map : regionMap) {
            Integer sendCount = null;
            Integer uid = null;
            for (Map.Entry<Integer, Object> entry : map.entrySet()) {
                if ("sendCount".equals(entry.getKey())) {
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
    public List<Task> selectListByCreator(Integer userId, Integer status, int page, int length) {
        Task task = new Task();
        task.setCreatorId(userId);
        if (status != null) {
            task.setStatus(status);
        }
        PageRequest pageRequest = new PageRequest();
        if (page > 0 && length > 0) {
            pageRequest.setLength(length);
            pageRequest.setStart((page - 1) * length);
        }
        pageRequest.setOrderField("id");
        pageRequest.setOrderDir("DESC");
        return mapper.selectPageList(task, pageRequest);
    }


    @Override
    public List<Task> selectListByCreator(Integer userId, Integer status, Integer payType, int page, int length) {
        Task task = new Task();
        task.setCreatorId(userId);
        if (status != null) {
            task.setStatus(status);
        }
        if (payType != null) {
            task.setPayType(payType);
        }
        PageRequest pageRequest = new PageRequest();
        if (page > 0 && length > 0) {
            pageRequest.setLength(length);
            pageRequest.setStart((page - 1) * length);
        }
        pageRequest.setOrderField("id");
        pageRequest.setOrderDir("DESC");
        return mapper.selectPageList(task, pageRequest);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteByPrimaryKey(Integer id) {
        if (super.deleteByPrimaryKey(id)) {
            Task cache = (Task) redisDemandInfoUtil.getDemandInfo(id);
            redisDemandInfoUtil.removeDemandInfo(id);
            redisDispatchCountUtil.add("app", -1L);
            //是否是今天
            try {
                Date createTime = cache.getCreateTime();
                if (simple.format(new Date()).equals(simple.format(createTime))) {
                    redisDispatchCountUtil.add("today_app", -1L);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return taskReceiveService.deleteByTaskId(id);
        }
        return false;
    }

    @Override
    public List<TaskReceive> selectListByReceiver(Integer userId, String status, Integer start, Integer length, String serviceType) {
        if (start != null) {
            start = (start - 1) * length;
        }
        return taskReceiveMapper.selectByReceiver(userId, status, start, length, serviceType);
    }

    @Override
    public List<TaskReceive> getRobTaskList(Integer userId, Integer status, Integer pageNum, Integer length, String serviceType, String sort, Integer roleId) {
        //获取缓存里的工单列表
        HashMap hashMap = redisDemandInfoUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        Point center = new Point();
        if (ObjectUtils.isNotNull(ids)) {
            ArrayList<Integer> idResult = new ArrayList<>();
            idResult.addAll(ids);
            Collections.sort(idResult, new Comparator<Integer>() {
                @Override
                public int compare(Integer o1, Integer o2) {
                    return o1.compareTo(o2);
                }
            });
            List<Integer> taskReceiveIds = new ArrayList<>();
            if (roleId.equals(RoleType.ServiceUser.getId())) {
                UserState userState = (UserState) redisUserStateUtil.getUserState(userId);
                if (ObjectUtils.isNotNull(userState)) {
                    center.setLat(userState.getLat());
                    center.setLng(userState.getLng());
                }
                UserFuWu userFuWu = userFuwuService.selectByUserId(userId);
                if (userFuWu != null) {
                    serviceType = userFuWu.getServiceType();
                }

            } else if (roleId.equals(RoleType.ReAdmin.getId())) {
                User user = userService.selectByPrimaryKey(userId);
                if (ObjectUtils.isNotNull(user) && ObjectUtils.isNotNull(user.getServiceOrgId())) {
                    ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(Integer.parseInt(user.getServiceOrgId()));
                    if (ObjectUtils.isNotNull(serviceOrgLocation)) {
                        center.setLat(serviceOrgLocation.getLat());
                        center.setLng(serviceOrgLocation.getLng());
                        serviceType = serviceOrgLocation.getServiceProjectName();
                    }
                }
            }
            if (ObjectUtils.isNotNull(center)) {
                Map distanceMap = new HashMap();// 距离排序map
                for (Integer id : idResult) {
                    Task cache = (Task) hashMap.get(id);
                    if (ObjectUtils.isNotNull(cache) && ObjectUtils.isNotNull(serviceType)) {
                        if (serviceType.indexOf(cache.getServiceType()) >= 0) {// 判断服务人员或组织是否包含订单所需服务项目
                            Point point = new Point();
                            point.setLat(cache.getLat());
                            point.setLng(cache.getLng());
                            if (Objects.equals(cache.getStatus(), TaskQuantity.NOT_RESPONSE) && GeoUtils.isPointInCircle(point, center, Keys.PUSHRANGE)) {
                                if (!StringUtils.isEmpty(sort)) {
                                    if (SORT_DISTANCE.equals(sort)) {// 距离排序
                                        Double distance = GeoUtils.getDistance(point, center);
                                        distanceMap.put(id, distance);
                                    }
                                }
                                taskReceiveIds.add(cache.getId());
                            }
                        }
                    }
                }
                PageRequest pageRequest = new PageRequest();
                if (!StringUtils.isEmpty(sort)) {
                    if (SORT_DISTANCE.equals(sort)) {
                        pageRequest.setOrderField(SORT_DISTANCE);
                        List<Map.Entry<Integer, Double>> distanceList =
                                new ArrayList<Map.Entry<Integer, Double>>(distanceMap.entrySet());
                        Collections.sort(distanceList, new Comparator<Map.Entry<Integer, Double>>() {
                            @Override
                            public int compare(Map.Entry<Integer, Double> o1,
                                               Map.Entry<Integer, Double> o2) {
                                if (o1.getValue() - o2.getValue() > 0) {
                                    return 1;
                                } else if (o1.getValue() - o2.getValue() == 0) {
                                    return 0;
                                } else {
                                    return -1;
                                }
                            }
                        });
                        List<Integer> distanceSortIds = new ArrayList<>();
                        for (Map.Entry<Integer, Double> map : distanceList) {
                            distanceSortIds.add(map.getKey());
                        }
                        taskReceiveIds = distanceSortIds;
                    }

                    if (SORT_SERVICETIME.equals(sort)) {
                        pageRequest.setOrderField(SORT_SERVICETIME);
                        pageRequest.setOrderDir("desc");
                    }
                } else {
                    pageRequest.setOrderField("id");
                    pageRequest.setOrderDir("desc");
                }
                if (taskReceiveIds != null && taskReceiveIds.size() > 0) {
                    List<TaskReceive> taskReceives = taskReceiveService.selectByTaskIds(taskReceiveIds, pageRequest);
                    if (taskReceives != null && taskReceives.size() > 0) {
                        int allCount = taskReceives.size();
                        if (length != -1 && pageNum != -1) {
                            if (allCount < ((pageNum - 1) * length)) {
                                return null;
                            } else if (allCount < pageNum * length) {
                                return taskReceives.subList((pageNum - 1) * length, allCount);
                            } else {
                                return taskReceives.subList((pageNum - 1) * length, (pageNum) * length);
                            }
                        } else {
                            return taskReceives;
                        }
                    }
                }
//                if (taskReceiveIds!=null && taskReceiveIds.size()>0) {
//                    int allCount = taskReceiveIds.size();
//                    if (length != -1 && pageNum != -1) {
//                        if (allCount < ((pageNum - 1) * length)) {
//                            return null;
//                        } else if (allCount < pageNum * length) {
//                            taskReceiveIds = taskReceiveIds.subList((pageNum - 1) * length, allCount);
//                        } else {
//                            taskReceiveIds = taskReceiveIds.subList((pageNum - 1) * length, (pageNum) * length);
//                        }
//                    }
//                    if (ObjectUtils.isNotNull(taskReceiveIds)) {
//                        return taskReceiveService.selectByTaskIds(taskReceiveIds, pageRequest);
//                    }
//                }
            }
        }
        return new ArrayList<>();
    }

    @Override
    public List<Task> selectUnDoTask(Integer userId, int start, int length) {
        return mapper.selectUnDoTask(userId, start, length);
    }

    @Override
    public boolean evaluateTask(Task task) {
        boolean b = false;
        //推送
        TaskReceive taskReceive = taskReceiveMapper.selectByLastTask(task.getId());
        JSONObject jsonObject = new JSONObject();
        task = mapper.selectByPrimaryKey(task.getId());
        List<String> receivers = new ArrayList<>();
        receivers.add(taskReceive.getReceiverId().toString());
        jsonObject.put("task", task);
        Message message = new Message();
        message.setTitle("推送消息");
        message.setCreateTime(new Date());
        message.setCreatorId(task.getCreatorId());
        message.setType(MessageQuantity.APPNOTICE);
        List<Integer> uids = new ArrayList<>();
        jsonObject.put("content", task.getCreatorName() + "已评价了您编号为" + task.getNumber() + "的服务工单！");
        message.setContent(jsonObject.toString());
        message.setAttach(TaskQuantity.EVALUATED + "");
        uids.add(taskReceive.getReceiverId());
        messageService.sendMessage(message, uids);
        jpushService.sendUserMessage(receivers, "用户已评价了您的服务工单！", JSON.toJSONString(jsonObject), JPushQuantity.SERVICEUSER);

        calculateValuateRate(task, taskReceive.getReceiverId());

        Task cache = (Task) redisDemandInfoUtil.getDemandInfo(task.getId());
        if (ObjectUtils.isNotNull(cache)) {
            cache.setStatus(TaskQuantity.EVALUATED);
            cache.setUpdateTime(new Date());
            cache.setLevel(task.getLevel());
            cache.setComment(task.getComment());
            redisDemandInfoUtil.putDemandInfo(task.getId(), cache);
        }
        return b;
    }


    @Override
    public boolean hasTaskByIdAndIdCard(String idcard, Integer id) {
        if (mapper.getTaskCountByIdCard(idcard, id) >= 1) {
            return true;
        }
        return false;
    }

    @Override
    public Integer countUnDoTask(Integer userId) {
        return mapper.countUnDoTask(userId);
    }


    @Override
    public Map<String, Long> getTaskServiceTypeStatistics() {
        List<Map<String, Object>> data = mapper.getTaskServiceTypeStatistics();
        Map<String, Long> result = new HashMap<String, Long>();
        for (Map<String, Object> map : data) {
            String serviceType = null;
            Long count = null;
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if ("serviceType".equals(entry.getKey())) {
                    serviceType = (String) entry.getValue();
                } else if ("count".equals(entry.getKey())) {
                    count = Long.parseLong(entry.getValue().toString());
                }
            }
            result.put(serviceType, count);
        }
        return result;
    }

    @Override
    public Map<String, Map<String, Object>> getTaskInfoStatistics(String receiverServiceOrg, String dataType, String timeType, String startTime, String endTime) throws ParseException {
        Task filter = new Task();
        if (ObjectUtils.isNotNull(receiverServiceOrg)) {
            filter.setReceiverServiceOrg(receiverServiceOrg);
        }
        filter.setType(TaskQuantity.TYPE_DEMAND);
        List<Task> infos = null;
        Map<String, Map<String, Object>> result = new LinkedHashMap<>();
        SimpleDateFormat df = null;
        long start = 0;
        long end = 0;
        int startMonth = 0;
        int startYear = 0;
        int endMonth = 0;
        int endYear = 0;
        Integer taskCount = getMapper().countAll();
        int page = taskCount % 100000 == 0 ? taskCount / 100000 : taskCount / 100000 + 1;
        PageRequest pageRequest = new PageRequest();
        for (int i = 0; i < page; i++) {
            if (page > 1) {
                pageRequest.setLength(100000);
                pageRequest.setStart(i * 100000);
            }
            infos = mapper.selectPageList(filter, pageRequest);
            switch (dataType) {
                case "fromType":
                    String[] fromTypes = {"助餐", "助浴", "助洁", "助医", "助急", "助行", "助购", "助学", "助乐", "助聊", "其他"};
                    //来电类型
                    for (String serviceType : fromTypes) {
                        Map<String, Object> res = new LinkedHashMap<>();
                        switch (timeType) {
                            case "month":
                                df = new SimpleDateFormat("yyyy-MM");
                                startMonth = df.parse(startTime).getMonth();
                                startYear = df.parse(startTime).getYear();
                                endMonth = df.parse(endTime).getMonth();
                                endYear = df.parse(endTime).getYear();
                                int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                                if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0))
                                    days[1] = 29;

                                start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                                end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                                while (end >= start) {

                                    res.put(df.format(new Date(start)), this.getDateByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * days[startMonth]));
                                    start += 1000L * 60 * 60 * 24 * days[startMonth];

                                    startMonth++;
                                    startMonth = startMonth % 12;
                                }
                                break;
                            case "year":
                                df = new SimpleDateFormat("yyyy");
                                startYear = df.parse(startTime).getYear();
                                endYear = df.parse(endTime).getYear();

                                start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();

                                while (endYear >= startYear) {
                                    //判断是否是闰年
                                    int day = 365;
                                    if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                        day = 366;
                                    }
                                    res.put(df.format(new Date(start)), this.getDateByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * day));
                                    start += 1000L * 60 * 60 * 24 * day;
                                    startYear++;
                                }
                                break;
                            case "day":
                                df = new SimpleDateFormat("yyyy-MM-dd");
                                start = df.parse(startTime).getTime();
                                end = df.parse(endTime).getTime();
                                while (end >= start) {
                                    res.put(df.format(new Date(start)), this.getDateByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24));
                                    start += 1000L * 60 * 60 * 24;
                                }
                                break;
                        }
                        if (ObjectUtils.isNotNull(result.get(serviceType))) {
                            Map<String, Object> old = result.get(serviceType);
                            Set<String> keys = old.keySet();
                            for (String key : keys) {
                                old.put(key, (Long) res.get(key) + (Long) old.get(key));
                            }
                            result.put(serviceType, old);
                        } else {
                            result.put(serviceType, res);
                        }
                    }
                    break;
                case "evaluate":
                    //满意度
                    int[] evaluateStars = {0, 1, 2, 3, 4, 5};
                    for (int evaluateStar : evaluateStars) {
                        Map<String, Object> res = new LinkedHashMap<>();
                        switch (timeType) {
                            case "year":
                                df = new SimpleDateFormat("yyyy");
                                startYear = df.parse(startTime).getYear();
                                endYear = df.parse(endTime).getYear();

                                start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();
                                while (endYear >= startYear) {
                                    int day = 365;
                                    if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                        day = 366;
                                    }
                                    res.put(df.format(new Date(start)), this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24 * day));
                                    start += 1000L * 60 * 60 * 24 * day;
                                    startYear++;
                                }
                                break;
                            case "month":
                                df = new SimpleDateFormat("yyyy-MM");
                                startMonth = df.parse(startTime).getMonth();
                                startYear = df.parse(startTime).getYear();
                                endMonth = df.parse(endTime).getMonth();
                                endYear = df.parse(endTime).getYear();
                                int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                                if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0))
                                    days[1] = 29;

                                start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                                end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                                while (end >= start) {

                                    res.put(df.format(new Date(start)), this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24 * days[startMonth]));
                                    start += 1000L * 60 * 60 * 24 * days[startMonth];
                                    startMonth++;
                                    startMonth = startMonth % 12;
                                }
                                break;
                            case "day":
                                df = new SimpleDateFormat("yyyy-MM-dd");
                                start = df.parse(startTime).getTime();
                                end = df.parse(endTime).getTime();
                                while (end >= start) {
                                    res.put(df.format(new Date(start)), this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24));
                                    start += 1000L * 60 * 60 * 24;
                                }
                                break;
                        }
                        if (ObjectUtils.isNotNull(result.get(evaluateStar + ""))) {
                            Map<String, Object> old = result.get(evaluateStar + "");
                            Set<String> keys = old.keySet();
                            for (String key : keys) {
                                old.put(key, (Long) res.get(key) + (Long) old.get(key));
                            }
                            result.put(evaluateStar + "", old);
                        } else {
                            result.put(evaluateStar + "", res);
                        }
                    }

                    break;
                case "money": {
                    String[] moneys = {"助餐", "助浴", "助洁", "助医", "助急", "助行", "助购", "助学", "助乐", "助聊", "其他"};
                    //来电类型
                    for (String serviceType : moneys) {
                        Map<String, Object> res = new LinkedHashMap<>();
                        switch (timeType) {
                            case "month":
                                df = new SimpleDateFormat("yyyy-MM");
                                startMonth = df.parse(startTime).getMonth();
                                startYear = df.parse(startTime).getYear();
                                endMonth = df.parse(endTime).getMonth();
                                endYear = df.parse(endTime).getYear();
                                int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                                if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0))
                                    days[1] = 29;

                                start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                                end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                                while (end >= start) {

                                    res.put(df.format(new Date(start)), this.getPriceByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * days[startMonth]));
                                    start += 1000L * 60 * 60 * 24 * days[startMonth];

                                    startMonth++;
                                    startMonth = startMonth % 12;
                                }
                                break;
                            case "year":
                                df = new SimpleDateFormat("yyyy");
                                startYear = df.parse(startTime).getYear();
                                endYear = df.parse(endTime).getYear();

                                start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();

                                while (endYear >= startYear) {
                                    //判断是否是闰年
                                    int day = 365;
                                    if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                        day = 366;
                                    }
                                    res.put(df.format(new Date(start)), this.getPriceByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * day));
                                    start += 1000L * 60 * 60 * 24 * day;
                                    startYear++;
                                }
                                break;
                            case "day":
                                df = new SimpleDateFormat("yyyy-MM-dd");
                                start = df.parse(startTime).getTime();
                                end = df.parse(endTime).getTime();
                                while (end >= start) {
                                    res.put(df.format(new Date(start)), this.getPriceByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24));
                                    start += 1000L * 60 * 60 * 24;
                                }
                                break;
                        }
                        if (ObjectUtils.isNotNull(result.get(serviceType))) {
                            Map<String, Object> old = result.get(serviceType);
                            Set<String> keys = old.keySet();
                            for (String key : keys) {
                                old.put(key, (Double) res.get(key) + (Double) old.get(key));
                            }
                            result.put(serviceType, old);
                        } else {
                            result.put(serviceType, res);
                        }
                    }
                    break;
                }
                default:
                    break;

            }
        }

        return result;
    }


    @Override
    public Map<String, Map<String, Object>> getTaskInfoStatisticsByServiceType(String receiverServiceOrg, Integer receiverId, String serviceType, String dataType, String timeType, String startTime, String endTime) throws ParseException {
        Task filter = new Task();
        List<Task> infos = null;
        if (ObjectUtils.isNotNull(receiverServiceOrg))
            filter.setReceiverServiceOrg(receiverServiceOrg);
        filter.setType(TaskQuantity.TYPE_DEMAND);
        if (!serviceType.equals("all")) {
            filter.setServiceType(serviceType);
        }
        Map<String, Map<String, Object>> result = new LinkedHashMap<>();
        Map<String, Object> res = null;
        SimpleDateFormat df = null;
        long start = 0;
        long end = 0;
        int startMonth = 0;
        int startYear = 0;
        int endMonth = 0;
        int endYear = 0;
        Integer taskCount = getMapper().countAll();
        int page = taskCount % 100000 == 0 ? taskCount / 100000 : taskCount / 100000 + 1;
        PageRequest pageRequest = new PageRequest();
        for (int i = 0; i < page; i++) {
            if (page > 1) {
                pageRequest.setLength(100000);
                pageRequest.setStart(i * 100000);
            }
            if (ObjectUtils.isNotNull(receiverId)) {
                infos = mapper.selectPageListByReceiveId(filter, pageRequest, receiverId);
            } else {
                infos = mapper.selectPageList(filter, pageRequest);
            }
            switch (dataType) {
                case "fromType":
                    //来电类型
                    res = new LinkedHashMap<>();
                    switch (timeType) {
                        case "month":
                            df = new SimpleDateFormat("yyyy-MM");
                            startMonth = df.parse(startTime).getMonth();
                            startYear = df.parse(startTime).getYear();
                            endMonth = df.parse(endTime).getMonth();
                            endYear = df.parse(endTime).getYear();
                            int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                            if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0)) {
                                days[1] = 29;
                            }

                            start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                            end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                            while (end >= start) {

                                res.put(df.format(new Date(start)), this.getDateByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * days[startMonth]));
                                start += 1000L * 60 * 60 * 24 * days[startMonth];

                                startMonth++;
                                startMonth = startMonth % 12;
                            }
                            break;
                        case "year":
                            df = new SimpleDateFormat("yyyy");
                            startYear = df.parse(startTime).getYear();
                            endYear = df.parse(endTime).getYear();

                            start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();

                            while (endYear >= startYear) {
                                //判断是否是闰年
                                int day = 365;
                                if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                    day = 366;
                                }
                                res.put(df.format(new Date(start)), this.getDateByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * day));
                                start += 1000L * 60 * 60 * 24 * day;
                                startYear++;
                            }
                            break;
                        case "day":
                            df = new SimpleDateFormat("yyyy-MM-dd");
                            start = df.parse(startTime).getTime();
                            end = df.parse(endTime).getTime();
                            while (end >= start) {
                                res.put(df.format(new Date(start)), this.getDateByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24));
                                start += 1000L * 60 * 60 * 24;
                            }
                            break;
                    }
                    if (ObjectUtils.isNotNull(result.get(serviceType))) {
                        Map<String, Object> old = result.get(serviceType);
                        Set<String> keys = old.keySet();
                        for (String key : keys) {
                            old.put(key, (Long) res.get(key) + (Long) old.get(key));
                        }
                        result.put(serviceType, old);
                    } else {
                        result.put(serviceType, res);
                    }
                    break;
                case "evaluate":
                    //满意度
                    int[] evaluateStars = {0, 1, 2, 3, 4, 5};
                    res = new LinkedHashMap<>();
                    for (int evaluateStar : evaluateStars) {
                        Long allcount = 0l;
                        switch (timeType) {
                            case "year":
                                df = new SimpleDateFormat("yyyy");
                                startYear = df.parse(startTime).getYear();
                                endYear = df.parse(endTime).getYear();
                                start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();
                                while (endYear >= startYear) {
                                    int day = 365;
                                    if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                        day = 366;
                                    }
                                    allcount += this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24 * day);
                                    start += 1000L * 60 * 60 * 24 * day;
                                    startYear++;
                                }
                                res.put(evaluateStar + "", allcount);

                                break;
                            case "month":
                                df = new SimpleDateFormat("yyyy-MM");
                                startMonth = df.parse(startTime).getMonth();
                                startYear = df.parse(startTime).getYear();
                                endMonth = df.parse(endTime).getMonth();
                                endYear = df.parse(endTime).getYear();
                                int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                                if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0)) {
                                    days[1] = 29;
                                }

                                start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                                end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                                while (end >= start) {

                                    allcount += this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24 * days[startMonth]);
                                    start += 1000L * 60 * 60 * 24 * days[startMonth];
                                    startMonth++;
                                    startMonth = startMonth % 12;
                                }
                                res.put(evaluateStar + "", allcount);
                                break;
                            case "day":
                                df = new SimpleDateFormat("yyyy-MM-dd");
                                start = df.parse(startTime).getTime();
                                end = df.parse(endTime).getTime();
                                while (end >= start) {
                                    allcount += this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24);
                                    start += 1000L * 60 * 60 * 24;
                                }
                                res.put(evaluateStar + "", allcount);
                                break;
                        }
                    }
                    if (ObjectUtils.isNotNull(result.get(serviceType))) {
                        Map<String, Object> old = result.get(serviceType);
                        Set<String> keys = old.keySet();
                        for (String key : keys) {
                            old.put(key, (Long) res.get(key) + (Long) old.get(key));
                        }
                        result.put(serviceType, old);
                    } else {
                        result.put(serviceType, res);
                    }
                    break;
                case "money": {
                    //来电类型
                    res = new LinkedHashMap<>();
                    switch (timeType) {
                        case "month":
                            df = new SimpleDateFormat("yyyy-MM");
                            startMonth = df.parse(startTime).getMonth();
                            startYear = df.parse(startTime).getYear();
                            endMonth = df.parse(endTime).getMonth();
                            endYear = df.parse(endTime).getYear();
                            int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                            if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0)) {
                                days[1] = 29;
                            }

                            start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                            end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                            while (end >= start) {

                                res.put(df.format(new Date(start)), this.getPriceByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * days[startMonth]));
                                start += 1000L * 60 * 60 * 24 * days[startMonth];

                                startMonth++;
                                startMonth = startMonth % 12;
                            }
                            break;
                        case "year":
                            df = new SimpleDateFormat("yyyy");
                            startYear = df.parse(startTime).getYear();
                            endYear = df.parse(endTime).getYear();

                            start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();

                            while (endYear >= startYear) {
                                //判断是否是闰年
                                int day = 365;
                                if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                    day = 366;
                                }
                                res.put(df.format(new Date(start)), this.getPriceByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24 * day));
                                start += 1000L * 60 * 60 * 24 * day;
                                startYear++;
                            }
                            break;
                        case "day":
                            df = new SimpleDateFormat("yyyy-MM-dd");
                            start = df.parse(startTime).getTime();
                            end = df.parse(endTime).getTime();
                            while (end >= start) {
                                res.put(df.format(new Date(start)), this.getPriceByRange(infos, serviceType, start, start + 1000L * 60 * 60 * 24));
                                start += 1000L * 60 * 60 * 24;
                            }
                            break;
                    }
                    if (ObjectUtils.isNotNull(result.get(serviceType))) {
                        Map<String, Object> old = result.get(serviceType);
                        Set<String> keys = old.keySet();
                        for (String key : keys) {
                            old.put(key, (Double) res.get(key) + (Double) old.get(key));
                        }
                        result.put(serviceType, old);
                    } else {
                        result.put(serviceType, res);
                    }
                    break;
                }
                default:
                    break;

            }

        }

        return result;
    }


    @Override
    public Long getDateByRange(List<Task> infos, String serviceType, long startTime, long endTime) {
        Long count = 0L;
        for (Task information : infos) {
            if (information.getCreateTime().getTime() >= startTime && information.getCreateTime().getTime() <= endTime) {
                if (serviceType.equals("all")) {
                    count++;
                } else if (serviceType.equals(information.getServiceType())) {
                    count++;

                }
            }
        }
        return count;
    }

    @Override
    public Long getDateByRange(List<Task> infos, Integer evaluateStar, long startTime, long endTime) {
        Long count = 0L;
        for (Task information : infos) {
            if (information.getCreateTime().getTime() >= startTime && information.getCreateTime().getTime() <= endTime) {
                if (evaluateStar == 0) {
                    if (Objects.equals(information.getStatus(), TaskQuantity.COMPLETE)) {
                        count++;
                    }
                } else {
                    if (Objects.equals(information.getLevel(), evaluateStar)) {
                        count++;
                    }

                }
            }
        }
        return count;
    }

    public double getPriceByRange(List<Task> infos, String moneyType, long startTime, long endTime) {
        double count = 0D;
        for (Task information : infos) {
            if (information.getCreateTime().getTime() >= startTime && information.getCreateTime().getTime() <= endTime && ObjectUtils.isNotNull(information.getMoney())) {
                if (moneyType.equals("all")) {
                    count += information.getMoney();
                } else if (moneyType.equals(information.getServiceType())) {
                    count += information.getMoney();
                }
            }
        }
        return count;
    }

    @Override
    public int preHandleTaskElder(Integer elderId) {
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(elderId);
        if (ObjectUtils.isNotNull(elderlyMsg)) {
            UserLinkElder filter = new UserLinkElder();
            filter.setElderName(elderlyMsg.getElderName());
            filter.setElderCardNo(elderlyMsg.getIdcardno());
            filter.setElderMobile(elderlyMsg.getMobile());
            List<UserLinkElder> userLinkElders = userLinkElderService.getAllRecode(filter);
            if (ObjectUtils.isNotNull(userLinkElders)) {
                return userLinkElders.get(0).getId();
            } else {
                filter.setElderAge(elderlyMsg.getAge());
                filter.setElderAddress(elderlyMsg.getRealAddress());
                filter.setElderSex(elderlyMsg.getSexDictId());
                filter.setUserId(0);
                if (userLinkElderService.insert(filter)) {
                    return filter.getId();
                }
            }
        }
        return 0;
    }


    @Override
    public boolean requestPay(Task task) {
        Task cache = (Task) redisDemandInfoUtil.getDemandInfo(task.getId());
        if (this.updateByPrimaryKeySelective(task)) {
            //更新缓存
            if (ObjectUtils.isNotNull(cache)) {
                cache.setReceiverName(task.getReceiverName());
                cache.setStatus(TaskQuantity.PAY);
                cache.setMoney(cache.getMoney());
                cache.setPayType(task.getPayType());
                cache.setPayTime(new Date());
                cache.setUpdateTime(new Date());
                redisDemandInfoUtil.putDemandInfo(task.getId(), cache);
                return true;
            }
        }
        return false;
    }

    @Override
    @Transactional
    public String createPaymentInfo(Task task, String ip) {
        switch (task.getPayType()) {
            case 2:
                //支付宝
                return createAlipayInfo(task.getServiceType() + "" + task.getServiceName(), task.getNumber(), task.getMoney());
            case 3:
                //微信
                return createWXpayInfo(task.getServiceType() + "" + task.getServiceName(), task.getNumber(), task.getMoney(), ip);
        }
        return null;
    }

    @Override
    public boolean updateTaskByNumber(Task task) {
        if (ObjectUtils.isNotNull(task.getNumber())) {
            return mapper.updateTaskByNumber(task) > 0;
        }
        return false;
    }


    @Override
    public Double countMoney(Task task, Date startTime, Date endTime) {
        return mapper.countMoney(task, startTime, endTime);
    }

    @Override
    public PageResponse<ServiceOrgTaskMoneyVo> selectPageListByOrgMoney(ServiceOrgTaskMoneyVo filter, PageRequest pageRequest) {
        PageResponse<ServiceOrgTaskMoneyVo> pageResponse = new PageResponse<ServiceOrgTaskMoneyVo>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectPageListByOrgMoney(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(mapper.countByOrgMoney(filter));
        return pageResponse;
    }

    @Override
    public int taskCountByCity(String city) {
        return mapper.taskCountByCity(city);
    }

    @Override
    public List<Task> selectCountByServiceType(String serviceType) {
        return mapper.selectCountByServiceType(serviceType);
    }

    @Override
    public PageResponse<Task> selectRecordList(Task task, PageRequest pageRequest) {
        PageResponse<Task> pageResponse = new PageResponse<>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(mapper.selectRecordList(task, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(mapper.recordCount(task));
        return pageResponse;
    }

//    @Override
//    public int taskCountByCityForDay(String city) {
//        return mapper.taskCountByCityForDay(city);
//    }
//
//    @Override
//    public int taskCountByCityForYear(String city) {
//        return mapper.taskCountByCityForYear(city);
//    }
//
//    @Override
//    public int getTaskByYear() {
//        return mapper.getCountByYear();
//    }
//
//    @Override
//    public int getTaskByDate() {
//        return mapper.getCountByDate();
//    }


    /**
     * 计算好评率
     *
     * @param task
     * @param receiverId
     */
    public void calculateValuateRate(Task task, Integer receiverId) {
        try {
            User receiver = userService.selectByPrimaryKey(receiverId);
            ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(Integer.parseInt(receiver.getServiceOrgId()));
            Double feekback = serviceOrgLocation.getFeedbackRate();
            if (feekback == null || feekback == 0) {
                if (task.getLevel() >= 4) {
                    feekback = 1.0;
                }
            } else if (feekback > 0) {
                if (task.getLevel() >= 4) {
                    feekback = (feekback * 10 + 1) / (11.0);
                } else {
                    feekback = (feekback * 10) / (11.0);
                }
            }

            serviceOrgLocation.setFeedbackRate(feekback);
            redisServiceOrgLocationUtil.putServiceOrgLocation(serviceOrgLocation.getServiceOrgId(), serviceOrgLocation);

            ServiceOrg serviceOrg = new ServiceOrg();
            serviceOrg.setId(serviceOrgLocation.getServiceOrgId());
            serviceOrg.setFeedbackRate(feekback);
            serviceOrgService.updateByPrimaryKeySelective(serviceOrg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成支付宝订单信息
     *
     * @param subject
     * @param out_trade_no
     * @param amount
     * @return
     */
    private String createAlipayInfo(String subject, String out_trade_no, Double amount) {
        //实例化客户端
        AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", APP_ID, APP_PRIVATE_KEY, "json", CHARSET, ALIPAY_PUBLIC_KEY, "RSA2");
        //实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
        AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
        //SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。
        AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
        model.setSubject(subject);
        model.setOutTradeNo(out_trade_no);
        model.setTimeoutExpress("30m");
        model.setTotalAmount(amount + "");
        model.setProductCode("QUICK_MSECURITY_PAY");
        request.setBizModel(model);
        request.setNotifyUrl(NOTIFY_URL);
        try {
            AlipayTradeAppPayResponse response = alipayClient.sdkExecute(request);
            return response.getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String createWXpayInfo(String subject, String out_trade_no, Double amount, String ip) {
        try {
//            WxPayConfig payConfig = new WxPayConfig();
//            payConfig.setAppId(WXpayKeys.APP_ID);
//            payConfig.setMchId(WXpayKeys.MCHID);
//            payConfig.setMchKey(WXpayKeys.MCHKEY);
//            wxPayService.setConfig(payConfig);
            WxPayUnifiedOrderRequest request = new WxPayUnifiedOrderRequest();
            request.setBody(subject);
            request.setOutTradeNo(out_trade_no);
            Double total = amount * 100;//元-分
            request.setTotalFee(total.intValue());
            request.setSpbillCreateIp(ip);
            request.setNotifyURL(WXpayKeys.NOTIFY_URL);
            request.setTradeType("APP");
            WxPayUnifiedOrderResult result = wxPayService.unifiedOrder(request);
            if (ObjectUtils.isNotNull(result)) {
                return result.getXmlString();
            }
        } catch (WxPayException e) {
            e.printStackTrace();
        }
        return null;
    }
//
//    @Override
//    public PageResponse<Task> selectPageListForProviders(PageRequest pageRequest, Task task) {
//        PageResponse<Task> pageResponse = new PageResponse<Task>();
//        pageResponse.setDraw(pageRequest.getDraw());
//        pageResponse.setData(mapper.selectPageListForProviders(pageRequest,task));
//        pageResponse.setRecordsTotal(pageResponse.getData().size());
//        pageResponse.setRecordsFiltered(mapper.countForProviders(task));
//        return pageResponse;
//    }


    @Override
    public boolean insertSomeTask(List<Task> tasks) {
//        if(mapper.insertSomeTask(tasks)>0){
//            return true;
//        }
        return false;
    }

    @Override
    public List<Task> countPool(String starDate, String endDate, String areaName, String orgName) {
        return mapper.countPool(starDate, endDate, areaName, orgName);
    }

}
