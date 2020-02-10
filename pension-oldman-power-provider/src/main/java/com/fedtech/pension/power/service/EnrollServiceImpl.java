package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Enroll;
import com.fedtech.pension.power.mapper.EnrollMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = EnrollService.class, version = "1.0.0")
public class EnrollServiceImpl extends BaseServiceImpl<Enroll> implements EnrollService {
    @Autowired
    private EnrollMapper enrollMapper;

    @Override
    public BaseMapper<Enroll> getMapper() {
        return enrollMapper;
    }

    @Override
    public boolean updateEnroll(Enroll enroll) {
        if (enroll.getId()>0) {
                enrollMapper.updateByPrimaryKeySelective(enroll);
        }else{
                enrollMapper.insert(enroll);
        }
        return true;
    }

    @Override
    public Enroll selectBymemberID(String memberID) {
        return enrollMapper.selectBymemberID(memberID);
    }


}
