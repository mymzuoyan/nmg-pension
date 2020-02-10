package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.IdcardValidator;
import com.fedtech.pension.elderly.entity.ElderlyOrderApp;
import com.fedtech.pension.elderly.mapper.ElderlyOrderAppMapper;
import com.fedtech.pension.elderly.redis.RedisTemplateUtil;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.SmsLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.List;


/**
 * 老人基础信息
 *
 * @author gengqiang
 */

@Service(version = "1.0.0", interfaceClass = ElderlyOrderAppService.class, timeout = 5000, retries = 0)
public class ElderlyOrderAppServiceImpl extends BaseServiceImpl<ElderlyOrderApp> implements ElderlyOrderAppService {

    @Autowired
    private RedisTemplate redisTemplate;


    @Autowired
    private ElderlyOrderAppMapper elderlyOrderMapper;

    @Autowired
    private ElderlyAssessmentService elderlyAssessmentService;

    @Reference(version = "1.0.0")
    private SmsLogService smsLogService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    private IdcardValidator validator = null;

    @Override
    public BaseMapper<ElderlyOrderApp> getMapper() {
        return elderlyOrderMapper;
    }



    @Override
    public ElderlyOrderApp insertBackId(ElderlyOrderApp record) {
//        record.setCreateTime(new Date());
        if (super.insert(record)) {
            //更新缓存
//            updateElderStatistic(record);
            return record;
        }
        return null;
    }
    @Override
    public boolean insert(ElderlyOrderApp record) {
//        record.setCreateTime(new Date());
        if (super.insert(record)) {
            //更新缓存
//            updateElderStatistic(record);
            return true;
        }
        return false;
    }

    @Override
    public List<ElderlyOrderApp> selectCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrderRobCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrderRobCountList(filter);
    }

    @Override
    public Integer selectOrderNew(ElderlyOrderApp filter){
       return  elderlyOrderMapper.selectOrderNew(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectNotServerCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectNotServerCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOnServerCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOnServerCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectNotPayCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectNotPayCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectHasPayCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectHasPayCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectServerOrderALLCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectServerOrderALLCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrgNotSendList(ElderlyOrderApp filter){
        return elderlyOrderMapper.selectOrgNotSendList(filter);
    }

    @Override
    public ElderlyOrderApp selectByPrimaryKey(Integer id) {
        ElderlyOrderApp elderlyMsg = super.selectByPrimaryKey(id);
        return elderlyMsg;
    }

    @Override
    public int updateServerRobStatus(ElderlyOrderApp elderlyOrderApp){
        return  elderlyOrderMapper.updateServerRobStatus(elderlyOrderApp);
    }

    @Override
    public List<ElderlyOrderApp> selectServerOrderZC() {
        return elderlyOrderMapper.selectServerOrderZC();
    }

    @Override
    public List<ElderlyOrderApp> selectByOrgId(Integer orgId){
        return elderlyOrderMapper.selectByOrgId(orgId);
    }

    @Override
    public List<ElderlyOrderApp> selectByOrgIdToday(){
        return elderlyOrderMapper.selectOrderToday();
    }
    @Override
    public List<ElderlyOrderApp> selectByOrgIdToday(Integer orgId){
        return elderlyOrderMapper.selectByOrgIdToday(orgId);
    }

    @Override
    public List<ElderlyOrderApp> selectByOrgId(){
        return elderlyOrderMapper.selectOrder();
    }


    @Override
    public List<ElderlyOrderApp> selectOrderCountByMonth(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrderCountByMonth(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrgOrderCountByMonth(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrgOrderCountByMonth(filter);
    }


    @Override
    public int selectOrderCountByVarsType(ElderlyOrderApp filter) {
      return   elderlyOrderMapper.selectOrderCountByVarsType(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrgNotServerCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrgNotServerCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrgOnServerCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrgOnServerCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrgNotPayCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrgNotPayCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrgHasPayCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrgHasPayCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectOrgServerOrderALLCountList(ElderlyOrderApp filter) {
        return elderlyOrderMapper.selectOrgServerOrderALLCountList(filter);
    }

    @Override
    public List<ElderlyOrderApp> selectServiceOrgMapBigData() {
        return elderlyOrderMapper.selectServiceOrgMapBigData();
    }
    @Override
    public List<ElderlyOrderApp> selectVarsCountBigData(){
        return elderlyOrderMapper.selectVarsCountBigData();
    }

    @Override
    public ElderlyOrderApp selectServiceCountBigData(){
        return elderlyOrderMapper.selectServiceCountBigData();
    }

    @Override
    public int getCardCountByArea(String area){
        return elderlyOrderMapper.getCardCountByArea(area);
    }
    @Override
    public int getfreePassCountByArea(String area){
        return elderlyOrderMapper.getfreePassCountByArea(area);
    }

    @Override
    public int getSignCountByArea(String area){
        return elderlyOrderMapper.getSignCountByArea(area);
    }

    @Override
    public PageResponse<ElderlyOrderApp> selectWebPageList(ElderlyOrderApp filter, PageRequest pageRequest) {
        PageResponse<ElderlyOrderApp> pageResponse = new PageResponse<ElderlyOrderApp>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(elderlyOrderMapper.selectWebPageList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(elderlyOrderMapper.webcount(filter));
        return pageResponse;
    }

    @Override
    public int webcount(ElderlyOrderApp filter) {
        return elderlyOrderMapper.webcount(filter);
    }

    @Override
    public double getGoldMoney(){
        return  elderlyOrderMapper.getGoldMoney();
    }

}
