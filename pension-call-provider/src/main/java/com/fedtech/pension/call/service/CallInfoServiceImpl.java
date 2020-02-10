package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.call.entity.CallInfo;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.entity.ReturnVisit;
import com.fedtech.pension.call.mapper.CallInfoMapper;
import com.fedtech.pension.call.redis.RedisMonitorInfoUtil;
import com.fedtech.pension.call.vo.MonitorInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by CodingQiang on 2016/10/14.
 */
@Service(interfaceClass = CallInfoService.class, version = "1.0.0")
public class CallInfoServiceImpl extends BaseServiceImpl<CallInfo> implements CallInfoService {

    @Autowired
    private CallInfoMapper mapper;

    @Autowired
    private ReturnVisitService returnVisitService;

    @Autowired
    private RedisMonitorInfoUtil redisMonitorInfoUtil;

    @Override
    public BaseMapper<CallInfo> getMapper() {
        return mapper;
    }

    @Override
    public MonitorInfo getMonitorInfo(String agentId) {
        return (MonitorInfo) redisMonitorInfoUtil.getMonitorInfo(agentId);
    }

    @Override
    public void putMonitorInfo(String agentId, MonitorInfo monitorInfo) {
        redisMonitorInfoUtil.putMonitorInfo(agentId, monitorInfo);
    }


    /**
     * 添加通话记录和回访记录
     *
     * @param record
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insert(CallInfo record) {
        boolean b = false;
        if (super.insert(record)) {
            try {
                MonitorInfo monitorInfo = (MonitorInfo) redisMonitorInfoUtil.getMonitorInfo(record.getMonitorName());
                ReturnVisit returnVisit = monitorInfo.getReturnVisit();
                if (ObjectUtils.isNotNull(returnVisit)) {
                    returnVisit.setCreateTime(new Date());
                    returnVisit.setCallInfoId(record.getId());
                    b = returnVisitService.insert(returnVisit);
                    monitorInfo.setReturnVisit(null);
                    redisMonitorInfoUtil.putMonitorInfo(record.getMonitorName(), monitorInfo);
                } else {
                    b = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
                b = false;
            }
        }
        return b;
    }

    @Override
    public CallInfo selectByUniqueId(String uniqueId) {
        return mapper.selectByUniqueId(uniqueId);
    }

    @Override
    public Map<String, Map<String, Integer>> getCallInfoStatistics(String monitorAddress, String dataType, String timeType, String startTime, String endTime) throws ParseException {
        CallInfo filter = new CallInfo();
        filter.setMonitorAddress(monitorAddress);
        List<CallInfo> infos = mapper.getAllRecode(filter);
        Map<String, Map<String, Integer>> result = new LinkedHashMap<>();
        SimpleDateFormat df = null;
        long start = 0;
        long end = 0;
        int startMonth = 0;
        int startYear = 0;
        int endMonth = 0;
        int endYear = 0;
        switch (dataType) {
            case "fromType":
                String[] fromTypes = {Keys.ZIXUN12349, Keys.ZONGHEFUWU, Keys.JINGJIHUJIAO};
                //来电类型
                for (String queueName : fromTypes) {
                    Map<String, Integer> res = new LinkedHashMap<>();
                    switch (timeType) {
                        case "month":
                            df = new SimpleDateFormat("yyyy-MM");
                            startMonth = df.parse(startTime).getMonth();
                            startYear = df.parse(startTime).getYear();
                            endMonth = df.parse(endTime).getMonth();
                            endYear = df.parse(endTime).getYear();
                            int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                            if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0))
                                days[1] = 29;

                            start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                            end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                            while (end >= start) {

                                res.put(df.format(new Date(start)), this.getDateByRange(infos, queueName, start, start + 1000L * 60 * 60 * 24 * days[startMonth]));
                                start += 1000L * 60 * 60 * 24 * days[startMonth];

                                startMonth++;
                                startMonth = startMonth % 12;
                            }
                            break;
                        case "year":
                            df = new SimpleDateFormat("yyyy");
                            startYear = df.parse(startTime).getYear();
                            endYear = df.parse(endTime).getYear();

                            start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();

                            while (endYear >= startYear) {
                                //判断是否是闰年
                                int day = 365;
                                if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                    day = 366;
                                }
                                res.put(df.format(new Date(start)), this.getDateByRange(infos, queueName, start, start + 1000L * 60 * 60 * 24 * day));
                                start += 1000L * 60 * 60 * 24 * day;
                                startYear++;
                            }
                            break;
                    }
                    result.put(queueName, res);
                }
                break;
            case "evaluate":
                //满意度
                int[] evaluateStars = {-1, 1, 2, 3, 4};
                for (int evaluateStar : evaluateStars) {
                    Map<String, Integer> res = new LinkedHashMap<>();
                    switch (timeType) {
                        case "year":
                            df = new SimpleDateFormat("yyyy");
                            startYear = df.parse(startTime).getYear();
                            endYear = df.parse(endTime).getYear();

                            start = (new Date(startYear, 1, 1, 0, 0, 0)).getTime();
                            while (endYear >= startYear) {
                                int day = 365;
                                if ((startYear % 4 == 0) && ((startYear % 100 != 0) || (startYear % 400 == 0))) {
                                    day = 366;
                                }
                                res.put(df.format(new Date(start)), this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24 * day));
                                start += 1000L * 60 * 60 * 24 * day;
                                startYear++;
                            }
                            break;
                        case "month":
                            df = new SimpleDateFormat("yyyy-MM");
                            startMonth = df.parse(startTime).getMonth();
                            startYear = df.parse(startTime).getYear();
                            endMonth = df.parse(endTime).getMonth();
                            endYear = df.parse(endTime).getYear();
                            int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                            if (startYear % 400 == 0 || (startYear % 4 == 0 && startYear % 100 != 0))
                                days[1] = 29;

                            start = (new Date(startYear, startMonth, 1, 0, 0, 0)).getTime();
                            end = (new Date(endYear, endMonth, days[endMonth], 23, 59, 59)).getTime();
                            while (end >= start) {

                                res.put(df.format(new Date(start)), this.getDateByRange(infos, evaluateStar, start, start + 1000L * 60 * 60 * 24 * days[startMonth]));
                                start += 1000L * 60 * 60 * 24 * days[startMonth];
                                startMonth++;
                                startMonth = startMonth % 12;
                            }
                            break;
                    }
                    result.put(evaluateStar + "", res);
                }

                break;
            default:
                break;

        }

        return result;
    }

    @Override
    public Map<String, Integer> getEvaluateStatisticsByMonth() {
        Map<String, Integer> result = new LinkedHashMap<>();
        CallInfo filter = new CallInfo();
        Calendar c = Calendar.getInstance();
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.getActualMinimum(Calendar.DAY_OF_MONTH));
        Date startTime = c.getTime();
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.getActualMaximum(Calendar.DAY_OF_MONTH));
        Date endTime = c.getTime();
        filter.setCreateTime(startTime);
        filter.setEndTime(endTime);
        List<CallInfo> infos = mapper.getAllRecode(filter);
        int[] evaluateStars = {-1, 1, 2, 3, 4};
        for (int evaluateStar : evaluateStars) {
            int count = 0;
            for (CallInfo information : infos) {
                if (evaluateStar == information.getEvaluateStar()) {
                    count++;
                }
            }
            result.put(evaluateStar + "", count);
        }
        return result;
    }

    @Override
    public int getDateByRange(List<CallInfo> infos, String queueName, long startTime, long endTime) {
        int count = 0;
        for (CallInfo information : infos) {
            if (information.getCreateTime().getTime() >= startTime && information.getCreateTime().getTime() <= endTime && queueName.equals(information.getQueueName())) {
                count++;
            }
        }
        return count;
    }

    @Override
    public int getDateByRange(List<CallInfo> infos, int evaluateStar, long startTime, long endTime) {
        int count = 0;
        for (CallInfo information : infos) {
            if (information.getCreateTime().getTime() >= startTime && information.getCreateTime().getTime() <= endTime && evaluateStar == information.getEvaluateStar()) {
                count++;
            }
        }
        return count;
    }

    @Override
    public Map<String, Long> countByMonitors(List<Monitor> monitors, Integer type) {
        Map<String, Long> result = new HashMap<>();
        List<Map> maps = mapper.countByMonitors(monitors, type);
        for (Map<Object, Object> map : maps) {
            String monitorName = "";
            Long count = 0L;
            for (Map.Entry<Object, Object> entry : map.entrySet()) {
                if (entry.getKey().equals("monitorName")) {
                    monitorName = entry.getValue().toString();
                } else if (entry.getKey().equals("count")) {
                    count = Long.parseLong(entry.getValue().toString());
                }
            }
            result.put(monitorName, count);
        }
        return result;
    }

    @Override
    public Map<String, Long> countByMonitorsByTime(List<Monitor> monitors, Integer type, Date startTime, Date endTime) {
        Map<String, Long> result = new HashMap<>();
        List<Map> maps = mapper.countByMonitors(monitors, type);
        for (Map<Object, Object> map : maps) {
            String monitorName = "";
            Long count = 0L;
            for (Map.Entry<Object, Object> entry : map.entrySet()) {
                if (entry.getKey().equals("count")) {
                    count = Long.parseLong(entry.getValue().toString());
                } else if (entry.getKey().equals("monitorName")) {
                    monitorName = entry.getValue().toString();
                }
            }
            result.put(monitorName, count);
        }
        return result;
    }

    @Override
    public Map<String, Integer> getDataByDate() {
        CallInfo info = new CallInfo();
        int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        info.setCreateTime(getDateByPoor(days[new Date().getMonth()]));
        List<CallInfo> infos = mapper.getAllRecode(info);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Integer> map = new LinkedHashMap<>();
        for (int i = days[new Date().getMonth()]; i >= 0; i--) {
            if (infos.size() != 0) {
                for (CallInfo information : infos) {
                    if (ObjectUtils.isNotNull(information.getCreateTime())) {
                        Date date = information.getCreateTime();
                        if (df.format(date).equals(df.format(getDateByPoor(i)))) {
                            Integer count = map.get(df.format(date));
                            if (ObjectUtils.isNotNull(count)) {
                                count++;
                                map.put(df.format(date), count);
                            } else {
                                map.put(df.format(date), 1);
                            }
                        }
                    }
                }
            }
            if (map.get(df.format(getDateByPoor(i))) == null) {
                map.put(df.format(getDateByPoor(i)), 0);
            }

        }
        return map;
    }

    private Date getDateByPoor(int poor) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -poor);
        return cal.getTime();
    }

    @Override
    public List<CallInfo> selectLinkedCall(List<String> uniqueIds) {
        return mapper.selectLinkedCall(uniqueIds);
    }
}

