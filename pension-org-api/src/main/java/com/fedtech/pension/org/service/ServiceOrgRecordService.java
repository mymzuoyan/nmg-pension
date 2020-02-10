package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgRecord;


/**
 *
 * @author miaoyueming
 * @date 2019/8/9
 * 建档内容
 */
public interface ServiceOrgRecordService extends BaseService<ServiceOrgRecord> {

    Integer selectIdByServiceOrgId(Integer serviceOrgId);
}
