package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderLinkMan;

import java.util.List;

/**
 * @author zhangcz
 */
public interface ElderLinkManService extends BaseService<ElderLinkMan> {


    /**
     * 查询
     * @param elderId
     * @return
     */
    List<ElderLinkMan> selectByElderId(Integer elderId);


}
