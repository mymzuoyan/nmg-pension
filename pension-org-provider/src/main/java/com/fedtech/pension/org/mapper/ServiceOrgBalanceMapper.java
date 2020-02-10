package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgBalance;
import org.apache.ibatis.annotations.Param;

/**
 * @author gengqiang
 */
public interface ServiceOrgBalanceMapper extends BaseMapper<ServiceOrgBalance> {

    /**
     * 根据serviceOrgId来获取
     *
     * @param serviceOrgId
     * @return
     */
    ServiceOrgBalance findByServiceOrgId(@Param("serviceOrgId") Integer serviceOrgId);
}