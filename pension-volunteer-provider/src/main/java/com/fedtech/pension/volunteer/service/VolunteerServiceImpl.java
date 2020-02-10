package com.fedtech.pension.volunteer.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.volunteer.entity.Volunteer;
import com.fedtech.pension.volunteer.mapper.VolunteerMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Administrator
 * @date 2016/9/28
 */
@Service(interfaceClass = VolunteerService.class, version = "1.0.0")
public class VolunteerServiceImpl extends BaseServiceImpl<Volunteer> implements VolunteerService {

    @Autowired
    private VolunteerMapper volunteerMapper;

    @Override
    public BaseMapper<Volunteer> getMapper() {
        return volunteerMapper;
    }

}
