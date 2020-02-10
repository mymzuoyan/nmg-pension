package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.entity.MessageReceive;
import com.fedtech.pension.sys.service.MessageReceiveService;
import com.fedtech.pension.sys.service.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

/**
 * @author Administrator
 * @date 2016/9/18
 */
@Controller
@RequestMapping("/admin/message/")
public class MessageController extends BaseController {

    @Reference(version = "1.0.0")
    private MessageService messageService;
    @Reference(version = "1.0.0")
    private MessageReceiveService messageReceiveService;

    protected Logger logger = LoggerFactory.getLogger(MessageController.class);

    public final String ADMIN_PREFIX = "/admin/sys/";


    /**
     * 发布公告
     *
     * @return
     */
    @RequestMapping("send")
    public String showSend() {
        return ADMIN_PREFIX + "message_send";
    }

    /**
     * 公告列表
     *
     * @return
     */
    @RequestMapping("list")
    public String showList() {
        return ADMIN_PREFIX + "message_list";
    }


    /**
     * 详情
     *
     * @param messageId
     * @param model
     * @return
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateTask(@PathVariable("id") Integer messageId, Model model) {
        Message message = messageService.selectByPrimaryKey(messageId);
        model.addAttribute("message", message);
        MessageReceive messageReceive = messageReceiveService.selectOneByUser(currentUser().getUid(), messageId);
        if (messageReceive != null) {
            if (messageReceive.getRead() == 0) {
                messageReceive.setRead(1);
                messageReceive.setReadTime(new Date());
                messageReceiveService.updateByPrimaryKeySelective(messageReceive);
            }
        } else {
            messageReceive = new MessageReceive();
            messageReceive.setMessageId(messageId);
            messageReceive.setReceiverId(currentUser().getUid());
            messageReceive.setReadTime(new Date());
            messageReceive.setRead(1);
            messageReceiveService.insert(messageReceive);
        }
        return ADMIN_PREFIX + "message_info";
    }


}
