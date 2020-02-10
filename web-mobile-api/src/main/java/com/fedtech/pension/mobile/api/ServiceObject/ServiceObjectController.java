package com.fedtech.pension.mobile.api.ServiceObject;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.FileUtil;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.service.UserRoleService;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;

/**
 * @author CoderQiang
 * @date 2017/2/4
 */
@Controller
@RequestMapping("/api/serviceObject/")
public class ServiceObjectController {

    SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    private String SAVEURL_serviceObject = "/file/app/serviceObject/";

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    /**
     * 注册
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    public AppResult register(User user) {
        AppResult result = new AppResult();

        if (StringUtils.isEmpty(user.getLogin_name())) {
            result.markError("账号为空");
            return result;
        }

        //判断是否存在账号
        if (ObjectUtils.isNotNull(userService.selectByLoginName(user.getLogin_name()))) {
            result.markError("账号已存在");
            return result;
        }
        user.setCreate_time(System.currentTimeMillis());
        user = userService.insertBackId(user);
        if (ObjectUtils.isNotNull(user.getUid())) {
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getUid());
            userRole.setRoleId(RoleType.ServiceObject.getId());
            if (userRoleService.insert(userRole)) {
                result.markSuccess("注册成功", null);
            } else {
                result.markError("注册失败");
            }
        } else {
            result.markError("注册失败");
        }
        return result;
    }


    /**
     * 上传文件
     *
     * @param request
     * @param file
     * @param id
     * @return
     */
    @RequestMapping(value = "fileUpload", method = RequestMethod.POST)
    @ResponseBody
    public AppResult fileUpload(HttpServletRequest request,
                                MultipartFile file,
                                @RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        JsonResult jr = new JsonResult();
        if (!StringUtils.isEmpty(id)) {
            FileUtil util = new FileUtil();
            if (!file.isEmpty()) {
                jr = util.saveFile(request, file, SAVEURL_serviceObject + id + "/");
            }
        }
        result.markSuccess("文件上传成功", jr.getData());
        return result;
    }


}
