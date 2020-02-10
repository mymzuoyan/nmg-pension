package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.SysRole;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.service.SysRoleService;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * @author DELL
 * @date 2016/9/8
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController {

    @Reference(version = "1.0.0")
    public UserService userService;
    @Reference(version = "1.0.0")
    public SysRoleService roleService;
//    @Autowired
//    private MonitorService monitorService;
//
//    @Autowired
//    private UserFuwuService userFuwuService;

    @RequestMapping(value = "index/{index}")
    public String showProfile(@PathVariable("index") Integer index, Model model) {
        List<UserRole> userRoles = roleService.getUserRolesByUserId(currentUser().getUid());
        if (userRoles.size() > 0) {
            SysRole sysRole = roleService.selectByPrimaryKey(userRoles.get(0).getRoleId());
            model.addAttribute("userRole", sysRole);
        }
//        Monitor monitor = monitorService.selectByUserId(currentUser().getUid());
//        if (ObjectUtils.isNotNull(monitor))
//            model.addAttribute("monitor", monitor);
//        if (index > 3)
//            index = 1;
        model.addAttribute(index);
        return ADMIN_PREFIX + "/sys/admin_profile";
    }


    @RequestMapping(value = {"/list"})
    public String showUserList() {
        return ADMIN_PREFIX + "/sys/user_list";
    }


    @RequestMapping(value = {"/onlineList"})
    public String showUserOnlineList() {
        return ADMIN_PREFIX + "/sys/user_online_list";
    }

    @RequestMapping(value = {"/add"})
    public String showAddUser(Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        List<SysRole> sysRoles = new ArrayList<>();
        User user = userService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("user", user);
        return ADMIN_PREFIX + "/sys/user_add";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userId, Model model) {
        User user = userService.selectByPrimaryKey(userId);

        List<UserRole> userRoles = roleService.getUserRolesByUserId(user.getUid());

        if (userRoles.size() > 0) {
            SysRole sysRole = roleService.selectByPrimaryKey(userRoles.get(0).getRoleId());
            model.addAttribute("userRole", sysRole);
        }
        model.addAttribute("user", user);
        return ADMIN_PREFIX + "/sys/user_info";
    }

}
