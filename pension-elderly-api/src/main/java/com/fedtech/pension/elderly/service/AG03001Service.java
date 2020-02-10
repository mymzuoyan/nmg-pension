package com.fedtech.pension.elderly.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.Ag03001;
import com.fedtech.pension.sys.entity.Area;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/11/12
 */
public interface AG03001Service extends BaseService<Ag03001> {

    int count();

    List<Ag03001> selectAll(Integer start, Integer length);

    Ag03001 selectbyId(String id);

    String getAreaName(Integer areaId);

    Area selectbyDistrictId(String districtId);
}
