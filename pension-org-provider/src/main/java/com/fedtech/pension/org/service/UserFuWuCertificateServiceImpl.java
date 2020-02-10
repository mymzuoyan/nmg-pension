package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.UserFuWuCertificate;
import com.fedtech.pension.org.mapper.UserFuWuCertificateMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 证书信息登记表
 * @author miaoyueming
 * @date 2019/10/11
 */
@Service(interfaceClass = UserFuWuCertificateService.class, version = "1.0.0")
public class UserFuWuCertificateServiceImpl extends BaseServiceImpl<UserFuWuCertificate> implements UserFuWuCertificateService {

    @Autowired
    private UserFuWuCertificateMapper userFuWuCertificateMapper;


    @Override
    public BaseMapper<UserFuWuCertificate> getMapper() {
        return userFuWuCertificateMapper;
    }
}


