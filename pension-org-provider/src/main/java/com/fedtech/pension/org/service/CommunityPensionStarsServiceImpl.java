package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.CheckName;
import com.fedtech.pension.org.entity.CommunityPensionStars;
import com.fedtech.pension.org.mapper.CheckNameMapper;
import com.fedtech.pension.org.mapper.CommunityPensionStarsMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author guxiangyang
 * @date 2019/8/16
 */

@Service(interfaceClass = CommunityPensionStarsService.class,version = "1.0.0")
public class CommunityPensionStarsServiceImpl extends BaseServiceImpl<CommunityPensionStars> implements CommunityPensionStarsService {

    @Autowired
    private CommunityPensionStarsMapper communityPensionStarsMapper;

    @Override
    public BaseMapper<CommunityPensionStars> getMapper() {
        return communityPensionStarsMapper;
    }
}
