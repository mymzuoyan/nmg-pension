package com.fedtech.pension.task.vo;

import java.io.Serializable;

/**
 * @author gengqiang
 * @date 2017/7/17
 */
public class TaskMoneyVo implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Double money;
    private Integer type;

    public TaskMoneyVo() {
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
