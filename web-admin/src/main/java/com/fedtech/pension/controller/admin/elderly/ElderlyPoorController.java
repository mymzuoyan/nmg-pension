package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyPoorApply;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.elderly.service.ElderlyPoorApplyService;
import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Set;

/**
 * @author gengqiang
 * @date 2017/8/16
 */
@Controller
@RequestMapping("/admin/elderly/poor/")
public class ElderlyPoorController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderlyPoorApplyService elderlyPoorApplyService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Autowired
    private RedisAreaUtil redisAreaUtil;

    public final String ADMIN_PREFIX = "/admin/elderly/";


    /**
     * 申请特困人员
     *
     * @return
     */
    @RequestMapping("apply")
    public String showGovBuyApply(Model model) {
        /*if (getCurrentUser().hasRole(RoleType.StAdmin.getValue()) || getCurrentUser().hasRole(RoleType.CoAdmin.getValue()) || currentUser().getLogin_name().equals("njytyl") || currentUser().getLogin_name().equals("njytcl") || currentUser().getLogin_name().equals("njxwmz")) {
            return ADMIN_PREFIX + "elderly_poor_apply";
        }
        return "unauthorized";*/
        return ADMIN_PREFIX + "elderly_poor_apply";
    }

    /**
     * 展示特困人员待办申请列表
     *
     * @return
     */
    @RequestMapping("handle/list")
    public String showPoorNeedHandleList() {
        return ADMIN_PREFIX + "elderly_poor_handle_list";
    }


    /**
     * 展示特困人员列表
     *
     * @return
     */
    @RequestMapping("list")
    public String showPoorList(@RequestParam(value = "result", required = false) Integer result,
                               @RequestParam(value = "region1", required = false) String region1,
                               @RequestParam(value = "region2", required = false) String region2,
                               @RequestParam(value = "region3", required = false) String region3,
                               Model model) {
        if (result != null) {
            model.addAttribute("result", result);
        }
        if (ObjectUtils.isNotNull(region1)) {
            model.addAttribute("region1", region1);
        }
        if (ObjectUtils.isNotNull(region2)) {
            model.addAttribute("region2", region2);
        }
        if (ObjectUtils.isNotNull(region3)) {
            model.addAttribute("region3", region3);
        }
        return ADMIN_PREFIX + "elderly_poor_apply_list";
    }


    /**
     * 展示特困人员申请内容
     *
     * @return
     */
    @RequestMapping("apply/info/{id}")
    public String showGovBuyApplyInfo(@PathVariable Integer id, Model model) {
        ElderlyPoorApply apply = elderlyPoorApplyService.selectByPrimaryKey(id);
        model.addAttribute("apply", apply);
        if (apply.getStatus() == 0) {
            //判断身份证和姓名是否匹配
            String name = elderlyMsgService.findNameByIdcardno(apply.getIdcardno());
            if (ObjectUtils.isNotNull(name)) {
                if (!name.equals(apply.getName())) {
                    model.addAttribute("nameError", "身份证与姓名可能不符，请注意检查。");
                }
            }
        }
        return ADMIN_PREFIX + "elderly_poor_apply_info";
    }

    /**
     * 显示数据统计
     *
     * @return
     */
    @RequestMapping("statistics")
    public String showStatistics(@RequestParam(value = "startYear", required = false, defaultValue = "0") Integer startYear,
                                 @RequestParam(value = "endYear", required = false, defaultValue = "0") Integer endYear,
                                 @RequestParam(value = "areaName", required = false, defaultValue = "0") String areaName, Model model) {
        if (startYear == 0) {
            startYear = Calendar.getInstance().get(Calendar.YEAR);
        }
        if (endYear == 0) {
            endYear = Calendar.getInstance().get(Calendar.YEAR);
        }
        model.addAttribute("startYear", startYear);
        model.addAttribute("endYear", endYear);
        if ("0".equals(areaName)) {
            areaName = currentUser().getAreaName();
            if (areaName.contains(",")) {
                areaName = areaName.substring(areaName.lastIndexOf(",") + 1);
            }
            Area area = (Area) redisAreaUtil.getArea(currentUser().getAreaId());
            model.addAttribute("areaId", currentUser().getAreaId());
            model.addAttribute("level", area.getLevel());
        } else {
            HashMap<Integer, Area> hash = redisAreaUtil.getHasMap();
            Set<Integer> ids = hash.keySet();
            for (Integer id : ids) {
                Area area = (Area) hash.get(id);
                if (area.getName().equals(areaName)) {
                    model.addAttribute("areaId", id);
                    model.addAttribute("level", area.getLevel());
                    break;
                }
            }
        }
        model.addAttribute("areaName", areaName);
        return ADMIN_PREFIX + "elderly_poor_apply_statistics";
    }

    /**
     * 显示证书
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("apply/certificate/{id}")
    public String showCertificate(@PathVariable Integer id, Model model) {
        ElderlyPoorApply apply = elderlyPoorApplyService.selectByPrimaryKey(id);
        model.addAttribute("apply", apply);
        //显示年审记录
        return ADMIN_PREFIX + "elderly_poor_apply_certificate";
    }

    /**
     * 年审列表
     *
     * @return
     */
    @RequestMapping("verification/list")
    public String showVerificationList() {
        return ADMIN_PREFIX + "elderly_poor_verification_list";
    }


    /**
     * 年审列表
     *
     * @return
     */
    @RequestMapping("verification/{id}/{applyId}")
    public String showVerification(@PathVariable Integer id, @PathVariable Integer applyId, Model model) {
        ElderlyPoorApply apply = elderlyPoorApplyService.selectByPrimaryKey(applyId);
        model.addAttribute("apply", apply);
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "elderly_poor_verification_info";
    }
}
