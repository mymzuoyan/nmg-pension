package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.gold.entity.GoldElderlySendMsg;
import com.fedtech.pension.gold.service.GoldElderlySendMsgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author DMJ
 * @date 2018/3/15
 */
@Controller
@RequestMapping("admin/api/sms/")
public class GoldElderlySendMsgApiController extends BaseController {

    @Reference(version ="1.0.0")
    private GoldElderlySendMsgService goldElderlySendMsgService;

    /**
     * 列表查询
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("elderMsgList")
    @ResponseBody
    public PageResponse<GoldElderlySendMsg> list(GoldElderlySendMsg filter, PageRequest pageRequest){

        return goldElderlySendMsgService.selectPageList(filter,pageRequest);
    }

    /**
     * 添加
     * @param goldElderlySendMsg
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public JsonResult insert(GoldElderlySendMsg goldElderlySendMsg,String luanchTime){
        JsonResult result = new JsonResult();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try{
             date = simpleDateFormat.parse(luanchTime);
        }catch (ParseException px){
            px.printStackTrace();
        }
        goldElderlySendMsg.setSendTime(date);
        goldElderlySendMsg.setResult(1);
        goldElderlySendMsg.setIsFlag(1);
        if(goldElderlySendMsgService.insert(goldElderlySendMsg)){
            result.markSuccess("添加成功", null);
        }else {
            result.markError("添加失败");
        }
        return result;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public JsonResult deleteSendMsg(Integer id){
        JsonResult result = new JsonResult();
        if(goldElderlySendMsgService.deleteByPrimaryKey(id)){
            result.markSuccess("删除成功", null);
        }else{
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 获取详情
     * @param id
     * @return
     */
    @RequestMapping("detail")
    @ResponseBody
    public GoldElderlySendMsg getDetail(Integer id){
        GoldElderlySendMsg goldElderlySendMsg = null;
        if(id != null){
            goldElderlySendMsg = goldElderlySendMsgService.selectByPrimaryKey(id);
        }
        return goldElderlySendMsg;
    }
}
