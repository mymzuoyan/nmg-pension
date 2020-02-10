package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.JiuYe;
import com.fedtech.pension.sys.entity.Area;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JiuYeMapper extends BaseMapper<JiuYe> {
    JiuYe selectByCardNo(String cardNo);

    boolean isAdd(JiuYe jiuYe);

    int insertSomeElder(@Param("jiuYes") List<JiuYe> jiuYes);

    Integer selectCountByAreaName(String areaName);

    List<Area> selectAreaByParentId(Integer parentId);


    List<JiuYe> selectByAreaName(String name);
}
