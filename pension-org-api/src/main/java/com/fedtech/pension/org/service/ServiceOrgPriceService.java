package com.fedtech.pension.org.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.entity.ServiceStandard;
import com.fedtech.pension.org.vo.RangeVo;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/5/22
 */
public interface ServiceOrgPriceService extends BaseService<ServiceOrgPrice> {

    /**
     * 批量插入
     *
     * @param serviceOrgPrices
     * @return
     */
    boolean insertSomeRecode(List<ServiceOrgPrice> serviceOrgPrices);

    /**
     * 根据组织id删除价格
     *
     * @param serviceOrgId
     * @return
     */
    boolean deleteByServiceOrgId(Integer serviceOrgId);

    /**
     * 更新组织的价格体系
     *
     * @param serviceOrgPrices
     * @param serviceOrgId
     * @return
     */
    boolean updateServiceOrgPrice(List<ServiceOrgPrice> serviceOrgPrices, Integer serviceOrgId);


    /**
     * 根据服务项目名称和组织Id来获取列表
     *
     * @param name
     * @param serviceOrgId
     * @return
     */
    List<ServiceOrgPrice> selectByNameAndServiceOrgId(String name, Integer serviceOrgId);

    /**
     * 根据服务项目Id和组织Id来获取列表
     *
     * @param serviceProjectId
     * @param serviceOrgId
     * @return
     */
    List<ServiceOrgPrice> selectByProjectIdAndServiceOrgId(Integer serviceProjectId, Integer serviceOrgId);


    /**
     * 根据服务项目名称和组织Id来获取列表
     *
     * @param name
     * @return
     */
    List<ServiceOrgPrice> selectByNameAndServiceOrgIds(String name, List<Integer> serviceOrgIds);

    /**
     * 分页获取
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    List<ServiceOrgPrice> selectByPage(ServiceOrgPrice filter, PageRequest pageRequest);

    /**
     * 根据服务内容来分页获取（所有的组织）
     *
     * @param name
     * @param pageRequest
     * @return
     */
    List<ServiceOrgPrice> selectServiceOrgsByName(String name, PageRequest pageRequest);


    /**
     * 获取组织的特定服务项目的价格区间
     *
     * @param serviceProjectId
     * @param serviceOrgIds
     * @return
     */
    RangeVo getPriceRange(Integer serviceProjectId, List serviceOrgIds);

    List<ServiceStandard> getStandardByType(Integer orgId, Integer type);


}
