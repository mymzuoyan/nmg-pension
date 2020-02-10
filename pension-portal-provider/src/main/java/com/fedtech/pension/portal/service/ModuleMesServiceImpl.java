package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.portal.entity.ModuleMes;
import com.fedtech.pension.portal.mapper.ModuleMesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * @author gengqiang
 */
@Service(interfaceClass = ModuleMesService.class, version = "1.0.0")
public class ModuleMesServiceImpl extends BaseServiceImpl<ModuleMes> implements ModuleMesService {

    @Autowired
    private ModuleMesMapper moduleMesMapper;

    @Override
    public BaseMapper<ModuleMes> getMapper() {
        return moduleMesMapper;
    }

    @Override
    @Cacheable(value = "homeModuleMes", key = "'selectTopNByModule'")// 使用了一个缓存名叫 homeModuleMes
    public List<ModuleMes> selectTopNByModule(Integer top) {
        return moduleMesMapper.selectTopNByModule(top);
    }

    @Override
    public List<ModuleMes> selectPutTopMes(Integer count) {
        return moduleMesMapper.selectPutTopMes(count);
    }

    @Override
    @CacheEvict(value = "homeModuleMes", key = "'selectTopNByModule'")// 更新 homeModuleMes 缓存
    public boolean deleteByPrimaryKey(Integer id) {
        if (null != id) {
            return 1 == getMapper().deleteByPrimaryKey(id);
        }
        return false;
    }

    @Override
    @CacheEvict(value = "homeModuleMes", key = "'selectTopNByModule'")// 更新 homeModuleMes 缓存
    public boolean insert(ModuleMes record) {
        if (null != record) {
            return 1 == getMapper().insert(record);
        }
        return false;
    }

    @Override
    @CacheEvict(value = "homeModuleMes", key = "'selectTopNByModule'")// 更新 homeModuleMes 缓存
    public boolean updateByPrimaryKeySelective(ModuleMes record) {
        if (null != record) {
            return 1 == getMapper().updateByPrimaryKeySelective(record);
        }
        return false;
    }


    @Override
    public List<ModuleMes> selectTopNByModuleId(Integer moduleId, Integer count) {
        return moduleMesMapper.selectTopNByModuleId(moduleId, count);
    }

    @Override
    public int selectMaxId() {
        return moduleMesMapper.selectMaxId();
    }

    @Override
    public boolean verifyModuleMeses(List<Integer> ids) {
        if (null != ids) {
            return 0 != moduleMesMapper.verifyModuleMeses(ids);
        }
        return false;
    }


    @Override
    public List<ModuleMes> selectTopOrLastN(Integer id, Integer moduleId, Integer n, String topOrLast) {
        return moduleMesMapper.selectTopOrLastN(id, moduleId, n, topOrLast);
    }
}


