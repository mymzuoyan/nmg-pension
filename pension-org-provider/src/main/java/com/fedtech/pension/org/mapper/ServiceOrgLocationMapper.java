package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/23
 */
public interface ServiceOrgLocationMapper extends BaseMapper<ServiceOrgLocation> {

    /**
     * 获取所有的地理位置
     *
     * @param serviceOrgLocation
     * @return
     */
    List<ServiceOrgLocation> selectAllServiceOrg(@Param("filter") ServiceOrgLocation serviceOrgLocation);

    /**
     * 获取组织的地理位置
     *
     * @param serviceOrgId
     * @return
     */
    ServiceOrgLocation selectByServiceOrgId(@Param("serviceOrgId") Integer serviceOrgId);

    /**
     * 更新
     *
     * @param record
     * @return
     */
    int updateByServiceOrgId(ServiceOrgLocation record);

    /**
     * 获取所有的地理位置
     *
     * @param serviceOrgLocation
     * @return
     */
    List<ServiceOrgLocation> selectAllAppServiceOrg(@Param("filter") ServiceOrgLocation serviceOrgLocation);

}
