package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 *
 * @author csn
 * @date 2018/2/9
 */
public class CheckName implements Serializable{

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String name;

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
}
