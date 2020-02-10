package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.JiuYe;
import com.fedtech.pension.elderly.mapper.JiuYeMapper;
import com.fedtech.pension.elderly.vo.EmployStatisticsVo;
import com.fedtech.pension.sys.entity.Area;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@org.springframework.stereotype.Service
@Service(version = "1.0.0", interfaceClass = JiuYeService.class, timeout = 5000, retries = 0)
public class JiuYeServiceImpl extends BaseServiceImpl<JiuYe> implements JiuYeService {
    @Autowired
    private JiuYeMapper jiuYeMapper;

    @Override
    public BaseMapper<JiuYe> getMapper() {
        return jiuYeMapper;
    }

    @Override
    public JiuYe selectByCardNo(String cardNo) {
        return jiuYeMapper.selectByCardNo(cardNo);
    }

    @Override
    public boolean isAdd(JiuYe jiuYe) {
        return jiuYeMapper.isAdd(jiuYe);
    }

    @Override
    public int insertSomeElder(List<JiuYe> jiuYes) {
        return jiuYeMapper.insertSomeElder(jiuYes);
    }

    @Override
    public Integer selectCountByAreaName(String areaName) {
        return jiuYeMapper.selectCountByAreaName(areaName);
    }

    @Override
    public List<EmployStatisticsVo> getStatistics(Integer areaId) {
        //根据父id 查询地区信息
        List<Area> listArea = jiuYeMapper.selectAreaByParentId(areaId);
        List<EmployStatisticsVo> employStatisticsVos = new ArrayList<>();
        int num = 1;
        double allMoney = 0;
        int allPeople = 0;
        for(Area area : listArea){
            List<JiuYe> emp = jiuYeMapper.selectByAreaName(area.getName());
            EmployStatisticsVo employStatisticsVo = new EmployStatisticsVo();
            employStatisticsVo.setAreaName(area.getName());
            employStatisticsVo.setPeopleCount(emp.size());
            employStatisticsVo.setAreaId(area.getId());
            employStatisticsVo.setSerialNumber(num);
            double money = 0;
            for(JiuYe jiuYe:emp){
                money += Double.parseDouble(jiuYe.getBuTieMoney());
            }
            allMoney += money;
            allPeople += emp.size();
            employStatisticsVo.setMoneyCount(money);
            employStatisticsVos.add(employStatisticsVo);
            num++;
        }
        EmployStatisticsVo employStatisticsVo = new EmployStatisticsVo();
        employStatisticsVo.setSerialNumber(num);
        employStatisticsVo.setAreaName("合计");
        employStatisticsVo.setMoneyCount(allMoney);
        employStatisticsVo.setPeopleCount(allPeople);
        employStatisticsVos.add(employStatisticsVo);
        return employStatisticsVos;
    }
}
