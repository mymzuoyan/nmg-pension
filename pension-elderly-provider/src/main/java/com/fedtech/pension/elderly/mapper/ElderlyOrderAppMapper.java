package com.fedtech.pension.elderly.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.elderly.entity.ElderlyOrderApp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface ElderlyOrderAppMapper extends BaseMapper<ElderlyOrderApp> {

    public List<ElderlyOrderApp> selectCountList(ElderlyOrderApp filter);

    public List<ElderlyOrderApp> selectOrderRobCountList(ElderlyOrderApp filter);
    public Integer selectOrderNew (ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectNotServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOnServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectNotPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectHasPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectServerOrderALLCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgNotSendList(ElderlyOrderApp filter);

    public int updateServerRobStatus(ElderlyOrderApp elderlyOrderApp);

    public List<ElderlyOrderApp> selectServerOrderZC();
    public List<ElderlyOrderApp> selectByOrgId(@Param("orgId") Integer orgId);
    public List<ElderlyOrderApp> selectOrder();
    public List<ElderlyOrderApp> selectByOrgIdToday(@Param("orgId") Integer orgId);
    public List<ElderlyOrderApp> selectOrderToday();


    public List<ElderlyOrderApp> selectOrderCountByMonth(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgOrderCountByMonth(ElderlyOrderApp filter);
    public int selectOrderCountByVarsType(ElderlyOrderApp filter);

   //机构工单
    public List<ElderlyOrderApp> selectOrgNotServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgOnServerCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgNotPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgHasPayCountList(ElderlyOrderApp filter);
    public List<ElderlyOrderApp> selectOrgServerOrderALLCountList(ElderlyOrderApp filter);

    //大数据页面统计
    public List<ElderlyOrderApp> selectServiceOrgMapBigData();
    public List<ElderlyOrderApp> selectVarsCountBigData();
    public ElderlyOrderApp selectServiceCountBigData();
    public double getGoldMoney();
    public int getCardCountByArea(String area);
    public int getfreePassCountByArea(String area);
    public int getSignCountByArea(String area);

    List<ElderlyOrderApp> selectWebPageList(@Param("filter") ElderlyOrderApp filter, @Param("page") PageRequest page);
    int webcount(ElderlyOrderApp filter);
//    public Map<String,Object> getMoney();







}