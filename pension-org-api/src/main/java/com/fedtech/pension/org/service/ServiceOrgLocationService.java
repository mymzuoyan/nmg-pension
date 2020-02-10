package com.fedtech.pension.org.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgLocation;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/23
 */
public interface ServiceOrgLocationService extends BaseService<ServiceOrgLocation> {



    /**
     * 获取所有的组织位置
     *
     * @param serviceOrgLocation
     * @return
     */
    List<ServiceOrgLocation> selectAllServiceOrg(ServiceOrgLocation serviceOrgLocation);

    /**
     * 获取所有的组织位置app
     *
     * @param serviceOrgLocation
     * @return
     */
    List<ServiceOrgLocation> selectAllAppServiceOrg(ServiceOrgLocation serviceOrgLocation);


    /**
     * 获取混存数据
     *
     * @param serviceOrgLocation
     * @return
     */
    List<ServiceOrgLocation> serviceOrgLocationCache(ServiceOrgLocation serviceOrgLocation);


    /**
     * 获取组织位置
     *
     * @param serviceOrgId
     * @return
     */
    ServiceOrgLocation selectByServiceOrgId(Integer serviceOrgId);

    /**
     * 更新组织地址
     *
     * @param serviceOrgLocation
     * @return
     */
    boolean updateOrInsertLocation(ServiceOrgLocation serviceOrgLocation);

    /**
     * 分页获取组织(好评率)
     *
     * @param filter
     * @param pageNum
     * @param length
     * @param lat
     * @param lng
     * @return
     */
    List<ServiceOrgLocation> selectPageListByFeedback(ServiceOrgLocation filter, Integer pageNum, Integer length, Double lat, Double lng, Double distance);


    /**
     * 分页获取组织(距离优先)
     *
     * @param filter
     * @param pageNum
     * @param length
     * @param lat
     * @param lng
     * @return
     */
    List<ServiceOrgLocation> selectPageListByRange(ServiceOrgLocation filter, Integer pageNum, Integer length, Double lat, Double lng, Double distance);


    /**
     * 分页获取组织(价格)
     *
     * @param filter
     * @param pageNum
     * @param length
     * @return
     */
    List<ServiceOrgLocation> selectPageListByPrice(ServiceOrgLocation filter, Integer pageNum, Integer length, String orderDir, Double lat, Double lng, Double distance);

    /**
     * 分页获取组织(等级)
     *
     * @param filter
     * @param pageNum
     * @param length
     * @param lat
     * @param lng
     * @return
     */
    List<ServiceOrgLocation> selectPageListByGrade(ServiceOrgLocation filter, Integer pageNum, Integer length, Double lat, Double lng, Double center);

    /**
     * 根据条件来获取组织列表
     *
     * @param serviceOrgLocation
     * @return
     */
    List<ServiceOrgLocation> getServiceOrgByFilter(ServiceOrgLocation serviceOrgLocation);
}
