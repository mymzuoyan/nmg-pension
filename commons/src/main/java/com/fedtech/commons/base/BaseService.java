package com.fedtech.commons.base;


import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;

import java.util.List;

/**
 * Created by Gong on 2016/4/8.
 */
public interface BaseService<T> {

    boolean deleteByPrimaryKey(Integer id, Integer userId);

    boolean deleteByPrimaryKey(Integer id);

    boolean insert(T record);

    T insertBackId(T record);

    T selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(T record);

    PageResponse<T> selectPageList(T filter, PageRequest pageRequest);

    List<T> getAllRecode(T t);

    int count(T filter);

    boolean insertSome(List<T> filters);

    List<T> selectByOrgName(String name);

    boolean deleteSomeMsg(List<Integer> idList);
}
