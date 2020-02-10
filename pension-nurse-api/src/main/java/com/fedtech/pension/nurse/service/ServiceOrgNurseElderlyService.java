package com.fedtech.pension.nurse.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;

/**
 * @author gengqiang
 * @date 2017/8/22
 */
public interface ServiceOrgNurseElderlyService extends BaseService<ServiceOrgNurseElderly> {
    /**
     * 删除
     *
     * @param elderId
     * @param number
     * @return
     */
    boolean deleteByIdcardnoAndNumber(Integer elderId, String number);

    /**
     * 根据老人ID和编码来获取看护对象
     *
     * @param elderId
     * @param number
     * @return
     */
    ServiceOrgNurseElderly findByIdcardnoAndNumber(Integer elderId, String number);


}
