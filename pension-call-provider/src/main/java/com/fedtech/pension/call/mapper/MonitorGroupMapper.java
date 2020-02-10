package com.fedtech.pension.call.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.call.entity.MonitorGroup;
import org.apache.ibatis.annotations.Param;

/**
 * @author Administrator
 * @date 2016/9/26
 */
public interface MonitorGroupMapper extends BaseMapper<MonitorGroup> {

    /**
     * 获取座席组
     *
     * @param name
     * @return
     */
    MonitorGroup selectMonitorGroupByName(@Param("name") String name);
}
