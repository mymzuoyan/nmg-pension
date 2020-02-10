package com.fedtech.pension.sys.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.ServiceProject;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/10/11
 */
public interface ServiceProjectService extends BaseService<ServiceProject> {

    /**
     * 根据类型名称来获取列表
     *
     * @param types
     * @return
     */
    List<ServiceProject> getServiceProjectsByType(String types);


    /**
     * 根据类型名称和组织Id来获取列表
     *
     * @param types
     * @return
     */
    List<ServiceProject> selectByTypeAndServiceOrgId(String types, Integer serviceOrgId);

}
