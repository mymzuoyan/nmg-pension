package com.fedtech.pension.portal.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.portal.entity.Communication;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/12/14
 */
public interface CommunicationMapper extends BaseMapper<Communication> {

    /**
     * 获取
     *
     * @param count
     * @return
     */
    List<Communication> selectTopN(@Param("count") Integer count);
}
