package com.fedtech.pension.datadock.api.lian;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.LiAnResult;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.entity.LiAnElderly;
import com.fedtech.entity.LiAnNurseRequest;
import com.fedtech.pension.datadock.api.MyValidateApiController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.nurse.entity.NurseElderly;
import com.fedtech.pension.nurse.entity.NurseRequest;
import com.fedtech.pension.nurse.service.*;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserLog;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserLogService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
@Controller
@RequestMapping("api/lian/")
public class LiAnApiController {


    private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    @Reference(version = "1.0.0")
    private UserLogService userLogService;

    @Reference(version = "1.0.0")
    private NurseElderlyService nurseElderlyService;


    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private BloodPressureService bloodPressureService;

    @Reference(version = "1.0.0")
    private BloodSugarService bloodSugarService;

    @Reference(version = "1.0.0")
    private BodyWeightService bodyWeightService;

    @Reference(version = "1.0.0")
    private BloodFatService bloodFatService;

    @Reference(version = "1.0.0")
    private SerumUricAcidService serumUricAcidService;

    @Reference(version = "1.0.0")
    private BloodOxygenService bloodOxygenService;

    @Reference(version = "1.0.0")
    private EcgService ecgService;

    @Reference(version = "1.0.0")
    private RespiratoryRateService respiratoryRateService;

    @Reference(version = "1.0.0")
    private MentalIndexService mentalIndexService;

    @Reference(version = "1.0.0")
    private BodyIndexService bodyIndexService;

    @Reference(version = "1.0.0")
    private SkinIndexService skinIndexService;

    @Reference(version = "1.0.0")
    private TemperatureService temperatureService;

    @Reference(version = "1.0.0")
    private NurseRequestService nurseRequestService;


    @Value("${lian-api-user}")
    private String liAnUserId;

    /**
     * 推送老人数据
     *
     * @param liAnElderly
     * @param request
     * @return
     */
    @RequestMapping(value = "saveElderly")
    @ResponseBody
    private LiAnResult saveElderly(@RequestBody LiAnElderly liAnElderly, HttpServletRequest request) {
        //添加老人数据
        UserLog userLog = new UserLog();
        userLog.setAction(JacksonUtil.bean2Json(liAnElderly));
        userLog.setCreateTime(new Date());
        userLog.setIp(request.getRemoteAddr());
        userLog.setUid(Integer.parseInt(liAnUserId));
        userLog.setDescription("添加老人数据");
        userLogService.insert(userLog);


        try {
            NurseElderly nurseElderly = nurseElderlyService.findByMemberId(liAnElderly.getMemberID());
            if (ObjectUtils.isNull(nurseElderly)) {
                nurseElderly = new NurseElderly();
            }
            nurseElderly.setDeviceSid(liAnElderly.getDeviceSid());
            nurseElderly.setMemberId(liAnElderly.getMemberID());
            nurseElderly.setElderName(liAnElderly.getName());
            nurseElderly.setIdcardno(liAnElderly.getIdCardNo());
            nurseElderly.setPhone(liAnElderly.getPhone());
            nurseElderly.setCreateTime(new Date());
            if (nurseElderly.getId() != null) {
                nurseElderlyService.updateByPrimaryKeySelective(nurseElderly);
            } else {
                nurseElderlyService.insert(nurseElderly);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return LiAnResult.ok().message("注册成功");

    }

    /**
     * 推送健康数据
     *
     * @param liAnNurseRequest
     * @return
     */
    @RequestMapping(value = "/sendHealthData", method = RequestMethod.POST)
    @ResponseBody
    public LiAnResult sendHealthData(@RequestBody LiAnNurseRequest liAnNurseRequest, HttpServletRequest servletRequest) {
        //添加老人数据
        UserLog userLog = new UserLog();
        userLog.setAction(JacksonUtil.bean2Json(liAnNurseRequest));
        userLog.setCreateTime(new Date());
        userLog.setIp(servletRequest.getRemoteAddr());
        userLog.setUid(Integer.parseInt(liAnUserId));
        userLog.setDescription("推送健康数据");
        userLogService.insert(userLog);

        //时间
        String time = liAnNurseRequest.getTestTime();
        try {
            df.parse(time);
        } catch (Exception e) {
            return LiAnResult.error("1", "时间格式不对 例：yyyy-MM-dd HH:mm:ss");

        }
        NurseRequest nurseRequest = toNurseRequest(liAnNurseRequest);

        User creator = new User();
        creator.setUid(Integer.parseInt(liAnUserId));
        nurseRequest.setCreator(creator);
        nurseRequest.setCreateTime(new Date());
        JSONObject request = (JSONObject) JSONObject.parse(JacksonUtil.bean2Json(nurseRequest.getBody()));
        if (nurseRequest.getType() == 1) {
            Double highValue = Double.valueOf(request.getDouble("highValue"));
            Double lowValue = Double.valueOf(request.getDouble("lowValue"));
            nurseRequest.setResult("血压：收缩压：" + highValue + "mmHg, 舒张压：" + lowValue + "mmHg");
            if ((bloodPressureService.insertBloodPressure(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 2) {
            Double sugarValue = Double.valueOf(request.getDouble("sugarValue"));
            nurseRequest.setResult("血糖：" + sugarValue + "mmol/L ");
            if ((bloodSugarService.insertBloodSugar(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 3) {
            Double hightVlaue = Double.valueOf(request.getDouble("hightVlaue"));
            Double weightValue = Double.valueOf(request.getDouble("weightValue"));
            nurseRequest.setResult("身高：" + hightVlaue + "m, 体重：" + weightValue + "kg");
            if ((bodyWeightService.insertBodyWeight(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 4) {
        } else if (nurseRequest.getType() == 5) {
        } else if (nurseRequest.getType() == 6) {
            if ((bodyIndexService.bodyAddJson(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 7) {
            if (bloodFatService.insertBloodFat(request) > 0) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 8) {
            Integer buaValue = Integer.valueOf(request.getInteger("buaValue"));
            nurseRequest.setResult("血尿酸值：" + buaValue + "μmol/L ");
            if ((serumUricAcidService.serumUricAcid2Json(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 9) {
            Integer spoValue = Integer.valueOf(request.getInteger("spoValue"));
            nurseRequest.setResult("血氧：" + spoValue + "%");
            if ((bloodOxygenService.bloodOxygen2Json(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 10) {
            Integer heartRate = Integer.valueOf(request.getInteger("heartRate"));
            nurseRequest.setResult("心率：" + heartRate + "次/分");
            if ((ecgService.ecg2Json(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 11) {
            Double breathFreq = Double.valueOf(request.getDouble("breathFreq"));
            nurseRequest.setResult("呼吸率：" + breathFreq + "%");
            if ((respiratoryRateService.respiratoryRate2Json(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 12) {
            if ((mentalIndexService.mentalAddJson(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 13) {
            Double waterPercent = Double.valueOf(request.getDouble("waterPercent"));
            nurseRequest.setResult("水分百分比：" + waterPercent + "%");
            if ((skinIndexService.skinAddJson(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        } else if (nurseRequest.getType() == 14) {
            Double bodyTemperature = Double.valueOf(request.getDouble("bodyTemperature"));
            nurseRequest.setResult("体温：" + bodyTemperature + "℃");
            if ((temperatureService.temAddJson(request) > 0) && (nurseRequestService.insert(nurseRequest))) {
                return LiAnResult.ok().message("新增成功!");
            } else {
                return LiAnResult.error("1", "新增失败！");
            }
        }
        return LiAnResult.error("1", "新增失败！");
    }


    public NurseRequest toNurseRequest(LiAnNurseRequest liAnNurseRequest) {
        NurseRequest nurseRequest = new NurseRequest();
        nurseRequest.setRecordId(liAnNurseRequest.getTestRecordID());
        try {
            NurseElderly nurseElderly = nurseElderlyService.findByMemberId(liAnNurseRequest.getMemberID());
            nurseRequest.setElderId(nurseElderly.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        nurseRequest.setTime(liAnNurseRequest.getTestTime());
        nurseRequest.setType(liAnNurseRequest.getTestType());
        nurseRequest.setCollectType(liAnNurseRequest.getCollectType());
        nurseRequest.setDeviceSid(liAnNurseRequest.getDeviceSid());
        nurseRequest.setBody(liAnNurseRequest.getTestBody());
        return nurseRequest;
    }


}
