package com.fedtech.pension.controller.admin.nurse;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 * @date 2017/8/21
 */
@Controller
@RequestMapping("/admin/nurse/")
public class NurseController extends BaseController {

    /**
     * 显示看护地图
     *
     * @return
     */
    @RequestMapping("map")
    public String showMap() {
        return ADMIN_NURSE_PREFIX + "nurse_map";
    }


    /**
     * 显示看护列表
     *
     * @return
     */
    @RequestMapping("alarm/list")
    public String showAlarmList() {
        return ADMIN_NURSE_PREFIX + "nurse_alarm_list";
    }
}
