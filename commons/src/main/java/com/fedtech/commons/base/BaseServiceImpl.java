package com.fedtech.commons.base;

import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;

import java.util.List;

/**
 * Created by Gong on 2016/4/8.
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {

    public abstract BaseMapper<T> getMapper();


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
    public boolean insert(T record) {
        if (null != record) {
            return 1 == getMapper().insert(record);
        }
        return false;
    }

    @Override
    public T insertBackId(T record) {
        if (null != record) {
            if (1 == getMapper().insert(record)) {
                return record;
            }
        }
        return null;
    }

    @Override
    public T selectByPrimaryKey(Integer id) {
        if (null != id) {
            return getMapper().selectByPrimaryKey(id);
        }
        return null;
    }

    @Override
    public boolean updateByPrimaryKeySelective(T record) {
        if (null != record) {
            return 1 == getMapper().updateByPrimaryKeySelective(record);
        }
        return false;
    }

    @Override
    public PageResponse<T> selectPageList(T filter, PageRequest pageRequest) {
        PageResponse<T> pageResponse = new PageResponse<T>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(getMapper().selectPageList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(getMapper().count(filter));
        return pageResponse;
    }


    @Override
    public int count(T filter) {
        return getMapper().count(filter);
    }

    @Override
    public List<T> getAllRecode(T t) {
        return getMapper().getAllRecode(t);

    }

    @Override
    public boolean insertSome(List<T> filters) {
        if (getMapper().insertSome(filters) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<T> selectByOrgName(String name) {
        return getMapper().selectByOrgName(name);
    }

    @Override
    public boolean deleteSomeMsg(List<Integer> idList) {
        if (getMapper().deleteSomeMsg(idList) > 0) {
            return true;
        }
        return false;
    }

}
