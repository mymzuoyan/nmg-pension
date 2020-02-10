package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Bill;

public interface BillMapper extends BaseMapper<Bill> {

    int invalidBill(Bill bill);

    void updateBillAccount(Bill filter);
}
