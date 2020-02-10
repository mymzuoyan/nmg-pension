package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Advertisement;
import com.fedtech.pension.portal.service.AdvertisementService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Administrator
 * @date 2016/12/15
 */
@Controller
@RequestMapping("/admin/advertisement/")
public class AdvertisementController extends BaseController {

    @Reference(version = "1.0.0",cache = "lru")
    private AdvertisementService advertisementService;

    public final String ADMIN_PREFIX = "/admin/portal/";


    /**
     * 显示添加广告页面
     *
     * @return
     */
    @RequestMapping("/add")
    public String showAdd() {
        return ADMIN_PREFIX + "advertisement_add";
    }

    /**
     * 显示广告列表页面
     *
     * @return
     */
    @RequestMapping("/list")
    public String showList() {
        return ADMIN_PREFIX + "advertisement_list";
    }

    /**
     * 显示广告列表页面
     *
     * @return
     */
    @RequestMapping("/info/{id}")
    public String showInfo(@PathVariable("id") int adId, Model model) {
        Advertisement advertisement = advertisementService.selectByPrimaryKey(adId);
        model.addAttribute("advertisement", advertisement);
        return ADMIN_PREFIX + "advertisement_info";
    }


}
