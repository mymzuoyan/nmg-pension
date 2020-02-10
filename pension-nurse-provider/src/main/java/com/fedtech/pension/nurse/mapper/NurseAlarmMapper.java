package com.fedtech.pension.nurse.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.nurse.entity.NurseAlarm;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface NurseAlarmMapper extends BaseMapper<NurseAlarm> {

    /**
     * 根据类型获取次数
     *
     * @return
     */
    List<Map<String, Object>> getCountByType(@Param("filter") NurseAlarm filter);

}