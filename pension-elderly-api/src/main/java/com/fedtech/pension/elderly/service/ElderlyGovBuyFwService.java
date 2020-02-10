package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.elderly.entity.ElderlyGovBuyFw;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/10/11
 */
public interface ElderlyGovBuyFwService extends BaseService<ElderlyGovBuyFw> {
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
    ElderlyGovBuyFw selectByElderId(Integer elderId);

    /**
     * 批量增加
     *
     * @param elderlyGovBuyFws
     * @return
     */
    int insertSomeElderGovBuyFw(List<ElderlyGovBuyFw> elderlyGovBuyFws);


    /**
     * 根据老人id更新对象
     *
     * @param record
     * @return
     */
    boolean updateByElderId(ElderlyGovBuyFw record);



    PageResponse<ElderlyGovBuyFw> selectHandlePageList(ElderlyGovBuyFw filter, PageRequest pageRequest);


}
