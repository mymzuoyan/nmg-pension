package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.entity.ServiceOrgTowerCourtyardInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
public interface ServiceOrgTowerCourtyardInformationMapper extends BaseMapper<ServiceOrgTowerCourtyardInformation> {

    ServiceOrgTowerCourtyardInformation selectByTowerCourtyardNum(@Param("towerCourtyardNum")String towerCourtyardNum);

    List<ServiceOrgTowerCourtyardInformation> selectByServiceOrgId(@Param("serviceOrgId")Integer serviceOrgId);

    ServiceOrgTowerCourtyardInformation selectByTowerCourtyardNumAndServiceOrgId(@Param("towerCourtyardNum")String towerCourtyardNum,@Param("serviceOrgId")Integer serviceOrgId);


}
