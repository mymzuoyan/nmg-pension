package com.fedtech.pension.elderly.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderlyPreferentialTreatment;
import org.apache.ibatis.annotations.Param;

/**
 * @author gengqiang
 */
public interface ElderlyPreferentialTreatmentMapper extends BaseMapper<ElderlyPreferentialTreatment> {
    /**
     * 获取特定的区域的最新的编码
     *
     * @param number
     * @return
     */
    String findByLastNumber(@Param("number") String number);
}