package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

/**
 * 服务人员
 * @author gengqiang
 * @date 2018/1/3
 */
@Controller
@RequestMapping("/admin/user/")
public class UserFuWuController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/serviceSource/";

    @Reference(version = "1.0.0")
    public UserService userService;

    @Reference(version = "1.0.0")
    public UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private UserFuWuTrainService userFuWuTrainService;

    @Reference(version = "1.0.0")
    private UserFuWuCertificateService userFuWuCertificateService;

    @Reference(version = "1.0.0")
    private UserFuWuPrizeService userFuWuPrizeService;

    @Reference(version = "1.0.0")
    private UserFuWuQuitService userFuWuQuitService;

    @RequestMapping("/worker/list")
    public String showWorkerList() {
        return ADMIN_PREFIX + "worker_list";

    }

    /**
     *  从业人员信息页
     * @param model
     * @param serviceOrgType (1.组织、2.机构)
     * @return
     */
    @RequestMapping("/fuwu/list")
    public String showUserFuwu(Model model, @RequestParam(value = "serviceOrgType", required = false) Integer serviceOrgType) {
        User user = userService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("user", user);
        if (ObjectUtils.isNotNull(serviceOrgType)) {
            model.addAttribute("serviceOrgType", serviceOrgType);
        }
        return ADMIN_PREFIX + "userfuwu_list";
    }

    /**
     *  从业人员证书信息
     * @return
     */
    @RequestMapping("/fuwu/certificateList")
    public String showCertificateList(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_certificate_list";
    }

    /**
     *  从业人员培训信息
     * @return
     */
    @RequestMapping("/fuwu/trainList")
    public String showTrainList(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_train_list";
    }

    /**
     *  从业人员获奖信息
     * @return
     */
    @RequestMapping("/fuwu/prizeList")
    public String showPrizeList(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_prize_list";
    }

    /**
     *  从业人员离职信息
     * @return
     */
    @RequestMapping("/fuwu/quitList")
    public String showQuitList(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_quit_list";
    }

    /**
     * 从业人员证书信息新增
     *
     * @return
     */
    @RequestMapping("/fuwu/certificateAdd")
    public String certificateAdd(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_certificate_add";
    }

    /**
     * 从业人员培训信息新增
     *
     * @return
     */
    @RequestMapping("/fuwu/trainAdd")
    public String trainAdd(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_train_add";
    }

    /**
     * 从业人员获奖信息新增
     *
     * @return
     */
    @RequestMapping("/fuwu/prizeAdd")
    public String prizeAdd(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_prize_add";
    }

    /**
     * 从业人员离职信息新增
     *
     * @return
     */
    @RequestMapping("/fuwu/quitAdd")
    public String quitAdd(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "userfuwu_quit_add";
    }

    /**
     * 从业人员证书信息详情
     *
     * @return
     */
    @RequestMapping("/fuwu/certificateDetail")
    public String certificateDetail(Model model, UserFuWuCertificate userFuWuCertificate) {
        userFuWuCertificate=userFuWuCertificateService.selectByPrimaryKey(userFuWuCertificate.getId());
        model.addAttribute("userFuWuCertificate",userFuWuCertificate);
        return ADMIN_PREFIX + "userfuwu_certificate_detail";
    }

    /**
     * 从业人员培训信息详情
     *
     * @return
     */
    @RequestMapping("/fuwu/trainDetail")
    public String trainDetail(Model model, UserFuWuTrain userFuWuTrain) {
        userFuWuTrain=userFuWuTrainService.selectByPrimaryKey(userFuWuTrain.getId());
        model.addAttribute("userFuWuTrain",userFuWuTrain);
        return ADMIN_PREFIX + "userfuwu_train_detail";
    }

    /**
     * 从业人员获奖信息详情
     *
     * @return
     */
    @RequestMapping("/fuwu/prizeDetail")
    public String prizeDetail(Model model, UserFuWuPrize userFuWuPrize) {
        userFuWuPrize=userFuWuPrizeService.selectByPrimaryKey(userFuWuPrize.getId());
        model.addAttribute("userFuWuPrize",userFuWuPrize);
        return ADMIN_PREFIX + "userfuwu_prize_detail";
    }

    /**
     * 从业人员离职信息详情
     *
     * @return
     */
    @RequestMapping("/fuwu/quitDetail")
    public String quitDetail(Model model, UserFuWuQuit userFuWuQuit) {
        userFuWuQuit=userFuWuQuitService.selectByPrimaryKey(userFuWuQuit.getId());
        model.addAttribute("userFuWuQuit",userFuWuQuit);
        return ADMIN_PREFIX + "userfuwu_quit_detail";
    }

    @RequestMapping("/fuwu/recordList")
    public String recordView() {
        return ADMIN_PREFIX + "userfuwu_record_list";
    }


    @RequestMapping("/fuwu/feedbackList")
    public String showFeedbackList(Model model, @RequestParam(value = "serviceOrgType", required = false) Integer serviceOrgType) {
        User user = userService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("user", user);
        if (ObjectUtils.isNotNull(serviceOrgType)) {
            model.addAttribute("serviceOrgType", serviceOrgType);
        }
        return ADMIN_PREFIX + "feedback_list";
    }

    @RequestMapping("/fuwu/add")
    public String addUserFuwu(Model model, @RequestParam("type") Integer type, @RequestParam(value = "serviceOrgType", required = false) Integer serviceOrgType) {
        User user = userService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("user", user);
        model.addAttribute("type", type);
        if (ObjectUtils.isNotNull(serviceOrgType)) {
            model.addAttribute("serviceOrgType", serviceOrgType);
        }
        return ADMIN_PREFIX + "userfuwu_add";
    }

    @RequestMapping("/fuwu/info/{id}")
    public String infoUserFuwu(@PathVariable("id") Integer id, Model model) {
        UserFuWu userFuWu = userFuwuService.selectByPrimaryKey(id);

        model.addAttribute("userFuWu", userFuWu);
        return ADMIN_PREFIX + "userfuwu_info";
    }

    @RequestMapping("/fuwu/record/{id}")
    public String recordUserFuwu(@PathVariable("id") Integer id, Model model) {
        UserFuWu userFuWu = userFuwuService.selectByPrimaryKey(id);

        model.addAttribute("userFuWu", userFuWu);
        return ADMIN_PREFIX + "userfuwu_record";
    }


}
