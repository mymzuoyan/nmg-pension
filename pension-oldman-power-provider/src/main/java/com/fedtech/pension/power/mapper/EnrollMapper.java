package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.Enroll;
import org.apache.ibatis.annotations.Param;

public interface EnrollMapper extends BaseMapper<Enroll> {

    Enroll selectBymemberID(@Param("memberID") String memberID);
}
