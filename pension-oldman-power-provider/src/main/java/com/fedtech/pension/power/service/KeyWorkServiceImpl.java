package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.KeyWork;
import com.fedtech.pension.power.mapper.KeyWorkMapper;
import org.springframework.beans.factory.annotation.Autowired;

;

/**
 * @author gengqiang
 * @date 2017/8/23
 */
@Service(interfaceClass = KeyWorkService.class, version = "1.0.0")
public class KeyWorkServiceImpl extends BaseServiceImpl<KeyWork> implements KeyWorkService {


    @Autowired
    private KeyWorkMapper keyWorkMapper;

    @Override
    public BaseMapper<KeyWork> getMapper() {
        return keyWorkMapper;
    }


    @Override
    public boolean updateAssessor(KeyWork assessor) {
        if (null != assessor) {
            if (assessor.getId() != null)
                return 1 == keyWorkMapper.updateByPrimaryKeySelective(assessor);
            else {
                return 1 == keyWorkMapper.insert(assessor);
            }
        }
        return true;
    }


}
