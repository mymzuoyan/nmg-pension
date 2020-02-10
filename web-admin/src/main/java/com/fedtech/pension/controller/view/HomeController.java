package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.portal.entity.Goods;
import com.fedtech.pension.portal.entity.ModuleMes;
import com.fedtech.pension.portal.service.GoodsService;
import com.fedtech.pension.portal.service.ModuleMesService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.service.TaskService;
import com.fedtech.pension.task.service.UserLinkElderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Properties;

/**
 * @author CodingQiang
 * @date 2016/11/4
 */
@Controller
public class HomeController extends BaseController {

    @Reference(version = "1.0.0")
    private ModuleMesService moduleMesService;

    @Reference(version = "1.0.0")
    private GoodsService goodsService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private UserLinkElderService userLinkElderService;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @RequestMapping(value = {"/"})
    public String showLogin() {
        return VIEW_PREFIX + "home";
    }


    @RequestMapping(value = {"/home.html"})
    public String showHome() {
        return VIEW_PREFIX + "home";
    }

    @RequestMapping(value = {"/register.html"})
    public String showRegister() {
        return VIEW_PREFIX + "register";
    }


    public static Properties webViewcounts = new Properties();


    /**
     * 模块信息列表
     *
     * @return
     */
    @RequestMapping("/moduleMes/list/{id}")
    public String showModuleMesList(@PathVariable("id") int moduleId, Model model) {
        model.addAttribute("moduleId", moduleId);
        return VIEW_PREFIX + "moduleMes_list";
    }

    /**
     * 详情
     *
     * @param moduleMesId
     * @param model
     * @return
     */
    @RequestMapping(value = "/moduleMes/{id}", method = RequestMethod.GET)
    public String showModuleMes(@PathVariable("id") int moduleMesId, Model model) {
        ModuleMes moduleMes = moduleMesService.selectByPrimaryKey(moduleMesId);
        model.addAttribute("moduleMes", moduleMes);
        List<ModuleMes> topModuleMess = moduleMesService.selectTopOrLastN(moduleMesId, moduleMes.getModuleId(), 1, "top");
        if (ObjectUtils.isNotNull(topModuleMess)) {
            model.addAttribute("topModuleMes", topModuleMess.get(0));
        }
        List<ModuleMes> lastModuleMess = moduleMesService.selectTopOrLastN(moduleMesId, moduleMes.getModuleId(), 1, "last");
        if (ObjectUtils.isNotNull(lastModuleMess)) {
            model.addAttribute("lastModuleMes", lastModuleMess.get(0));
        }

        return VIEW_PREFIX + "moduleMes_info";
    }

    /**
     * 商品列表
     *
     * @return
     */
    @RequestMapping("/goods/list/{id}")
    public String showGoodsList(@PathVariable("id") int classId, Model model) {
        model.addAttribute("classId", classId);
        return VIEW_PREFIX + "goods_list";
    }


    /**
     * 详情
     *
     * @param classId
     * @param model
     * @return
     */
    @RequestMapping(value = "/goods/{id}", method = RequestMethod.GET)
    public String showGoods(@PathVariable("id") int classId, Model model) {
        Goods goods = goodsService.selectByPrimaryKey(classId);
        model.addAttribute("goods", goods);
        return VIEW_PREFIX + "goods_info";
    }


    /**
     * 组织地图
     *
     * @return
     */
    @RequestMapping("/serviceOrgMap.html")
    public String showServiceOrgMap() {
        return VIEW_PREFIX + "serviceOrg_map";
    }


    /**
     * 信箱
     *
     * @return
     */
    @RequestMapping("/letter/add")
    public String addLetter() {
        return VIEW_PREFIX + "letter_add";
    }


    /**
     * 组织评价
     *
     * @return
     */
    @RequestMapping("/serviceOrg/comment/{id}")
    public String comment(@PathVariable("id") int id, Model model) {
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(serviceOrg)) {
            model.addAttribute("serviceOrg", serviceOrg);
            return VIEW_PREFIX + "service_org_comment";
        }
        return "redirect:/home.html";
    }


    /**
     * 申请组织账户
     *
     * @return
     */
    @RequestMapping("/serviceOrg_apply")
    public String showServiceOrgApply() {
        return VIEW_PREFIX + "serviceOrg_apply";
    }


    /**
     * 忘记密码
     *
     * @return
     */
    @RequestMapping("/forgetPassword.html")
    public String forgetPassword() {
        return VIEW_PREFIX + "forget_password";
    }

    /**
     * 门户网站用户信息
     *
     * @return
     */
    @RequestMapping("/user/user_profile.html")
    public String showUserProfile(Model model) {
        if (ObjectUtils.isNotNull(currentUser())) {
            return VIEW_PREFIX + "user_profile";
        }
        return "redirect:/home.html";
    }

    /**
     * 添加关联老人
     *
     * @return
     */
    @RequestMapping("/user/add_linkElder.html")
    public String showAddLinkElder() {
        return VIEW_PREFIX + "add_linkElder";
    }

    /**
     * 添加关联老人
     *
     * @return
     */
    @RequestMapping("/user/update_linkElder.html/{id}")
    public String showUpdateLinkElder(@PathVariable Integer id, Model model) {
        UserLinkElder userLinkElder = userLinkElderService.selectByPrimaryKey(id);
        model.addAttribute(userLinkElder);
        return VIEW_PREFIX + "add_linkElder";
    }


    /**
     * 发布需求
     *
     * @return
     */
    @RequestMapping("/user/sendDemand.html")
    public String showSendADemand() {
        if (ObjectUtils.isNotNull(currentUser())) {
            return VIEW_PREFIX + "send_demand";
        }
        return "redirect:/home.html";
    }

    /**
     * 订单列表
     *
     * @return
     */
    @RequestMapping("/user/task_list.html")
    public String showTaskList() {
        if (ObjectUtils.isNotNull(currentUser())) {
            return VIEW_PREFIX + "user_task_list";
        }
        return "redirect:/home.html";
    }


    /**
     * 订单列表
     *
     * @return
     */
    @RequestMapping("/user/task_info.html/{id}")
    public String showTaskInfo(@PathVariable Integer id, Model model) {
        if (ObjectUtils.isNotNull(currentUser())) {
            Task task = taskService.selectByPrimaryKey(id);
            if (currentUser().getUid().equals(task.getCreatorId())) {
                model.addAttribute(task);
                return VIEW_PREFIX + "user_task_info";
            }
            return "redirect:/home.html";
        }
        return "redirect:/home.html";
    }

    /**
     * 显示消息页面
     *
     * @return
     */
    @RequestMapping("/user/user_message.html")
    public String showUserMessage() {
        if (ObjectUtils.isNotNull(currentUser())) {
            return VIEW_PREFIX + "user_message";
        }
        return "redirect:/home.html";
    }
    /**
     * 显示特困人员申请
     *
     * @return
     */
    @RequestMapping("/user/elderMsg_poor_apply.html")
    public String showElderMsgPoorApply() {
        if (ObjectUtils.isNotNull(currentUser())) {
            return VIEW_PREFIX + "elderMsg_poor_apply";
        }
        return "redirect:/home.html";
    }


}
