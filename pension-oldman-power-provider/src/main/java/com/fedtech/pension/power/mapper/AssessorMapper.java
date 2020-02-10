package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Assessor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AssessorMapper extends BaseMapper<Assessor> {

    /**
     * 获取评估人
     *
     * @return
     */
    Assessor findAssessor(Long id);

    /**
     *
     * @param idCard
     * @return
     */
    Assessor selectByCardNo(String idCard);

    int insertSomeElder(@Param("assessors") List<Assessor> assessors);
}
