package com.fedtech.pension.call.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.call.entity.MonitorGroup;

/**
 * @author Administrator
 * @date 2016/9/26
 */
public interface MonitorGroupService extends BaseService<MonitorGroup> {

    /**
     * 获取座席组
     *
     * @param name
     * @return
     */
    MonitorGroup selectMonitorGroupByName(String name);

}
