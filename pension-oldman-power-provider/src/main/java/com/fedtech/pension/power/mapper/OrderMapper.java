package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper extends BaseMapper<Order> {

    List<Order> selectByBillId(Integer id);

    int deleteByBillId(@Param("idList") List<Integer> idList);
}
