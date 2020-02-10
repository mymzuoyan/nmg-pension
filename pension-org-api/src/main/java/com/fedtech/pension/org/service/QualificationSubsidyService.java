package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.QualificationSubsidy;
import com.fedtech.pension.org.vo.QualificationStatistics;
import com.fedtech.pension.sys.entity.Area;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DMJ
 * @date 2019/4/3
 */
public interface QualificationSubsidyService extends BaseService<QualificationSubsidy>{

    int getAreaId(String areaName);

    List<Area> getListArea();

    List<QualificationStatistics> getStatistics(Integer areaId);
}
