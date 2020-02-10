package com.fedtech.pension.org.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.NursingHomeServiceCheck;

/**
 *
 * @author csn
 * @date 2018/2/7
 */
public interface NursingHomeServiceCheckService extends BaseService<NursingHomeServiceCheck> {

    NursingHomeServiceCheck getRecodeDetail(NursingHomeServiceCheck filter);
}
