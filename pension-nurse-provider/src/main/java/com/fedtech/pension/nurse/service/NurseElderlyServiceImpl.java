package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.NurseElderly;
import com.fedtech.pension.nurse.mapper.NurseElderlyMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
@Service(interfaceClass = NurseElderlyService.class, version = "1.0.0")
public class NurseElderlyServiceImpl extends BaseServiceImpl<NurseElderly> implements NurseElderlyService {

    @Autowired
    private NurseElderlyMapper mapper;

    @Override
    public BaseMapper<NurseElderly> getMapper() {
        return mapper;
    }


    @Override
    public NurseElderly findByMemberId(String memberId) {
        return mapper.findByMemberId(memberId);
    }


    @Override
    public NurseElderly findByIdcardNo(String idcardno) {
        return mapper.findByIdcardNo(idcardno);
    }
}
