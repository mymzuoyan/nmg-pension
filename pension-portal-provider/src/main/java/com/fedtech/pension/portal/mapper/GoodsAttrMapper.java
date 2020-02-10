package com.fedtech.pension.portal.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.portal.entity.GoodsAttr;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品属性
 * @author gengqiang
 */
public interface GoodsAttrMapper extends BaseMapper<GoodsAttr> {

    /**
     * 批量插入
     *
     * @param goodsAttrs
     * @return
     */
    int insertSomeAccord(@Param("goodsAttrs") List<GoodsAttr> goodsAttrs);

    /**
     * 根据goodsId删除
     *
     * @param goodsId
     * @return
     */
    int deleteByGoodsId(@Param("goodsId") Integer goodsId);
}