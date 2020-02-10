package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.SysVars;
import com.fedtech.pension.sys.mapper.SysVarsMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by GQ on 16/5/12.
 */
@Service(version = "1.0.0", interfaceClass = SysVarsService.class)
public class SysVarsServiceImpl extends BaseServiceImpl<SysVars> implements SysVarsService {
    @Autowired
    private SysVarsMapper keyWorkMapper;

    @Override
    public BaseMapper<SysVars> getMapper() {
        return keyWorkMapper;
    }


    @Override
    public boolean updateAssessor(SysVars assessor) {
        if (null != assessor) {
            if (assessor.getVarsId() != null) {
                return 1 == keyWorkMapper.updateByPrimaryKeySelective(assessor);
            } else {
                return 1 == keyWorkMapper.insert(assessor);
            }
        }
        return true;
    }

    @Override
    public SysVars findByName(String name) {
        return keyWorkMapper.findByName(name);
    }


}
