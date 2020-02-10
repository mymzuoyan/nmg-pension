package com.fedtech.pension.elderly.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderlyPoorApply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ElderlyPoorApplyMapper extends BaseMapper<ElderlyPoorApply> {

    /**
     * 获取特定的区域的最新的编码
     *
     * @param number
     * @return
     */
    String findByLastNumber(@Param("number") String number);

    /**
     * 获取需要年审的
     *
     * @return
     */
    List<Integer> getNeedVerification();


}