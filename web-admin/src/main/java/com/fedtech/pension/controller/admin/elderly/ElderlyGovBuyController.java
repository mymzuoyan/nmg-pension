package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApply;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApplyDoc;
import com.fedtech.pension.elderly.service.ElderlyGovBuyService;
import com.fedtech.pension.elderly.service.ElderlyGovbuyApplyDocService;
import com.fedtech.pension.elderly.service.ElderlyGovbuyApplyService;
import com.fedtech.pension.sys.service.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author gengqiang
 * @date 2017/7/24
 */
@Controller
@RequestMapping("/admin/elderly/govbuy/")
public class ElderlyGovBuyController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderlyGovBuyService elderlyGovBuyService;

    @Reference(version = "1.0.0")
    private ElderlyGovbuyApplyService elderlyGovbuyApplyService;

    @Reference(version = "1.0.0")
    private ElderlyGovbuyApplyDocService elderlyGovbuyApplyDocService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    public final String ADMIN_PREFIX = "/admin/elderly/";


    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");


    /**
     * 显示政府购买信息
     *
     * @return
     */
    @RequestMapping("list")
    public String showGovBuyInfo() {
        return ADMIN_PREFIX + "elderly_govbuy_list";
    }


    /**
     * 添加政府购买老人
     *
     * @return
     */
    @RequestMapping("add")
    public String showAddGovBuyInfo(Model model) {
        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        return ADMIN_PREFIX + "elderly_govbuy_add";
    }

    /**
     * 显示政府购买信息
     *
     * @return
     */
    @RequestMapping("detail/{id}")
    public String showGovBuyInfo_Detail(@PathVariable("id") Integer id, Model model) {
        ElderlyGovBuy elderlyGovBuy = elderlyGovBuyService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(elderlyGovBuy)) {
            model.addAttribute("elderlyGovBuy", elderlyGovBuy);
        }
        return ADMIN_PREFIX + "elderly_govbuy_detail";
    }


    /**
     * 申请政府购买服务
     *
     * @return
     */
    @RequestMapping("apply")
    public String showGovBuyApply(Model model) {
        if (getCurrentUser().hasRole(RoleType.StAdmin.getValue()) || currentUser().getLogin_name().equals("njytyl") || currentUser().getLogin_name().equals("njytcl") || currentUser().getLogin_name().equals("njxwmz")) {
            String number = "";
            try {
                number = elderlyGovbuyApplyService.createApplyPreNumber(currentUser().getAreaId());
            } catch (Exception e) {
                return "unauthorized";
            }
            String lastNum = elderlyGovbuyApplyService.findByLastNumber(number);
            if (ObjectUtils.isNotNull(lastNum)) {
                String a = lastNum.substring(2);
                number = "NJ" + (Integer.parseInt(a) + 1);
            } else {
                number += "1000001";
            }
            model.addAttribute("number", number);
            return ADMIN_PREFIX + "elderly_govbuy_apply";
        }
        return "unauthorized";
    }

    /**
     * 展示政府购买服务待办申请列表
     *
     * @return
     */
    @RequestMapping("handle/list")
    public String showGovBuyNeedHandleList() {
        return ADMIN_PREFIX + "elderly_govbuy_handle_list";
    }


    /**
     * 展示政府购买服务列表（已通过）
     *
     * @return
     */
    @RequestMapping("apply/list")
    public String showGovBuyList() {
        return ADMIN_PREFIX + "elderly_govbuy_apply_list";
    }


    /**
     * 展示政府购买服务申请内容
     *
     * @return
     */
    @RequestMapping("apply/info/{id}")
    public String showGovBuyApplyInfo(@PathVariable Integer id, Model model) {
        ElderlyGovbuyApply apply = elderlyGovbuyApplyService.selectByPrimaryKey(id);
        model.addAttribute("apply", apply);
        return ADMIN_PREFIX + "elderly_govbuy_apply_info";
    }


    /**
     * 展示文书页面
     *
     * @param applyId
     * @param model
     * @return
     */
    @RequestMapping("apply/doc")
    public String showGovBuyApplyDoc(Integer applyId, Integer via, Model model) {
        ElderlyGovbuyApply apply = elderlyGovbuyApplyService.selectByPrimaryKey(applyId);
        if (currentUser().getAreaName().contains(apply.getRegion1())) {
            model.addAttribute("apply", apply);
            model.addAttribute("accept_person", currentUser().getNick_name());
            model.addAttribute("accept_date", df.format(new Date()));
            model.addAttribute("accept_phone", currentUser().getMobile());
            Integer type = 0;
            Integer nextStatus = 0;
            switch (apply.getStatus()) {
                case 0:
                    if (via == 1) {
                        type = 0;//受理通知书 -->1
                        nextStatus = 1;
                    } else {
                        type = 1;//不予受理通知书 --->2
                        nextStatus = 2;
                    }
                    break;
                case 1:
                    if (via == 1) {
                        type = 3;//初审结果通知书 ---->3
                        nextStatus = 3;
                    } else {
                        type = 2;//补正通知书 ---->4
                        nextStatus = 4;
                    }
                    break;
                case 3:
                    if (via == 1) {
                        type = 4;//评估任务通知书 ---->5
                        nextStatus = 5;
                    } else {
                        type = 5;//不予批准通知书 ---->6
                        nextStatus = 6;
                    }
                    break;
                case 4:
                    if (via == 1) {
                        type = 0;//受理通知书 ----->1
                        nextStatus = 1;
                    } else {
                        type = 1;//不予受理通知书----->2
                        nextStatus = 2;
                    }
                    break;
                case 5:
                    if (via == 1) {
                        type = 6;//评估报告  ---->7
                        nextStatus = 7;
                    }
                    break;
                case 7:
                    if (via == 1) {
                        type = 7;//公示通知----->8
                        nextStatus = 8;
                    } else {
                        type = 8;//不予批准通知书----->9
                        nextStatus = 9;
                    }
                    break;

                case 8:
                    if (via == 1) {
                        type = 9;//公示结果反馈----->10
                        nextStatus = 10;
                    }
                    break;
                case 10:
                    if (via == 1) {
                        type = 13;//政府购买居家养老服务通知书----->11
                        nextStatus = 11;
                    } else if (via == 2) {
                        type = 10;//复审通知书----->12
                        nextStatus = 12;
                    } else {
                        type = 12;//复检评估任务通知书----->5
                        nextStatus = 5;
                    }
                    break;
                case 12:
                    if (via == 1) {
                        type = 11;//复审结果通知书----->7
                        nextStatus = 14;
                    }
                    break;
                case 14:
                    if (via == 1) {
                        type = 7;//公示通知----->8
                        nextStatus = 8;
                    } else {
                        type = 8;//不予批准通知书----->9
                        nextStatus = 9;
                    }
                    break;

            }
            model.addAttribute("type", type);
            model.addAttribute("nextStatus", nextStatus);

            return ADMIN_PREFIX + "elderly_govbuy_apply_doc";
        } else {
            return "unauthorized";
        }

    }


    /**
     * 展示文书页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("apply/doc/info/{id}")
    public String showGovBuyApplyDocInfo(@PathVariable Integer id, Model model) {
        ElderlyGovbuyApplyDoc doc = elderlyGovbuyApplyDocService.selectByPrimaryKey(id);
        model.addAttribute("doc", doc);
        return ADMIN_PREFIX + "elderly_govbuy_apply_doc_info";

    }

}
