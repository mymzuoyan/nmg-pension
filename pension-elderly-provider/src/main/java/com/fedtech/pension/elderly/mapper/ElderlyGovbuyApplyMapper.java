package com.fedtech.pension.elderly.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApply;
import org.apache.ibatis.annotations.Param;

public interface ElderlyGovbuyApplyMapper extends BaseMapper<ElderlyGovbuyApply> {

    /**
     * 获取特定的区域的最新的编码
     * @param number
     * @return
     */
    String findByLastNumber(@Param("number") String number);
}