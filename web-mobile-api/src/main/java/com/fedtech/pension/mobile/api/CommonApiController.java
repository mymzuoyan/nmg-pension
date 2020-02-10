
package com.fedtech.pension.mobile.api;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fedtech.commons.data.*;
import com.fedtech.commons.utils.GeoUtils;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.mobile.redis.RedisServiceOrgLocationUtil;
import com.fedtech.pension.mobile.redis.RedisUserStateUtil;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.entity.UserFuWu;
import com.fedtech.pension.org.quantity.ServiceOrgTypeQuantity;
import com.fedtech.pension.org.service.ServiceOrgLocationService;
import com.fedtech.pension.org.service.ServiceOrgPriceService;
import com.fedtech.pension.org.service.UserFuwuService;
import com.fedtech.pension.portal.entity.Advertisement;
import com.fedtech.pension.portal.service.AdvertisementService;
import com.fedtech.pension.sys.entity.*;
import com.fedtech.pension.sys.quantity.MessageQuantity;
import com.fedtech.pension.sys.service.*;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.quantity.JPushQuantity;
import com.fedtech.pension.task.service.JpushService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.vo.ServiceOrgTaskVo;
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
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author CoderQiang
 * @date 2017/3/6
 */
@Controller
@RequestMapping("/api/")
public class CommonApiController {


    protected Logger logger = LoggerFactory.getLogger(CommonApiController.class);

    @Reference(version = "1.0.0")
    private ServiceOrgLocationService serviceOrgLocationService;

    @Reference(version = "1.0.0")
    private ServiceTypeService serviceTypeService;

    @Reference(version = "1.0.0")
    private ServiceProjectService serviceProjectService;

    @Reference(version = "1.0.0")
    private MessageService messageService;

    @Reference(version = "1.0.0")
    private MessageReceiveService messageReceiveService;

    @Reference(version = "1.0.0")
    private SmsLogService smsLogService;

    @Reference(version = "1.0.0")
    private JpushService jpushService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private ServiceOrgPriceService serviceOrgPriceService;

    @Reference(version = "1.0.0")
    private AdvertisementService advertisementService;

    @Reference(version = "1.0.0")
    private SysVarsService sysVarsService;

    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;

    @Autowired
    private RedisUserStateUtil redisUserStateUtil;


    /**
     * 获取某一个服务人员的地址信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getUserLocation", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getUserLocation(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        UserState userState = (UserState) redisUserStateUtil.getUserState(id);
        if (ObjectUtils.isNotNull(userState)) {
            result.markSuccess("获取服务人员地理信息成功", userState);
        } else {
            result.markError("获取服务人员地理信息失败");
        }
        return result;
    }

    /**
     * 分页获取组织列表
     *
     * @param areaName
     * @param serviceOrgName
     * @param pageNum
     * @param length
     * @param institutionTypeDictId
     * @param serviceType
     * @param serviceProjectName
     * @param orderType
     * @param lat
     * @param lng
     * @return
     */
    @RequestMapping(value = "serviceOrg/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceOrgList(@RequestParam(value = "areaName", required = false) String areaName,
                                    @RequestParam(value = "serviceOrgName", required = false) String serviceOrgName,
                                    @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                    @RequestParam(value = "length", required = false) Integer length,
                                    @RequestParam(value = "institutionTypeDictId", required = false) String institutionTypeDictId,
                                    @RequestParam(value = "serviceType", required = false) String serviceType,
                                    @RequestParam(value = "serviceProjectName") String serviceProjectName,
                                    @RequestParam(value = "orderType", required = false, defaultValue = "feedback") String orderType,
                                    @RequestParam(value = "lat", required = false) Double lat,
                                    @RequestParam(value = "lng", required = false) Double lng) {
        JSON.DEFAULT_GENERATE_FEATURE = SerializerFeature.DisableCircularReferenceDetect.getMask();
        List<ServiceOrgLocation> serviceOrgLocations = null;
        List<ServiceOrgLocation> sResult = new ArrayList<>();
        AppResult result = new AppResult();
        ServiceOrgLocation serviceOrgLocation = new ServiceOrgLocation();
        serviceOrgLocation.setAreaName(areaName);
        serviceOrgLocation.setServiceOrgName(serviceOrgName);
        serviceOrgLocation.setInstitutionTypeDictId(institutionTypeDictId);
        serviceOrgLocation.setServiceProjectName(serviceType);
        if ("feedback".equals(orderType)) {
            //好评率优先
            serviceOrgLocations = serviceOrgLocationService.selectPageListByFeedback(serviceOrgLocation, pageNum, length, lat, lng, Keys.PUSHRANGE);
        } else if ("range".equals(orderType) && ObjectUtils.isNotNull(lat) && ObjectUtils.isNotNull(lng)) {
            //距离优先
            serviceOrgLocations = serviceOrgLocationService.selectPageListByRange(serviceOrgLocation, pageNum, length, lat, lng, Keys.PUSHRANGE);
        } else if ("price".equals(orderType)) {
            //价格优先
            serviceOrgLocation.setServiceProjectName(serviceProjectName);
            serviceOrgLocations = serviceOrgLocationService.selectPageListByPrice(serviceOrgLocation, pageNum, length, "ASC", lat, lng, Keys.PUSHRANGE);
        } else if ("grade".equals(orderType)) {
            //等级优先
            serviceOrgLocations = serviceOrgLocationService.selectPageListByGrade(serviceOrgLocation, pageNum, length, lat, lng, Keys.PUSHRANGE);

        }
        if (ObjectUtils.isNotNull(serviceOrgLocations)) {
            Point center = new Point();
            center.setLng(lng);
            center.setLat(lat);
            for (ServiceOrgLocation s : serviceOrgLocations) {
                if (ObjectUtils.isNotNull(s) && ObjectUtils.isNotNull(s.getLng()) && ObjectUtils.isNotNull(s.getLat())) {
                    Point point = new Point();
                    point.setLng(s.getLng());
                    point.setLat(s.getLat());
                    if (GeoUtils.isPointInCircle(point, center, Keys.PUSHRANGE)) {
                        sResult.add(s);
                    }
                }
            }
            if (!ObjectUtils.isNotNull(sResult)) {
                //如果PUSHRANGE公里内没有组织，就取所有组织
                sResult = serviceOrgLocations;
            }
            int allCount = sResult.size();
            if (pageNum != null && pageNum > 0 && length != null && length > 0) {
                if (allCount < ((pageNum - 1) * length)) {
                    JSONObject jsonObject = new JSONObject();
                    result.markSuccess("获取组织成功", jsonObject);
                    return result;
                } else if (allCount < pageNum * length) {
                    sResult = sResult.subList((pageNum - 1) * length, allCount);
                } else {
                    sResult = sResult.subList((pageNum - 1) * length, (pageNum) * length);
                }
            }
        }
        List<Integer> sids = new ArrayList<>();

        for (ServiceOrgLocation s : sResult) {
            sids.add(s.getServiceOrgId());
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("serviceOrgs", sResult);
        if (ObjectUtils.isNotNull(sids)) {
            List<ServiceOrgPrice> serviceOrgPrices = serviceOrgPriceService.selectByNameAndServiceOrgIds(serviceProjectName, sids);
            jsonObject.put("ServiceOrgPrices", serviceOrgPrices);
            List<ServiceOrgTaskVo> serviceOrgTaskVos = taskReceiveService.getTaskCountByLast30(sids);
            jsonObject.put("serviceOrgTasks", serviceOrgTaskVos);
        }

        //获取价格
        result.markSuccess("获取组织成功", jsonObject);
        return result;
    }


    /**
     * 获取三公里之内的服务组织
     *
     * @param lat
     * @param lng
     * @return
     */
    @RequestMapping(value = "serviceOrg/getRobServiceOrgs", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getRobServiceOrgs(@RequestParam("lat") Double lat, @RequestParam("lng") Double lng, @RequestParam(value = "serviceType", required = false) String serviceType) {
        AppResult result = new AppResult();
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> sids = hashMap.keySet();
        List<ServiceOrgLocation> sResult = new ArrayList<>();
        Set<Integer> resultIds = new HashSet<>();
        List<ServiceOrgLocation> serviceOrgLocations = serviceOrgLocationService.selectPageListByRange(new ServiceOrgLocation(), 0, 0, lat, lng, Keys.PUSHRANGE);
        if (ObjectUtils.isNotNull(sids)) {
            Point center = new Point();
            center.setLat(lat);
            center.setLng(lng);
            for (ServiceOrgLocation s : serviceOrgLocations) {
                if (ObjectUtils.isNotNull(s) && ObjectUtils.isNotNull(s.getLat())) {
                    Point point = new Point();
                    point.setLat(s.getLat());
                    point.setLng(s.getLng());
                    if (GeoUtils.isPointInCircle(point, center, Keys.PUSHRANGE)) {
                        if (ObjectUtils.isNotNull(serviceType) && ObjectUtils.isNotNull(s.getServiceProjectName()) && s.getServiceProjectName().contains(serviceType)) {
                            sResult.add(s);
                            resultIds.add(s.getId());
                        }
                        if (!ObjectUtils.isNotNull(serviceType)) {
                            sResult.add(s);
                            resultIds.add(s.getId());
                        }
                    }
                }
            }
            if (!ObjectUtils.isNotNull(sResult)) {
                for (ServiceOrgLocation s : serviceOrgLocations) {
                    if (ObjectUtils.isNotNull(serviceType) && ObjectUtils.isNotNull(s.getServiceProjectName()) && s.getServiceProjectName().contains(serviceType)) {
                        sResult.add(s);
                    }
                    if (!ObjectUtils.isNotNull(serviceType)) {
                        sResult.add(s);
                    }
                    if (sResult.size() >= 4) {
                        break;
                    }
                }
            } else if (sResult.size() < 4) {
                for (ServiceOrgLocation s : serviceOrgLocations) {
                    if (resultIds.contains(s.getId())) {
                        continue;
                    }
                    if (ObjectUtils.isNotNull(serviceType) && ObjectUtils.isNotNull(s.getServiceProjectName()) && s.getServiceProjectName().contains(serviceType)) {
                        sResult.add(s);
                        resultIds.add(s.getId());
                    }
                    if (!ObjectUtils.isNotNull(serviceType)) {
                        sResult.add(s);
                        resultIds.add(s.getId());
                    }
                    if (sResult.size() >= 4) {
                        break;
                    }
                }
            }
        }
        result.markSuccess("获取成功", sResult);
        return result;
    }

    /**
     * 机构列表
     *
     * @return
     */
    @RequestMapping(value = "institution/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getInstitutionList() {
        ServiceOrg filter = new ServiceOrg();
        filter.setType(ServiceOrgTypeQuantity.INSTITUTION);
        List<ServiceOrgLocation> serviceOrgLocations = new ArrayList<>();
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) hashMap.get(id);
            if (ServiceOrgTypeQuantity.INSTITUTION.equals(serviceOrgLocation.getType())) {
                serviceOrgLocations.add(serviceOrgLocation);
            }
        }
        AppResult result = new AppResult();
        if (ObjectUtils.isNotNull(serviceOrgLocations)) {
            result.markSuccess("获取成功", serviceOrgLocations);
        } else {
            result.markError("获取失败");
        }
        return result;
    }

    /**
     * 企业列表
     *
     * @return
     */
    @RequestMapping(value = "providers/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getProvidersList() {
        ServiceOrg filter = new ServiceOrg();
        filter.setType(ServiceOrgTypeQuantity.PROVIDERS);
        List<ServiceOrgLocation> serviceOrgLocations = new ArrayList<>();
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) hashMap.get(id);
            if (ServiceOrgTypeQuantity.PROVIDERS.equals(serviceOrgLocation.getType())) {
                serviceOrgLocations.add(serviceOrgLocation);
            }
        }
        AppResult result = new AppResult();
        if (ObjectUtils.isNotNull(serviceOrgLocations)) {
            result.markSuccess("获取成功", serviceOrgLocations);
        } else {
            result.markError("获取失败");
        }
        return result;
    }

    /**
     * 获取组织详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "serviceOrg/detail", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getServiceOrgDetail(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(id);
        result.markSuccess("获取组织成功", serviceOrgLocation);
        return result;
    }


    /**
     * 分页获取服务人员列表
     *
     * @param serviceOrgId
     * @param pageNum
     * @param length
     * @return
     */
    @RequestMapping(value = "serviceUser/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceUserList(@RequestParam("serviceOrgId") Integer serviceOrgId,
                                     @RequestParam(value = "serviceType", required = false) String serviceType,
                                     @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                     @RequestParam(value = "length", required = false) Integer length) {
        AppResult result = new AppResult();
        UserFuWu userFuWu = new UserFuWu();
        userFuWu.setServiceOrgId(serviceOrgId);
        userFuWu.setServiceType(serviceType);
        PageRequest pageRequest = new PageRequest();
        if (!StringUtils.isEmpty(pageNum) && !StringUtils.isEmpty(length)) {
            if (pageNum < 1) {
                result.markError("页数不可小于1");
                return result;
            }
            pageRequest.setStart(pageNum - 1);
            pageRequest.setLength(length);
        }
        PageResponse<UserFuWu> userFuWus = userFuwuService.selectPageList(userFuWu, pageRequest);
        result.markSuccess("获取服务人员列表信息成功", userFuWus.getData());
        return result;
    }

    /**
     * 获取服务类型列表
     *
     * @return
     */
    @RequestMapping(value = "serviceType/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceTypeList() {
        AppResult result = new AppResult();
        List<ServiceType> serviceTypes = serviceTypeService.getAllRecode(new ServiceType());
        result.markSuccess("获取服务类型列表信息成功", serviceTypes);
        return result;
    }

    /**
     * 获取服务项目列表成功
     *
     * @param serviceTypeId
     * @return
     */
    @RequestMapping(value = "serviceProject/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceProjectList(@RequestParam(value = "serviceTypeId", required = false) Integer serviceTypeId) {
        AppResult result = new AppResult();
        ServiceProject serviceProject = new ServiceProject();
        serviceProject.setServiceType(serviceTypeId);
        List<ServiceProject> serviceProjects = serviceProjectService.getAllRecode(serviceProject);
        result.markSuccess("获取服务项目列表信息成功", serviceProjects);
        return result;
    }

    /**
     * 获取通知列表
     *
     * @return
     */
    @RequestMapping(value = "getMessageList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getMessageList(@RequestParam("userId") Integer userId,
                                    @RequestParam(value = "read", required = false) Integer read,
                                    @RequestParam(value = "attach", required = false) String attach,
                                    @RequestParam(value = "rob", required = false) Integer rob,
                                    @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                    @RequestParam(value = "length", required = false) Integer length) {
        AppResult result = new AppResult();
        PageRequest pageRequest = new PageRequest();
        if (!StringUtils.isEmpty(pageNum) && !StringUtils.isEmpty(length)) {
            if (pageNum < 1) {
                result.markError("页数不可小于1");
                return result;
            } else {
                pageRequest.setStart((pageNum - 1) * length);
                pageRequest.setLength(length);
            }
        }
        Message message = new Message();
        message.setReceiveId(userId);
        message.setType(MessageQuantity.APPNOTICE);
        message.setAttach(attach);
        if (read != null) {
            message.setRead(read);
        }
        if (!StringUtils.isEmpty(rob)) {
            JSONObject jsonObject = new JSONObject();
            if (rob == 0) {
                jsonObject.put("rob", 0);
                message.setContent(jsonObject.toJSONString().replaceAll("\\{|\\}", ""));
            } else if (rob == 1) {
                jsonObject.put("rob", 1);
                message.setContent(jsonObject.toJSONString().replaceAll("\\{|\\}", ""));
            }
        }
        List<Message> messages = messageService.selectUnRead(message, pageRequest);
        result.markSuccess("获取通知成功", messages);
        return result;
    }


    @RequestMapping(value = "updateMessageReceive", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateMessageReceive(@RequestParam("userId") Integer userId, @RequestParam("messageId") Integer messageId) {
        JsonResult result = new JsonResult();
        MessageReceive messageReceive = new MessageReceive();
        messageReceive.setRead(1);
        messageReceive.setMessageId(messageId);
        messageReceive.setReceiverId(userId);
        messageReceive.setReadTime(new Date());
        if (messageReceiveService.updateByMessageIdAndReceiverId(messageReceive)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 清空消息列表
     *
     * @param userId
     * @param attach
     * @param rob
     * @param pageNum
     * @param length
     * @return
     */
    @RequestMapping(value = "clearMessage", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public AppResult clearMessage(@RequestParam("userId") Integer userId,
                                  @RequestParam(value = "attach", required = false) String attach,
                                  @RequestParam(value = "rob", required = false) Integer rob,
                                  @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                  @RequestParam(value = "length", required = false) Integer length) {
        AppResult result = new AppResult();
        result = getMessageList(userId, null, attach, rob, pageNum, length);
        List<Message> messages = (List<Message>) result.getData();
        List<Integer> idList = new ArrayList<Integer>();
        for (Message message : messages) {
            idList.add(message.getReceiveId());
        }
        if (!idList.isEmpty() && idList.size() > 0) {
            if (messageReceiveService.deleteSomeMessageReceive(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 发送验证码
     *
     * @param phone
     * @param num
     * @return
     */
    @RequestMapping(value = "sendVerificationCode", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendVerificationCode(HttpServletRequest request, HttpServletResponse response, @RequestParam("phone") String phone, @RequestParam("num") String num) {
        AppResult result = new AppResult();
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET,POST");
        String ip = request.getRemoteAddr();
        String resultStr = smsLogService.sendYZM(phone, num, ip);
        if ("true".equals(resultStr)) {
            result.markSuccess("发送成功", null);
        } else {
            result.markError(resultStr);
        }
        return result;
    }


    /**
     * 提醒服务人员
     *
     * @param userId
     * @param receiveId
     * @param content
     * @param id
     * @return
     */
    @RequestMapping(value = "sendMessageToUser", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendMessageToUser(@RequestParam("userId") Integer userId,
                                       @RequestParam("receiveId") Integer receiveId,
                                       @RequestParam("content") String content,
                                       @RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        TaskReceive taskReceive = new TaskReceive();
        taskReceive.setId(id);
        taskReceive.setRemind(1);
        if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
            List<String> receivers = new ArrayList<>();
            receivers.add(receiveId.toString());
            JSONObject jsonObject = new JSONObject();
            Message message = new Message();
            message.setTitle("推送消息");
            message.setCreateTime(new Date());
            message.setCreatorId(userId);
            message.setType(MessageQuantity.APPNOTICE);
            List<Integer> uids = new ArrayList<>();
            message.setContent(content);
            uids.add(receiveId);
            messageService.sendMessage(message, uids);
            jpushService.sendUserMessage(receivers, content, JSON.toJSONString(jsonObject), JPushQuantity.SERVICEUSER);
            result.markSuccess("提醒成功", null);
        } else {
            result.markError("提醒失败");
        }
        return result;
    }


    @RequestMapping("/serviceProjectPrice/list")
    @ResponseBody
    public AppResult getServiceProjectPriceList(Integer serviceOrgId, String serviceProjectName) {
        AppResult result = new AppResult();
        List<ServiceOrgPrice> serviceOrgPrices = serviceOrgPriceService.selectByNameAndServiceOrgId(serviceProjectName, serviceOrgId);
        result.markSuccess("获取价格成功", serviceOrgPrices);
        return result;
    }


    /**
     * 获取引导页
     *
     * @return
     */
    @RequestMapping("/advertisement/bootpages")
    @ResponseBody
    public AppResult getAdvertisements() {
        AppResult result = new AppResult();
        Advertisement filter = new Advertisement();
        filter.setPurpose(1);
        List<Advertisement> advertisements = advertisementService.getAllRecode(filter);
        result.markSuccess("获取引导页成功", advertisements);
        return result;
    }


    /**
     * 获取版本号
     *
     * @return
     */
    @RequestMapping("version")
    @ResponseBody
    public String versionChange() {
        SysVars query = sysVarsService.findByName("version");
        if (ObjectUtils.isNotNull(query)) {
            return query.getVarsValue();
        }
        return "";
    }


}
