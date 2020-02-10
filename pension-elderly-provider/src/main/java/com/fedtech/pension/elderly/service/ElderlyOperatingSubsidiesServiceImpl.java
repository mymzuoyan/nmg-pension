package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.ElderlyOperatingSubsidies;
import com.fedtech.pension.elderly.mapper.ElderlyOperatingSubsidiesMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author guxiangyang
 * @date 2019/11/22
 */
@Service(interfaceClass = ElderlyOperatingSubsidiesService.class,version = "1.0.0")
public class ElderlyOperatingSubsidiesServiceImpl extends BaseServiceImpl<ElderlyOperatingSubsidies> implements ElderlyOperatingSubsidiesService {

    @Autowired
    private ElderlyOperatingSubsidiesMapper mapper;
    @Override
    public BaseMapper<ElderlyOperatingSubsidies> getMapper() {
        return mapper;
    }

    @Override
    public void delByInsConSuld(Integer insConSuId) {
         mapper.delByInsConSuld(insConSuId);
    }
}
