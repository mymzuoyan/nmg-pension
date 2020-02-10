package com.fedtech.pension.portal.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 商品类型
 * @author gengqiang
 */
public class GoodsType implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //商品类目id
    private String name;

    private List<GoodsTypeAttr> attrs;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<GoodsTypeAttr> getAttrs() {
        return attrs;
    }

    public void setAttrs(List<GoodsTypeAttr> attrs) {
        this.attrs = attrs;
    }
}