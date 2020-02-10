package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.Certificate;
import com.fedtech.pension.org.mapper.CertificateMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2016/9/9.
 * 相关证件
 */
@Service(interfaceClass = CertificateService.class, version = "1.0.0")
public class CertificateServiceImpl extends BaseServiceImpl<Certificate> implements CertificateService{

   @Autowired
    private CertificateMapper certificateMapper;


    @Override
    public BaseMapper<Certificate> getMapper() {
        return certificateMapper;
    }

    @Override
    public List<Certificate> selectByCertificateId(Integer id) {
        return certificateMapper.selectByCertificateId(id);
    }
}
