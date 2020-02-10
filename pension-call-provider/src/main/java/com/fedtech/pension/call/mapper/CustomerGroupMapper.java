package com.fedtech.pension.call.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.call.entity.CustomerGroup;
import org.apache.ibatis.annotations.Param;

/**
 * @author gengqiang
 */
public interface CustomerGroupMapper extends BaseMapper<CustomerGroup> {

    /**
     * 根据信息来获取
     *
     * @param name
     * @return
     */
    CustomerGroup selectByName(@Param("name") String name);


}