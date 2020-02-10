package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.utils.*;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.UserFuWu;
import com.fedtech.pension.org.service.UserFuwuService;
import com.fedtech.pension.sys.entity.*;
import com.fedtech.pension.sys.quantity.MessageQuantity;
import com.fedtech.pension.sys.service.*;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.service.UserLinkElderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.fedtech.commons.enums.RoleType.ServiceUser;


/**
 * Created by CoderQiang on 2017/4/10.
 */
@Controller
@RequestMapping("/view/api/user/")
public class PageUserApiController extends BaseController {

    @Reference(version = "1.0.0")
    private UserService userService;
    @Reference(version = "1.0.0")
    private SmsLogService smsLogService;
    @Reference(version = "1.0.0")
    private UserLinkElderService userLinkElderService;
    @Reference(version = "1.0.0")
    private MessageService messageService;
    @Reference(version = "1.0.0")
    private MessageReceiveService messageReceiveService;
    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;
    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;

    /**
     * 发送验证码（先判断账号与联系方式是否关联）
     *
     * @param login_name
     * @param phone
     * @return
     */
    @RequestMapping(value = "sendValidateCode", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult sendValidateCode(HttpServletRequest request, String login_name, String phone) {

        JsonResult jsonResult = new JsonResult();
        User user = userService.selectByLoginName(login_name);
        if (ObjectUtils.isNotNull(user)) {
            if (phone.equals(user.getPhone())) {
                //发送短信验证码
                String code = (int) ((Math.random() * 9 + 1) * 100000) + "";
                String ip = request.getRemoteAddr();
                String resultStr = smsLogService.sendYZM(phone, code, ip);
                if ("true".equals(resultStr)) {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("uid", user.getUid());
                    jsonObject.put("code", code);
                    jsonResult.markSuccess("发送成功", jsonObject);
                } else {
                    jsonResult.markError(resultStr);
                }
            } else {
                jsonResult.markError("账号与联系方式不匹配");
            }
        } else {
            jsonResult.markError("没有该账号");
        }
        return jsonResult;
    }


    /**
     * 修改密码
     *
     * @param userId
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "updatePwd")
    @ResponseBody
    public JsonResult updatePwd(@RequestParam("userId") Integer userId,
                                @RequestParam("newPwd") String newPwd) {
        JsonResult result = new JsonResult();
        User user = userService.selectByPrimaryKey(userId);
        if (ObjectUtils.isNotNull(user)) {
            user.setPass_word(newPwd);
            if (userService.updateByPrimaryKeySelective(user)) {
                result.markSuccess("修改密码成功", null);
            } else {
                result.markError("修改密码失败");
            }
        } else {
            result.markError("用户不存在");
        }
        return result;
    }

    /**
     * 添加服务老人
     *
     * @param elderName
     * @param elderMobile
     * @param elderCardNo
     * @param elderAddress
     * @return
     */
    @RequestMapping(value = "addOrUpdateUserLinkElder", method = RequestMethod.POST)
    @ResponseBody
    public AppResult addUserLinkElder(@RequestParam("id") Integer id,
                                      @RequestParam("elderName") String elderName,
                                      @RequestParam("elderMobile") String elderMobile,
                                      @RequestParam("elderCardNo") String elderCardNo,
                                      @RequestParam("elderAddress") String elderAddress) {
        AppResult result = new AppResult();
        if(ObjectUtils.isNotNull(id))
        {
            return updateLinkElder(id,elderAddress,elderMobile,elderName,elderCardNo);
        }
        Integer elderAge = 0;
        Integer elderSex = 0;
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("userId不能为空");
            return result;
        }
        //判断年龄
        IdcardInfoExtractor idcardInfo = new IdcardInfoExtractor(elderCardNo);
        if (!ObjectUtils.isNotNull(idcardInfo.getAge()) || idcardInfo.getAge() < 60) {
            result.markError("老人年龄不能小于60");
            return result;
        }
        elderAge = idcardInfo.getAge();
        elderSex = "男".equals(idcardInfo.getGender()) ? 1 : 2;
        UserLinkElder userLinkElder = new UserLinkElder();
        userLinkElder.setUserId(currentUser().getUid());
        userLinkElder.setElderName(elderName);
        userLinkElder.setElderAge(elderAge);
        userLinkElder.setElderSex(elderSex);
        userLinkElder.setElderMobile(elderMobile);
        userLinkElder.setElderCardNo(elderCardNo);
        userLinkElder.setElderAddress(elderAddress);
        if (userLinkElderService.insert(userLinkElder)) {
            result.markSuccess("添加服务老人成功", null);
        } else {
            result.markError("添加服务老人失败");
        }
        return result;
    }


    /**
     * 获取服务对象服务老人列表
     *
     * @return
     */
    @RequestMapping(value = "getLinkElderList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getLinkElderList() throws Exception {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("userId不能为空");
            return result;
        }
        UserLinkElder userLinkElder = new UserLinkElder();
        userLinkElder.setUserId(currentUser().getUid());
        List<UserLinkElder> userLinkElders = userLinkElderService.getAllRecode(userLinkElder);
        for (UserLinkElder u : userLinkElders) {
            u.setQrcode(DESHelper.toHexString(DESHelper.encrypt(u.getElderCardNo(), Keys.SECRETKEY)));
        }
        if (userLinkElders != null) {
            result.markSuccess("获取服务对象服务老人列表成功", userLinkElders);
        } else {
            result.markError("获取服务对象服务老人列表失败");
        }
        return result;
    }

    /**
     * 删除服务老人
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteLinkElder", method = RequestMethod.POST)
    @ResponseBody
    public AppResult deleteLinkElder(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        if (userLinkElderService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除服务老人成功", null);
        } else {
            result.markError("删除服务老人失败");
        }
        return result;
    }


    /**
     * 更新服务老人信息
     *
     * @param id
     * @param elderAddress
     * @param elderMobile
     * @param elderName
     * @param elderCardNo
     * @return
     */
    @RequestMapping(value = "updateLinkElder", method = RequestMethod.POST)
    @ResponseBody
    public AppResult updateLinkElder(@RequestParam("id") Integer id,
                                     @RequestParam(value = "elderAddress", required = false) String elderAddress,
                                     @RequestParam(value = "elderMobile", required = false) String elderMobile,
                                     @RequestParam(value = "elderName", required = false) String elderName,
                                     @RequestParam(value = "elderCardNo", required = false) String elderCardNo
    ) {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(id)) {
            result.markError("id不能为空");
            return result;
        }
        UserLinkElder userLinkElder = new UserLinkElder();
        userLinkElder.setId(id);
        if (ObjectUtils.isNotNull(elderAddress))
            userLinkElder.setElderAddress(elderAddress);
        if (ObjectUtils.isNotNull(elderMobile))
            userLinkElder.setElderMobile(elderMobile);
        if (ObjectUtils.isNotNull(elderName))
            userLinkElder.setElderName(elderName);
        if (ObjectUtils.isNotNull(elderCardNo))
            userLinkElder.setElderCardNo(elderCardNo);
        if (userLinkElderService.updateByPrimaryKeySelective(userLinkElder)) {
            result.markSuccess("更新服务老人信息成功", null);
        } else {
            result.markError("更新服务老人信息失败");
        }
        return result;
    }

    /**
     * 获取通知列表
     *
     * @return
     */
    @RequestMapping(value = "getMessageList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getMessageList(@RequestParam(value = "attach", required = false) String attach,
                                    @RequestParam(value = "rob", required = false) Integer rob,
                                    @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                    @RequestParam(value = "length", required = false) Integer length) {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("userId不能为空");
            return result;
        }
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
        JSONObject jo=new JSONObject();
        Message message = new Message();
        message.setReceiveId(currentUser().getUid());
        message.setType(MessageQuantity.APPNOTICE);
        message.setAttach(attach);
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
        int count = messageService.countUnRead(message);
        jo.put("totalPage", count % length > 0 ? count / length + 1 : count / length);
        jo.put("count", count );
        jo.put("messages", messages);
        result.markSuccess("获取通知成功", jo);
        return result;
    }


    @RequestMapping(value = "updateMessageReceive", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateMessageReceive(@RequestParam("messageId") Integer messageId) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("userId不能为空");
            return result;
        }
        MessageReceive messageReceive = new MessageReceive();
        messageReceive.setRead(1);
        messageReceive.setMessageId(messageId);
        messageReceive.setReceiverId(currentUser().getUid());
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
     * @param attach
     * @param rob
     * @param pageNum
     * @param length
     * @return
     */
    @RequestMapping(value = "clearMessage", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public AppResult clearMessage(@RequestParam(value = "attach", required = false) String attach,
                                  @RequestParam(value = "rob", required = false) Integer rob,
                                  @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                  @RequestParam(value = "length", required = false) Integer length) {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("userId不能为空");
            return result;
        }
        result = getMessageList(attach, rob, pageNum, length);
        List<Message> messages = (List<Message>) result.getData();
        List<Integer> idList = new ArrayList<Integer>();
        for (Message message : messages) {
            idList.add(message.getId());
        }
        if (!idList.isEmpty() && idList.size() > 0) {
            if (messageService.deleteSomeMessage(idList)) {
                idList.removeAll(idList);
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
            } else {
                result.markError("删除失败");
            }
        } else {
            result.markError("消息列表为空！");
        }
        return result;
    }


    /**
     * 平台用户注册
     * @param user
     * @param sysRoleId
     * @param fuwuId
     * @return
     */
    @RequestMapping(value = "/userApply", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "平台用户注册")
    public JsonResult userApply(User user, Integer sysRoleId, Integer fuwuId) {
        JsonResult result = new JsonResult();
        //判断是否存在账号
        if (ObjectUtils.isNotNull(userService.selectByLoginName(user.getLogin_name()))) {
            result.markError("账号已存在");
            return result;
        }
        //和添加用户不同此处为用户自己输入的密码
        user.setPass_word(MD5.MD5Encode(user.getPass_word()));
        user.setCreate_time(new Date().getTime());

        if (userService.insert(user)) {
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getUid());
            userRole.setRoleId(sysRoleId);
            if (userRoleService.insert(userRole)) {
                UserFuWu userFuWu = new UserFuWu();
                if (sysRoleId == ServiceUser.getId()) {
                    if (!StringUtils.isEmpty(fuwuId)) {
                        UserState us = new UserState();
                        us.setUid(user.getUid());
                        us.setServiceOrgId(user.getServiceOrgId());
                        us.setServiceOrgName(user.getServiceOrgName());
                        us.setOnLine(0);
                        us.setUserStatus(0);
                        userFuWu.setId(fuwuId);
                        userFuWu.setUserId(user.getUid());
                        if (userFuwuService.updateByPrimaryKeySelective(userFuWu)) {
                            UserFuWu userFuWu1 = userFuwuService.selectByPrimaryKey(fuwuId);
                            us.setServiceType(userFuWu1.getServiceType());
                            us.setUserName(userFuWu1.getName());
                            us.setPhone(userFuWu1.getMobile());
                            result.markSuccess("注册成功", null);
                        } else {
                            result.markError("注册失败");
                        }
                    }
                }
                result.markSuccess("注册成功", null);
            } else {
                result.markError("注册失败");
            }
        } else {
            result.markError("注册失败");
        }
        return result;
    }


}
