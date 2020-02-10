package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.AllianceType;

import java.util.List;

public interface AllianceTypeService extends BaseService<AllianceType> {
    List<AllianceType> selectIntype(String inClassic);
}
