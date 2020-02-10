package com.fedtech.pension.power.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.AllianceType;

import java.util.List;

public interface AllianceTypeMapper extends BaseMapper<AllianceType> {

    List<AllianceType> selectIntype(String inClassic);

}