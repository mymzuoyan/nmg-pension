package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgFloorInformationMapper extends BaseMapper<ServiceOrgFloorInformation> {

    ServiceOrgFloorInformation selectByFloorNumber(@Param("floorNumber")String floorNumber,@Param("towerCourtyardId")Integer towerCourtyardId);

    List<ServiceOrgFloorInformation> selectByTowerCourtyardId(@Param("towerCourtyardId")Integer towerCourtyardId);
}
