package com.fedtech.pension.gold.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.gold.entity.GoldSendStandard;
import com.fedtech.pension.gold.mapper.GoldSendStandardMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author csn
 * @date 2018/1/12
 */
@Service(interfaceClass = GoldSendStandardService.class,version = "1.0.0")
public class GoldSendStandardServiceImpl extends BaseServiceImpl<GoldSendStandard> implements GoldSendStandardService{

    @Autowired
    private GoldSendStandardMapper goldSendStandardMapper;

    @Override
    public BaseMapper<GoldSendStandard> getMapper() {
        return goldSendStandardMapper;
    }

}
