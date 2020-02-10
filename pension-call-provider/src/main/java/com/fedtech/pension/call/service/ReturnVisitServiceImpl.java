package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.ReturnVisit;
import com.fedtech.pension.call.mapper.ReturnVisitMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author CoderQiang
 * @date 2017/2/9
 */
@Service(interfaceClass = ReturnVisitService.class, version = "1.0.0")
public class ReturnVisitServiceImpl extends BaseServiceImpl<ReturnVisit> implements ReturnVisitService {

    @Autowired
    private ReturnVisitMapper mapper;

    @Override
    public BaseMapper<ReturnVisit> getMapper() {
        return mapper;
    }


    @Override
    @Transactional
    public boolean insert(ReturnVisit record) {
        //更新状态
        this.updateStatusByVisitorId(0, record.getVisitorId());
        return super.insert(record);
    }

    @Override
    public boolean updateStatusByVisitorId(Integer status, Integer visitorId) {
        if (null != visitorId) {
            return 1 <= mapper.updateStatusByVisitorId(status, visitorId);
        }
        return false;
    }

    @Override
    public boolean updateResultByCallInfoId(Integer visitResult, Integer callInfoId) {
        if (null != visitResult && null != callInfoId) {
            return 1 <= mapper.updateResultByCallInfoId(visitResult, callInfoId);
        }
        return false;
    }
}
