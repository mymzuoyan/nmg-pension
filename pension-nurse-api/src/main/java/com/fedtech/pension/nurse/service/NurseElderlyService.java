package com.fedtech.pension.nurse.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.nurse.entity.NurseElderly;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
public interface NurseElderlyService extends BaseService<NurseElderly> {


    /**
     * 根据memberId来获取老人信息
     *
     * @param memberId
     * @return
     */
    NurseElderly findByMemberId(String memberId);


    /**
     * 根据idcardno来获取老人信息
     *
     * @param idcardno
     * @return
     */
    NurseElderly findByIdcardNo(String idcardno);
}
