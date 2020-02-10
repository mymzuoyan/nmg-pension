package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.EntrySubsidy;
import com.fedtech.pension.org.mapper.EntrySubsidyMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author DMJ
 * @date 2019/4/1
 */
@Service(interfaceClass = EntrySubsidyService.class,version = "1.0.0")
public class EntrySubsidyServiceImpl extends BaseServiceImpl<EntrySubsidy> implements EntrySubsidyService{

    @Autowired
    private EntrySubsidyMapper entrySubsidyMapper;

    @Override
    public BaseMapper<EntrySubsidy> getMapper() {
        return entrySubsidyMapper;
    }
}
