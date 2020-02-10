package com.fedtech.pension.portal.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.portal.entity.GoodsTypeAttr;

import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/7
 */
public interface GoodsTypeAttrService extends BaseService<GoodsTypeAttr> {

    /**
     * 批量插入
     *
     * @param goodsTypeAttrs
     * @return
     */
    boolean insertSomeAccord(List<GoodsTypeAttr> goodsTypeAttrs);


    /**
     * 根据classId删除
     *
     * @param typeId
     * @return
     */
    boolean deleteByTypeId(Integer typeId);

}
