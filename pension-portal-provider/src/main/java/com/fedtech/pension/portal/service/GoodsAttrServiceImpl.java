package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.portal.entity.GoodsAttr;
import com.fedtech.pension.portal.mapper.GoodsAttrMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/7
 */
@org.springframework.stereotype.Service
@Service(interfaceClass = GoodsAttrService.class, version = "1.0.0")
public class GoodsAttrServiceImpl extends BaseServiceImpl<GoodsAttr> implements GoodsAttrService {

    @Autowired
    private GoodsAttrMapper mapper;

    @Override
    public BaseMapper<GoodsAttr> getMapper() {
        return mapper;
    }


    @Override
    public boolean insertSomeAccord(List<GoodsAttr> goodsAttrs) {
        if (ObjectUtils.isNotNull(goodsAttrs)) {
            return mapper.insertSomeAccord(goodsAttrs) > 0;
        }
        return false;
    }

    @Override
    public boolean deleteByGoodsId(Integer goodsId) {
        if (ObjectUtils.isNotNull(goodsId)) {
            return mapper.deleteByGoodsId(goodsId) > 0;
        }
        return false;
    }
}
