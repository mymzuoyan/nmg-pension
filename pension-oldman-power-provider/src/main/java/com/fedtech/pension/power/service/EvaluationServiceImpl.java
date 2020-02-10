package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Evaluation;
import com.fedtech.pension.power.mapper.EvaluationMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = EvaluationService.class, version = "1.0.0")
public class EvaluationServiceImpl extends BaseServiceImpl<Evaluation> implements EvaluationService {

    @Autowired
    private EvaluationMapper evaluationMapper;
    @Override
    public BaseMapper<Evaluation> getMapper() {
        return evaluationMapper;
    }

    @Override
    public boolean update(Evaluation evaluation) {
        if(null!=evaluation)
        {
            if(evaluation.getId()!=null)
            {
                return 1 == evaluationMapper.updateByPrimaryKeySelective(evaluation);
            }
            else
            {
                return 1 == evaluationMapper.insert(evaluation);
            }
        }
        return true;
    }
}
