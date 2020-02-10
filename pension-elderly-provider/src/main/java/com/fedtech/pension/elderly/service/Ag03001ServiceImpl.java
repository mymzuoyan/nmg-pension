package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.Ag03001;
import com.fedtech.pension.elderly.mapper.Ag03001Mapper;
import com.fedtech.pension.sys.entity.Area;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/11/12
 */
@Service(interfaceClass = AG03001Service.class,version = "1.0.0")
public class Ag03001ServiceImpl extends BaseServiceImpl<Ag03001> implements AG03001Service {

    @Autowired
    private Ag03001Mapper mapper;

    @Override
    public BaseMapper<Ag03001> getMapper() {
        return mapper;
    }

    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public List<Ag03001> selectAll(Integer start, Integer length) {
        return mapper.selectAll(start,length);
    }

    @Override
    public Ag03001 selectbyId(String id) {
        return mapper.selectbyId(id);
    }

    @Override
    public String getAreaName(Integer areaId) {
        return mapper.getAreaName(areaId);
    }

    @Override
    public Area selectbyDistrictId(String districtId) {
        return mapper.selectbyDistrictId(districtId);
    }
}
