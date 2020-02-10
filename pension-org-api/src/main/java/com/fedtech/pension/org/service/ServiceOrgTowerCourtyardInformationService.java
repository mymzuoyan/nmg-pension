package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.entity.ServiceOrgTowerCourtyardInformation;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgTowerCourtyardInformationService  extends BaseService<ServiceOrgTowerCourtyardInformation> {
    /**
     * 根据楼院编号TowerCourtyardNum获取楼院信息
     * @param towerCourtyardNum
     * @return
     */
    ServiceOrgTowerCourtyardInformation selectByTowerCourtyardNum(String towerCourtyardNum);

    /**
     * 根据机构Id ServiceOrgId获取楼院编号信息
     * @param ServiceOrgId
     * @return
     */
    List<ServiceOrgTowerCourtyardInformation> selectByServiceOrgId(Integer ServiceOrgId);


    /**
     * 根据楼院编号获取信息
     * @param towerCourtyardNum
     * @return
     */
    ServiceOrgTowerCourtyardInformation selectByTowerCourtyardNumAndServiceOrgId(String towerCourtyardNum,Integer ServiceOrgId);



}
