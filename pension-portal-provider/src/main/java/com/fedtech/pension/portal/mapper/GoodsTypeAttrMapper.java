package com.fedtech.pension.portal.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.portal.entity.GoodsTypeAttr;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface GoodsTypeAttrMapper extends BaseMapper<GoodsTypeAttr> {

    /**
     * 批量插入
     *
     * @param goodsTypeAttrs
     * @return
     */
    int insertSomeAccord(@Param("goodsTypeAttrs") List<GoodsTypeAttr> goodsTypeAttrs);

    /**
     * 根据classID删除
     *
     * @param typeId
     * @return
     */
    int deleteByTypeId(Integer typeId);

}