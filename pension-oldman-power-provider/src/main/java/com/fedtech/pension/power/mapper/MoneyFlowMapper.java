package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.MoneyFlow;
import org.apache.ibatis.annotations.Param;


public interface MoneyFlowMapper extends BaseMapper<MoneyFlow> {
    /**
     * 统计刷卡数据
     *
     * @return
     */
    int countMoneyFlowBydate(@Param("date") String date);



}
