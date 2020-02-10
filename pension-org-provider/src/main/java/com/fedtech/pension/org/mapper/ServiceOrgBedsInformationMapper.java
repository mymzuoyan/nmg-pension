package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgBedsInformation;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgBedsInformationMapper extends BaseMapper<ServiceOrgBedsInformation> {

    ServiceOrgBedsInformation selectByBedNumberAndRoomId(@Param("bedNumber")String bedNumber, @Param("roomId")Integer roomId);

    /**
     * 根据床位编号roomId获取床位信息
     * @param roomId
     * @return
     */
    List<ServiceOrgBedsInformation> selectByRoomId(@Param("roomId") Integer roomId);


    /**
     * 根据床位编号bedNumber,房间编号roomNum获取床位信息
     * @param bedNumber
     * @return
     */
    ServiceOrgBedsInformation selectByBedNumberAndRoomNum(@Param("bedNumber") String bedNumber,@Param("roomNum") String roomNum);
}
