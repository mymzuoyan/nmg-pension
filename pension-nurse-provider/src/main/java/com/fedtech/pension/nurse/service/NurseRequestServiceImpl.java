package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.NurseRequest;
import com.fedtech.pension.nurse.mapper.NurseRequestMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author miaoyueming
 * @date 2019/6/26
 */
@Service(interfaceClass = NurseRequestService.class, version = "1.0.0")
public class NurseRequestServiceImpl extends BaseServiceImpl<NurseRequest> implements NurseRequestService {

    @Autowired
    private NurseRequestMapper nurseRequestMapper;

    @Override
    public BaseMapper<NurseRequest> getMapper() {
        return nurseRequestMapper;
    }

    @Override
    public Integer requestAddJson(JSON json) {
        NurseRequest nurseRequest = new NurseRequest();
        JSONObject jsonObject = JSONObject.parseObject(json.toString());
        nurseRequest = JSON.toJavaObject(jsonObject, NurseRequest.class);
        nurseRequestMapper.insert(nurseRequest);
        return nurseRequest.getId();
    }
}
