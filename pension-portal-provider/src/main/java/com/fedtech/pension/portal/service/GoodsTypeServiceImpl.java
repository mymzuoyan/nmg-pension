package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.portal.entity.GoodsType;
import com.fedtech.pension.portal.entity.GoodsTypeAttr;
import com.fedtech.pension.portal.mapper.GoodsTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/6
 */
@Service(interfaceClass = GoodsTypeService.class, version = "1.0.0")
public class GoodsTypeServiceImpl extends BaseServiceImpl<GoodsType> implements GoodsTypeService {

    @Autowired
    private GoodsTypeMapper mapper;

    @Autowired
    private GoodsTypeAttrService typeAttrService;

    @Override
    public BaseMapper<GoodsType> getMapper() {
        return mapper;
    }

    @Override
    @Transactional
    public boolean insertTypeAttr(GoodsType goodsType, String attr) {
        if (this.insert(goodsType)) {
            List<GoodsTypeAttr> typeAttrs = new ArrayList<>();
            if (ObjectUtils.isNotNull(attr) && attr.indexOf(",") > 0) {
                for (int i = 0; i < attr.split(",").length; i++) {
                    GoodsTypeAttr typeAttr = new GoodsTypeAttr();
                    typeAttr.setTypeId(goodsType.getId());
                    typeAttr.setAttr(attr.split(",")[i]);
                    typeAttrs.add(typeAttr);
                }
            }
            if (ObjectUtils.isNotNull(typeAttrs)) {
                return typeAttrService.insertSomeAccord(typeAttrs);
            }
        }
        return false;
    }

    @Override
    public boolean updateTypeAttr(GoodsType goodsType, String attr) {
        if (this.updateByPrimaryKeySelective(goodsType)) {
            List<GoodsTypeAttr> typeAttrs = new ArrayList<>();
            if (ObjectUtils.isNotNull(attr) && attr.indexOf(",") > 0) {
                for (int i = 0; i < attr.split(",").length; i++) {
                    GoodsTypeAttr typeAttr = new GoodsTypeAttr();
                    typeAttr.setTypeId(goodsType.getId());
                    typeAttr.setAttr(attr.split(",")[i]);
                    typeAttrs.add(typeAttr);
                }
            }
            if (ObjectUtils.isNotNull(typeAttrs)) {
                if (typeAttrService.deleteByTypeId(goodsType.getId())) {
                    return typeAttrService.insertSomeAccord(typeAttrs);
                }
            }
        }
        return false;
    }
}
