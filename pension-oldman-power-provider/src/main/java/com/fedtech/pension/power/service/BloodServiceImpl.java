package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Blood;
import com.fedtech.pension.power.entity.Enroll;
import com.fedtech.pension.power.mapper.BloodMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = BloodService.class, version = "1.0.0")
public class BloodServiceImpl extends BaseServiceImpl<Blood> implements BloodService {
    @Autowired
    private BloodMapper bloodMapper;

    @Override
    public BaseMapper<Blood> getMapper() {
        return bloodMapper;
    }

    @Override
    public boolean updateBlood(Blood blood) {
        if (blood.getId()>0) {
            bloodMapper.updateByPrimaryKeySelective(blood);
        }else{
            bloodMapper.insert(blood);
        }
        return true;
    }

    @Override
    public Blood selectBytestRecordID(String testRecordID) {
        return bloodMapper.selectBytestRecordID(testRecordID);
    }
}
