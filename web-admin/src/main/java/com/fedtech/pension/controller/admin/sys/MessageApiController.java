package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.quantity.MessageQuantity;
import com.fedtech.pension.sys.service.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/1/20
 */
@Controller
@RequestMapping("/admin/api/message/")
public class MessageApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(MessageApiController.class);

    @Reference(version = "1.0.0")
    private MessageService messageService;


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


    /**
     * 发布公告
     *
     * @param message
     * @return
     */
    @RequestMapping("send")
    @ResponseBody
    @SystemControllerLog(description = "发布公告")
    public JsonResult addModuleMes(Message message) {
        JsonResult result = new JsonResult();
        message.setCreateTime(new Date());
        message.setCreatorId(currentUser().getUid());
        if (messageService.insert(message, currentUser().getUid())) {
            result.markSuccess("发布成功", null);
        } else {
            result.markError("发布失败");
        }
        return result;
    }


    /**
     * 删除公告
     *
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    @SystemControllerLog(description = "删除公告")
    public JsonResult deleteModulesMes(Integer id) {
        JsonResult result = new JsonResult();
        if (messageService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 获取未读公告
     *
     * @return
     */
    @RequestMapping("getUnReadMessage")
    @ResponseBody
    public List<Message> getUnReadMessage(Message message) {
        message.setReceiveId(currentUser().getUid());
        message.setRead(0);
        message.setType(MessageQuantity.APPNOTICE);
        PageResponse<Message> dataTable = messageService.selectPageList(message, new PageRequest());
        return dataTable.getData();
    }
}
