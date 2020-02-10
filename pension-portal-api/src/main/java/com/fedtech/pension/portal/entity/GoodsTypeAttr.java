package com.fedtech.pension.portal.entity;

import java.io.Serializable;

/**
 * 商品类型属性表
 * @author gengqiang
 * @date 2017/7/7
 */
public class GoodsTypeAttr implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //类型id
    private Integer typeId;

    //属性
    private String attr;

    public GoodsTypeAttr() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getAttr() {
        return attr;
    }

    public void setAttr(String attr) {
        this.attr = attr;
    }
}
