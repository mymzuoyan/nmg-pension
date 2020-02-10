package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.call.vo.ElderlyGovBuyVisitVo;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/10/11
 */
public interface ElderlyGovBuyService extends BaseService<ElderlyGovBuy> {
    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    boolean deleteSome(List<Integer> ids);

    /**
     * 根据老人id查询对象
     *
     * @param elderId
     * @return
     */
    ElderlyGovBuy selectByElderId(Integer elderId);

    /**
     * 批量增加
     *
     * @param elderlyGovBuys
     * @return
     */
    int insertSomeElderGovBuy(List<ElderlyGovBuy> elderlyGovBuys);

    /**
     * 根据老人id更新对象
     *
     * @param record
     * @return
     */
    boolean updateByElderId(ElderlyGovBuy record);


    /**
     * 需要回访的老人分页查询
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<ElderlyGovBuyVisitVo> selectVisitPageList(ElderlyGovBuy filter, PageRequest pageRequest);
    PageResponse<ElderlyGovBuy> selectHandlePageList(ElderlyGovBuy filter, PageRequest pageRequest);
}
