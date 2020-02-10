package com.fedtech.pension.task.vo;

import java.io.Serializable;

/**
 * @author gengqiang
 * @date 2017/6/12
 */
public class ServiceOrgTaskVo implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;
    private Double count;

    public ServiceOrgTaskVo() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getCount() {
        return count;
    }

    public void setCount(Double count) {
        this.count = count;
    }
}
