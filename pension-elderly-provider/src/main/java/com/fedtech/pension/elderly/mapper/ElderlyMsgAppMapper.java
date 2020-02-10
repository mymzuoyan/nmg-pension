package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderlyMsgApp;

import java.util.List;

/**
 * @author gengqiang
 */
public interface ElderlyMsgAppMapper extends BaseMapper<ElderlyMsgApp> {

    public List<ElderlyMsgApp> selectCountList(ElderlyMsgApp elderlyMsgApp);

}