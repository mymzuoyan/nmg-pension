package com.fedtech.pension.power.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.power.entity.ElderCapacity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ElderCapacityMapper  extends BaseMapper<ElderCapacity> {

    ElderCapacity selectElderCapacityById(Integer id);
    /**
     * 获取当前能力信息
     *
     * @return
     */
    ElderCapacity findElderCapacity();
    /**
     * 新增导入的评估老人信息
     *@param elderCapacitys
     * @return
     */
    int insertSomeElderCapacity(@Param("elderCapacitys") List<ElderCapacity> elderCapacitys);

    /**
     * 根据身份证号查询评估老人信息
     *@param idCard
     * @return
     */
    ElderCapacity selectByIdcard(@Param("idCard") String idCard);

    List<ElderCapacity> selectByServerId(@Param("serverId") String serverId);
}
