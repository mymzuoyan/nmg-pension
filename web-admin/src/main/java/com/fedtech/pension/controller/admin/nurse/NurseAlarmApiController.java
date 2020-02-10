package com.fedtech.pension.controller.admin.nurse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.DateUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderLinkMan;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderLinkManService;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.nurse.entity.NurseAlarm;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;
import com.fedtech.pension.nurse.service.NurseAlarmService;
import com.fedtech.pension.nurse.service.ServiceOrgNurseElderlyService;
import com.fedtech.pension.redis.RedisCacheUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author gengqiang
 * @date 2017/8/23
 */
@Controller
@RequestMapping("/admin/api/nurse/alarm/")
public class NurseAlarmApiController extends BaseController {

    @Reference(version = "1.0.0")
    private NurseAlarmService nurseAlarmService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private ServiceOrgNurseElderlyService serviceOrgNurseElderlyService;

    @Reference(version = "1.0.0")
    private ElderLinkManService elderLinkManService;

    @Autowired
    private RedisCacheUtils redisCacheUtils;

    /**
     * 获取警告列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<NurseAlarm> list(NurseAlarm filter, PageRequest pageRequest) {
        PageResponse<NurseAlarm> nurseAlarmPageResponse = nurseAlarmService.selectPageList(filter, pageRequest);
        return nurseAlarmPageResponse;
    }

    @RequestMapping("listBraceletHistory")
    @ResponseBody
    public PageResponse<NurseAlarm> listBraceletHistory(NurseAlarm filter, PageRequest pageRequest, HttpServletRequest request) {

        //处理日期时间过滤
        String startDateString = request.getParameter("startTimeString");
        String endDateString = request.getParameter("endTimeString");
        if(!StringUtils.isEmpty(startDateString)){
            Date startDate = DateUtils.parseDate(startDateString);
            filter.setStartTime(startDate);
        }
        if(!StringUtils.isEmpty(endDateString)){
            Date endDate = DateUtils.parseDate(endDateString);
            filter.setEndTime(endDate);
        }
        //只处理手环信息
        filter.setSignType(99);
        filter.setAlarmType("爱心手环");
        filter.setGx("hrm_reg_locOrhrm_abnor_loc");
        return nurseAlarmService.selectPageList(filter, pageRequest);
    }


    @RequestMapping("listHistoryByNumber")
    @ResponseBody
    public PageResponse<NurseAlarm> listHistoryByNumber(NurseAlarm filter, PageRequest pageRequest, HttpServletRequest request) {

        //处理日期时间过滤
        String startDateString = request.getParameter("startTimeString");
        String endDateString = request.getParameter("endTimeString");
        if(!StringUtils.isEmpty(startDateString)){
            Date startDate = DateUtils.parseDate(startDateString);
            filter.setStartTime(startDate);
        }
        if(!StringUtils.isEmpty(endDateString)){
            Date endDate = DateUtils.parseDate(endDateString);
            filter.setEndTime(endDate);
        }
        PageResponse<NurseAlarm> pageResponse = new PageResponse<>();
        String braceletNumber = request.getParameter("braceletNumber");
        if(StringUtils.isEmpty(braceletNumber)){
            pageResponse.setError("手环ID为空，请检查原因！");
        }
        Map<String,List<NurseAlarm>> cacheList = (Map<String,List<NurseAlarm>>)redisCacheUtils.getHash("LOVE_BRACELET_LOCATION_RATE_CACHE");
        List<NurseAlarm> nurseAlarms = null;
        if(cacheList.containsKey(braceletNumber)){
            nurseAlarms = cacheList.get(braceletNumber);
        }
        List<NurseAlarm> result = new ArrayList<>();
        if(nurseAlarms != null && nurseAlarms.size()>0){
            result = nurseAlarms.stream().filter(nurseAlarm -> isEnable(nurseAlarm,filter)).collect(Collectors.toList());
        }
        //只处理手环信息
        filter.setNumber(braceletNumber);
        filter.setSignType(99);
        filter.setAlarmType("爱心手环");
//        filter.setGx("hrm_reg_locOrhrm_abnor_loc");
        if(pageRequest.getStart()==0){//需要查询缓存
            pageRequest.setLength(10-result.size());
        }else{
            pageRequest.setStart(pageRequest.getStart()-result.size());
        }
        PageResponse<NurseAlarm> page = nurseAlarmService.selectPageList(filter, pageRequest);
        pageResponse.setRecordsFiltered(result.size()+page.getRecordsFiltered());
        pageResponse.setRecordsTotal(result.size()+page.getRecordsFiltered());
        result.addAll(page.getData());
        if(pageRequest.getStart()==0){//需要查询缓存
            pageResponse.setData(result);
        }else{
            pageResponse.setData(page.getData());
        }
        return pageResponse;
    }



    /**
     * 获取爱心手环推送消息经纬度和心律
     * @author liun
     * @date 2018/4/11
     *
     */
    @RequestMapping("getBraceletDataList")
    @ResponseBody
    public PageResponse<NurseAlarm> getBraceletDataList(HttpServletRequest request,NurseAlarm filter){
        String length = request.getParameter("length");
        String start = request.getParameter("start");
        PageResponse<NurseAlarm> pageResponse = new PageResponse<>();
        Map<String,Object> resultMap = new HashMap<>();
        List<NurseAlarm> result = new ArrayList<>();
        try {
            List<NurseAlarm> nurseAlarmList = null;
            NurseAlarm nurseAlarm = null;
            Map<String,List<NurseAlarm>> cacheList = (Map<String,List<NurseAlarm>>)redisCacheUtils.getHash("LOVE_BRACELET_LOCATION_RATE_CACHE");
            cacheList = sortMapByKey(cacheList);
            for (Map.Entry<String,List<NurseAlarm>> entry : cacheList.entrySet()) {
                nurseAlarmList = entry.getValue();
                if(nurseAlarmList != null && nurseAlarmList.size()>0){
                    nurseAlarm = nurseAlarmList.stream().sorted(Comparator.comparing(NurseAlarm::getCreateTime).reversed()).findFirst().orElse(null);
                    if(nurseAlarm.getFenceType() != null && nurseAlarm.getFenceType().equals("auto_loc")){
                        //将缓存最近一条心律信息赋值并返回(缓存没有不返回)
                        NurseAlarm nAlarm = nurseAlarmList.stream().filter(nurse->nurse.getFenceType().equals("hrm_reg_loc")||nurse.getFenceType().equals("hrm_abnor_loc")).sorted(Comparator.comparing(NurseAlarm::getCreateTime).reversed()).findFirst().orElse(null);
                        if(nAlarm != null && nAlarm.getSignResult() != null){
                            nurseAlarm.setSignResult(nAlarm.getSignResult());
                        }
                    }
                    if(nurseAlarm != null){
                        if(nurseAlarm.getNumber() != null){
                            selectByEntity(nurseAlarm);
                            //过滤数据
                            if(isEnable(nurseAlarm,filter)){
                                result.add(nurseAlarm);
                            }
                        }
                    }
                }
            }
            pageResponse.setRecordsFiltered(result.size());
            pageResponse.setRecordsTotal(result.size());
            pageResponse.setData(subList(length,start,result));
        }catch (Exception ex){
            ex.printStackTrace();
            pageResponse.setError("获取失败！");
        }
        return pageResponse;
    }

    /**
     * 截取指定长度
     */
    public List<NurseAlarm> subList(String length,String start,List<NurseAlarm> list){
        if(StringUtils.isEmpty(length) || StringUtils.isEmpty(start) ){
            return  list;
        }
        Integer pageNumber = Integer.parseInt(start);
        Integer pageSize =Integer.parseInt(length);
        if(pageNumber+pageSize >= list.size()){
            list = list.subList(pageNumber,list.size());
            return  list;
        }
        list = list.subList(pageNumber,pageNumber+pageSize);
        return  list;
    }
    /**
     *根据key排序
     */
    public Map<String,List<NurseAlarm>> sortMapByKey(Map<String,List<NurseAlarm>> map){
        if (map == null || map.isEmpty()) {
            return null;
        }
        Map<String, List<NurseAlarm>> sortMap = new TreeMap<>((nurse1,nurse2)->nurse1.compareTo(nurse2));
        sortMap.putAll(map);
        return sortMap;
    }
    //过滤数据
    public boolean isEnable(NurseAlarm nurseAlarm,NurseAlarm filter){
        boolean enable = true;
        if(!StringUtils.isEmpty(filter.getNumber())){
            if(!StringUtils.isEmpty(nurseAlarm.getNumber())){
                if(nurseAlarm.getNumber().indexOf(filter.getNumber())<0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(!StringUtils.isEmpty(filter.getElderName())){
            if(!StringUtils.isEmpty(nurseAlarm.getElderName())){
                if(nurseAlarm.getElderName().indexOf(filter.getElderName())<0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(!StringUtils.isEmpty(filter.getBuilding())){
            if(!StringUtils.isEmpty(nurseAlarm.getBuilding())){
                if(nurseAlarm.getBuilding().indexOf(filter.getBuilding())<0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(!StringUtils.isEmpty(filter.getFloor())){
            if(!StringUtils.isEmpty(nurseAlarm.getFloor())){
                if(nurseAlarm.getFloor().indexOf(filter.getFloor())<0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(!StringUtils.isEmpty(filter.getJhrXm())){
            if(!StringUtils.isEmpty(nurseAlarm.getJhrXm())){
                if(nurseAlarm.getJhrXm().indexOf(filter.getJhrXm())<0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(!StringUtils.isEmpty(filter.getJhrPhone())){
            if(!StringUtils.isEmpty(nurseAlarm.getJhrPhone())){
                if(nurseAlarm.getJhrPhone().indexOf(filter.getJhrPhone())<0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(filter.getStartTime() != null){
            if(nurseAlarm.getAlarmTime() != null){
                if(filter.getStartTime().compareTo(nurseAlarm.getAlarmTime())>0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(filter.getEndTime() != null){
            if(nurseAlarm.getAlarmTime() != null){
                if(filter.getEndTime().compareTo(nurseAlarm.getAlarmTime())<0){
                    enable = false;
                }
            }else {
                enable = false;
            }
        }
        if(!enable){
            return  enable;
        }
        return enable;
    }


    public NurseAlarm selectByEntity(NurseAlarm nurseAlarm){
        //查询老人信息
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(nurseAlarm.getElderId());
        if(elderlyMsg != null){
            nurseAlarm.setElderName(elderlyMsg.getElderName());
        }
        //查询电话信息
        ServiceOrgNurseElderly serviceOrgNurseElderly = new ServiceOrgNurseElderly();
        serviceOrgNurseElderly.setDeviceNumber(nurseAlarm.getNumber());
        List<ServiceOrgNurseElderly> list = serviceOrgNurseElderlyService.getAllRecode(serviceOrgNurseElderly);
        if(list !=null && list.size()>0){
            serviceOrgNurseElderly = list.get(0);
        }
        if(serviceOrgNurseElderly != null){
            nurseAlarm.setFloor(serviceOrgNurseElderly.getDeviceMobile());
        }
        //查询监护人信息
        ElderLinkMan elderLinkMan = new ElderLinkMan();
        elderLinkMan.setElderId(nurseAlarm.getElderId());
        List<ElderLinkMan> elderLinkManList = elderLinkManService.getAllRecode(elderLinkMan);
        if(elderLinkManList != null && elderLinkManList.size()>0){
            nurseAlarm.setJhrXm(elderLinkManList.get(0).getLinkName());
            nurseAlarm.setGx(elderLinkManList.get(0).getRelationship());
            nurseAlarm.setJhrPhone(elderLinkManList.get(0).getLinkTel());
        }
        return nurseAlarm;
    }
    /**
     * 根据手环id获取手环轨迹
     * @return
     */
    @RequestMapping("getOrbitByBraceletId")
    @ResponseBody
    public JsonResult getOrbitByBraceletId(String braceletId){
        JsonResult jsonResult = new JsonResult();
        try{
            if(StringUtils.isEmpty(braceletId)){
                jsonResult.markError("手环ID为空，请检查原因！");
                return jsonResult;
            }
            Map<String,List<NurseAlarm>> cacheList = (Map<String,List<NurseAlarm>>)redisCacheUtils.getHash("LOVE_BRACELET_LOCATION_RATE_CACHE");
            if(cacheList.containsKey(braceletId)){
                List<NurseAlarm> nurseAlarms = cacheList.get(braceletId);
                //按告警时间正序排列
                if(nurseAlarms != null && nurseAlarms.size()>0){
                    nurseAlarms = nurseAlarms.stream().sorted(Comparator.comparing(NurseAlarm::getAlarmTime)).collect(Collectors.toList());
                }else {
                    nurseAlarms = new ArrayList<>();
                }
                NurseAlarm nurseAlarm = null;
                if(nurseAlarms != null && nurseAlarms.size()>0){
                    nurseAlarm = nurseAlarms.get(0);
                    selectByEntity(nurseAlarm);
                }
                List<NurseAlarm> resultList = new ArrayList<>();
                for(NurseAlarm nurse : nurseAlarms){
                    nurse.setElderName(nurseAlarm.getElderName());
                    nurse.setJhrPhone(nurseAlarm.getJhrPhone());
                    nurse.setJhrXm(nurseAlarm.getJhrXm());
                    nurse.setGx(nurseAlarm.getGx());
                    nurse.setFloor(nurseAlarm.getFloor());
                    resultList.add(nurse);
                }
                jsonResult.setData(resultList);
            }
            jsonResult.markError("获取成功！");
        }catch (Exception ex){
            ex.printStackTrace();
            jsonResult.markError("获取失败！");
        }
        return jsonResult;
    }


    /**
     * 获取警告类型数量
     *
     * @return
     */
    @RequestMapping("getAlarmTypeCount")
    @ResponseBody
    public Map<String, Map<String, Integer>> getAlarmTypeCount() {
        Map<String, Map<String, Integer>> result = new HashMap<>();
        NurseAlarm filter = new NurseAlarm();
        Map<String, Integer> all = nurseAlarmService.getCountByType(filter);
        result.put("all", all);
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        filter.setStartTime(calendar.getTime());
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        filter.setEndTime(calendar.getTime());
        result.put("today", nurseAlarmService.getCountByType(filter));
        return result;
    }
}
