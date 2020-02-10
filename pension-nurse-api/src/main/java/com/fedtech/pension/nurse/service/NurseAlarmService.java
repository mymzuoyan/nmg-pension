package com.fedtech.pension.nurse.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.NurseAlarm;

import java.util.Map;

/**
 * Created by gengqiang on 2017/8/23.
 */
public interface NurseAlarmService extends BaseService<NurseAlarm> {

    /**
     * 根据类型获取次数
     *
     * @param filter
     * @return
     */
    Map<String, Integer> getCountByType(NurseAlarm filter);
}
