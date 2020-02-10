package com.fedtech.pension.datadock.api.nurse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.entity.LiAnNurseRequest;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.nurse.entity.*;
import com.fedtech.pension.nurse.service.*;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserLog;
import com.fedtech.pension.sys.service.UserLogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @author miaoyueming
 * @date 2019/6/26
 */
@Controller
@RequestMapping("/api/")
public class NurseApiController {

    private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Reference(version = "1.0.0")
    private UserLogService userLogService;

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
    private NurseElderlyService nurseElderlyService;

    @Reference(version = "1.0.0")
    private NurseRequestService nurseRequestService;

    /**
     * 推送健康数据
     *
     * @param nurseRequest
     * @return
     */
    @RequestMapping(value = "/sendHealthData", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendHealthData(@RequestBody NurseRequest nurseRequest, HttpServletRequest servletRequest) {
        AppResult result = new AppResult();
        String userId = servletRequest.getHeader("userId");
        //添加老人数据
        UserLog userLog = new UserLog();
        userLog.setAction(JacksonUtil.bean2Json(nurseRequest));
        userLog.setCreateTime(new Date());
        userLog.setIp(servletRequest.getRemoteAddr());
        userLog.setUid(Integer.parseInt(userId));
        userLog.setDescription("推送健康数据");
        userLogService.insert(userLog);

        //判断是否已存在
        if (ObjectUtils.isNotNull(nurseRequest.getIdcardno())) {
            NurseElderly nurseElderly = nurseElderlyService.findByIdcardNo(nurseRequest.getIdcardno());
            if (!ObjectUtils.isNotNull(nurseElderly)) {
                result.markError("该老人不存在");
                return result;
            }
            nurseRequest.setElderId(nurseElderly.getId());
        } else {
            result.markError("身份证不可为空");
            return result;
        }
        //时间
        String time = nurseRequest.getTime();
        try {
            df.parse(time);
        } catch (Exception e) {
            result.markError("时间格式不对 例：yyyy-MM-dd HH:mm:ss");
            return result;
        }

        User creator = new User();
        creator.setUid(Integer.parseInt(userId));
        nurseRequest.setCreator(creator);
        nurseRequest.setCreateTime(new Date());
        JSONObject request = (JSONObject) JSONObject.parse(JacksonUtil.bean2Json(nurseRequest.getBody()));
        if (nurseRequest.getType() == 1) {
            Double highValue = Double.valueOf(request.getDouble("highValue"));
            Double lowValue = Double.valueOf(request.getDouble("lowValue"));
            nurseRequest.setResult("血压：收缩压：" + highValue + "mmHg, 舒张压：" + lowValue + "mmHg");
            nurseRequest.setAssociationId(bloodPressureService.insertBloodPressure(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 2) {
            Double sugarValue = Double.valueOf(request.getDouble("sugarValue"));
            nurseRequest.setResult("血糖：" + sugarValue + "mmol/L ");
            nurseRequest.setAssociationId(bloodSugarService.insertBloodSugar(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 3) {
            Double hightVlaue = Double.valueOf(request.getDouble("hightVlaue"));
            Double weightValue = Double.valueOf(request.getDouble("weightValue"));
            nurseRequest.setResult("身高：" + hightVlaue + "m, 体重：" + weightValue + "kg");
            nurseRequest.setAssociationId(bodyWeightService.insertBodyWeight(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 4) {
        } else if (nurseRequest.getType() == 5) {
        } else if (nurseRequest.getType() == 6) {
            nurseRequest.setAssociationId(bodyIndexService.bodyAddJson(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 7) {
            nurseRequest.setAssociationId(bloodFatService.insertBloodFat(request));
            if ((nurseRequest.getAssociationId() > 0)&&(nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 8) {
            Integer buaValue = Integer.valueOf(request.getInteger("buaValue"));
            nurseRequest.setResult("血尿酸值：" + buaValue + "μmol/L ");
            nurseRequest.setAssociationId(serumUricAcidService.serumUricAcid2Json(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 9) {
            Integer spoValue = Integer.valueOf(request.getInteger("spoValue"));
            nurseRequest.setResult("血氧：" + spoValue + "%");
            nurseRequest.setAssociationId(bloodOxygenService.bloodOxygen2Json(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 10) {
            Integer heartRate = Integer.valueOf(request.getInteger("heartRate"));
            nurseRequest.setResult("心率：" + heartRate + "次/分");
            nurseRequest.setAssociationId(ecgService.ecg2Json(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 11) {
            Double breathFreq = Double.valueOf(request.getDouble("breathFreq"));
            nurseRequest.setResult("呼吸率：" + breathFreq + "%");
            nurseRequest.setAssociationId(respiratoryRateService.respiratoryRate2Json(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 12) {
            nurseRequest.setAssociationId(mentalIndexService.mentalAddJson(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 13) {
            Double waterPercent = Double.valueOf(request.getDouble("waterPercent"));
            nurseRequest.setResult("水分百分比：" + waterPercent + "%");
            nurseRequest.setAssociationId(skinIndexService.skinAddJson(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        } else if (nurseRequest.getType() == 14) {
            Double bodyTemperature = Double.valueOf(request.getDouble("bodyTemperature"));
            nurseRequest.setResult("体温：" + bodyTemperature + "℃");
            nurseRequest.setAssociationId(temperatureService.temAddJson(request));
            if ((nurseRequest.getAssociationId() > 0) && (nurseRequestService.insert(nurseRequest))) {
                result.markSuccess("新增成功!");
            } else {
                result.markError("新增失败！");
            }
        }

        return result;
    }

    /**
     * 批量推送健康数据
     *
     * @param nurseRequestList
     * @return
     */
    @RequestMapping(value = "/sendHealthDatas", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendHealthDatas(@RequestBody List<NurseRequest> nurseRequestList, HttpServletRequest servletRequest) {
        AppResult result = new AppResult();
        String userId = servletRequest.getHeader("userId");

        for(int i = 0; i < nurseRequestList.size(); i++){
            //添加老人数据
            UserLog userLog = new UserLog();
            userLog.setAction(JacksonUtil.bean2Json(nurseRequestList.get(i)));
            userLog.setCreateTime(new Date());
            userLog.setIp(servletRequest.getRemoteAddr());
            userLog.setUid(Integer.parseInt(userId));
            userLog.setDescription("推送健康数据");
            userLogService.insert(userLog);
            //判断是否已存在
            if (ObjectUtils.isNotNull(nurseRequestList.get(i).getIdcardno())) {
                NurseElderly nurseElderly = nurseElderlyService.findByIdcardNo(nurseRequestList.get(i).getIdcardno());
                if (!ObjectUtils.isNotNull(nurseElderly)) {
                    result.markError("该老人不存在");
                    return result;
                }
                nurseRequestList.get(i).setElderId(nurseElderly.getId());
            } else {
                result.markError("身份证不可为空");
                return result;
            }
            //时间
            String time = nurseRequestList.get(i).getTime();
            try {
                df.parse(time);
            } catch (Exception e) {
                result.markError("时间格式不对 例：yyyy-MM-dd HH:mm:ss");
                return result;
            }

            User creator = new User();
            creator.setUid(Integer.parseInt(userId));
            nurseRequestList.get(i).setCreator(creator);
            nurseRequestList.get(i).setCreateTime(new Date());
            JSONObject request = (JSONObject) JSONObject.parse(JacksonUtil.bean2Json(nurseRequestList.get(i).getBody()));
            if (nurseRequestList.get(i).getType() == 1) {
                Double highValue = Double.valueOf(request.getDouble("highValue"));
                Double lowValue = Double.valueOf(request.getDouble("lowValue"));
                nurseRequestList.get(i).setResult("血压：收缩压：" + highValue + "mmHg, 舒张压：" + lowValue + "mmHg");
                nurseRequestList.get(i).setAssociationId(bloodPressureService.insertBloodPressure(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 2) {
                Double sugarValue = Double.valueOf(request.getDouble("sugarValue"));
                nurseRequestList.get(i).setResult("血糖：" + sugarValue + "mmol/L ");
                nurseRequestList.get(i).setAssociationId(bloodSugarService.insertBloodSugar(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 3) {
                Double hightVlaue = Double.valueOf(request.getDouble("hightVlaue"));
                Double weightValue = Double.valueOf(request.getDouble("weightValue"));
                nurseRequestList.get(i).setResult("身高：" + hightVlaue + "m, 体重：" + weightValue + "kg");
                nurseRequestList.get(i).setAssociationId(bodyWeightService.insertBodyWeight(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 4) {
            } else if (nurseRequestList.get(i).getType() == 5) {
            } else if (nurseRequestList.get(i).getType() == 6) {
                nurseRequestList.get(i).setAssociationId(bodyIndexService.bodyAddJson(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 7) {
                nurseRequestList.get(i).setAssociationId(bloodFatService.insertBloodFat(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0)&&(nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 8) {
                Integer buaValue = Integer.valueOf(request.getInteger("buaValue"));
                nurseRequestList.get(i).setResult("血尿酸值：" + buaValue + "μmol/L ");
                nurseRequestList.get(i).setAssociationId(serumUricAcidService.serumUricAcid2Json(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 9) {
                Integer spoValue = Integer.valueOf(request.getInteger("spoValue"));
                nurseRequestList.get(i).setResult("血氧：" + spoValue + "%");
                nurseRequestList.get(i).setAssociationId(bloodOxygenService.bloodOxygen2Json(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 10) {
                Integer heartRate = Integer.valueOf(request.getInteger("heartRate"));
                nurseRequestList.get(i).setResult("心率：" + heartRate + "次/分");
                nurseRequestList.get(i).setAssociationId(ecgService.ecg2Json(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 11) {
                Double breathFreq = Double.valueOf(request.getDouble("breathFreq"));
                nurseRequestList.get(i).setResult("呼吸率：" + breathFreq + "%");
                nurseRequestList.get(i).setAssociationId(respiratoryRateService.respiratoryRate2Json(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 12) {
                nurseRequestList.get(i).setAssociationId(mentalIndexService.mentalAddJson(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 13) {
                Double waterPercent = Double.valueOf(request.getDouble("waterPercent"));
                nurseRequestList.get(i).setResult("水分百分比：" + waterPercent + "%");
                nurseRequestList.get(i).setAssociationId(skinIndexService.skinAddJson(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            } else if (nurseRequestList.get(i).getType() == 14) {
                Double bodyTemperature = Double.valueOf(request.getDouble("bodyTemperature"));
                nurseRequestList.get(i).setResult("体温：" + bodyTemperature + "℃");
                nurseRequestList.get(i).setAssociationId(temperatureService.temAddJson(request));
                if ((nurseRequestList.get(i).getAssociationId() > 0) && (nurseRequestService.insert(nurseRequestList.get(i)))) {
                    result.markSuccess("新增成功!");
                } else {
                    result.markError("新增失败！");
                }
            }
        }
        return result;
    }

}
