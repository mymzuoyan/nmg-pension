package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.*;
import com.fedtech.pension.elderly.entity.ElderlyAssessment;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.mapper.ElderlyMsgMapper;
import com.fedtech.pension.elderly.quantity.StatisticDataQuantity;
import com.fedtech.pension.elderly.redis.RedisTemplateUtil;
import com.fedtech.pension.elderly.vo.ElderlyMsgVo;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.SmsLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * 老人基础信息
 *
 * @author gengqiang
 */
@org.springframework.stereotype.Service
@Service(version = "1.0.0", interfaceClass = ElderlyMsgService.class, timeout = 5000, retries = 0)
public class ElderlyMsgServiceImpl extends BaseServiceImpl<ElderlyMsg> implements ElderlyMsgService {


    @Autowired
    private ElderlyMsgMapper elderlyMsgMapper;

    @Autowired
    private ElderlyGovBuyService elderlyGovBuyService;

    @Autowired
    private ElderlyAssessmentService elderlyAssessmentService;

    @Reference(version = "1.0.0")
    private SmsLogService smsLogService;

    @Reference(version = "1.0.0")
    private AreaService areaService;


    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    private IdcardValidator validator = null;

    @Override
    public BaseMapper<ElderlyMsg> getMapper() {
        return elderlyMsgMapper;
    }

    public void updateElderStatistic(ElderlyMsg record, Integer num) {
        Map<String, List<Long>> cache = (Map<String, List<Long>>) redisTemplateUtil.getHash(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE);
        for (String str : cache.keySet()) {
            if (record.getAreaName().contains(str)) {
                List<Long> counts = cache.get(str);
                counts.set(0, counts.get(0) + num);
                if (ObjectUtils.isNotNull(record.getEducationDictId())) {
                    counts.set(record.getEducationDictId(), counts.get(record.getEducationDictId()) + num);
                }
                cache.put(str, counts);
            }
        }
        redisTemplateUtil.setHash(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE, cache);
    }

    @Override
    public boolean updateByPrimaryKeySelective(ElderlyMsg record) {
        ElderlyMsg oleRecode = super.selectByPrimaryKey(record.getId());
        updateElderStatistic(oleRecode, -1);
        if (super.updateByPrimaryKeySelective(record)) {
            updateElderStatistic(record, 1);
            return true;
        }
        return false;
    }


    @Override
    public ElderlyMsg insertBackId(ElderlyMsg record) {
        record.setCreateTime(new Date());
        if (super.insert(record)) {
            //更新缓存
            updateElderStatistic(record, 1);
            return record;
        }
        return null;
    }

    @Override
    public boolean insert(ElderlyMsg record) {
        record.setCreateTime(new Date());
        if (super.insert(record)) {
            //更新缓存
            updateElderStatistic(record, 1);
            return true;
        }
        return false;
    }


    @Override
    public boolean deleteByPrimaryKey(Integer id) {
        ElderlyMsg oleRecode = super.selectByPrimaryKey(id);
        updateElderStatistic(oleRecode, -1);
        return super.deleteByPrimaryKey(id);
    }


    @Override
    public boolean deleteByPrimaryKey(Integer id, Integer userId) {
        ElderlyMsg oleRecode = super.selectByPrimaryKey(id);
        updateElderStatistic(oleRecode, -1);
        return super.deleteByPrimaryKey(id, userId);
    }


    @Override
    public ElderlyMsg selectByPrimaryKey(Integer id) {
        ElderlyMsg elderlyMsg = super.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(elderlyMsg)) {
            if (ObjectUtils.isNotNull(elderlyMsg.getAreaName())) {
                String areaName[] = elderlyMsg.getAreaName().split(",");
                if (areaName.length >= 2) {
                    elderlyMsg.setRegion1(elderlyMsg.getAreaName().split(",")[1]);
                }

                if (areaName.length >= 3) {
                    elderlyMsg.setRegion2(elderlyMsg.getAreaName().split(",")[2]);
                }

                if (areaName.length >= 4) {
                    elderlyMsg.setRegion3(elderlyMsg.getAreaName().split(",")[3]);
                }
            }
        }
        return elderlyMsg;
    }

    /**
     * 确认老人去世
     *
     * @param id
     * @return
     */
    @Override
    public boolean isDeadElder(Integer id) {
        ElderlyMsg elderlyMsg = super.selectByPrimaryKey(id);
        if (elderlyMsgMapper.isDeadElder(id)) {
            //更新缓存
            updateElderStatistic(elderlyMsg, -1);
            return true;
        }
        return false;
    }

    @Override
    public Integer selectByAreaId(Integer areaId) {
        return elderlyMsgMapper.selectByAreaId(areaId);
    }

    @Override
    public Integer selectCount() {
        return elderlyMsgMapper.selectCount();
    }

    @Override
    public boolean updateIsDeath(List<Integer> idList) {
        return elderlyMsgMapper.updateIsDeath(idList);
    }

    @Override
    public List<ElderlyMsg> selectByMsg(ElderlyMsg elderlyMsg) {
        return elderlyMsgMapper.selectByMsg(elderlyMsg);
    }

    @Override
    public List<ElderlyMsg> selectAll(ElderlyMsg elderlyMsg) {
        return elderlyMsgMapper.selectAll(elderlyMsg);
    }

    /**
     * 加载老人评分信息LIST
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @Override
    public PageResponse<ElderlyMsg> selectAssePageList(ElderlyMsg filter, PageRequest pageRequest, Map map) {
        PageResponse<ElderlyMsg> pageResponse = new PageResponse<ElderlyMsg>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setRecordsTotal(getMapper().countAll());
        pageResponse.setRecordsFiltered(getMapper().count(filter));
        pageResponse.setData(elderlyMsgMapper.selectAssePageList(filter, pageRequest, map));
        return pageResponse;
    }

    /**
     * 加载老人评估多次信息LIST
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @Override
    public PageResponse<ElderlyMsg> selectAsseAllPageList(ElderlyMsg filter, PageRequest pageRequest) {
        PageResponse<ElderlyMsg> pageResponse = new PageResponse<ElderlyMsg>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setRecordsTotal(elderlyMsgMapper.countAss(filter));
        pageResponse.setRecordsFiltered(elderlyMsgMapper.countAss(filter));
        pageResponse.setData(elderlyMsgMapper.selectAsseAllPageList(filter, pageRequest));
        return pageResponse;
    }

    /**
     * 老人户籍统计
     *
     * @return
     */
    @Override
    public Map<String, Integer> getStatisticsByArea(ElderlyMsg elderlyMsg) {
        Map<String, Integer> map = new LinkedHashMap<>();
        Map<String, List<Long>> cache = (Map<String, List<Long>>) redisTemplateUtil.getHash(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE);
        for (String in : cache.keySet()) {
            //map.keySet()返回的是所有key的值
            List<Long> counts = cache.get(in);//得到每个key多对用value的值
            map.put(in, counts.get(0).intValue());
        }
        return map;
    }

    /**
     * 政府购买统计
     *
     * @return
     */
    @Override
    public Map<String, Integer> getStatisticsByGovBuy(ElderlyGovBuy elderlyGovBuy) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        ElderlyMsg elderlyMsg = new ElderlyMsg();
        elderlyMsg.setAreaName(elderlyGovBuy.getAreaName());
        elderlyMsg.setServiceOrgId(elderlyGovBuy.getServiceOrgId());
        int allCount = getMapper().count(elderlyMsg);
        int govBuyCount = elderlyGovBuyService.count(elderlyGovBuy);
        map.put("非政府购买老人", allCount - govBuyCount);
        map.put("政府购买老人", govBuyCount);
        return map;
    }


    /**
     * 老人能力评估统计
     *
     * @return
     */
    @Override
    public Map<String, Integer> getStatisticsByAssess(ElderlyAssessment elderlyAssessment) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        List<ElderlyAssessment> elderlyAssessments = elderlyAssessmentService.getAllRecode(elderlyAssessment);
        int[] count = {0, 0, 0};
        for (ElderlyAssessment e : elderlyAssessments) {
            if (e.getResultDictId() != null) {
                switch (e.getResultDictId()) {
                    case 1:
                        count[0]++;//自理
                        break;
                    case 2:
                        count[2]++;//失能
                        break;
                    case 3:
                        count[1]++;//半失能
                        break;
                    default:

                }
            }
        }
        map.put("自理", count[0]);
        map.put("半失能", count[1]);
        map.put("失能", count[2]);
        return map;
    }

    @Override
    public ElderlyMsg selectByCardNo(String cardNo) {
        return elderlyMsgMapper.selectByCardNo(cardNo);
    }

    @Override
    public ElderlyMsg selectByCardNoForGold(String cardNo) {
        return elderlyMsgMapper.selectByCardNoForGold(cardNo);
    }

    @Override
    public int insertSomeElder(List<ElderlyMsg> elderlyMsgs) {
        int count = elderlyMsgMapper.insertSomeElder(elderlyMsgs);

        return count;
    }

    @Override
    public int updateSomeElder(List<ElderlyMsg> elderlyMsgs) {
        int count = elderlyMsgMapper.updateSomeElder(elderlyMsgs);
        return count;
    }

    @Override
    public List<ElderlyMsg> selectBySomeId(List<Integer> idList) {
        return elderlyMsgMapper.selectBySomeId(idList);
    }


    @Override
    public Map<String, Integer> getStatisticsByDate(ElderlyMsg filter, String startTime, String endTime) throws ParseException {
        List<ElderlyMsg> elderlyMsgs = elderlyMsgMapper.getAllRecode(filter);
        Map<String, Integer> result = new LinkedHashMap<>();
        SimpleDateFormat df = null;
        Integer count = 0;
        long start = 0;
        long end = 0;
        int startMonth = 0;
        int startYear = 0;
        int endMonth = 0;
        int endYear = 0;
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
            count += this.getCountByData(elderlyMsgs, start, start + 1000L * 60 * 60 * 24 * days[startMonth]);
            result.put(df.format(new Date(start)), count);
            start += 1000L * 60 * 60 * 24 * days[startMonth];
            startMonth++;
            startMonth = startMonth % 12;
        }
        return result;
    }

    public int getCountByData(List<ElderlyMsg> elderlyMsgs, long startTime, long endTime) {
        int count = 0;
        for (ElderlyMsg elderlyMsg : elderlyMsgs) {
            if (ObjectUtils.isNull(elderlyMsg.getCreateTime())) {
                //
            } else if (elderlyMsg.getCreateTime().getTime() >= startTime && elderlyMsg.getCreateTime().getTime() <= endTime)
                count++;
        }
        return count;
    }


    @Override
    public HashMap<String, List<Long>> getCountByAreaAndelderTypeDictIds(ElderlyMsg msg) {
        Integer allcount = getMapper().countAll();
        int page = allcount % 100000 == 0 ? allcount / 100000 : allcount / 100000 + 1;
        PageRequest pageRequest = new PageRequest();
        List<Area> areas = areaService.selectByParentId(1);
        HashMap<String, List<Long>> result = new LinkedHashMap<>();
        for (int i = 0; i < page; i++) {
            if (page > 1) {
                pageRequest.setLength(100000);
                pageRequest.setStart(i * 100000);
            }
            List<ElderlyMsg> elderlyMsgs = getMapper().selectPageList(msg, pageRequest);
            for (Area a : areas) {
                Long[] count = {0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L};
                for (ElderlyMsg e : elderlyMsgs) {
                    if (StringUtils.isEmpty(e.getAreaName())) {
                        continue;
                    }
                    if (e.getAreaName().indexOf(a.getName()) >= 0) {
                        String elderTypeDictIds = e.getElderTypeDictIds();
                        String abilityAssess = e.getAbilityAssess();
                        if (!StringUtils.isEmpty(elderTypeDictIds)) {
                            for (int j = 0; j < count.length; j++) {
                                if (elderTypeDictIds.contains(j + "")) {
                                    count[j]++;
                                }
                            }
                        }
                        //获取已评估老人数
                        if (!StringUtils.isEmpty(abilityAssess)) {
                            count[10]++;
                        }
                        count[0]++;
                    }
                }
                List<Long> counts = result.get(a.getName());
                if (!ObjectUtils.isNotNull(counts)) {
                    result.put(a.getName(), Arrays.asList(count));
                } else {
                    List<Long> b = new ArrayList<>();
                    for (int j = 0; j < counts.size(); j++) {
                        b.add(counts.get(j) + count[j]);
                    }
                    result.put(a.getName(), b);
                }
            }
        }
        return result;
    }

    @Override
    public HashMap<String, List<Long>> getCountByAreaAndelderTypeDictIds(Integer areaId) {
        Integer allcount = getMapper().countAll();
        int page = allcount % 100000 == 0 ? allcount / 100000 : allcount / 100000 + 1;
        PageRequest pageRequest = new PageRequest();
        Area area = areaService.selectByPrimaryKey(areaId);
        List<Area> areas = areaService.selectByParentId(areaId);
        areas.add(0, area);
        HashMap<String, List<Long>> result = new LinkedHashMap<>();
        for (int i = 0; i < page; i++) {
            if (page > 1) {
                pageRequest.setLength(100000);
                pageRequest.setStart(i * 100000);
            }
            List<ElderlyMsg> elderlyMsgs = getMapper().selectPageList(new ElderlyMsg(), pageRequest);
            for (Area a : areas) {
                Long[] count = {0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L};
                for (ElderlyMsg e : elderlyMsgs) {
                    if (StringUtils.isEmpty(e.getAreaName())) {
                        continue;
                    }
                    if (e.getAreaName().indexOf(a.getName()) >= 0) {
                        String elderTypeDictIds = e.getElderTypeDictIds();
                        String abilityAssess = e.getAbilityAssess();
                        if (!StringUtils.isEmpty(elderTypeDictIds)) {
                            for (int j = 0; j < count.length; j++) {
                                if (elderTypeDictIds.contains(j + "")) {
                                    count[j]++;
                                }
                            }
                        }
                        //获取已评估老人数
                        if (!StringUtils.isEmpty(abilityAssess)) {
                            count[10]++;
                        }
                        count[0]++;
                    }
                }
                List<Long> counts = result.get(a.getName());
                if (!ObjectUtils.isNotNull(counts)) {
                    result.put(a.getName(), Arrays.asList(count));
                } else {
                    List<Long> b = new ArrayList<>();
                    for (int j = 0; j < counts.size(); j++) {
                        b.add(counts.get(j) + count[j]);
                    }
                    result.put(a.getName(), b);
                }
            }
        }
        return result;
    }

    @Override
    public HashMap<String, List<Long>> getCountByAreaAndelderTypeDictIdsFromCache(ElderlyMsg elderlyMsg) {
        List<Area> areas = areaService.selectByParentId(1);
        LinkedHashMap<String, List<Long>> hashMap = new LinkedHashMap<>();
        HashMap cache = (HashMap<String, List<Long>>) redisTemplateUtil.getHash(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE);
        if (ObjectUtils.isNotNull(areas)) {
            for (Area a : areas) {
                hashMap.put(a.getName(), (List<Long>) cache.get(a.getName()));
            }
        }
        return hashMap;
    }

    @Override
    public HashMap<String, List<Long>> getCountByAreaAndAbilityAssess(ElderlyMsg elderlyMsg) {
        Integer allcount = getMapper().countAll();
        int page = allcount % 100000 == 0 ? allcount / 100000 : allcount / 100000 + 1;
        PageRequest pageRequest = new PageRequest();
        List<Area> areas = areaService.selectByParentId(1);
        HashMap<String, List<Long>> result = new LinkedHashMap<>();
        for (int i = 0; i < page; i++) {
            if (page > 1) {
                pageRequest.setLength(100000);
                pageRequest.setStart(i * 100000);
            }
            List<ElderlyMsg> elderlyMsgs = getMapper().selectPageList(elderlyMsg, pageRequest);
            for (Area a : areas) {
                Long[] count = {0L, 0L, 0L};
                for (ElderlyMsg e : elderlyMsgs) {
                    if (StringUtils.isEmpty(e.getAreaName())) {
                        continue;
                    }
                    if (e.getAreaName().indexOf(a.getName()) >= 0) {
                        String abilityAssess = e.getAbilityAssess();
                        if (!StringUtils.isEmpty(abilityAssess)) {
                            for (int j = 0; j < count.length; j++) {
                                if (abilityAssess.equals("1")) {
                                    count[j]++;
                                }
                            }
                            /*count[Integer.parseInt(elderTypeDictIds)]++;*/
                        }
                        count[0]++;
                    }
                }
                List<Long> counts = result.get(a.getName());
                if (!ObjectUtils.isNotNull(counts)) {
                    result.put(a.getName(), Arrays.asList(count));
                } else {
                    List<Long> b = new ArrayList<>();
                    for (int j = 0; j < counts.size(); j++) {
                        b.add(counts.get(j) + count[j]);
                    }
                    result.put(a.getName(), b);
                }
            }
        }
        return result;
    }

    @Override
    public List<Long> getCountByElderTypeDictIds(ElderlyMsg elderlyMsg) {
        List<Map<Object, Object>> data = elderlyMsgMapper.getCountByElderTypeDictIds(elderlyMsg);
        Long[] count = {0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L};
        for (Map<Object, Object> map : data) {
            if (map.containsKey("elderTypeDictId")) {
                count[Integer.parseInt(map.get("elderTypeDictId").toString())] = (Long) map.get("count");
            }
            count[0] += (Long) map.get("count");
        }
        return Arrays.asList(count);
    }


    @Override
    public Map<String, List<ElderlyMsg>> filterElderMes(InputStream file, ElderlyMsg filer) {
        BufferedReader reader = null;
        Map<String, List<ElderlyMsg>> elderlyMsgs = new HashMap<>();
        try {
            reader = new BufferedReader(new InputStreamReader(file, "GBK"));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
                if (line > 2) {
                    String[] strs = tempString.split("\\s+");
                    ElderlyMsg msg = new ElderlyMsg();
                    try {
                        msg.setAreaName(strs[0].replace("分局", "区"));
                        if (ObjectUtils.isNotNull(filer.getAreaName())) {
                            if (!filer.getAreaName().contains(msg.getAreaName()))
                                break;
                        }

                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：区域转化错误");
                    }
                    try {
                        msg.setElderName(strs[3]);
                        if (ObjectUtils.isNotNull(filer.getElderName())) {
                            if (!filer.getElderName().contains(msg.getElderName()))
                                break;
                        }
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：名称设置错误");
                    }
                    try {
                        msg.setIdcardno(strs[4]);
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：身份证设置错误");
                    }
                    try {
                        msg.setRealAddress(strs[5]);
                        if (ObjectUtils.isNotNull(filer.getRealAddress())) {
                            if (!filer.getRealAddress().contains(msg.getRealAddress()))
                                break;
                        }
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：地址设置错误");
                    }
                    try {
                        IdcardInfoExtractor IdcardInfoExtractor = new IdcardInfoExtractor(strs[4]);
                        msg.setAge(IdcardInfoExtractor.getAge());
                        msg.setSexDictId("男".equals(IdcardInfoExtractor.getGender()) ? 1 : 2);
                        if (ObjectUtils.isNotNull(filer.getStartAge())) {
                            if (filer.getStartAge() > msg.getAge()) {
                                break;
                            }
                        }
                        if (ObjectUtils.isNotNull(filer.getEndAge())) {
                            if (filer.getEndAge() < msg.getEndAge()) {
                                break;
                            }
                        }
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：年龄和性别设置错误");
                    }
                    if (ObjectUtils.isNotNull(elderlyMsgs.get(msg.getAreaName()))) {
                        List<ElderlyMsg> elderlyMsgs1 = elderlyMsgs.get(msg.getAreaName());
                        elderlyMsgs1.add(msg);
                        elderlyMsgs.put(msg.getAreaName(), elderlyMsgs1);
                    } else {
                        List<ElderlyMsg> elderlyMsgs1 = new ArrayList<>();
                        elderlyMsgs1.add(msg);
                        elderlyMsgs.put(msg.getAreaName(), elderlyMsgs1);
                    }
                }
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
        return elderlyMsgs;
    }


    @Override
    public boolean importElderMes(InputStream file) {
        boolean b = false;
        BufferedReader reader = null;
        List<ElderlyMsg> elderlyMsgs = new ArrayList<>();
        try {
            reader = new BufferedReader(new InputStreamReader(file, "GBK"));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
                if (line > 900002) {
                    String[] strs = tempString.split("\\s+");
                    ElderlyMsg msg = new ElderlyMsg();
                    try {
                        String areaName = strs[0].replace("分局", "区");
                        msg.setAreaName(areaName);
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：区域转化错误");
                    }
                    try {
                        msg.setElderName(strs[3]);
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：名称设置错误");
                    }
                    try {
                        msg.setIdcardno(strs[4]);
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：身份证设置错误");
                    }
                    try {
                        msg.setRealAddress(strs[5]);
                        if (!StringUtils.isEmpty(msg.getAreaName())) {
                            msg.setAreaOrder(AreaUtil.getAreaOrder(msg.getAreaName()));
//                            ElderMsgApiController.getAreaInfo(msg.getAreaName(), msg);
                            String code = msg.getDeptCode();
                            StringBuffer buffer = new StringBuffer(code);
                            if (code.length() < 12) {
                                for (int i = code.length(); i <= 11; i++) {
                                    buffer.append("0");
                                }
                                msg.setDeptCode(buffer.toString());
                            }
                        }
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：地址设置错误");
                    }
                    try {
                        IdcardInfoExtractor IdcardInfoExtractor = new IdcardInfoExtractor(strs[4]);
                        msg.setAge(IdcardInfoExtractor.getAge());
                        msg.setSexDictId("男".equals(IdcardInfoExtractor.getGender()) ? 1 : 2);
                    } catch (Exception e) {
                        System.out.println("错误行" + line + "原因：年龄和性别设置错误");
                    }
                    msg.setStatus(1);
                    msg.setCreateTime(new Date());
                    elderlyMsgs.add(msg);
                }
                line++;
                if (elderlyMsgs.size() == 5000) {
                    if (this.insertSomeElder(elderlyMsgs) > 0) {
                        elderlyMsgs.removeAll(elderlyMsgs);
                        b = true;
                    } else {
                    }
                }
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
        if (elderlyMsgs.size() > 0 && this.insertSomeElder(elderlyMsgs) > 0) {
            loadStatisticData();
            b = true;
        } else {
        }
        return b;
    }

    @Override
    public List<ElderlyMsg> getEldersByAge(Integer age) {
        return elderlyMsgMapper.getEldersByAge(age);
    }


    @Override
    public List<ElderlyMsgVo> selectGovBuyPageList(ElderlyMsg filter, PageRequest pageRequest) {
        return elderlyMsgMapper.selectGovBuyPageList(filter, pageRequest);
    }

    @Override
    public ElderlyMsgVo selectGovBuyByCardNo(String cardNo) {
        return elderlyMsgMapper.selectGovBuyByCardNo(cardNo);
    }

    @Override
    public ElderlyMsgVo selectGovBuyByPrimaryKey(Integer id) {
        return elderlyMsgMapper.selectGovBuyByPrimaryKey(id);
    }


    @Override
    public boolean sendMessageToElder(String message, String ip) {
        boolean b = false;
        List<ElderlyMsg> elderlyMsgs = new ArrayList<>();
        List<ElderlyMsg> lists = this.getEldersByAge(79);
        for (ElderlyMsg e : lists) {
            if (ObjectUtils.isNotNull(e.getMobile()) && ObjectUtils.isNotNull(e.getIdcardno())) {
                String idcardno = e.getIdcardno();
                String mobile = e.getMobile();
                validator = new IdcardValidator();
                try {
                    if (validator.isValidatedAllIdcard(idcardno)) {
                        if (idcardno.length() == 15) {
                            idcardno = validator.convertIdcarBy15bit(idcardno);
                        }
                        String birthday = idcardno.substring(6, 14);
                        Date birthdate = null;
                        birthdate = new SimpleDateFormat("yyyyMMdd")
                                .parse(birthday);
                        GregorianCalendar currentDay = new GregorianCalendar();
                        currentDay.setTime(birthdate);
                        GregorianCalendar nowDay = new GregorianCalendar();
                        nowDay.setTime(new Date());
                        //判断是一个月之内
                        if (currentDay.get(Calendar.MONTH) - nowDay.get(Calendar.MONTH) == 1 && currentDay.get(Calendar.DAY_OF_MONTH) - nowDay.get(Calendar.DAY_OF_MONTH) < 0 && ObjectUtils.isNotNull(mobile)) {
                            elderlyMsgs.add(e);
                        }
                    }
                } catch (ParseException e1) {
                    e1.printStackTrace();
                }

            }
        }
        if (ObjectUtils.isNotNull(elderlyMsgs)) {
//            String resultStr = smsLogService.sendTips(elderlyMsgs, message, ip);
            String resultStr = "";
            if (!"false".equals(resultStr)) {
                b = true;
            }
        }
        return b;
    }


    @Override
    public List<ElderlyMsg> getAddAndUpElder(ElderlyMsg filter) {
        List<ElderlyMsg> result = new ArrayList<>();
        List<ElderlyMsg> lists = new ArrayList<>();
        if (filter.getAge() == 0) {
            filter.setAge(79);
            lists.addAll(elderlyMsgMapper.getIdAndIdCardno(filter));
            filter.setAge(89);
            lists.addAll(elderlyMsgMapper.getIdAndIdCardno(filter));
            filter.setAge(99);
            lists.addAll(elderlyMsgMapper.getIdAndIdCardno(filter));
        } else {
            lists = elderlyMsgMapper.getIdAndIdCardno(filter);
        }
        for (ElderlyMsg e : lists) {
            if (ObjectUtils.isNotNull(e.getIdcardno())) {
                String idcardno = e.getIdcardno();
                validator = new IdcardValidator();
                try {
                    if (validator.isValidatedAllIdcard(idcardno)) {
                        if (idcardno.length() == 15) {
                            idcardno = validator.convertIdcarBy15bit(idcardno);
                        }
                        String birthday = idcardno.substring(6, 14);
                        Date birthdate = null;
                        birthdate = new SimpleDateFormat("yyyyMMdd")
                                .parse(birthday);
                        GregorianCalendar currentDay = new GregorianCalendar();
                        currentDay.setTime(birthdate);
                        GregorianCalendar nowDay = new GregorianCalendar();
                        nowDay.setTime(new Date());
                        //判断是一个月之内
                        if (DateUtils.getPreMonth() - currentDay.get(Calendar.MONTH) == 2) {
                            result.add(e);
                        }
                    }
                } catch (ParseException e1) {
                    e1.printStackTrace();
                }

            }
        }
        return result;
    }

    @Override
    public Map<String, List<Integer>> getAddAndUpElderInfo() {
        Map<String, List<Integer>> result = new HashMap<>();
        ElderlyMsg filter = new ElderlyMsg();
        filter.setAge(79);
        List<ElderlyMsg> elderlyMsgs = this.getAddAndUpElder(filter);
        filter.setAge(89);
        if (ObjectUtils.isNotNull(elderlyMsgs)) {
            elderlyMsgs.addAll(this.getAddAndUpElder(filter));
        } else {
            elderlyMsgs = this.getAddAndUpElder(filter);
        }
        filter.setAge(99);
        if (ObjectUtils.isNotNull(elderlyMsgs)) {
            elderlyMsgs.addAll(this.getAddAndUpElder(filter));
        } else {
            elderlyMsgs = this.getAddAndUpElder(filter);
        }
        for (ElderlyMsg msg : elderlyMsgs) {
            String areaName = msg.getAreaName();
            if (ObjectUtils.isNotNull(areaName)) {
                int flag = 0;
                if (areaName.split(",").length > 1) {
                    flag = 1;
                }
                List<Integer> countList = result.get(areaName.split(",")[flag]);
                Integer[] counts = {0, 0, 0};
                if (countList != null) {
                    counts = countList.toArray(counts);
                }
                if (ObjectUtils.isNotNull(msg.getAge())) {
                    switch (msg.getAge()) {
                        case 79:
                            counts[0]++;
                            break;
                        case 89:
                            counts[1]++;
                            break;
                        case 99:
                            counts[2]++;
                            break;
                    }
                }
                countList = Arrays.asList(counts);
                result.put(areaName.split(",")[flag], countList);
            }
        }
        return result;
    }

    @Override
    public boolean sendMessageToElders(List<ElderlyMsg> lists, String message, String ip) {
        boolean b = false;
        List<ElderlyMsg> result = new ArrayList<>();
        for (ElderlyMsg e : lists) {
            if (ObjectUtils.isNotNull(e.getMobile()) && ObjectUtils.isNotNull(e.getIdcardno())) {
                result.add(e);
            }
        }
        if (ObjectUtils.isNotNull(result)) {
//            smsLogService.sendTips(result, message, ip);
            b = true;
        }
        return b;
    }

    @Override
    public String findNameByIdcardno(String idcardno) {
        return elderlyMsgMapper.findNameByIdcardno(idcardno);
    }

    @Override
    public List<ElderlyMsg> exportLowInsuranceElderly(ElderlyMsg elderlyMsg) {
        return elderlyMsgMapper.exportLowInsuranceElderly(elderlyMsg);
    }

    @Override
    public List<ElderlyMsg> exportDeathElderly() {
        return elderlyMsgMapper.exportDeathElderly();
    }


    @Override
    public Map selectByQrCoder(String qrCoder) {
        return elderlyMsgMapper.selectByQrCoder(qrCoder);
    }

    @Override
    public PageResponse<ElderlyMsg> selectPageServiceList(ElderlyMsg filter, PageRequest pageRequest) {
        PageResponse<ElderlyMsg> pageResponse = new PageResponse<ElderlyMsg>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(elderlyMsgMapper.selectPageServiceList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(elderlyMsgMapper.serviceCount(filter));
        return pageResponse;
    }

    @Override
    public ElderlyMsg selectByNameAndCardNo(String idcardno, String elderName) {
        return elderlyMsgMapper.selectByNameAndCardNo(idcardno, elderName);
    }

    @Override
    public List<ElderlyMsg> getAllBirth(String birthDay) {
        return elderlyMsgMapper.getAllBirth(birthDay);
    }

    @Override
    public ElderlyMsg findByHelpCardNo(String helpCardNo) {
        return elderlyMsgMapper.findByHelpCardNo(helpCardNo);
    }

    @Override
    public boolean updateHelpCardNoByIdcardno(String helpCardNo, String idcardno) {
        return elderlyMsgMapper.updateHelpCardNoByIdcardno(helpCardNo, idcardno) > 0;
    }

    @Override
    public ElderlyMsg selectByPhone(String phone) {
        return elderlyMsgMapper.selectByPhone(phone);
    }

    @Override
    public ElderlyMsg selectElderByCardNo(String idcardno) {
        return elderlyMsgMapper.selectElderByCardNo(idcardno);
    }

    @Override
    public int insertBatch(List<ElderlyMsg> elderlyMsgs) {
        return elderlyMsgMapper.insertBatch(elderlyMsgs);
    }



    public void loadStatisticData() {
        redisTemplateUtil.delete(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE);
        redisTemplateUtil.setHash(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE, this.getCountByAreaAndelderTypeDictIds(new ElderlyMsg()));
    }
}
