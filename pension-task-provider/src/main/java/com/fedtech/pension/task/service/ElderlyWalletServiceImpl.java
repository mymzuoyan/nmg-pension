package com.fedtech.pension.task.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.task.entity.ElderlyWallet;
import com.fedtech.pension.task.mapper.ElderlyWalletMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/8/16
 */
@Service(interfaceClass = ElderlyWalletService.class, version = "1.0.0")
public class ElderlyWalletServiceImpl extends BaseServiceImpl<ElderlyWallet> implements ElderlyWalletService {

    @Autowired
    private ElderlyWalletMapper mapper;

    @Override
    public BaseMapper<ElderlyWallet> getMapper() {
        return mapper;
    }


}
