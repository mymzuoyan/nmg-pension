package com.fedtech.pension.org.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.Certificate;


import java.util.List;

/**
 * Created by Administrator on 2016/9/9.
 * 相关证件
 */
public interface CertificateService extends BaseService<Certificate> {
    List<Certificate> selectByCertificateId(Integer id);
}
