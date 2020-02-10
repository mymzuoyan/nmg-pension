package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.entity.ElderlyOperatingSubsidies;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/11/22
 */
public interface ElderlyOperatingSubsidiesMapper extends BaseMapper<ElderlyOperatingSubsidies> {

     void delByInsConSuld(@Param("insConSuId") Integer insConSuId);
}
