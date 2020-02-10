package com.fedtech.pension.elderly.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.JiuYe;
import com.fedtech.pension.elderly.vo.EmployStatisticsVo;

import java.util.List;

public interface JiuYeService extends BaseService<JiuYe> {
    JiuYe selectByCardNo(String cardNo);

    boolean isAdd(JiuYe jiuYe);

    int insertSomeElder(List<JiuYe> jiuYes);

    Integer selectCountByAreaName(String areaName);

    List<EmployStatisticsVo> getStatistics(Integer areaId);
}
