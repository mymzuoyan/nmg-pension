package com.fedtech.pension.controller.admin.lovebracelet;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author liun
 * @date 2018/3/17
 */
@Controller
@RequestMapping("/admin/loveBracelet/")
public class LoveBraceletController extends BaseController {

    /**
     * 手环对象信息
     *
     * @return
     */
    @RequestMapping("braceletObjectInfo")
    public String braceletObjectInfo() {
        return ADMIN_BRACELET_PREFIX + "bracelet_object_info";
    }


    /**
     * 智能手环视图
     *
     * @return
     */
    @RequestMapping("braceletView")
    public String braceletView() {
        return ADMIN_BRACELET_PREFIX + "bracelet_view";
    }


    /**
     * 智能手环视图列表
     *
     * @return
     */
    @RequestMapping("braceletViewList")
    public String braceletViewList() {
        return ADMIN_BRACELET_PREFIX + "bracelet_view_list";
    }

    /**
     * 智能警告信息
     *
     * @return
     */
    @RequestMapping("braceletWarningInfo")
    public String braceletWarningInfo() {
        return ADMIN_BRACELET_PREFIX + "bracelet_warning_info";
    }


    @RequestMapping("getCloseLocationById")
    public String getCloseLocationById(String braceletId,Model model) {
        model.addAttribute("braceletId",braceletId);
        return ADMIN_BRACELET_PREFIX + "bracelet_view_location";
    }

    @RequestMapping("listHistorByNumber")
    public String listHistorByNumber(String braceletNumber,Model model) {
        model.addAttribute("braceletNumber",braceletNumber);
        return ADMIN_BRACELET_PREFIX + "bracelet_view_listHistory";
    }
}
