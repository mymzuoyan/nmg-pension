package com.fedtech.pension.sys.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.SysVars;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysVarsMapper extends BaseMapper<SysVars> {

    /**
     * 根据参数类型获取参数
     *
     * @return
     */

    List<SysVars> selectByVarsTypeId(@Param("varsTypeId") Integer varsTypeId);

    /**
     * 删除
     *
     * @param varsTypeId
     * @return
     */
    int deleteByVarsTypeId(@Param("varsTypeId") Integer varsTypeId);

    /**
     * 根据name获取参数
     *
     * @param name
     * @return
     */
    SysVars findByName(String name);


}