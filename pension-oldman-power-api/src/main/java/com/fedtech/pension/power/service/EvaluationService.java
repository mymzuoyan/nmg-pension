package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.Evaluation;

public interface EvaluationService extends BaseService<Evaluation> {
    /**
     * 新增、修改
     *
     * @param evaluation
     * @return
     */
    boolean update(Evaluation evaluation);

}
