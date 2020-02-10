package com.fedtech.pension.org.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgVideo;

import java.util.List;

public interface ServiceOrgVideoMapper extends BaseMapper<ServiceOrgVideo> {

    int addServiceOrgVideo(ServiceOrgVideo serviceOrgVideo);

    int deleteServiceOrgVideo(ServiceOrgVideo serviceOrgVideo);

    List<ServiceOrgVideo> getAllVideoById(Integer orgId);
}