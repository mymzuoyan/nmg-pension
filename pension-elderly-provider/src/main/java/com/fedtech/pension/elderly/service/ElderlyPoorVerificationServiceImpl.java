package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.ElderlyPoorVerification;
import com.fedtech.pension.elderly.mapper.ElderlyPoorVerificationMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by gengqiang on 2017/9/27.
 */
@Service(interfaceClass = ElderlyPoorVerificationService.class, version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyPoorVerificationServiceImpl extends BaseServiceImpl<ElderlyPoorVerification> implements ElderlyPoorVerificationService {

    @Autowired
    private ElderlyPoorVerificationMapper mapper;

    @Override
    public BaseMapper<ElderlyPoorVerification> getMapper() {
        return mapper;
    }

    @Override
    public boolean insertSomeRecode(List<ElderlyPoorVerification> verifications) {
        return mapper.insertSomeRecode(verifications) > 0;
    }
}
