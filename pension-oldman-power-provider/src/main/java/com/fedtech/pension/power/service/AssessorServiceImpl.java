package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Assessor;
import com.fedtech.pension.power.mapper.AssessorMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service(interfaceClass = AssessorService.class, version = "1.0.0")
public class AssessorServiceImpl extends BaseServiceImpl<Assessor> implements AssessorService {
    @Autowired
    private AssessorMapper assessorMapper;

    @Override
    public BaseMapper<Assessor> getMapper() {
        return assessorMapper;
    }

    @Override
    public boolean updateAssessor(Assessor assessor) {
        if (null != assessor) {
            if (assessor.getId() != null)
                return 1 == assessorMapper.updateByPrimaryKeySelective(assessor);
            else {
                return 1 == assessorMapper.insert(assessor);
            }
        }
        return true;
    }

    @Override
    public Assessor selectByCardNo(String idCard) {
                return  assessorMapper.selectByCardNo(idCard);
    }

    @Override
    public int insertSomeElder(List<Assessor> assessors) {
        int count = assessorMapper.insertSomeElder(assessors);
        return count;
    }


}
