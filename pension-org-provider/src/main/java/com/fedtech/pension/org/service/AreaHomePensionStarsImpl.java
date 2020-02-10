package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.AreaHomePensionStars;
import com.fedtech.pension.org.entity.CommunityPensionStars;
import com.fedtech.pension.org.mapper.AreaHomePensionStarsMapper;
import com.fedtech.pension.org.mapper.CommunityPensionStarsMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gxy
 * @date 2019/8/25 - 16:02
 */


@Service(interfaceClass = AreaHomePensionStarsService.class,version = "1.0.0")
public class AreaHomePensionStarsImpl extends BaseServiceImpl<AreaHomePensionStars> implements AreaHomePensionStarsService {

    @Autowired
    private AreaHomePensionStarsMapper areaHomePensionStarsMapper;

    @Override
    public BaseMapper<AreaHomePensionStars> getMapper() {
        return areaHomePensionStarsMapper;
    }

}
