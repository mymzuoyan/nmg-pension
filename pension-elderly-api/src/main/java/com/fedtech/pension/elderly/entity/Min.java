package com.fedtech.pension.elderly.entity;

public class Min {
    private static final Long serialVersionUID = 1L;

    private Integer areaId;
    private Integer page_num;
    private Integer page_size;
    private Integer page_ye;

    public Integer getPage_ye() {
        return page_ye;
    }

    public void setPage_ye(Integer page_ye) {
        this.page_ye = page_ye;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getPage_num() {
        return page_num;
    }

    public void setPage_num(Integer page_num) {
        this.page_num = page_num;
    }

    public Integer getPage_size() {
        return page_size;
    }

    public void setPage_size(Integer page_size) {
        this.page_size = page_size;
    }
}
