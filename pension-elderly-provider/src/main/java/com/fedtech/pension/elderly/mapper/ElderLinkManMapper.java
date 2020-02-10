package com.fedtech.pension.elderly.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.elderly.entity.ElderLinkMan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zhangcz
 */
public interface ElderLinkManMapper extends BaseMapper<ElderLinkMan> {


    /**
     * 查询
     * @param elderId
     * @return
     */
    List<ElderLinkMan> selectByElderId(@Param("elderId") Integer elderId);

}
