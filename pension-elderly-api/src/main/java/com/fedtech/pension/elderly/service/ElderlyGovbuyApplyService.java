package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApply;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApplyDoc;
import com.fedtech.pension.sys.entity.User;

/**
 * Created by gengqiang on 2017/7/24.
 */
public interface ElderlyGovbuyApplyService extends BaseService<ElderlyGovbuyApply> {

    /**
     * 获取特定的区域的最新的编码
     * @param number
     * @return
     */
    String findByLastNumber(String number);


    /**
     * 生成申请编码的前置部分
     * @param areaId
     * @return
     */
     String createApplyPreNumber(Integer areaId);

    /**
     * 处理政府购买服务申请
     * @param apply
     * @param doc
     * @return
     */
     boolean handleGovBuyApply(ElderlyGovbuyApply apply, ElderlyGovbuyApplyDoc doc, User handleUser);

}
