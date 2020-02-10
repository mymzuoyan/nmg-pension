package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderlyPreferentialTreatment;

/**
 *
 * @author gengqiang
 * @date 2017/10/20
 */
public interface ElderlyPreferentialTreatmentService extends BaseService<ElderlyPreferentialTreatment> {



    /**
     * 生成申请编码的前置部分
     *
     * @param areaId
     * @return
     */
    String createApplyPreNumber(Integer areaId);

    /**
     * 生成申请编码
     * @param areaId
     * @return
     */
    String createApplyNewNumber(Integer areaId);

}
