package com.fedtech.pension.ipccp.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.ipccp.entity.Abandoned;
import com.fedtech.pension.ipccp.mapper.AbandonedMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/18
 */
@Service(interfaceClass = AbandonedService.class, version = "1.0.0")
public class AbandonedServiceImpl implements AbandonedService {


    @Override
    public boolean deleteByPrimaryKey(Integer id) {
        if (null != id) {
            return 1 == getMapper().deleteByPrimaryKey(id);
        }
        return false;
    }

    @Override
    public boolean deleteByPrimaryKey(Integer id, Integer userId) {
        if (null != id && null != userId) {
            return 1 == getMapper().deleteByPrimaryKey(id, userId);
        }
        return false;
    }

    @Override
    public boolean insert(Abandoned record) {
        if (null != record) {
            return 1 == getMapper().insert(record);
        }
        return false;
    }

    @Override
    public Abandoned insertBackId(Abandoned record) {
        if (null != record) {
            if (1 == getMapper().insert(record)) {
                return record;
            }
        }
        return null;
    }

    @Override
    public Abandoned selectByPrimaryKey(Integer id) {
        if (null != id) {
            return getMapper().selectByPrimaryKey(id);
        }
        return null;
    }

    @Override
    public boolean updateByPrimaryKeySelective(Abandoned record) {
        if (null != record) {
            return 1 == getMapper().updateByPrimaryKeySelective(record);
        }
        return false;
    }

    @Override
    public PageResponse<Abandoned> selectPageList(Abandoned filter, PageRequest pageRequest) {
        PageResponse<Abandoned> pageResponse = new PageResponse<Abandoned>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(getMapper().selectPageList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(getMapper().count(filter));
        return pageResponse;
    }


    @Override
    public int count(Abandoned filter) {
        return getMapper().count(filter);
    }

    @Override
    public List<Abandoned> getAllRecode(Abandoned t) {
        return getMapper().getAllRecode(t);

    }

    @Override
    public boolean insertSome(List<Abandoned> filters) {
        if (getMapper().insertSome(filters) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Abandoned> selectByOrgName(String name) {
        return getMapper().selectByOrgName(name);
    }

    @Override
    public boolean deleteSomeMsg(List<Integer> idList) {
        if (getMapper().deleteSomeMsg(idList) > 0) {
            return true;
        }
        return false;
    }


    @Autowired
    private AbandonedMapper mapper;

    public BaseMapper<Abandoned> getMapper() {
        return mapper;
    }


    @Override
    public List<Abandoned> selectAbandoneds(Abandoned abandoned, PageRequest pageRequest) {
        return mapper.selectPageList(abandoned, pageRequest);
    }

    @Override
    public List<String> selectAbandonedCallerId(Abandoned abandoned) {
        return mapper.selectAbandonedCallerId(abandoned);
    }

    @Override
    public Abandoned selectByLinkedId(String linkedid) {
        return mapper.selectByLinkedId(linkedid);
    }

    @Override
    public int getCountNotContains(Abandoned Abandoned) {
        return mapper.getCountNotContains(Abandoned);
    }
}
