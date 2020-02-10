package com.fedtech.pension.mobile.api.ServiceOrgUser;


import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.DESHelper;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.mobile.redis.RedisUserStateUtil;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.quantity.PayTypeQuantity;
import com.fedtech.pension.org.service.ServiceOrgPriceService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserState;
import com.fedtech.pension.task.entity.*;
import com.fedtech.pension.task.quantity.JPushQuantity;
import com.fedtech.pension.task.quantity.TaskPlanQuantity;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.quantity.TaskReceiveQuantity;
import com.fedtech.pension.task.service.*;
import com.google.common.base.Strings;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * Created by CodingQiang on 2016/10/12.
 */
@Controller
@RequestMapping("/api/serviceUser/task/")
public class SOUTaskApiController {
    protected Logger logger = LoggerFactory.getLogger(SOUTaskApiController.class);

    SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private TaskPlanService taskPlanService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private TaskHandleService taskHandleService;

    @Reference(version = "1.0.0")
    private ServiceOrgPriceService serviceOrgPriceService;

    @Reference(version = "1.0.0")
    private ElderlyWalletService elderlyWalletService;

    @Autowired
    private RedisUserStateUtil redisUserStateUtil;


    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    private String key = "@njytyl&";

    /**
     * 组织管理员/服务人员获取接单列表
     * 分页
     *
     * @param userId
     * @param pageNum
     * @param status  0：未处理 1:正在处理 2：已完成
     * @return
     */
    @RequestMapping(value = "getTaskByUserId", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskByUserID(@RequestParam("userId") Integer userId,
                                     @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                     @RequestParam(value = "status", required = false) String status,
                                     @RequestParam(value = "serviceType", required = false) String serviceType) {
        AppResult result = new AppResult();
        if (pageNum != null && pageNum < 1) {
            result.markError("页数不能小于1");
            return result;
        }
        List<TaskReceive> milTasks = taskService.selectListByReceiver(userId, status, pageNum, 5, serviceType);
        result.markSuccess("获取任务成功", milTasks);
        return result;
    }

    /**
     * 获取抢单列表（3公里之内）
     *
     * @param userId
     * @param pageNum
     * @param status
     * @param serviceType
     * @return
     */
    @RequestMapping(value = "getRobTaskList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getRobTaskList(@RequestParam("userId") Integer userId,
                                    @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                    @RequestParam(value = "length", required = false) Integer length,
                                    @RequestParam(value = "status", required = false) Integer status,
                                    @RequestParam(value = "serviceType", required = false) String serviceType,
                                    @RequestParam(value = "sort", required = false) String sort
    ) {
        AppResult result = new AppResult();
        List<TaskReceive> milTasks = new ArrayList<>();
        if (ObjectUtils.isNotNull(pageNum) && ObjectUtils.isNotNull(length)) {
            milTasks = taskService.getRobTaskList(userId, status, pageNum, length, serviceType, sort, RoleType.ServiceUser.getId());
        } else {
            milTasks = taskService.getRobTaskList(userId, status, -1, -1, serviceType, sort, RoleType.ServiceUser.getId());
        }
        result.markSuccess("获取任务成功", milTasks);
        return result;
    }


    /**
     * 订单详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getInfoById", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getInfoById(@RequestParam(value = "id", required = false) Integer id,
                                 @RequestParam(value = "taskId", required = false) Integer taskId) {
        AppResult result = new AppResult();
        if (ObjectUtils.isNotNull(id)) {
            TaskReceive tr = taskReceiveService.selectById(id);
            if (ObjectUtils.isNotNull(tr)) {
                result.markSuccess("获取订单详情成功", tr);
            } else {
                result.markError("无此订单");
                return result;
            }
        }
        if (ObjectUtils.isNotNull(taskId)) {
            TaskReceive taskReceive = new TaskReceive();
            taskReceive.setTaskId(taskId);
            taskReceive.setReceiverId(0);
            List<TaskReceive> list = taskReceiveService.getAllRecode(taskReceive);
            if (!list.isEmpty() && list.size() > 0) {
                TaskReceive tr = taskReceiveService.selectById(list.get(0).getId());
                if (ObjectUtils.isNotNull(tr)) {
                    result.markSuccess("获取订单详情成功", tr);
                } else {
                    result.markError("无此订单");
                }
            } else {
                result.markError("无此订单");
            }
        }
        return result;
    }


    /**
     * 更新订单状态
     *
     * @param taskId
     * @param name
     * @param status
     * @return
     */
    @RequestMapping(value = "updateTaskStatus", method = RequestMethod.POST)
    @Transactional
    @ResponseBody
    public AppResult updateTaskStatus(@RequestParam("id") Integer id,
                                      @RequestParam("taskId") Integer taskId,
                                      @RequestParam("status") Integer status,
                                      @RequestParam("userId") Integer userId,
                                      @RequestParam("name") String name,
                                      @RequestParam(value = "idcardno", required = false) String idcardno) {
        AppResult result = new AppResult();
        // 查询订单支付类型
        Task cache = (Task) taskService.getCache(taskId);
        if (!StringUtils.isEmpty(cache.getPayType())) {
            if (cache.getPayType().equals(PayTypeQuantity.IDEALMONEYPAYMENT)) {
                //虚拟货币扣款
                AppResult idealMoneyRes = idealMoneyPayment(idcardno, cache);
                if (idealMoneyRes.getSuccess().equals(0)) {
                    return idealMoneyRes;
                }
            }
        }
        Map<String, Integer> map = taskReceiveService.getTaskStatus(status);
        // 更新订单状态
        Task task = new Task();
        task.setId(taskId);
        task.setStatus(map.get("taskStatus"));
        task.setReceiverName(name);
        task.setUpdateTime(new Date());
        if (taskService.updateByPrimaryKeySelective(task)) {
            if (status.equals(TaskQuantity.SERVICEUSER_REFUSE)) {
                TaskReceive taskReceive = taskReceiveService.selectByPrimaryKey(id);
                if (ObjectUtils.isNotNull(taskReceive)) {
                    taskService.sendTasktoUser(task, userId, name, taskReceive.getCreatorId(), JPushQuantity.SERVICEADMIN);
                    if (taskReceiveService.deleteByPrimaryKey(id)) {
                        if (ObjectUtils.isNotNull(cache)) {
                            cache.setStatus(map.get("taskStatus"));
                            cache.setReceiverName(name);
                            cache.setUpdateTime(new Date());
                            taskService.updateCache(cache);
                        }
                        result.markSuccess("更新订单状态成功", null);
                    } else {
                        result.markError("更新订单状态失败");
                    }
                }
            } else {
                TaskReceive taskReceive = new TaskReceive();
                taskReceive.setId(id);
                taskReceive.setStatus(map.get("taskReceiveStatus"));
                taskReceive.setUpdateTime(new Date());
                if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
                    taskService.sendTasktoUser(task, userId, name, 0, JPushQuantity.SERVICEOBJECT);
                    //更新缓存
                    if (ObjectUtils.isNotNull(cache)) {
                        cache.setStatus(map.get("taskStatus"));
                        cache.setReceiverName(name);
                        cache.setUpdateTime(new Date());
                        taskService.updateCache(cache);
                    }
                    result.markSuccess("更新订单状态成功", null);
                } else {
                    result.markError("更新订单状态失败");
                }
            }
        }

        return result;
    }


    /**
     * 更新虚拟货币余额
     *
     * @param idcardno
     * @param cache
     * @return
     */
    public AppResult idealMoneyPayment(String idcardno, Task cache) {
        AppResult result = new AppResult();
        ElderlyWallet elderlyWallet = new ElderlyWallet();
        if (!StringUtils.isEmpty(idcardno)) {
            elderlyWallet.setIdcardno(idcardno);
            List<ElderlyWallet> elderlyWallets = elderlyWalletService.getAllRecode(elderlyWallet);
            if (!ObjectUtils.isNotNull(elderlyWallets)) {
                result.markError("老人无虚拟币");
                return result;
            } else if (elderlyWallets.size() > 1) {
                result.markError("老人虚拟币不唯一");
                return result;
            } else {
                elderlyWallet = elderlyWallets.get(0);
            }
        } else {
            result.markError("身份证号码为空");
            return result;
        }
        if (!StringUtils.isEmpty(cache.getMoney())) {
            if (!StringUtils.isEmpty(elderlyWallet.getBalance())) {
                double balance = elderlyWallet.getBalance();
                if (cache.getMoney() > balance) {
                    result.markError("虚拟货币余额不足");
                    return result;
                } else {
                    balance = balance - cache.getMoney();
                    elderlyWallet.setBalance(balance);
                    if (elderlyWalletService.updateByPrimaryKeySelective(elderlyWallet)) {
                        result.markSuccess("支付成功", elderlyWallet);
                    } else {
                        result.markError("虚拟货币余额更新失败");
                    }
                }
            }
        } else {
            result.markError("支付金额为空");
            return result;
        }
        return result;
    }

    /**
     * 更新抢单状态
     *
     * @param id
     * @param taskId
     * @param userId
     * @param name
     * @return
     */
    @RequestMapping(value = "updateRobTaskStatus", method = RequestMethod.POST)
    @Transactional
    @ResponseBody
    public AppResult updateRobTaskStatus(@RequestParam("id") Integer id,
                                         @RequestParam("taskId") Integer taskId,
                                         @RequestParam("userId") Integer userId,
                                         @RequestParam("name") String name) {
        AppResult result = new AppResult();
        TaskReceive taskReceive = taskReceiveService.selectByPrimaryKey(id);
        if (taskReceive.getReceiverId() != 0) {
            result.markError("订单已经被抢了");
        } else {
            // 更新订单状态
            Task task = new Task();
            task.setId(taskId);
            task.setStatus(TaskQuantity.SERVICEUSER_RESPONSE);
            UserState userState = (UserState) redisUserStateUtil.getUserState(userId);
            if (ObjectUtils.isNotNull(userState)) {
                task.setReceiverServiceOrg(userState.getServiceOrgName());
            }
            task.setReceiverName(name);
            task.setUpdateTime(new Date());
            try {
                List<ServiceOrgPrice> serviceOrgPrices = serviceOrgPriceService.selectByNameAndServiceOrgId(taskReceive.getServiceName(), Integer.parseInt(userState.getServiceOrgId()));
                boolean flag = false;
                if (ObjectUtils.isNull(serviceOrgPrices)) {
                    for (ServiceOrgPrice serviceOrgPrice : serviceOrgPrices) {
                        if (!ObjectUtils.isNull(serviceOrgPrice.getPrice()) && serviceOrgPrice.getPrice() != -1) {
                            Double price = serviceOrgPrice.getPrice();
                            if (!serviceOrgPrice.getServiceUnit().contains("小时")) {
                                task.setMoney(price);
                                task.setPriceInfo(price + "元");
                            } else {
                                task.setPriceInfo(price + "元（按小时记）");
                                task.setMoney(price);
                            }
                            flag = true;
                        }
                    }
                    if (!flag) {
                        result.markError("抢单失败，请完善价格体系");
                        return result;
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
                result.markError("抢单失败");
                return result;
            }
            //生成价格说明
            if (taskService.updateByPrimaryKeySelective(task)) {
                taskReceive.setId(id);
                taskReceive.setReceiverId(userId);
                taskReceive.setStatus(TaskReceiveQuantity.RESPONSE);
                taskReceive.setUpdateTime(new Date());
                if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
                    taskService.sendTasktoUser(task, userId, name, 0, JPushQuantity.SERVICEOBJECT);
                    //更新缓存
                    Task cache = (Task) taskService.getCache(taskId);
                    if (ObjectUtils.isNotNull(cache)) {
                        cache.setStatus(TaskQuantity.SERVICEUSER_RESPONSE);
                        cache.setReceiverName(name);
                        cache.setUpdateTime(new Date());
                        if (ObjectUtils.isNotNull(task.getPriceInfo())) {
                            cache.setPriceInfo(task.getPriceInfo());
                        }
                        if (ObjectUtils.isNotNull(task.getMoney())) {
                            cache.setMoney(task.getMoney());
                        }
                        try {
                            cache.setReceiverServiceOrg(((UserState) redisUserStateUtil.getUserState(userId)).getServiceOrgName());
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        taskService.updateCache(cache);
                    }
                    result.markSuccess("抢单成功", null);
                } else {
                    result.markError("抢单失败");
                }
            }
        }
        return result;
    }

    /**
     * 获取服务人员已完成，未完成，评价订单(好评，差评，未评)
     *
     * @return
     */
    @RequestMapping(value = "getTaskCountByUserId", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskCountByUserId(@RequestParam("userId") Integer userId) {
        AppResult result = new AppResult();
        List<TaskReceive> taskReceives = taskReceiveService.selectCountByReceiverId(userId);
        int notComplete = 0;// 未完成
        int complete = 0;//已完成
        List<Integer> notCompletes = new ArrayList<>();
        notCompletes.add(TaskQuantity.SERVICEUSER_RESPONSE);
        notCompletes.add(TaskQuantity.SERVICEUSER_REGISTER);
        List<Integer> completes = new ArrayList<>();
        completes.add(TaskQuantity.COMPLETE);
        completes.add(TaskQuantity.EVALUATED);
        if (ObjectUtils.isNotNull(taskReceives)) {
            for (int i = 0; i < taskReceives.size(); i++) {
                if (notCompletes.contains(taskReceives.get(i).getStatus())) {
                    notComplete += taskReceives.get(i).getTaskCount();
                }
                if (completes.contains(taskReceives.get(i).getStatus())) {
                    complete += taskReceives.get(i).getTaskCount();
                }
            }
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("notComplete", notComplete);
        jsonObject.put("complete", complete);
        jsonObject.put("evaluated", complete);
        result.markSuccess("获取服务统计成功", jsonObject);
        return result;
    }

    /**
     * 评价中心
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "getEvaluated", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getEvaluated(@RequestParam("userId") Integer userId) {
        AppResult result = new AppResult();
        int goodEvaluated = 0;
        int badEvaluated = 0;
        int notEvaluated = 0;
        List<TaskReceive> milTasks = taskService.selectListByReceiver(userId, "" + TaskQuantity.COMPLETE + "," + TaskQuantity.EVALUATED + "", null, null, null);
        if (ObjectUtils.isNotNull(milTasks)) {
            for (int i = 0; i < milTasks.size(); i++) {
                if (!StringUtils.isEmpty(milTasks.get(i).getLevel())) {
                    if (milTasks.get(i).getLevel() >= 3) {
                        goodEvaluated += 1;
                    } else {
                        badEvaluated += 1;
                    }
                } else {
                    notEvaluated += 1;
                }
            }
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("goodEvaluated", goodEvaluated);
        jsonObject.put("badEvaluated", badEvaluated);
        jsonObject.put("notEvaluated", notEvaluated);
        result.markSuccess("获取评价成功", jsonObject);
        return result;
    }

    /**
     * 获取今日订单
     *
     * @param userId
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "getTaskByTime", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskByTime(@RequestParam("userId") Integer userId, @RequestParam("pageNum") Integer pageNum) {
        AppResult result = new AppResult();
        List<TaskReceive> trs = taskReceiveService.getTaskByTime(userId, pageNum, 5);
        result.markSuccess("获取今日订单成功", trs);
        return result;
    }

    /**
     * 服务统计
     *
     * @param flag year-年 month-月
     * @return
     */
    @RequestMapping(value = "getCountByTime", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getCountByTime(@RequestParam("flag") String flag,
                                    @RequestParam("year") Integer year,
                                    @RequestParam("month") Integer month,
                                    @RequestParam("userId") Integer userId,
                                    @RequestParam("status") String status) {
        AppResult result = new AppResult();
        Map map = new HashMap();
        map.put("flag", flag);
        map.put("year", year);
        map.put("month", month);
        map.put("userId", userId);
        map.put("status", status);
        List<Map> maps = taskReceiveService.getCountByTime(map);
        result.markSuccess("获取服务统计成功", maps);
        return result;
    }

    /**
     * 自定义服务统计
     *
     * @param flag      1-年 2-月 3-天
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping(value = "getCountByAnyTime", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getCountByAnyTime(@RequestParam("flag") Integer flag,
                                       @RequestParam("startTime") String startTime,
                                       @RequestParam("endTime") String endTime) throws Exception {
        AppResult result = new AppResult();
        User user = new User();
        List<Map> maps = taskReceiveService.getCountByAnyTime(user, flag, df.parse(startTime), df.parse(endTime));
        result.markSuccess("获取自定义服务统计成功", maps);
        return result;
    }

    /**
     * 扫码
     *
     * @param scanCode
     * @param id
     * @return
     */
    @RequestMapping(value = "scanCode", method = RequestMethod.POST)
    @ResponseBody
    public AppResult scanCode(@RequestParam("scanCode") String scanCode,
                              @RequestParam("id") Integer id,
                              @RequestParam("taskId") Integer taskId,
                              @RequestParam("name") String name) throws Exception {
        AppResult result = new AppResult();
        String idcardno = decryptMessage(scanCode);
        if (!StringUtils.isEmpty(idcardno)) {
            if (taskService.hasTaskByIdAndIdCard(idcardno, taskId)) {
                result = updateRegister(id, taskId, name);
                if (result.getSuccess() == 1) {
                    result.markSuccess("扫码成功", null);
                } else {
                    result.markError("扫码失败");
                }
            } else {
                result.markError("服务老人不是改老人");
            }
        }
        return result;
    }

    /**
     * 服务人员登记
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "updateRegister", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public AppResult updateRegister(@RequestParam("id") Integer id, @RequestParam("taskId") Integer taskId, @RequestParam("name") String name) {
        AppResult result = new AppResult();
        TaskReceive taskReceive = new TaskReceive();
        taskReceive.setRegister(1);
        taskReceive.setId(id);
        taskReceive.setUpdateTime(new Date());
        if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
            Task task = new Task();
            task.setId(taskId);
            task.setReceiverName(name);
            task.setStatus(TaskQuantity.SERVICEUSER_REGISTER);
            task.setUpdateTime(new Date());
            if (taskService.updateByPrimaryKeySelective(task)) {
                //更新缓存
                Task cache = (Task) taskService.getCache(taskId);
                if (ObjectUtils.isNotNull(cache)) {
                    cache.setReceiverName(name);
                    cache.setUpdateTime(new Date());
                    cache.setStatus(TaskQuantity.SERVICEUSER_REGISTER);
                    taskService.updateCache(cache);
                    taskService.sendTasktoUser(cache, cache.getCreatorId(), cache.getReceiverName(), cache.getCreatorId(), JPushQuantity.SERVICEOBJECT);
                }
                result.markSuccess("登记成功", null);
            } else {
                result.markError("登记失败");
            }
        } else {
            result.markError("登记失败");
        }
        return result;
    }

    public String encryptElderly(ElderlyMsg elderlyMsg) throws Exception {
        String str = "";
        //加密
        if (ObjectUtils.isNotNull(elderlyMsg.getIdcardno())) {
            str = DESHelper.toHexString(DESHelper.encrypt(elderlyMsg.getIdcardno(), key));
        }

        return str;
    }

    public String decryptMessage(String message) throws Exception {
        String str = "";
        //加密
        if (ObjectUtils.isNotNull(message)) {
            str = DESHelper.decrypt(message, key);
        }

        return str;
    }


    /**
     * 请求支付
     *
     * @param request
     * @param taskId
     * @param type
     * @param name
     * @return
     */
    @RequestMapping(value = "requestPay", method = RequestMethod.POST)
    @ResponseBody
    public AppResult requestPay(HttpServletRequest request,
                                @RequestParam("taskId") Integer taskId,
                                @RequestParam("type") Integer type,
                                @RequestParam("money") Double money,
                                @RequestParam("name") String name) {
        AppResult result = new AppResult();
        //判断是否已上门
        Task cache = (Task) taskService.getCache(taskId);
        if (!ObjectUtils.isNotNull(cache)) {
            cache = taskService.selectByPrimaryKey(taskId);
            if (!ObjectUtils.isNotNull(cache)) {
                return null;
            }
        }
        if (ObjectUtils.isNotNull(cache)) {
            if (!Objects.equals(TaskQuantity.SERVICEUSER_REGISTER, cache.getStatus())) {
                result.markError("该工单不在服务中");
                return result;
            }
        } else {
            result.markError("未找到该工单");
        }
        Task task = new Task();
        task.setId(taskId);
        task.setReceiverName(name);
        task.setMoney(money);
        task.setStatus(TaskQuantity.PAY);
        task.setUpdateTime(new Date());
        task.setPayType(type);
        task.setPayTime(new Date());
        if (taskService.requestPay(task)) {
            result.markSuccess("请求支付成功", cache);
        } else {
            result.markError("请求支付失败");
        }
        return result;
    }


    /**
     * 获取工单价格信息
     *
     * @param request
     * @param taskId
     * @return
     */
    @RequestMapping(value = "getTaskPriceInfo", method = RequestMethod.POST)
    @ResponseBody
    public Double getTaskPriceInfo(HttpServletRequest request, @RequestParam("taskId") Integer taskId) {
        AppResult result = new AppResult();
        //判断是否已上门
        Task cache = (Task) taskService.getCache(taskId);
        if (!ObjectUtils.isNotNull(cache)) {
            cache = taskService.selectByPrimaryKey(taskId);
            if (!ObjectUtils.isNotNull(cache)) {
                return null;
            }
        }
        Double money = cache.getMoney();
        //生成价格
        if (cache.getPriceInfo().contains("小时")) {
            //
            Long time = 0L;
            Double hour = 0d;
            Double min = 0.5d;
            TaskHandle taskHandle = taskHandleService.getTaskHandleByStatus(taskId, TaskQuantity.SERVICEUSER_REGISTER);
            if (ObjectUtils.isNotNull(taskHandle)) {
                Date start = taskHandle.getHandleTime();
                time = System.currentTimeMillis() - start.getTime();
                hour = Double.valueOf(time / (1000 * 60 * 60));
                min = Double.valueOf(time % (1000 * 60));
                if (min >= 30) {
                    hour += 1;
                } else {
                    hour += .5;
                }

            }
            money = money * hour;
        }
        return money;
    }


    /**
     * 1、	扫码获取老人信息
     *
     * @param qrCoder
     * @return
     * @throws Exception
     */
    @RequestMapping("getElderMsgByQrCoder")
    @ResponseBody
    public AppResult getElderMsgByQrCoder(@RequestParam("qrCoder") String qrCoder) throws Exception {
        AppResult appResult = new AppResult();
        String idcardno = decryptMessage(qrCoder);
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
        if (!ObjectUtils.isNotNull(elderlyMsg)) {
            appResult.markError("该老人不存在");
            return appResult;
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", elderlyMsg.getId());
        jsonObject.put("elderName", elderlyMsg.getElderName());
        jsonObject.put("sexDictId", elderlyMsg.getSexDictId());
        jsonObject.put("age", elderlyMsg.getAge());
        jsonObject.put("realAddress", elderlyMsg.getRealAddress());
        jsonObject.put("homeTel", elderlyMsg.getHomeTel());
        jsonObject.put("idcardno", elderlyMsg.getIdcardno());
        jsonObject.put("mobile", elderlyMsg.getMobile());
        appResult.markSuccess("查询成功", jsonObject);
        return appResult;
    }


    /**
     * 发布需求
     *
     * @param task
     * @return
     */
    @RequestMapping(value = "sendADemand", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendADemand(TaskPlan task, String timeStr, HttpServletRequest request,
                                 @RequestParam(value = "serviceOrgId", required = false) Integer serviceOrgId) throws Exception {
        Integer userId = Integer.parseInt(request.getHeader("userId"));
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(task.getElderId())) {
            result.markError("请选择服务老人");
            return result;
        }
        if (task.getLat() == null || task.getLat() == 0 || task.getLng() == null && task.getLng() == 0) {
            result.markError("经纬度格式出错");
            return result;
        }
        if (StringUtils.isEmpty(task.getServiceType())) {
            result.markError("服务项目不能为空");
            return result;
        }
        if (StringUtils.isEmpty(task.getServiceAddress())) {
            result.markError("服务地址不能为空");
            return result;
        }
        if (!Strings.isNullOrEmpty(timeStr)) {
            try {
                task.setServiceTime(dateTime.parse(timeStr));
            } catch (ParseException e) {
                e.printStackTrace();
                result.markError("发布时间格式不对");
                return result;
            }
        }
        //生成订单编号
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        task.setNumber(df.format(new Date()));
        task.setSource("app");
        task.setType(TaskPlanQuantity.TYPE_CODER);//二维码
        task.setStatus(TaskPlanQuantity.NOTCOMPLETE);//未完成
        task.setCreateTime(new Date());
        task.setCreatorId(userId);
        task=taskPlanService.insertBackId(task);
        if (ObjectUtils.isNotNull(task.getId())) {
            result.markSuccess("发布需求成功", task);
            return result;
        } else {
            result.markError("发布需求失败");
        }
        return result;
    }

    /**
     * 4、	再次扫码进行工单完结
     *
     * @param qrCoder
     * @param taskId
     * @return
     */
    @RequestMapping("complete")
    @ResponseBody
    public AppResult complete(@RequestParam("qrCoder") String qrCoder,
                              @RequestParam("taskId") Integer taskId,
                              @RequestParam("timeStr") String timeStr,
                              @RequestParam("completeAddress") String completeAddress) {
        AppResult appResult = new AppResult();
        TaskPlan taskPlan = taskPlanService.selectByPrimaryKey(taskId);
        if (!ObjectUtils.isNotNull(taskPlan)) {
            appResult.markError("该工单不存在");
            return appResult;
        }
        String qrCoderTask = taskPlan.getQrCoder();
        if (qrCoder.equals(qrCoderTask)) {
            taskPlan.setStatus(TaskPlanQuantity.COMPLETE);//已完成
            taskPlan.setCompleteAddress(completeAddress);
            if (!Strings.isNullOrEmpty(timeStr)) {
                try {
                    taskPlan.setUpdateTime(dateTime.parse(timeStr));
                } catch (ParseException e) {
                    e.printStackTrace();
                    appResult.markError("发布时间格式不对");
                    return appResult;
                }
            }
            if (taskPlanService.updateByPrimaryKeySelective(taskPlan)) {
                appResult.markSuccess("此次服务已完成", taskPlan);
            } else {
                appResult.markError("此次服务未完成");
            }
        } else {
            appResult.markError("二维码扫描结果不正确");
        }
        return appResult;
    }

    /**
     * 分页获取列表
     *
     * @return
     */
    @RequestMapping("getListByCreator")
    @ResponseBody
    public AppResult getListByCreator(@RequestParam("userId") Integer userId,
                                      @RequestParam(value = "pageNum", required = false,defaultValue = "0") Integer pageNum,
                                      @RequestParam(value = "length", required = false,defaultValue = "0") Integer length,
                                      @RequestParam(value = "status", required = false) Integer status) {
        AppResult appResult = new AppResult();
        List<TaskPlan> milTasks = taskPlanService.selectListByCreator(userId, status, pageNum, length);
        appResult.markSuccess("获取工单列表成功", milTasks);
        return appResult;
    }

    /**
     * 获取计划工单详情
     *
     * @param taskId
     * @return
     */
    @RequestMapping("getTaskPlanInfo")
    @ResponseBody
    public AppResult getTaskPlanInfo(@RequestParam("taskId") Integer taskId) {
        AppResult appResult = new AppResult();
        TaskPlan taskPlan = taskPlanService.selectByPrimaryKey(taskId);
        if (ObjectUtils.isNotNull(taskPlan)) {
            appResult.markSuccess("获取详情成功", taskPlan);
        } else {
            appResult.markError("无此订单");
        }
        return appResult;
    }
}
