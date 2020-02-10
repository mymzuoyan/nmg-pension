package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.ElderCapacity;
import com.fedtech.pension.power.mapper.ElderCapacityMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service(interfaceClass = ElderCapacityService.class, version = "1.0.0")
public class ElderCapacityServiceImpl extends BaseServiceImpl<ElderCapacity> implements ElderCapacityService {

    @Autowired
    private ElderCapacityMapper  elderCapacityMapper;

    @Override
    public BaseMapper<ElderCapacity> getMapper() {
        return elderCapacityMapper;
    }

    @Override
    public boolean update(ElderCapacity elderCapacity) {
        if(null!=elderCapacity)
        {
            if(elderCapacity.getId()!=null)
            {
                return 1 == elderCapacityMapper.updateByPrimaryKeySelective(elderCapacity);
            }
            else
            {
                return 1 == elderCapacityMapper.insert(elderCapacity);
            }
        }
        return true;
    }

    @Override
    public ElderCapacity selectElderCapacity() {
        return elderCapacityMapper.findElderCapacity();
    }


    @Override
    public int insertSomeElderCapacity(List<ElderCapacity> elderCapacitys) {
        int count = elderCapacityMapper.insertSomeElderCapacity(elderCapacitys);
        return count;
    }

    @Override
    public ElderCapacity findByIdcard(String idCard) {
        ElderCapacity elderCapacity = elderCapacityMapper.selectByIdcard(idCard);
        return elderCapacity;
    }


    @Override
    public ElderCapacity selectByPrimaryKey(Integer id) {
        ElderCapacity elderCapacity=super.selectByPrimaryKey(id);
        return elderCapacity;
    }

    @Override
    public List<ElderCapacity> selectByServerId(String serverId) {
        return elderCapacityMapper.selectByServerId(serverId);
    }
}
