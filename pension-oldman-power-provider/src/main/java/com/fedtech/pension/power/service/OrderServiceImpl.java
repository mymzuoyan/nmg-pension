package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Order;
import com.fedtech.pension.power.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service(interfaceClass = OrderService.class, version = "1.0.0")
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public BaseMapper<Order> getMapper() {
        return orderMapper;
    }


    @Override
    public List<Order> selectByBillId(Integer id) {
        return orderMapper.selectByBillId(id);
    }
    @Override
    public boolean deleteByPrimaryKey(Integer id) {
        if (null != id) {
            return 1 == getMapper().deleteByPrimaryKey(id);
        }
        return false;
    }
    @Override
    public boolean deleteByBillId(List<Integer> idList) {
        if (orderMapper.deleteByBillId(idList) > 0) {
            return true;
        }
        return false;
    }
}
