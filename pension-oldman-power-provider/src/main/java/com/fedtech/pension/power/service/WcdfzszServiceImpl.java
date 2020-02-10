package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.Wcdfzsz;
import com.fedtech.pension.power.mapper.WcdfzszMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = WcdfzszService.class, version = "1.0.0")
public class WcdfzszServiceImpl extends BaseServiceImpl<Wcdfzsz> implements WcdfzszService {
    @Autowired
    private WcdfzszMapper wcdfzszMapper;

    @Override
    public BaseMapper<Wcdfzsz> getMapper() {
        return wcdfzszMapper;
    }

    @Override
    public boolean updateWcdfzsz(Wcdfzsz wcdfzsz) {
        if (null != wcdfzsz) {
            if (wcdfzsz.getId() != null)
                return 1 == wcdfzszMapper.updateByPrimaryKeySelective(wcdfzsz);
            else {
                return 1 == wcdfzszMapper.insert(wcdfzsz);
            }
        }
        return true;
    }

    @Override
    public Wcdfzsz selectWcdfzsz() {
        return  wcdfzszMapper.findWcdfzsz();
    }
}
