package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.entity.ServiceOrgTowerRoomInformation;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgTowerRoomInformationService extends BaseService<ServiceOrgTowerRoomInformation> {

    /**
     * 根据房间编号roomNum,floorId获取房间信息
     * @param roomNum
     * @return
     */
    ServiceOrgTowerRoomInformation selectByFloorNumberAndfloorId(String roomNum, Integer floorId);

    /**
     * 根据房间编号roomNum获取房间信息
     * @param roomNum
     * @return
     */
    List<ServiceOrgTowerRoomInformation> selectByFloorNumber(String roomNum,String serviceOrgId);


    /**
     * 根据房间编号roomNum和serviceOrgId获取房间信息
     * @param roomNum
     * @return
     */
    ServiceOrgTowerRoomInformation selectByRoomNumAndServiceOrgId(String roomNum,String serviceOrgId);



    /**
     * 根据floorId获取房间信息
     * @param floorId
     * @return
     */
    List<ServiceOrgTowerRoomInformation> selectByFloorId(Integer floorId);






}
