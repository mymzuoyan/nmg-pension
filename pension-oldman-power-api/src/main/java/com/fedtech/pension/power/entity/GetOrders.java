package com.fedtech.pension.power.entity;

import java.util.List;

public class GetOrders {
    List<Order> orders;//将需要接收集合填入并获得Setter/getter方法

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
