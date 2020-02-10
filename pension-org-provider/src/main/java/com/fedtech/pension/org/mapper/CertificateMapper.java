package com.fedtech.pension.org.mapper;



import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.Certificate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CertificateMapper extends BaseMapper<Certificate> {
    List<Certificate> selectByCertificateId(@Param("id") Integer id);
}