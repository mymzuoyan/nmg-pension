package com.fedtech.pension.org.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.entity.ServiceStandard;
import com.fedtech.pension.org.vo.RangeVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ServiceOrgPriceMapper extends BaseMapper<ServiceOrgPrice> {

    /**
     * 批量插入
     *
     * @param serviceOrgPrices
     * @return
     */
    int insertSomeRecode(@Param("serviceOrgPrices") List<ServiceOrgPrice> serviceOrgPrices);

    /**
     * 根据组织id删除价格
     *
     * @param serviceOrgId
     * @return
     */
    int deleteByServiceOrgId(@Param("serviceOrgId") Integer serviceOrgId);


    /**
     * 根据服务项目名称和组织Id来获取ServiceOrgPrice
     *
     * @param name
     * @param serviceOrgId
     * @return
     */
    List<ServiceOrgPrice> selectByNameAndServiceOrgId(@Param("name") String name, @Param("serviceOrgId") Integer serviceOrgId);

    /**
     * 根据服务项目id和组织Id来获取ServiceOrgPrice
     *
     * @param typeId
     * @param serviceOrgId
     * @return
     */
    List<ServiceOrgPrice> selectByProjectIdAndServiceOrgId(@Param("serviceProjectId") Integer typeId, @Param("serviceOrgId") Integer serviceOrgId);


    /**
     * 根据服务项目名称和组织Id来获取列表
     *
     * @param name
     * @return
     */
    List<ServiceOrgPrice> selectByNameAndServiceOrgIds(@Param("name") String name, @Param("serviceOrgIds") List<Integer> serviceOrgIds);


    /**
     * 根据服务名称获取组织
     *
     * @param name
     * @return
     */
    List<ServiceOrgPrice> selectServiceOrgsByName(@Param("name") String name, @Param("page") PageRequest pageRequest);


    /**
     * 获取组织的特定服务项目的价格区间
     *
     * @param serviceProjectId
     * @param serviceOrgIds
     * @return
     */
    RangeVo getPriceRange(@Param("serviceProjectId") Integer serviceProjectId, @Param("serviceOrgIds") List serviceOrgIds);

    List<ServiceStandard> getStandardByType(@Param("orgId") Integer orgId, @Param("type") Integer type);

}


