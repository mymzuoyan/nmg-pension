package com.fedtech.pension.ipccp.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.ipccp.entity.Abandoned;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface AbandonedMapper extends BaseMapper<Abandoned> {

    /**
     * @param abandoned
     * @return
     */
    List<String> selectAbandonedCallerId(@Param("filter") Abandoned abandoned);

    /**
     * @param linkedid
     * @return
     */
    Abandoned selectByLinkedId(@Param("linkedid") String linkedid);

    /**
     * @param Abandoned
     * @return
     */
    int getCountNotContains(@Param("filter") Abandoned Abandoned);
}