package com.fedtech.pension.sys.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.ServiceType;

import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/27
 */
public interface ServiceTypeService extends BaseService<ServiceType> {

    /**
     * 批量获取
     *
     * @param ids
     * @return
     */
    List<ServiceType> getTypeByIds(String ids);
}
