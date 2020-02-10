package com.fedtech.pension.power.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.power.entity.ElderCapacity;

import java.util.List;

public interface ElderCapacityService extends BaseService<ElderCapacity> {


    boolean  update(ElderCapacity elderCapacity);
    ElderCapacity  selectElderCapacity();
    boolean  deleteSomeMsg(List<Integer> idList);
    boolean deleteByPrimaryKey(Integer id);
    /**
     * 批量添加老人
     *
     * @param elderCapacitys
     * @return
     */
    int insertSomeElderCapacity(List<ElderCapacity> elderCapacitys);

    /**
     * 根据身份证号查询评估老人信息
     *
     * @param idCard
     * @return
     */
    ElderCapacity findByIdcard(String idCard);

    //根据serverId查询关联的老人评估列表
    List<ElderCapacity> selectByServerId(String serverId);
}
