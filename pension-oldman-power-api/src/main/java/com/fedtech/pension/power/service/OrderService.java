package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Order;

import java.util.List;

public interface OrderService extends BaseService<Order> {

    List<Order> selectByBillId(Integer id);
    boolean deleteByBillId(List<Integer> idList);
}
