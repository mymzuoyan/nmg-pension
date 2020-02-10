package com.fedtech.pension.portal.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.portal.entity.GoodsAttr;

import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/7
 */
public interface GoodsAttrService extends BaseService<GoodsAttr> {
    /**
     * 批量插入
     *
     * @param goodsAttrs
     * @return
     */
    boolean insertSomeAccord(List<GoodsAttr> goodsAttrs);

    /**
     * 根据goodsId删除
     *
     * @param goodsId
     * @return
     */
    boolean deleteByGoodsId(Integer goodsId);
}
