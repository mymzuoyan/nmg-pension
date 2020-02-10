package com.fedtech.pension.org.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgElderly;
import com.fedtech.pension.org.entity.ServiceOrgTowerRoomInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface ServiceOrgElderlyMapper extends BaseMapper<ServiceOrgElderly> {

    /**
     * 根据老人id获取信息
     * @param elderlyId
     * @return
     */
    ServiceOrgElderly selectByElderlyId(@Param("elderlyId")Integer elderlyId);


    /**
     * 根据serviceOrgId获取信息
     * @param serviceOrgId
     * @return
     */
    List<ServiceOrgElderly> selectByServiceOrgId(@Param("serviceOrgId")Integer serviceOrgId);

    /**
     * 根据serviceOrgId BedNumber获取信息
     * @param bedNumber
     * @return
     */
    List<ServiceOrgElderly> selectByServiceOrgIdAndBedNumber(@Param("serviceOrgId")Integer serviceOrgId,@Param("bedNumber")String bedNumber);
}