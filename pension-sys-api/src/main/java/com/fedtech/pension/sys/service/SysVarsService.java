package com.fedtech.pension.sys.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.SysVars;

import java.util.List;

/**
 * Created by GQ on 16/5/12.
 */
public interface SysVarsService extends BaseService<SysVars> {

    /**
     * 新增、修改参数
     *
     * @param assessor
     * @return
     */
    boolean updateAssessor(SysVars assessor);


    /**
     * 根据name获取参数
     * @param name
     * @return
     */
    SysVars findByName(String name);


}


