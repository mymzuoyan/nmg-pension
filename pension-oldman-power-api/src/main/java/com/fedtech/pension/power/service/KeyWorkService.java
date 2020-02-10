package com.fedtech.pension.power.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.KeyWork;

/**
 * Created by gengqiang on 2017/8/23.
 */
public interface KeyWorkService extends BaseService<KeyWork> {

    /**
     * 新增、修改评估人
     *
     * @param assessor
     * @return
     */
    boolean updateAssessor(KeyWork assessor);

}
