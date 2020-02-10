package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.NursingHomeServiceCheck;

/**
 *
 * @author csn
 * @date 2018/2/7
 */
public interface NursingHomeServiceCheckMapper extends BaseMapper<NursingHomeServiceCheck>{

    NursingHomeServiceCheck getRecodeDetail(NursingHomeServiceCheck filter);
}
