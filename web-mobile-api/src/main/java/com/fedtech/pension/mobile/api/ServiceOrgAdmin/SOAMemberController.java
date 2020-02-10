package com.fedtech.pension.mobile.api.ServiceOrgAdmin;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.mobile.redis.RedisServiceOrgLocationUtil;
import com.fedtech.pension.mobile.redis.RedisUserStateUtil;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.service.ServiceOrgLocationService;
import com.fedtech.pension.sys.entity.UserState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

/**
 * @author zhnn
 * @date 2017/3/22
 */
@Controller
@RequestMapping("/api/serviceAdmin/")
public class SOAMemberController {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Reference(version = "1.0.0")
    private ServiceOrgLocationService serviceOrgLocationService;

    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;

    @Autowired
    private RedisUserStateUtil redisUserStateUtil;

    /**
     * 获取服务人员地理信息
     *
     * @return
     */
    @RequestMapping(value = "getUserLocations")
    @ResponseBody
    public AppResult getUserLocations(@RequestParam("serviceOrgId") String serviceOrgId,
                                      @RequestParam(value = "serviceType", required = false) String serviceType,
                                      @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                      @RequestParam(value = "length", required = false) Integer length) {
        AppResult result = new AppResult();
        List<UserState> userStates = new ArrayList<>();
        HashMap hashMap = redisUserStateUtil.getHasMap();
        Set<Integer> uids = hashMap.keySet();
        for (Integer id : uids) {
            UserState userState = (UserState) hashMap.get(id);
            if (ObjectUtils.isNotNull(userState)) {
                if (!StringUtils.isEmpty(serviceOrgId)) {// 确定组织
                    if (userState.getServiceOrgId().equals(serviceOrgId)) {
                        if (!StringUtils.isEmpty(serviceType)) {// 确定服务项目
                            if(userState.getServiceType()!=null){
                                if (userState.getServiceType().indexOf(serviceType) >= 0) {
                                    userStates.add(userState);
                                }
                            }
//                            if (userState.getServiceType().indexOf(serviceType) >= 0) {
//                                userStates.add(userState);
//                            }
                        } else {
                            userStates.add(userState);
                        }
                    }
                } else {
                    result.markError("组织id不可为空");
                }
            }
        }
        if (!StringUtils.isEmpty(pageNum) && !StringUtils.isEmpty(length)) {
            if (pageNum < 1) {
                result.markError("页数不可小于1");
            } else {
                if (ObjectUtils.isNotNull(userStates)) {
                    int allCount = userStates.size();
                    if (allCount < ((pageNum - 1) * length)) {
                        return null;
                    } else if (allCount < pageNum * length) {
                        userStates = userStates.subList((pageNum - 1) * length, allCount);
                    } else {
                        userStates = userStates.subList((pageNum - 1) * length, (pageNum) * length);
                    }
                    if (ObjectUtils.isNotNull(userStates)) {
                        result.markSuccess("获取服务人员地理信息成功", userStates);
                    }
                }
            }
        }
        result.markSuccess("获取服务人员地理信息成功", userStates);
        return result;
    }


    /**
     * 更新组织地理信息
     *
     * @param serviceOrgLocation
     * @return
     */
    @RequestMapping("updateLocation")
    @ResponseBody
    public AppResult updateServiceOrgLocation(ServiceOrgLocation serviceOrgLocation) {
        AppResult result = new AppResult();
        if (ObjectUtils.isNotNull(serviceOrgLocation.getServiceOrgId())) {
            if (serviceOrgLocationService.updateOrInsertLocation(serviceOrgLocation)) {
                ServiceOrgLocation so = serviceOrgLocationService.selectByServiceOrgId(serviceOrgLocation.getServiceOrgId());
                //更新缓存
                redisServiceOrgLocationUtil.putServiceOrgLocation(serviceOrgLocation.getServiceOrgId(), so);
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        } else {
            result.markError("没有明确组织");
        }
        return result;

    }


}
