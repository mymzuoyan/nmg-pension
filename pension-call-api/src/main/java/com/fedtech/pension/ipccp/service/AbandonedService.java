package com.fedtech.pension.ipccp.service;


import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.ipccp.entity.Abandoned;

import java.util.List;

/**
 * Created by CodingQiang on 2016/10/18.
 */
public interface AbandonedService  {


    boolean deleteByPrimaryKey(Integer id, Integer userId);

    boolean deleteByPrimaryKey(Integer id);

    boolean insert(Abandoned record);

    Abandoned insertBackId(Abandoned record);

    Abandoned selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(Abandoned record);

    PageResponse<Abandoned> selectPageList(Abandoned filter, PageRequest pageRequest);

    List<Abandoned> getAllRecode(Abandoned t);

    int count(Abandoned filter);

    boolean insertSome(List<Abandoned> filters);

    List<Abandoned> selectByOrgName(String name);

    boolean deleteSomeMsg(List<Integer> idList);

    /**
     * 获取列表
     *
     * @param abandoned
     * @param pageRequest
     * @return
     */
    List<Abandoned> selectAbandoneds(Abandoned abandoned, PageRequest pageRequest);

    /**
     * @param abandoned
     * @return
     */
    List<String> selectAbandonedCallerId(Abandoned abandoned);

    /**
     * @param Abandoned
     * @return
     */
    int getCountNotContains(Abandoned Abandoned);

    /**
     * @param linkedid
     * @return
     */
    Abandoned selectByLinkedId(String linkedid);

}
