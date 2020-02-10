package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * 区域表
 * @author Administrator
 * @date 2016/9/8
 */
public class Area implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 区域编码
     */
    private String districtId;

    /**
     * 区域名称
     */
    private String name;

    /**
     * 父级id
     */
    private Integer parentId;

    /**
     * 等级
     */
    private Integer level;

    public String getDistrictId() {
        return districtId;
    }

    public void setDistrictId(String districtId) {
        this.districtId = districtId;
    }

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

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Area() {
    }




}
