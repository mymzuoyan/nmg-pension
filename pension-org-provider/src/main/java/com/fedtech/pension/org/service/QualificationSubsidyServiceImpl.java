package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.QualificationSubsidy;
import com.fedtech.pension.org.mapper.QualificationSubsidyMapper;
import com.fedtech.pension.org.vo.QualificationStatistics;
import com.fedtech.pension.sys.entity.Area;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DMJ
 * @date 2019/4/3
 */
@Service(interfaceClass = QualificationSubsidyService.class,version = "1.0.0")
public class QualificationSubsidyServiceImpl extends BaseServiceImpl<QualificationSubsidy> implements QualificationSubsidyService{

    @Autowired
    private QualificationSubsidyMapper qualificationSubsidyMapper;

    @Override
    public BaseMapper<QualificationSubsidy> getMapper() {
        return qualificationSubsidyMapper;
    }

    @Override
    public int getAreaId(String areaName) {
        return qualificationSubsidyMapper.getAreaId(areaName);
    }

    @Override
    public List<Area> getListArea() {
        return qualificationSubsidyMapper.getListArea();
    }

    @Override
    public List<QualificationStatistics> getStatistics(Integer areaId) {
        List<Area> areaList = qualificationSubsidyMapper.getListAreaByParentId(areaId);
        List<QualificationStatistics> listQual = new ArrayList<>();
        int waitVerityAll = 0;
        int passVerityAll = 0;
        int notPassVerityAll = 0;
        int allSum = 0;
        int num = 1;
        for(Area area : areaList){
            QualificationStatistics qualificationStatistics = new QualificationStatistics();
            qualificationStatistics.setAreaName(area.getName());
            qualificationStatistics.setAreaId(area.getId());
            qualificationStatistics.setNumber(num);
            List<Map<String,Integer>> list = qualificationSubsidyMapper.selectCount(area.getName());
            int countAll = 0;
            if(list.size()>0){
                for(Map map:list){
                    if((Integer) map.get("verityStatus") == 0){
                        qualificationStatistics.setWaitVerity(((Number)map.get("count")).intValue());
                        countAll += ((Number)map.get("count")).intValue();
                        waitVerityAll += ((Number)map.get("count")).intValue();
                    }else if((Integer) map.get("verityStatus") == 1){
                        qualificationStatistics.setPassVerity(((Number)map.get("count")).intValue());
                        countAll += ((Number)map.get("count")).intValue();
                        passVerityAll += ((Number)map.get("count")).intValue();
                    }else if((Integer) map.get("verityStatus") == 2){
                        qualificationStatistics.setNotPassVerity(((Number)map.get("count")).intValue());
                        countAll += ((Number)map.get("count")).intValue();
                        notPassVerityAll += ((Number)map.get("count")).intValue();
                    }
                }
            }
            qualificationStatistics.setVeritySum(countAll);
            allSum += countAll;
            listQual.add(qualificationStatistics);
            num++;
        }
        QualificationStatistics qualificationStatistics = new QualificationStatistics();
        qualificationStatistics.setAreaName("合计");
        qualificationStatistics.setPassVerity(passVerityAll);
        qualificationStatistics.setWaitVerity(waitVerityAll);
        qualificationStatistics.setNotPassVerity(notPassVerityAll);
        qualificationStatistics.setVeritySum(allSum);
        qualificationStatistics.setNumber(num);
        listQual.add(qualificationStatistics);
        return listQual;
    }
}
