package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.task.entity.ElderlyWallet;
import com.fedtech.pension.task.service.ElderlyWalletService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 * @date 2017/8/16
 */
@Controller
@RequestMapping("/admin/elderly/wallet/")
public class ElderlyWalletController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/elderly/";

    @Reference(version ="1.0.0")
    private ElderlyWalletService elderlyWalletService;

    /**
     * 显示政府购买老人电子钱包列表
     *
     * @return
     */
    @RequestMapping("list")
    public String showList() {
        return ADMIN_PREFIX + "elderly_wallet_list";
    }


    /***
     * 电子钱包详情页
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("infoList/{id}")
    public String showInfoList(@PathVariable Integer id, Model model){
        //把这条记录的老人身份证带到详情页
        ElderlyWallet idcardno =elderlyWalletService.selectByPrimaryKey(id);
        model.addAttribute("elderlyWallet",idcardno);
        return ADMIN_PREFIX + "elderly_wallet_infoList";
    }
}
