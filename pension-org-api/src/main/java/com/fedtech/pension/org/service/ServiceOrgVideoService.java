package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgVideo;

import java.util.List;

public interface ServiceOrgVideoService extends BaseService<ServiceOrgVideo> {

    boolean addServiceOrgVideo(ServiceOrgVideo serviceOrgVideo);

    boolean deleteServiceOrgVideo(ServiceOrgVideo serviceOrgVideo);

    List<ServiceOrgVideo> getAllVideoById(Integer orgId);
}
