package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.entity.MessageReceive;
import com.fedtech.pension.sys.quantity.MessageQuantity;
import com.fedtech.pension.sys.service.MessageReceiveService;
import com.fedtech.pension.sys.service.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author CoderQiang
 * @date 2017/1/20
 */
@Controller
@RequestMapping("/admin/api/message/receive/")
public class MessageReceiveApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(MessageReceiveApiController.class);

    @Reference(version = "1.0.0")
    private MessageService messageService;

    @Reference(version = "1.0.0")
    private MessageReceiveService messageReceiveService;

    /**
     * 查看公告列表
     *
     * @param message
     * @param pageRequest
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    @SystemControllerLog(description = "查看公告列表")
    public PageResponse<Message> messageList(Message message, PageRequest pageRequest) {
        message.setReceiveId(currentUser().getUid());
        message.setType(MessageQuantity.APPNOTICE);
        PageResponse<Message> dataTable = messageService.selectPageList(message, pageRequest);
        return dataTable;
    }

    @RequestMapping("/update")
    @ResponseBody
    @SystemControllerLog(description = "更新已读状态")
    public JsonResult updateMessageReceive(MessageReceive messageReceive) {
        JsonResult result = new JsonResult();
        messageReceive.setRead(1);
        messageReceive.setReceiverId(currentUser().getUid());
        messageReceive.setReadTime(new Date());
        messageReceiveService.updateByMessageIdAndReceiverId(messageReceive);
        result.markSuccess("更新成功", null);
        return result;
    }
}

