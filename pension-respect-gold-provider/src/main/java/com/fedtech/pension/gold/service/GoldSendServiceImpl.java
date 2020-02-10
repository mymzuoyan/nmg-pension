package com.fedtech.pension.gold.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.gold.entity.GoldElderly;
import com.fedtech.pension.gold.entity.GoldSend;
import com.fedtech.pension.gold.mapper.GoldSendMapper;
import com.fedtech.pension.gold.vo.GoldSendVo;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import com.google.common.base.Strings;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 *
 * @author csn
 * @date 2018/1/11
 */
@Service(interfaceClass = GoldSendService.class,version = "1.0.0",timeout =1200000)
@Component
public class GoldSendServiceImpl extends BaseServiceImpl<GoldSend> implements GoldSendService {
    @Autowired
    private GoldSendMapper goldSendMapper;

    @Reference(version ="1.0.0")
    private AreaService areaService;

    @Autowired
    private GoldElderlyService goldElderlyService;

    @Override
    public BaseMapper<GoldSend> getMapper() {
        return goldSendMapper;
    }

    @Override
    public Boolean buFaMoney(GoldSend goldSend) {
        if (null != goldSend) {
            return 1 == goldSendMapper.buFaMoney(goldSend);
        }
        return false;
    }

    @Override
    public PageResponse<GoldSend> goldReissueList(GoldSend filter, @Param("page") PageRequest pageRequest) {
        PageResponse<GoldSend> pageResponse = new PageResponse<GoldSend>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(goldSendMapper.goldReissueList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(goldSendMapper.count1(filter));
        return pageResponse;
    }

    /**银行发放查询列表*/
    @Override
    public PageResponse<GoldSend> selectPageList2(GoldSend filter, PageRequest pageRequest) {
        PageResponse<GoldSend> pageResponse = new PageResponse<GoldSend>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(goldSendMapper.selectPageList2(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(goldSendMapper.count2(filter));
        return pageResponse;
    }

    /**银行补发查询列表*/
    @Override
    public PageResponse<GoldSend> selectBankBufaList(GoldSend filter, PageRequest pageRequest) {
        PageResponse<GoldSend> pageResponse = new PageResponse<GoldSend>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(goldSendMapper.selectBankBufaList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(goldSendMapper.countBankBufa(filter));
        return pageResponse;
    }

    @Override
    public int count2(GoldSend goldSend) {
        return goldSendMapper.count2(goldSend);
    }


    @Override
    public int count1(GoldSend goldSend) {
        return goldSendMapper.count1(goldSend);
    }

    @Override
    public int countBankBufa(GoldSend goldSend) {
        return goldSendMapper.countBankBufa(goldSend);
    }

    @Override
    public List<GoldSend> selectByIdCard(String idcardno) {
        return goldSendMapper.selectByIdCard(idcardno);
    }

    @Override
    public List<GoldSend> getAllRecode(GoldSend goldSend) {
        return goldSendMapper.getAllRecode(goldSend);
    }

    @Override
    public List<GoldSend> getAllRecode2(GoldSend goldSend) {
        return goldSendMapper.getAllRecode2(goldSend);
    }

    @Override
    public List<GoldSend> getAllRecode3(GoldSend goldSend) {
        return goldSendMapper.getAllRecode3(goldSend);
    }

    @Override
    public List<GoldSend> getAllRecode4(GoldSend goldSend) {
        return goldSendMapper.getAllRecode4(goldSend);
    }

    /**
     *  统计发放
     * */
    @Override
    public List<GoldSendVo> statistics(Integer areaId , GoldSendVo filter) {
        Area area0 = areaService.selectByPrimaryKey(areaId);
        List<GoldSendVo> goldSendVos = goldSendMapper.statistic(area0.getLevel() + 1 ,filter);
        List<GoldSendVo> result = new ArrayList<>();
        List<Area> areas = areaService.selectByParentId(areaId);
        Double allCountMoney1 = 0d;
        Double allCountMoney2 = 0d;
        Double allCountMoney3 = 0d;
        Double allCountMoney4 = 0d;
        Double allCountMoney = 0d;
        Integer allCountPer1 = 0;
        Integer allCountPer2 = 0;
        Integer allCountPer3 = 0;
        Integer allCountPer4 = 0;
        Integer allCountPer = 0;
        for (Area area : areas
                ) {
            GoldSendVo en = new GoldSendVo();
            en.setAreaId(area.getId());
            en.setAreaName(area.getName());
            for (GoldSendVo goldSendVo : goldSendVos
                    ) {
                if (!Strings.isNullOrEmpty(goldSendVo.getAreaName()) && goldSendVo.getAreaName().contains(area.getName())) {
                    if (!StringUtils.isEmpty(goldSendVo.getApplyType())) {
                        if (goldSendVo.getApplyType().equals(0)) {
                            en.setCountPer1(goldSendVo.getCount());
                            en.setCountMoney1(goldSendVo.getMoney());
                            allCountPer1 += goldSendVo.getCount();
                            allCountMoney1 += goldSendVo.getMoney();
                            allCountPer+=allCountPer1;
                            allCountMoney+=allCountMoney1;
                        }
                        else if (goldSendVo.getApplyType().equals(1)) {
                            en.setCountPer2(goldSendVo.getCount());
                            en.setCountMoney2(goldSendVo.getMoney());
                            allCountPer2 += goldSendVo.getCount();
                            allCountMoney2 += goldSendVo.getMoney();
                            allCountPer+=allCountPer2;
                            allCountMoney+=allCountMoney2;
                        }
                        else if (goldSendVo.getApplyType().equals(2)) {
                            en.setCountPer3(goldSendVo.getCount());
                            en.setCountMoney3(goldSendVo.getMoney());
                            allCountPer3 += goldSendVo.getCount();
                            allCountMoney3 += goldSendVo.getMoney();
                            allCountPer+=allCountPer3;
                            allCountMoney+=allCountMoney3;
                        }else if (goldSendVo.getApplyType().equals(3)) {
                            en.setCountPer4(goldSendVo.getCount());
                            en.setCountMoney4(goldSendVo.getMoney());
                            allCountPer4 += goldSendVo.getCount();
                            allCountMoney4 += goldSendVo.getMoney();
                            allCountPer+=allCountPer4;
                            allCountMoney+=allCountMoney4;
                        }
                        en.setAllCount(allCountPer);
                        en.setAllMoney(allCountMoney);
                    }
                }
            }
            result.add(en);
        }
        GoldSendVo enAll = new GoldSendVo();
        enAll.setAreaId(area0.getId());
        enAll.setAreaName("合计");
        enAll.setCountMoney1(allCountMoney1);
        enAll.setCountMoney2(allCountMoney2);
        enAll.setCountMoney3(allCountMoney3);
        enAll.setCountMoney4(allCountMoney4);
        enAll.setAllMoney(allCountMoney);
        enAll.setCountPer1(allCountPer1);
        enAll.setCountPer2(allCountPer2);
        enAll.setCountPer3(allCountPer3);
        enAll.setCountPer4(allCountPer4);
        enAll.setAllCount(allCountPer);
        result.add(enAll);
        return result;
    }

    /**补发统计*/
    @Override
    public List<GoldSendVo> buFaStatistics(Integer areaId ,@Param("filter") GoldSendVo filter) {
        Area area0 = areaService.selectByPrimaryKey(areaId);
        List<GoldSendVo> goldSendVos = goldSendMapper.buFaStatistic(area0.getLevel() + 1 ,filter);
        List<GoldSendVo> result = new ArrayList<>();
        List<Area> areas = areaService.selectByParentId(areaId);
        Double allCountMoney1 = 0d;
        Double allCountMoney2 = 0d;
        Double allCountMoney3 = 0d;
        Double allCountMoney4 = 0d;
        Double allCountMoney = 0d;
        Integer allCountPer1 = 0;
        Integer allCountPer2 = 0;
        Integer allCountPer3 = 0;
        Integer allCountPer4 = 0;
        Integer allCountPer = 0;
        for (Area area : areas
                ) {
            GoldSendVo en = new GoldSendVo();
            en.setAreaId(area.getId());
            en.setAreaName(area.getName());
            for (GoldSendVo goldSendVo : goldSendVos
                    ) {
                if (!Strings.isNullOrEmpty(goldSendVo.getAreaName()) && goldSendVo.getAreaName().contains(area.getName())) {
                    if (!StringUtils.isEmpty(goldSendVo.getApplyType())) {
                        if (goldSendVo.getApplyType().equals(0)) {
                            en.setCountPer1(goldSendVo.getCount());
                            en.setCountMoney1(goldSendVo.getBufaMoney());
                            allCountPer1 += goldSendVo.getCount();
                            allCountMoney1 += goldSendVo.getBufaMoney();
                            allCountPer+=allCountPer1;
                            allCountMoney+=allCountMoney1;
                        }
                        else if (goldSendVo.getApplyType().equals(1)) {
                            en.setCountPer2(goldSendVo.getCount());
                            en.setCountMoney2(goldSendVo.getBufaMoney());
                            allCountPer2 += goldSendVo.getCount();
                            allCountMoney2 += goldSendVo.getBufaMoney();
                            allCountPer+=allCountPer2;
                            allCountMoney+=allCountMoney2;
                        }
                        else if (goldSendVo.getApplyType().equals(2)) {
                            en.setCountPer3(goldSendVo.getCount());
                            en.setCountMoney3(goldSendVo.getBufaMoney());
                            allCountPer3 += goldSendVo.getCount();
                            allCountMoney3 += goldSendVo.getBufaMoney();
                            allCountPer+=allCountPer3;
                            allCountMoney+=allCountMoney3;
                        }else if (goldSendVo.getApplyType().equals(3)) {
                            en.setCountPer4(goldSendVo.getCount());
                            en.setCountMoney4(goldSendVo.getBufaMoney());
                            allCountPer4 += goldSendVo.getCount();
                            allCountMoney4 += goldSendVo.getBufaMoney();
                            allCountPer+=allCountPer4;
                            allCountMoney+=allCountMoney4;
                        }
                        en.setAllCount(allCountPer);
                        en.setAllMoney(allCountMoney);
                    }
                }
            }
            result.add(en);
        }
        GoldSendVo enAll = new GoldSendVo();
        enAll.setAreaId(area0.getId());
        enAll.setAreaName("合计");
        enAll.setCountMoney1(allCountMoney1);
        enAll.setCountMoney2(allCountMoney2);
        enAll.setCountMoney3(allCountMoney3);
        enAll.setCountMoney4(allCountMoney4);
        enAll.setAllMoney(allCountMoney);
        enAll.setCountPer1(allCountPer1);
        enAll.setCountPer2(allCountPer2);
        enAll.setCountPer3(allCountPer3);
        enAll.setCountPer4(allCountPer4);
        enAll.setAllCount(allCountPer);
        result.add(enAll);
        return result;
    }


    /**
     * 定时任务:每个月第一天0点执行一次
     * */
    @Override
    @Scheduled(cron = "0 0 0 1 * ?")
    public boolean insertSomeGold() {
        List<GoldElderly> goldElderlies = goldElderlyService.selectAllId();
        List<GoldSend> goldSendList= new ArrayList<>();
        for (GoldElderly a : goldElderlies){
            GoldSend goldSend = new GoldSend();
            goldSend.setElderId(a.getId());
            goldSend.setMoney(a.getGoldSendStandard().getMoneyStandard());
            goldSend.setFafangTime(new Date());

            goldSendList.add(goldSend);
        }
        if (goldSendMapper.insertSomeGold(goldSendList) > 0) {
            return true;
        }
        return false;
    }

    /*@Scheduled(fixedDelay=3000)
    public void test(){
        System.err.println("测试定时器");
    }*/
    @Override
    public int goldSendCountByCity(String city){
        return goldSendMapper.goldSendCountByCity(city);
    }

    @Override
    public int goldSendCountByCityAndYear(String city) {
        return goldSendMapper.goldSendCountByCityAndYear(city);
    }

    @Override
    public int goldSendCountByCityAndDay(String city) {
        return goldSendMapper.goldSendCountByCityAndDay(city);
    }

    @Override
    public int goldSendCountByYear() {
        return goldSendMapper.goldSendCountByYear();
    }

    @Override
    public int goldSendCountByDay() {
        return goldSendMapper.goldSendCountByDay();
    }

}
