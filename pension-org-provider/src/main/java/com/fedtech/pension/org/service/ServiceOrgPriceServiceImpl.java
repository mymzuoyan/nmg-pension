package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.org.entity.ServiceStandard;
import com.fedtech.pension.org.mapper.ServiceOrgPriceMapper;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.vo.RangeVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/5/22
 */
@org.springframework.stereotype.Service
@Service(interfaceClass = ServiceOrgPriceService.class, version = "1.0.0")
public class ServiceOrgPriceServiceImpl extends BaseServiceImpl<ServiceOrgPrice> implements ServiceOrgPriceService {
    @Autowired
    private ServiceOrgPriceMapper mapper;

    @Override
    public BaseMapper<ServiceOrgPrice> getMapper() {
        return mapper;
    }


    @Override
    public boolean insertSomeRecode(List<ServiceOrgPrice> serviceOrgPrices) {
        if (mapper.insertSomeRecode(serviceOrgPrices) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteByServiceOrgId(Integer serviceOrgId) {
        if (mapper.deleteByServiceOrgId(serviceOrgId) > 0) {
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public boolean updateServiceOrgPrice(List<ServiceOrgPrice> serviceOrgPrices, Integer serviceOrgId) {
        return insertSomeRecode(serviceOrgPrices);
    }

    @Override
    public List<ServiceOrgPrice> selectByNameAndServiceOrgId(String name, Integer serviceOrgId) {
        return mapper.selectByNameAndServiceOrgId(name, serviceOrgId);
    }

    @Override
    public List<ServiceOrgPrice> selectByProjectIdAndServiceOrgId(Integer typeId, Integer serviceOrgId) {
        return mapper.selectByProjectIdAndServiceOrgId(typeId, serviceOrgId);
    }

    @Override
    public List<ServiceOrgPrice> selectByNameAndServiceOrgIds(String name, List<Integer> serviceOrgIds) {
        return mapper.selectByNameAndServiceOrgIds(name, serviceOrgIds);
    }

    @Override
    public List<ServiceOrgPrice> selectByPage(ServiceOrgPrice filter, PageRequest pageRequest) {
        return mapper.selectPageList(filter, pageRequest);
    }

    @Override
    public List<ServiceOrgPrice> selectServiceOrgsByName(@Param("name") String name, @Param("page") PageRequest pageRequest) {
        return mapper.selectServiceOrgsByName(name, pageRequest);
    }

    @Override
    public RangeVo getPriceRange(Integer serviceProjectId, List serviceOrgIds) {
        return mapper.getPriceRange(serviceProjectId, serviceOrgIds);
    }

    @Override
    public  List<ServiceStandard> getStandardByType(Integer orgId, Integer type){
        return  mapper.getStandardByType(orgId,type);
    }



}
