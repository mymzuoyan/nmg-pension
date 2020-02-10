package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.NurseAlarm;
import com.fedtech.pension.nurse.mapper.NurseAlarmMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 * @date 2017/8/23
 */
@Service(interfaceClass = NurseAlarmService.class, version = "1.0.0")
public class NurseAlarmServiceImpl extends BaseServiceImpl<NurseAlarm> implements NurseAlarmService {


    @Autowired
    private NurseAlarmMapper nurseAlarmMapper;

    @Override
    public BaseMapper<NurseAlarm> getMapper() {
        return nurseAlarmMapper;
    }


    @Override
    public Map<String, Integer> getCountByType(NurseAlarm filter) {
        List<Map<String, Object>> regionMap = nurseAlarmMapper.getCountByType(filter);
        Map<String, Integer> result = new HashMap<String, Integer>();
        for (Map<String, Object> map : regionMap) {
            String alarmType = null;
            Integer count = null;
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if ("alarmType".equals(entry.getKey())) {
                    alarmType = (String) entry.getValue();
                } else if ("count".equals(entry.getKey())) {
                    count = Integer.parseInt(entry.getValue().toString());
                }
            }
            result.put(alarmType, count);
        }
        return result;
    }
}
