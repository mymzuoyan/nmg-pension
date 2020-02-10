package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.portal.entity.Goods;
import com.fedtech.pension.portal.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/7
 */
@Controller
@RequestMapping("/goods/api/")
public class PageGoodsApiController {

    @Reference(version = "1.0.0")
    private GoodsService goodsService;

    /**
     * 获取特定类型的商品
     *
     * @param classId
     * @param count
     * @return
     */
    @RequestMapping("/selectTopNByClassId")
    @ResponseBody
    public List<Goods> selectMoudleMes(Integer classId, Integer count) {
        return goodsService.selectTopNByTypeId(classId, count);
    }


    /**
     * 分页获取
     *
     * @param goods
     * @param page
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getList(Goods goods, Integer page, PageRequest pageRequest) {
        int length = 5;
        if (ObjectUtils.isNotNull(pageRequest.getLength())) {
            length = pageRequest.getLength();
        }
        JsonResult result = new JsonResult();
        pageRequest.setOrderField("id");
        pageRequest.setOrderDir("DESC");
        if (page < 1) {
            page = 1;
        }
        pageRequest.setStart(length * (page - 1));
        JSONObject jo = new JSONObject();
        PageResponse<Goods> goodsPageResponse = goodsService.selectPageList(goods, pageRequest);
        int count = goodsPageResponse.getRecordsFiltered();
        jo.put("totalPage", count % length > 0 ? count / length + 1 : count / length);
        jo.put("infos", goodsPageResponse.getData());
        result.markSuccess("获取成功", jo);
        return result;
    }

}
