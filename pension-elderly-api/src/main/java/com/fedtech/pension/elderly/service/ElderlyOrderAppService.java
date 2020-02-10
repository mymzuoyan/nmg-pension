
package com.fedtech.pension.elderly.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.elderly.entity.ElderlyOrderApp;

import java.util.List;

/**
 * 老人基础信息
 *
 * @author gengqiang
 */

public interface ElderlyOrderAppService extends BaseService<ElderlyOrderApp> {
    public boolean insert(ElderlyOrderApp record) ;

    public List<ElderlyOrderApp> selectCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrderRobCountList(ElderlyOrderApp filter);
    public Integer selectOrderNew(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectNotServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOnServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectNotPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectHasPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectServerOrderALLCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgNotSendList(ElderlyOrderApp filter);
    public int updateServerRobStatus(ElderlyOrderApp elderlyOrderApp);

    public List<ElderlyOrderApp> selectServerOrderZC();
    public List<ElderlyOrderApp> selectByOrgId(Integer orgId);
    public List<ElderlyOrderApp> selectByOrgId();
    public List<ElderlyOrderApp> selectByOrgIdToday(Integer orgId);
    public List<ElderlyOrderApp> selectByOrgIdToday();


    public List<ElderlyOrderApp> selectOrderCountByMonth(ElderlyOrderApp filter);

    public List<ElderlyOrderApp> selectOrgOrderCountByMonth(ElderlyOrderApp filter);


    public int selectOrderCountByVarsType(ElderlyOrderApp filter);
//机构工单
    public List<ElderlyOrderApp> selectOrgNotServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgOnServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgNotPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgHasPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgServerOrderALLCountList(ElderlyOrderApp filter);

    public List<ElderlyOrderApp> selectServiceOrgMapBigData();
    public List<ElderlyOrderApp> selectVarsCountBigData();
    public ElderlyOrderApp selectServiceCountBigData();
    public double getGoldMoney();
    public int getCardCountByArea(String area);
    public int getfreePassCountByArea(String area);
    public int getSignCountByArea(String area);

    public PageResponse<ElderlyOrderApp> selectWebPageList(ElderlyOrderApp filter, PageRequest pageRequest);
    public  int webcount(ElderlyOrderApp filter);
}
