package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.org.entity.ServiceOrgSubsidyApply;
import com.fedtech.pension.org.mapper.ServiceOrgSubsidyApplyMapper;
import com.fedtech.pension.org.vo.ServiceOrgSubsidyApplyStatistic;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 * @date 2018/1/19
 */
@Service(interfaceClass = ServiceOrgSubsidyApplyService.class, version = "1.0.0")
public class ServiceOrgSubsidyApplyServiceImpl extends BaseServiceImpl<ServiceOrgSubsidyApply> implements ServiceOrgSubsidyApplyService {

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Autowired
    private ServiceOrgSubsidyApplyMapper mapper;

    @Override
    public BaseMapper<ServiceOrgSubsidyApply> getMapper() {
        return mapper;
    }

    @Override
    public List<ServiceOrgSubsidyApplyStatistic> getStatistics(ServiceOrgSubsidyApplyStatistic filter) {
        List<Area> areaList = areaService.selectByParentId(filter.getAreaId());
        Area area = areaService.selectByPrimaryKey(filter.getAreaId());
        List<ServiceOrgSubsidyApplyStatistic> result = new ArrayList<>();
        filter.setAreaLevel(area.getLevel() + 1);
        List<ServiceOrgSubsidyApplyStatistic> statistics = mapper.statistic(filter);
        Long allCount = 0L;
        Long jsCount = 0L;
        Long jsUndoCount = 0L;
        Long jsDoneCount = 0L;
        Long jsRefuseCount = 0L;
        Long yyCount = 0L;
        Long yyUndoCount = 0L;
        Long yyDoneCount = 0L;
        Long yyRefuseCount = 0L;
        for (Area a : areaList) {
            boolean b = false;
            ServiceOrgSubsidyApplyStatistic statistic1 = new ServiceOrgSubsidyApplyStatistic();
            for (ServiceOrgSubsidyApplyStatistic statistic : statistics) {
                if (ObjectUtils.isNotNull(statistic.getAreaName()) && a.getName().equals(statistic.getAreaName())) {
                    statistic1.setAreaName(a.getName());
                    statistic1.setAreaId(a.getId());
                    statistic1.setCount(statistic.getCount());
                    statistic1.setJsCount(statistic.getJsCount());
                    statistic1.setJsUndoCount(statistic.getJsUndoCount());
                    statistic1.setJsDoneCount(statistic.getJsDoneCount());
                    statistic1.setJsRefuseCount(statistic.getJsRefuseCount());
                    statistic1.setYyCount(statistic.getYyCount());
                    statistic1.setYyUndoCount(statistic.getYyUndoCount());
                    statistic1.setYyDoneCount(statistic.getYyDoneCount());
                    statistic1.setYyRefuseCount(statistic.getYyRefuseCount());
                    allCount += statistic1.getCount();
                    jsCount += statistic1.getJsCount();
                    jsUndoCount += statistic1.getJsUndoCount();
                    jsDoneCount += statistic1.getJsDoneCount();
                    jsRefuseCount += statistic1.getJsRefuseCount();
                    yyCount += statistic1.getYyCount();
                    yyUndoCount += statistic1.getYyUndoCount();
                    yyDoneCount += statistic1.getYyDoneCount();
                    yyRefuseCount += statistic1.getYyRefuseCount();
                    b = true;
                    break;
                }
            }
            if (b) {
                result.add(statistic1);
            } else {
                statistic1.setAreaId(a.getId());
                statistic1.setAreaName(a.getName());
                statistic1.setCount(0L);
                statistic1.setJsCount(0L);
                statistic1.setJsUndoCount(0L);
                statistic1.setJsDoneCount(0L);
                statistic1.setJsRefuseCount(0L);
                statistic1.setYyCount(0L);
                statistic1.setYyUndoCount(0L);
                statistic1.setYyDoneCount(0L);
                statistic1.setYyRefuseCount(0L);
                result.add(statistic1);
            }
        }
        ServiceOrgSubsidyApplyStatistic statistic1 = new ServiceOrgSubsidyApplyStatistic();
        statistic1.setAreaName(area.getName());
        statistic1.setCount(allCount);
        statistic1.setJsCount(jsCount);
        statistic1.setJsUndoCount(jsUndoCount);
        statistic1.setJsDoneCount(jsDoneCount);
        statistic1.setJsRefuseCount(jsRefuseCount);
        statistic1.setYyCount(yyCount);
        statistic1.setYyUndoCount(yyUndoCount);
        statistic1.setYyDoneCount(yyDoneCount);
        statistic1.setJsRefuseCount(yyRefuseCount);
        result.add(statistic1);
        return result;
    }
}
