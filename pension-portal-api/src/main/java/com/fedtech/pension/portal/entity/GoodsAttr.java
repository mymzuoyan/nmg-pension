package com.fedtech.pension.portal.entity;

import java.io.Serializable;

/**
 * 商品属性
 * @author gengqiang
 * @date 2017/7/7
 */
public class GoodsAttr implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //商品id
    private Integer goodsId;

    //财产id
    private Integer attrId;

    //财产
    private String attr;

    //值
    private String value;

    public GoodsAttr() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getAttrId() {
        return attrId;
    }

    public void setAttrId(Integer attrId) {
        this.attrId = attrId;
    }

    public String getAttr() {
        return attr;
    }

    public void setAttr(String attr) {
        this.attr = attr;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}