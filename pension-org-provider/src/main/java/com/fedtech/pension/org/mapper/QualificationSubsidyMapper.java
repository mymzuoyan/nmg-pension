package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.QualificationSubsidy;
import com.fedtech.pension.sys.entity.Area;

import java.util.List;
import java.util.Map;

/**
 *
 * @author DMJ
 * @date 2019/4/3
 */
public interface QualificationSubsidyMapper extends BaseMapper<QualificationSubsidy>{

    int getAreaId(String areaName);

    List<Area> getListArea();

    List<QualificationSubsidy> selectAll();

    List<Map<String, Integer>> selectCount(String areaName);

    List<Area> getListAreaByParentId(Integer areaId);
}
