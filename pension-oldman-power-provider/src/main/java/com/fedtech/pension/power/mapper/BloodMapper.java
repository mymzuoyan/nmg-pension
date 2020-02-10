package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Blood;
import org.apache.ibatis.annotations.Param;

public interface BloodMapper extends BaseMapper<Blood> {

    Blood selectBytestRecordID(@Param("testRecordID") String testRecordID);
}
