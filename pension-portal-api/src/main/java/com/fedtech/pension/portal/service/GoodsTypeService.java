package com.fedtech.pension.portal.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.portal.entity.GoodsType;

/**
 * Created by gengqiang on 2017/7/6.
 */
public interface GoodsTypeService extends BaseService<GoodsType> {

    /**
     * 添加
     *
     * @param goodsType
     * @param attr
     * @return
     */
    boolean insertTypeAttr(GoodsType goodsType, String attr);


    /**
     * 更新
     *
     * @param goodsType
     * @param attr
     * @return
     */
    boolean updateTypeAttr(GoodsType goodsType, String attr);
}
