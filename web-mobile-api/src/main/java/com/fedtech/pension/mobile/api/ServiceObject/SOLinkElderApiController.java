package com.fedtech.pension.mobile.api.ServiceObject;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.utils.DESHelper;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.mobile.api.MyValidateApiController;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.service.TaskService;
import com.fedtech.pension.task.service.UserLinkElderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/3/8
 */
@Controller
@RequestMapping("/api/serviceObject/linkElder/")
public class SOLinkElderApiController {
    protected Logger logger = LoggerFactory.getLogger(SOLinkElderApiController.class);

    @Reference(version = "1.0.0")
    private UserLinkElderService userLinkElderService;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    private String key = "@njytyl&";

    /**
     * 添加服务老人
     *
     * @param userId
     * @param elderName
     * @param elderMobile
     * @param elderCardNo
     * @param elderAddress
     * @return
     */
    @RequestMapping(value = "addUserLinkElder", method = RequestMethod.POST)
    @ResponseBody
    public AppResult addUserLinkElder(@RequestParam("userId") Integer userId,
                                      @RequestParam("elderName") String elderName,
                                      @RequestParam("elderMobile") String elderMobile,
                                      @RequestParam("elderCardNo") String elderCardNo,
                                      @RequestParam("elderAddress") String elderAddress) {
        AppResult result = new AppResult();
        Integer elderAge = 0;
        Integer elderSex = 0;
        if (!ObjectUtils.isNotNull(userId)) {
            result.markError("userId不能为空");
            return result;
        }
        //判断年龄
        MyValidateApiController myValidateApiController = new MyValidateApiController();
        ElderlyMsg elderlyMsg = (ElderlyMsg) myValidateApiController.autoAnalysisIdentity(elderCardNo, "elder");
        logger.info(JacksonUtil.bean2Json(elderlyMsg));
        if (!ObjectUtils.isNotNull(elderlyMsg.getAge()) || elderlyMsg.getAge() < 60) {
            result.markError("老人年龄不能小于60");
            return result;
        }
        UserLinkElder old = new UserLinkElder();
        old.setUserId(userId);
        old.setElderCardNo(elderCardNo);
        if (userLinkElderService.count(old) > 0) {
            result.markError("改老人已存在");
            return result;
        }
        elderAge = elderlyMsg.getAge();
//        elderSex = "男".equals(elderlyMsg.getSexDictId()) ? 1 : 2;
        elderSex = elderlyMsg.getSexDictId();
        UserLinkElder userLinkElder = new UserLinkElder();
        userLinkElder.setUserId(userId);
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
     * @param userId
     * @return
     */
    @RequestMapping(value = "getLinkElderList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getLinkElderList(@RequestParam("userId") Integer userId) throws Exception {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(userId)) {
            result.markError("userId不能为空");
            return result;
        }
        UserLinkElder userLinkElder = new UserLinkElder();
        userLinkElder.setUserId(userId);
        List<UserLinkElder> userLinkElders = userLinkElderService.getAllRecode(userLinkElder);
        for (UserLinkElder u : userLinkElders) {
            u.setQrcode(DESHelper.toHexString(DESHelper.encrypt(u.getElderCardNo(), key)));
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
        //查询是否有未完结工单
        Task filter = new Task();
        filter.setElderId(id);
        filter.setStatus(TaskQuantity.EVALUATED);
        int count = taskService.count(filter);
        if (count > 0) {
            result.markError("改老人有未完结工单");
        } else {
            if (userLinkElderService.deleteByPrimaryKey(id)) {

                result.markSuccess("删除服务老人成功", null);
            } else {
                result.markError("删除服务老人失败");
            }
        }
        return result;
    }


    /**
     * /api/serviceObject/linkElder/
     * 更新服务老人信息
     *
     * @param id
     * @param elderSex
     * @param elderAddress
     * @param elderMobile
     * @param elderName
     * @param elderAge
     * @param elderCardNo
     * @return
     */

    @RequestMapping(value = "updateLinkElder", method = RequestMethod.POST)
    @ResponseBody
    public AppResult updateLinkElder(@RequestParam("id") Integer id,
                                     @RequestParam(value = "elderSex", required = false) Integer elderSex,
                                     @RequestParam(value = "elderAddress", required = false) String elderAddress,
                                     @RequestParam(value = "elderMobile", required = false) String elderMobile,
                                     @RequestParam(value = "elderName", required = false) String elderName,
                                     @RequestParam(value = "elderAge", required = false) Integer elderAge,
                                     @RequestParam(value = "elderCardNo", required = false) String elderCardNo
    ) {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(id)) {
            result.markError("id不能为空");
            return result;
        }
        UserLinkElder userLinkElder = new UserLinkElder();
        userLinkElder.setId(id);
        if (elderSex != null) {
            userLinkElder.setElderSex(elderSex);
        }
        if (ObjectUtils.isNotNull(elderAddress)) {
            userLinkElder.setElderAddress(elderAddress);
        }
        if (ObjectUtils.isNotNull(elderMobile)) {
            userLinkElder.setElderMobile(elderMobile);
        }
        if (ObjectUtils.isNotNull(elderName)) {
            userLinkElder.setElderName(elderName);
        }
        if (ObjectUtils.isNotNull(elderAge)) {
            userLinkElder.setElderAge(elderAge);
        }
        if (ObjectUtils.isNotNull(elderCardNo)) {
            userLinkElder.setElderCardNo(elderCardNo);
        }
        if (userLinkElderService.updateByPrimaryKeySelective(userLinkElder)) {
            result.markSuccess("更新服务老人信息成功", null);
        } else {
            result.markError("更新服务老人信息失败");
        }
        return result;
    }


}
