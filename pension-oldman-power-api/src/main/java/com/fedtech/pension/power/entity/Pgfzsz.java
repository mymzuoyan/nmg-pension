package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Pgfzsz implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;
    private String name; //名称
    private Integer zc;  //正常
    private Integer qss; //轻丧失
    private Integer zss; //中丧失
    private Integer wqss; //完全丧失

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

    public Integer getZc() {
        return zc;
    }

    public void setZc(Integer zc) {
        this.zc = zc;
    }

    public Integer getQss() {
        return qss;
    }

    public void setQss(Integer qss) {
        this.qss = qss;
    }

    public Integer getZss() {
        return zss;
    }

    public void setZss(Integer zss) {
        this.zss = zss;
    }

    public Integer getWqss() {
        return wqss;
    }

    public void setWqss(Integer wqss) {
        this.wqss = wqss;
    }
}
