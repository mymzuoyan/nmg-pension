package com.fedtech.pension.datadock.api.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.LiAnResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.utils.DESHelper;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.entity.LiAnElderly;
import com.fedtech.pension.datadock.api.MyValidateApiController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.elderly.vo.ElderlyMsgVo;
import com.fedtech.pension.nurse.entity.NurseElderly;
import com.fedtech.pension.nurse.service.NurseElderlyService;
import com.fedtech.pension.sys.entity.UserLog;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 * @date 2019/6/21
 */
@Controller
@RequestMapping("api")
public class ElderlyApiController {

    @Reference(version = "1.0.0")
    private NurseElderlyService nurseElderlyService;


    @Reference(version = "1.0.0")
    private UserLogService userLogService;


    /**
     * 推送老人数据
     *
     * @param nurseElderly
     * @param request
     * @return
     */
    @RequestMapping(value = "saveElderly")
    @ResponseBody
    private AppResult saveElderly(@RequestBody NurseElderly nurseElderly, HttpServletRequest request) {
        String userId = request.getHeader("userId");
        //添加老人数据
        UserLog userLog = new UserLog();
        userLog.setAction(JacksonUtil.bean2Json(nurseElderly));
        userLog.setCreateTime(new Date());
        userLog.setIp(request.getRemoteAddr());
        userLog.setUid(Integer.parseInt(userId));
        userLog.setDescription("添加老人数据");
        userLogService.insert(userLog);


        try {
            NurseElderly oldRecord = nurseElderlyService.findByIdcardNo(nurseElderly.getIdcardno());
            if (ObjectUtils.isNotNull(oldRecord)) {
                nurseElderly.setId(oldRecord.getId());
            }
            nurseElderly.setCreateTime(new Date());
            if (nurseElderly.getId() != null) {
                nurseElderlyService.updateByPrimaryKeySelective(nurseElderly);
            } else {
                nurseElderlyService.insert(nurseElderly);
            }


        } catch (Exception e) {
            e.printStackTrace();
            return AppResult.error("注册失败");
        }
        return AppResult.ok().message("注册成功");

    }


}
