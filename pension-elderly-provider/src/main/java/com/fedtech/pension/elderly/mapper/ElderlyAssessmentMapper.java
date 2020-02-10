package com.fedtech.pension.elderly.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderlyAssessment;
import org.apache.ibatis.annotations.Param;

public interface ElderlyAssessmentMapper  extends BaseMapper<ElderlyAssessment> {

    /**
     * 根据主键 id 查询
     * @param id
     * @return
     */
    ElderlyAssessment selectByPrimaryKeyAll(Integer id);

    int updateByElderId(@Param("id") Integer id);

}