package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.call.vo.ElderlyGovBuyVisitVo;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ElderlyGovBuyMapper extends BaseMapper<ElderlyGovBuy> {
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
    int updateByElderId(ElderlyGovBuy record);

    /**
     * 根据老人id查询
     *
     * @param elderId
     * @return
     */
    ElderlyGovBuy selectByElderId(@Param("elderId") Integer elderId);

    /**
     * 批量增加
     *
     * @param elderlyGovBuys
     * @return
     */
    int insertSomeElderGovBuy(@Param("elderlyGovBuys") List<ElderlyGovBuy> elderlyGovBuys);




    /**
     * 需要回访的老人分页查询
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<ElderlyGovBuyVisitVo> selectVisitPageList(@Param("filter") ElderlyGovBuy t, @Param("page") PageRequest pageRequest);

    /**
     * 统计筛选后的需要回访的老人数据
     *
     * @param filter
     * @return
     */
    int countVisit(ElderlyGovBuy filter);

    List<ElderlyGovBuy> selectPageListHandle(@Param("filter") ElderlyGovBuy t, @Param("page") PageRequest pageRequest);
    int countHandle(ElderlyGovBuy filter);

}