package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.task.entity.ElderlyWallet;
import com.fedtech.pension.task.service.ElderlyWalletService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author gengqiang
 * @date 2017/8/16
 */
@Controller
@RequestMapping("/admin/api/elderly/wallet/")
public class ElderlyWalletApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderlyWalletService elderlyWalletService;

    /**
     * 显示政府购买老人电子钱包列表
     *
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    @SystemControllerLog(description = "显示政府购买老人电子钱包列表")
    public PageResponse<ElderlyWallet> list(ElderlyWallet filter, PageRequest pageRequest) {
        return elderlyWalletService.selectPageList(filter, pageRequest);
    }

}
