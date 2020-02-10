package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Bill;

public interface BillService extends BaseService<Bill> {

    boolean invalidBill(Bill bill);

    void updateBillAccount(Bill filter);


    /**
     * 统计分析
     *
     * @param bill
     */
    void doStatistic(Bill bill);
}
