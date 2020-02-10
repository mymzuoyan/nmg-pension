package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgWareHouse;
import com.fedtech.pension.org.entity.SojournManage;
import com.fedtech.pension.org.mapper.ServiceOrgWareHouseMapper;
import com.fedtech.pension.org.mapper.SojournManageMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  旅居养老机构管理
 * @author guxiangyang
 * @date 2019/8/7
 */
@Service(interfaceClass = SojournManageService.class, version = "1.0.0")
public class SojournManageServiceImpl extends BaseServiceImpl<SojournManage> implements SojournManageService {

    @Autowired
    private SojournManageMapper SojournManageMapper;


    @Override
    public BaseMapper<SojournManage> getMapper() {
        return SojournManageMapper;
    }
}


