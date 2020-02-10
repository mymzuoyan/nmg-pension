package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgBedsInformation;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgBedsInformationService extends BaseService<ServiceOrgBedsInformation> {


    /**
     * 根据床位编号bedNumber,roomId获取床位信息
     * @param bedNumber
     * @return
     */
    ServiceOrgBedsInformation selectByBedNumberAndRoomId(String bedNumber, Integer roomId);

    /**
     * 根据roomId获取床位信息
     * @param roomId
     * @return
     */
    List<ServiceOrgBedsInformation> selectByRoomId(Integer roomId);

    /**
     * 根据床位编号bedNumber,房间编号roomNum获取床位信息
     * @param bedNumber
     * @return
     */
    ServiceOrgBedsInformation selectByBedNumberAndRoomNum(String bedNumber, String roomNum);
}
