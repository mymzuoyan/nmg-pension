package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.elderly.entity.ElderlyGovBuyFw;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ElderlyGovBuyFwMapper extends BaseMapper<ElderlyGovBuyFw> {
    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    int deleteSome(@Param("ids") List<Integer> ids);

    /**
     * 根据老人id更新对象
     *
     * @param record
     * @return
     */
    int updateByElderId(ElderlyGovBuyFw record);

    /**
     * 根据老人id查询
     *
     * @param elderId
     * @return
     */
    ElderlyGovBuyFw selectByElderId(@Param("elderId") Integer elderId);

    /**
     * 批量增加
     *
     * @param elderlyGovBuyFws
     * @return
     */
    int insertSomeElderGovBuyFw(@Param("elderlyGovBuyFws") List<ElderlyGovBuyFw> elderlyGovBuyFws);


    List<ElderlyGovBuyFw> selectPageListHandle(@Param("filter") ElderlyGovBuyFw t, @Param("page") PageRequest pageRequest);
    int countHandle(ElderlyGovBuyFw filter);

}