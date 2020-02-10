package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.FileUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Goods;
import com.fedtech.pension.portal.entity.GoodsType;
import com.fedtech.pension.portal.service.GoodsTypeService;
import com.fedtech.pension.portal.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author gengqiang
 * @date 2017/7/6
 */
@Controller
@RequestMapping("/admin/api/goods/")
public class GoodsApiController extends BaseController {

    @Reference(version = "1.0.0")
    private GoodsTypeService goodsTypeService;

    @Reference(version = "1.0.0")
    private GoodsService goodsService;

    /**
     * 商品类型列表接口
     *
     * @param goodsType
     * @param pageRequest
     * @return
     */
    @RequestMapping("/type/list")
    @ResponseBody
    @SystemControllerLog(description = "查看商品类型列表")
    public PageResponse<GoodsType> goodsTypeList(GoodsType goodsType, PageRequest pageRequest) {
        PageResponse<GoodsType> dataTable = goodsTypeService.selectPageList(goodsType, pageRequest);
        return dataTable;
    }

    /**
     * 添加商品类型接口
     *
     * @param goodsType
     * @return
     */
    @RequestMapping("/type/add")
    @ResponseBody
    @SystemControllerLog(description = "添加商品类型")
    public JsonResult addGoodsType(GoodsType goodsType, String attr) {
        JsonResult result = new JsonResult();
        if (goodsTypeService.insertTypeAttr(goodsType, attr)) {
            result.markSuccess("保存成功", null);
        } else {
            result.markError("保存失败");
        }
        return result;
    }


    /**
     * 更新商品类型
     *
     * @param goodsType
     * @return
     */
    @RequestMapping("/type/update")
    @ResponseBody
    @SystemControllerLog(description = "更新商品类型")
    public JsonResult updateGoodsType(GoodsType goodsType, String attr) {
        JsonResult result = new JsonResult();
        if (goodsTypeService.updateTypeAttr(goodsType, attr)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 删除商品类型
     *
     * @param goodsTypeId
     * @return
     */
    @RequestMapping("/type/delete")
    @ResponseBody
    @SystemControllerLog(description = "删除商品类型")
    public JsonResult deleteGoodsType(Integer goodsTypeId) {
        JsonResult result = new JsonResult();
        if (goodsTypeService.deleteByPrimaryKey(goodsTypeId)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


    /**
     * 查看商品列表
     *
     * @param goods
     * @param pageRequest
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    @SystemControllerLog(description = "查看商品列表")
    public PageResponse<Goods> goodsList(Goods goods, PageRequest pageRequest) {
        if (!getCurrentUser().hasRole(RoleType.SuAdmin.getValue())) {
            goods.setCreatorId(currentUser().getUid());
        }
        PageResponse<Goods> dataTable = goodsService.selectPageList(goods, pageRequest);
        return dataTable;
    }

    /**
     * 添加商品信息
     *
     * @param goods
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    @SystemControllerLog(description = "添加商品信息")
    public JsonResult addGoods(Goods goods, String attrs, String attrIds) {
        JsonResult result = new JsonResult();
        goods.setCreatorId(currentUser().getUid());
        goods = goodsService.insertGoodsAttr(goods, attrs, attrIds);
        if (ObjectUtils.isNotNull(goods.getId())) {
            result.markSuccess("保存成功", goods);
        } else {
            result.markError("保存失败");
        }
        return result;
    }

    /**
     * 商品上下架信息
     *
     * @param
     * @return
     */
    @RequestMapping("closed")
    @ResponseBody
    @SystemControllerLog(description = "商品上下架")
    public JsonResult closedGoods(Goods goods) {
        JsonResult result = new JsonResult();
        if (goodsService.closedGoods(goods)){
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 更新商品信息
     *
     * @param
     * @return
     */
    @RequestMapping("update")
    @ResponseBody
    @SystemControllerLog(description = "更新商品信息")
    public JsonResult updateGoods(Goods goods,
                                  @RequestParam(value = "attrs", required = false)String attrs,
                                  @RequestParam(value = "attrIds", required = false) String attrIds) {
        JsonResult result = new JsonResult();
        if (goodsService.updateGoodsAttr(goods, attrs, attrIds)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 删除商品信息
     *
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    @SystemControllerLog(description = "删除商品信息")
    public JsonResult deleteGoods(Integer id) {
        JsonResult result = new JsonResult();
        if (goodsService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


    /**
     * 上传图片
     *
     * @param request
     * @param img
     * @param id
     * @return
     */
    @RequestMapping("fileUpload")
    @ResponseBody
    public JsonResult fileUpload(HttpServletRequest request, MultipartFile img, String id) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult saveResult = util.saveFile(request, img, util.SAVEURL_GOODS_IMAGE, true, 200, 200);

        String imgUrl = saveResult.getData().toString();
        Goods goods = new Goods();
        goods.setImg(imgUrl);
        goods.setPic(imgUrl.substring(0, imgUrl.lastIndexOf(".")) + "_200_200" + imgUrl.substring(imgUrl.lastIndexOf(".")));
        if (id != null && id != "") {
            goods.setId(Integer.parseInt(id));
            if (goodsService.updateByPrimaryKeySelective(goods)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        }
        return result;
    }

}
