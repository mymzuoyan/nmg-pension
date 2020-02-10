package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Goods;
import com.fedtech.pension.portal.entity.GoodsType;
import com.fedtech.pension.portal.service.GoodsTypeService;
import com.fedtech.pension.portal.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/6
 */
@Controller
@RequestMapping("/admin/goods/")
public class GoodsController extends BaseController {


    @Reference(version = "1.0.0",cache = "lru")
    private GoodsService goodsService;

    @Reference(version = "1.0.0",cache = "lru")
    private GoodsTypeService goodsTypeService;

    public final String ADMIN_PREFIX = "/admin/portal/";


    /**
     * 商品类型列表
     *
     * @return
     */
    @RequestMapping("type/list")
    public String showClassList() {
        return ADMIN_PREFIX + "goods_type_list";
    }

    /**
     * 商品信息列表
     *
     * @return
     */
    @RequestMapping("/list")
    public String showModuleMes(Model model) {
        List<GoodsType> types = goodsTypeService.getAllRecode(null);
        model.addAttribute("types", types);
        return ADMIN_PREFIX + "goods_list";
    }

    /**
     * 发布
     *
     * @return
     */
    @RequestMapping("/add")
    public String showAddGoods(Model model) {
        List<GoodsType> types = goodsTypeService.getAllRecode(null);
        model.addAttribute("types", types);
        return ADMIN_PREFIX + "goods_add";
    }


    /**
     * 更新
     *
     * @param moduleMesId
     * @param model
     * @return
     */
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String showGoods(@PathVariable("id") int moduleMesId, Model model) {
        List<GoodsType> types = goodsTypeService.getAllRecode(null);
        Goods goods = goodsService.selectByPrimaryKey(moduleMesId);
        model.addAttribute("types", types);
        model.addAttribute("goods", goods);
        return ADMIN_PREFIX + "goods_info";
    }


}
