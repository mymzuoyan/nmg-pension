package com.fedtech.pension.portal.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.portal.entity.Communication;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/12/14
 */
public interface CommunicationService extends BaseService<Communication> {

    /**
     * 获取
     *
     * @param count
     * @return
     */
    List<Communication> selectTopN(Integer count);

}
