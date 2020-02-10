package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Assessor;

import java.util.List;


public interface AssessorService extends BaseService<Assessor> {

    /**
     * 新增、修改评估人
     *
     * @param assessor
     * @return
     */
    boolean updateAssessor(Assessor assessor);

    /**
     *
     * @param idCard
     * @return
     */
    Assessor selectByCardNo(String idCard);

    /**
     *
     * @param assessors
     * @return
     */
    int insertSomeElder(List<Assessor> assessors);
}
