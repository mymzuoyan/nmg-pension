package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.entity.ServiceOrgTowerRoomInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgTowerRoomInformationMapper extends BaseMapper<ServiceOrgTowerRoomInformation> {

    ServiceOrgTowerRoomInformation selectByFloorNumberAndfloorId(@Param("roomNum")String roomNum, @Param("floorId")Integer floorId);

    /**
     * 根据房间编号roomNum获取房间信息
     * @param roomNum
     * @return
     */
    List<ServiceOrgTowerRoomInformation> selectByFloorNumber(@Param("roomNum")String roomNum,@Param("serviceOrgId")String serviceOrgId);


    /**
     * 根据房间编号roomNum和serviceOrgId获取房间信息
     * @param roomNum
     * @return
     */
    ServiceOrgTowerRoomInformation selectByRoomNumAndServiceOrgId(@Param("roomNum")String roomNum,@Param("serviceOrgId")String serviceOrgId);


    List<ServiceOrgTowerRoomInformation> selectByFloorId( @Param("floorId")Integer floorId);
}
