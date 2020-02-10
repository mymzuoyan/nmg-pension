package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.portal.entity.GoodsTypeAttr;
import com.fedtech.pension.portal.mapper.GoodsTypeAttrMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/7
 */
@org.springframework.stereotype.Service
@Service(interfaceClass = GoodsTypeAttrService.class, version = "1.0.0")
public class GoodsTypeAttrServiceImpl extends BaseServiceImpl<GoodsTypeAttr> implements GoodsTypeAttrService {

    @Autowired
    private GoodsTypeAttrMapper mapper;

    @Override
    public BaseMapper<GoodsTypeAttr> getMapper() {
        return mapper;
    }

    @Override
    public boolean insertSomeAccord(List<GoodsTypeAttr> goodsTypeAttrs) {
        if (ObjectUtils.isNotNull(goodsTypeAttrs)) {
            return mapper.insertSomeAccord(goodsTypeAttrs) > 0;
        }
        return false;
    }

    @Override
    public boolean deleteByTypeId(Integer classId) {
        if (ObjectUtils.isNotNull(classId)) {
            return mapper.deleteByTypeId(classId) > 0;
        }
        return false;
    }
}
