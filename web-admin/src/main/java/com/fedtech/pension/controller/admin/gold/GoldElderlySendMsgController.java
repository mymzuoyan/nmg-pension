package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.gold.service.GoldElderlySendMsgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author DMJ
 * @date 2019/3/15
 */
@Controller
@RequestMapping("admin/gold/sendMessage/")
public class GoldElderlySendMsgController extends BaseController {

    @Reference(version = "1.0.0")
    private GoldElderlySendMsgService goldElderlySendMsgService;

    public final String ADMIN_GOLD_PREFIX ="/admin/gold/";

    @RequestMapping("list")
    public String showGoldElderlylist(){

        return ADMIN_GOLD_PREFIX+"gold_elderMsg_sms_list";
    }
}
