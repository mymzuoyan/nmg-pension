package com.fedtech.pension.controller.admin.sys;

import com.fedtech.pension.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Administrator
 * @date 2016/9/18
 */
@Controller
@RequestMapping("/admin/message/receive")
public class MessageReceiveController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(MessageReceiveController.class);

    public final String ADMIN_PREFIX = "/admin/sys/";

    /**
     * 公告列表
     *
     * @return
     */
    @RequestMapping("list")
    public String showList() {
        return ADMIN_PREFIX + "message_receive_list";
    }

}
