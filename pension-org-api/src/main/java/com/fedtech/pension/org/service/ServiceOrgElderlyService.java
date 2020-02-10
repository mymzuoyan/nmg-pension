package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgElderly;
import com.fedtech.pension.org.entity.ServiceOrgTowerRoomInformation;

import java.util.List;

/**
 * @author gengqiang
 * @date 2018/1/15
 */
public interface ServiceOrgElderlyService extends BaseService<ServiceOrgElderly> {

    /**
     * 根据老人id获取信息
     * @param elderlyId
     * @return
     */
    ServiceOrgElderly selectByElderlyId(Integer elderlyId);

    /**
     * 根据serviceOrgId获取信息
     * @param serviceOrgId
     * @return
     */
    List<ServiceOrgElderly> selectByServiceOrgId(Integer serviceOrgId);
    /**
     * 根据serviceOrgId BedNumber获取信息
     * @param bedNumber
     * @return
     */
    List<ServiceOrgElderly> selectByServiceOrgIdAndBedNumber(Integer serviceOrgId,String bedNumber);
}
