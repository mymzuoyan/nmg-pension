package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgFloorInformationService extends BaseService<ServiceOrgFloorInformation> {

    /**
     * 根据楼层编号floorNumber,towerCourtyardId获取楼层信息
     * @param floorNumber
     * @return
     */
    ServiceOrgFloorInformation selectByFloorNumber(String floorNumber,Integer towerCourtyardId);



    /**
     * 根据编号TowerCourtyardId获取信息
     * @param towerCourtyardId
     * @return
     */
    List<ServiceOrgFloorInformation> selectByTowerCourtyardId( Integer towerCourtyardId);
}
