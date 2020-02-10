package com.fedtech.pension.org.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.org.entity.ServiceOrgCardData;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ForkJoinPool;

/**
 * @author gengqiang
 */
public interface ServiceOrgCardDataMapper extends BaseMapper<ServiceOrgCardData> {

    int insertSomeMsg(@Param("filters") List<Map> dataList);

}