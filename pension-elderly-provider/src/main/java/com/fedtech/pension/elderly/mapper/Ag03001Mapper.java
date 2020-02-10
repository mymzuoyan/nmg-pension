package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.Ag03001;
import com.fedtech.pension.sys.entity.Area;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/11/12
 */
public interface Ag03001Mapper extends BaseMapper<Ag03001> {

    int count();

    List<Ag03001> selectAll(@Param("start") Integer start,@Param("length")  Integer length);

    Ag03001 selectbyId(@Param("id") String id);

    String getAreaName(Integer areaId);

    Area selectbyDistrictId(String districtId);
}
