package com.fedtech.pension.portal.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.portal.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface GoodsMapper extends BaseMapper<Goods> {

    /**
     * 获取count个特定类型的商品
     *
     * @param typeId
     * @return
     */
    List<Goods> selectTopNByClassId(@Param("typeId") Integer typeId, @Param("count") Integer count);

    /**
     * 商品上下架
     * @param goods
     * @return
     */
    int closedGoods(Goods goods);
}