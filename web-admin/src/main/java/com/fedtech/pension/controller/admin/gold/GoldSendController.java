package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author csn
 * @date 2018/1/11
 */
@Controller
@RequestMapping("admin/gold/goldSend/")
public class GoldSendController extends BaseController {
    public final String ADMIN_GOLD_PREFIX ="/admin/gold/";

    @Reference(version ="1.0.0")
    private AreaService areaService;

    @RequestMapping("goldNotice")
    public String goldNoticeList(){

        return ADMIN_GOLD_PREFIX+"gold_send_noticeList";
    }

    @RequestMapping("list")
    public String goldSendlist(){

        return ADMIN_GOLD_PREFIX+"gold_send_list";
    }

    /**补发*/
    @RequestMapping("goldReissue")
    public String goldReissue(){

        return ADMIN_GOLD_PREFIX+"gold_send_goldReissue";
    }

    @RequestMapping("goldReissueList")
    public String goldReissueList(){

        return ADMIN_GOLD_PREFIX+"gold_send_goldReissueList";
    }

    @RequestMapping("goldSendBankReissueList")
    public String goldBankReissueList(){

        return ADMIN_GOLD_PREFIX+"gold_send_bank_reissue_list";
    }

    @RequestMapping("goldSendBankList")
    public String goldBankList(){

        return ADMIN_GOLD_PREFIX+"gold_send_bank_list";
    }

    @RequestMapping("goldFafangStatistic")
    public String goldFafangStatistic(Model model, @RequestParam(value = "areaName", required = false, defaultValue = "") String areaName) {
        boolean flag = false;

        if (!StringUtils.isEmpty(areaName)) {
            Area area = areaService.getAreaByNameFromCache(areaName);
            model.addAttribute("areaId", area.getId());
            if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue()) || getCurrentUser().hasRole(RoleType.MuAdmin.getValue())) {
                if (area.getLevel() == 1) {
                    flag = true;
                }
            }
        } else {
            model.addAttribute("areaId", currentUser().getAreaId());
            if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue()) || getCurrentUser().hasRole(RoleType.MuAdmin.getValue())) {
                flag = true;
            }
        }
        model.addAttribute("flag", flag);

        return ADMIN_GOLD_PREFIX + "gold_send_fafangStatistic";
    }

    @RequestMapping("goldBufaStatistic")
    public String goldBufaStatistic(Model model, @RequestParam(value = "areaName", required = false, defaultValue = "") String areaName) {
        boolean flag = false;

        if (!StringUtils.isEmpty(areaName)) {
            Area area = areaService.getAreaByNameFromCache(areaName);
            model.addAttribute("areaId", area.getId());
            if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue()) || getCurrentUser().hasRole(RoleType.MuAdmin.getValue())) {
                if (area.getLevel() == 1) {
                    flag = true;
                }
            }
        } else {
            model.addAttribute("areaId", currentUser().getAreaId());
            if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue()) || getCurrentUser().hasRole(RoleType.MuAdmin.getValue())) {
                flag = true;
            }
        }
        model.addAttribute("flag", flag);

        return ADMIN_GOLD_PREFIX + "gold_send_bufaStatistic";
    }
}
