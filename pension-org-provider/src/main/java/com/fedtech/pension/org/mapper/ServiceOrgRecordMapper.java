package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgRecord;

/**
 *
 * @author miaoyueming
 * @date 2019/8/9
 * 建档内容
 */

public interface ServiceOrgRecordMapper extends BaseMapper<ServiceOrgRecord> {

    Integer selectIdByServiceOrgId(Integer serviceOrgId);
}
