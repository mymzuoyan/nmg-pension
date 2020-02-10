package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.portal.entity.Goods;
import com.fedtech.pension.portal.entity.GoodsAttr;
import com.fedtech.pension.portal.mapper.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/6
 */
@Service(interfaceClass = GoodsService.class, version = "1.0.0")
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

    @Autowired
    private GoodsMapper mapper;
    @Autowired
    private GoodsAttrService goodsAttrService;

    @Override
    public BaseMapper<Goods> getMapper() {
        return mapper;
    }

    @Override
    public List<Goods> selectTopNByTypeId(Integer typeId, Integer count) {
        return mapper.selectTopNByClassId(typeId, count);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Goods insertGoodsAttr(Goods goods, String attrs, String attrIds) {
        goods = this.insertBackId(goods);
        if (ObjectUtils.isNotNull(goods.getId())) {
            List<GoodsAttr> goodsProperties = new ArrayList<>();
            String[] ids = attrIds.split(",");
            String[] values = attrs.split("\\|");
            for (int i = 0; i < ids.length; i++) {
                GoodsAttr goodsAttr = new GoodsAttr();
                goodsAttr.setAttrId(Integer.parseInt(ids[i]));
                goodsAttr.setValue(values[i]);
                goodsAttr.setGoodsId(goods.getId());
                goodsProperties.add(goodsAttr);
            }
            goodsAttrService.insertSomeAccord(goodsProperties);
            return goods;
        }
        return null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateGoodsAttr(Goods goods, String attrs, String attrIds) {

        if (this.updateByPrimaryKeySelective(goods)) {
            if (goodsAttrService.deleteByGoodsId(goods.getId())) {
                List<GoodsAttr> goodsAttrs = new ArrayList<>();
               if(attrs!=null && attrIds!=null){
                   String[] ids = attrIds.split(",");
                   String[] values = attrs.split("\\|");
                   for (int i = 0; i < ids.length; i++) {
                       GoodsAttr goodsAttr = new GoodsAttr();
                       goodsAttr.setAttrId(Integer.parseInt(ids[i]));
                       goodsAttr.setValue(values[i]);
                       goodsAttr.setGoodsId(goods.getId());
                       goodsAttrs.add(goodsAttr);
                   }
               }
                return goodsAttrService.insertSomeAccord(goodsAttrs);
            }
            return true;
        }
        return false;
    }

    @Override
    public boolean closedGoods(Goods goods) {
        if (null != goods) {
            return 1 == mapper.closedGoods(goods);
        }
        return false;
    }
}
