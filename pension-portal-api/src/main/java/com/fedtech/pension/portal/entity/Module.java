package com.fedtech.pension.portal.entity;

import java.io.Serializable;

/**
 * 新闻类型表
 * @author Administrator
 * @date 2016/10/12
 */
public class Module implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //展示模块
    private String module;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public Module() {
        super();
    }
}
