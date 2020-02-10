package com.fedtech.pension.org.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.org.entity.ServiceOrgBalance;

/**
 *
 * @author gengqiang
 * @date 2017/8/4
 */
public interface ServiceOrgBalanceService extends BaseService<ServiceOrgBalance> {

    /**
     * 根据serviceOrgId来获取
     * @param serviceOrgId
     * @return
     */
    ServiceOrgBalance findByServiceOrgId(Integer serviceOrgId);

    /**
     * 组织增加金额
     * @param serviceOrgId
     * @param money
     * @param type
     * @return
     */
    boolean addBalance(Integer serviceOrgId, Double money, Integer type);


    /**
     * 组织减少金额
     * @param serviceOrgId
     * @param money
     * @param type
     * @return
     */
    boolean subBalance(Integer serviceOrgId, Integer cashId, Double money, Integer type);

    /**
     * 提现
     * @param number
     * @param serviceOrgId
     * @param ip
     * @param cashId
     * @param money
     * @param type
     * @return
     */
    boolean cashMoney(String number, Integer serviceOrgId, String ip, Integer cashId, Double money, Integer type);

}
