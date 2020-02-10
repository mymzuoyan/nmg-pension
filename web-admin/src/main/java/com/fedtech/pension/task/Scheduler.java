package com.fedtech.pension.task;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.pension.controller.admin.lovebracelet.LoveBraceletApiController;
import com.fedtech.pension.nurse.entity.NurseAlarm;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;
import com.fedtech.pension.nurse.service.NurseAlarmService;
import com.fedtech.pension.nurse.service.ServiceOrgNurseElderlyService;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *  create by liun
 *  2018/3/20
 */
public class Scheduler {

    @Autowired
    private ServiceOrgNurseElderlyService serviceOrgNurseElderlyService;

    @Autowired
    private NurseAlarmService nurseAlarmService;

    /**
     * 获取实时心律数据，将其插入到t_nurse_alarm表中
     * 后期以signType = 99 取相关手环数据
     */
    public void realHeartRhythmTask() {
        //以当前时间进行查询
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        final String ts = time.split(" ")[0]+"T"+time.split(" ")[1];
        LoveBraceletApiController loveBraceletApiController = new LoveBraceletApiController();
        //获取数据库中的设备id
        ServiceOrgNurseElderly serviceOrgNurseElderly = new ServiceOrgNurseElderly();
        serviceOrgNurseElderly.setDeviceName("手环");
        List<ServiceOrgNurseElderly> serviceOrgNurseElderlyList =  serviceOrgNurseElderlyService.getAllRecode(serviceOrgNurseElderly);
        serviceOrgNurseElderlyList.stream().filter(elderly -> !StringUtils.isEmpty(elderly.getDeviceNumber())).map(ServiceOrgNurseElderly::getDeviceNumber).forEach(id->{
            //根据id获取心律数据
            JsonResult jsonResult = loveBraceletApiController.getRealHeartRhythm(id,ts);
            //插入数据
            List<Map<String,String>> result = (List<Map<String,String>>)jsonResult.getData();
            NurseAlarm nurseAlarm = new NurseAlarm();
            nurseAlarm.setNumber(id);//id
            nurseAlarm.setAlarmType("体征告警");
            nurseAlarm.setSignType(99);//标识手环心律数据
            if(result != null && result.size()>0){
                Map<String,String> res = result.get(0);
                nurseAlarm.setSignResult(String.valueOf(res.get("rate")));//心律
                nurseAlarm.setAlarmTime(new Date(Long.parseLong(String.valueOf(res.get("rate")))));
            }else {
                nurseAlarm.setSignResult("0");//心律
            }
            nurseAlarm.setCreateTime(Calendar.getInstance().getTime());
            nurseAlarmService.insert(nurseAlarm);
        });
    }
}
