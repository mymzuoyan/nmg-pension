package com.fedtech.pension.sys.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.ServiceProject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ServiceProjectMapper extends BaseMapper<ServiceProject> {

    /**
     * 根据类型名称来获取列表
     * @param types
     * @return
     */
    List<ServiceProject> getServiceProjectsByType(@Param("types") String types);

    /**
     * 根据类型名称和组织Id来获取列表
     * @param types
     * @return
     */
    List<ServiceProject> selectByTypeAndServiceOrgId(@Param("types") String types, @Param("serviceOrgId") Integer serviceOrgId);


}