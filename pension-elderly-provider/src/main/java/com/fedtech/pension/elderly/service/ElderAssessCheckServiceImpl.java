package com.fedtech.pension.elderly.service;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.ElderAssessCheck;
import com.fedtech.pension.elderly.mapper.ElderAssessCheckMapper;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * Created by Administrator on 2016/10/10.
 */
@org.springframework.stereotype.Service
@Service(version = "1.0.0",interfaceClass = ElderAssessCheckService.class,timeout = 5000, retries = 0)
public class ElderAssessCheckServiceImpl extends BaseServiceImpl<ElderAssessCheck> implements ElderAssessCheckService {

    @Autowired
   private ElderAssessCheckMapper mapper;

    @Override
    public BaseMapper<ElderAssessCheck> getMapper() {
        return mapper;
    }
}
