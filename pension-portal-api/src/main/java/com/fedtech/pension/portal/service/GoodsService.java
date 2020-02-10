package com.fedtech.pension.portal.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.portal.entity.Goods;

import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/6
 */
public interface GoodsService extends BaseService<Goods> {

    /**
     * 获取count个特定类型的商品
     *
     * @param typeId
     * @return
     */
    List<Goods> selectTopNByTypeId(Integer typeId, Integer count);

    /**
     * 添加商品
     *
     * @param goods
     * @param attrs
     * @param attrIds
     * @return
     */
    Goods insertGoodsAttr(Goods goods, String attrs, String attrIds);

    /**
     * 更新商品
     *
     * @param goods
     * @param attrs
     * @param attrIds
     * @return
     */
    boolean updateGoodsAttr(Goods goods, String attrs, String attrIds);

    /**
     * 商品上下架
     * @param goods
     * @return
     */
    boolean closedGoods(Goods goods);
}
