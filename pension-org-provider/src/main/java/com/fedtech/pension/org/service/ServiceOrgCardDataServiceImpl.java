package com.fedtech.pension.org.service;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.MD5;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.org.entity.ServiceOrgCardData;
import com.fedtech.pension.org.entity.ServiceOrgCardDataRecord;
import com.fedtech.pension.org.mapper.ServiceOrgCardDataMapper;
import com.fedtech.pension.org.redis.RedisServiceOrgLocationUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 * @date 2018/4/24
 */
@Service(interfaceClass = ServiceOrgCardDataService.class, version = "1.0.0", timeout = 60000, retries = 0)
public class ServiceOrgCardDataServiceImpl extends BaseServiceImpl<ServiceOrgCardData> implements ServiceOrgCardDataService {


    private static String CARDDATAURL = "http://58.222.216.146:10003/appmanager/civil/ConsumDataPush";
    private static String CARDDATACHANNELID = "1001";
    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;
    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;
    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;
    @Reference(version = "1.0.0")
    private ServiceOrgCardDataRecordService serviceOrgCardDataRecordService;
    @Autowired
    private ServiceOrgCardDataMapper mapper;

    @Override
    public BaseMapper<ServiceOrgCardData> getMapper() {
        return mapper;
    }

    @Override
    public boolean insertSomeMsg(List<Map> dataList) {
        if (mapper.insertSomeMsg(dataList) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public JsonResult getServiceOrgCardData() {
        JsonResult jsonResult = new JsonResult();
        //请求参数拼接
        JSONObject reqParam = new JSONObject();
        JSONObject channel = new JSONObject();
        channel.put("channel_id", MD5.MD5Encode(CARDDATACHANNELID));
        reqParam.put("reqParam", channel);
        String result = HttpRequest.sendPost(CARDDATAURL, reqParam.toString());
        System.out.println(result);
        if (!StringUtils.isEmpty(result)) {
            JSONObject jsonObject = JSON.parseObject(result);
            if (jsonObject.get("respCode").equals("00")) {
                List<Map> dataList = (List<Map>) jsonObject.get("respData");
                if (ObjectUtils.isNotNull(dataList)) {
                    ServiceOrgCardDataRecord socdr = new ServiceOrgCardDataRecord();
                    socdr.setResult(result);
                    socdr.setCreateTime(new Date());
                    serviceOrgCardDataRecordService.insert(socdr);
                    jsonResult.markSuccess(jsonObject.get("respMsg").toString(), dataList);
                } else {
                    jsonResult.markSuccess(jsonObject.get("respMsg").toString() + ",返回数据为空，不执行插入", dataList);
                }
            } else {
                jsonResult.markError(jsonObject.get("respMsg").toString());
            }
        }
        return jsonResult;
    }


}
