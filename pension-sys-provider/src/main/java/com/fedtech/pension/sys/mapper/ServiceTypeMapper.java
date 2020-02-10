package com.fedtech.pension.sys.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.ServiceType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/27
 */
public interface ServiceTypeMapper extends BaseMapper<ServiceType> {


    /**
     * 批量获取
     *
     * @param ids
     * @return
     */
    List<ServiceType> getTypeByIds(@Param("ids") String ids);
}
