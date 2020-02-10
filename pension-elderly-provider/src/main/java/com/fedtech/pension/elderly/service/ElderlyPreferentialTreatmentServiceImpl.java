package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.ElderlyPreferentialTreatment;
import com.fedtech.pension.elderly.mapper.ElderlyPreferentialTreatmentMapper;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

/**
 * @author gengqiang
 * @date 2017/10/20
 */
@Service(interfaceClass = ElderlyPreferentialTreatmentService.class, version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyPreferentialTreatmentServiceImpl extends BaseServiceImpl<ElderlyPreferentialTreatment> implements ElderlyPreferentialTreatmentService {

    @Autowired
    private ElderlyPreferentialTreatmentMapper mapper;

    @Reference(version = "1.0.0")
    private AreaService areaService;


    @Override
    public BaseMapper<ElderlyPreferentialTreatment> getMapper() {
        return mapper;
    }

    @Override
    public String createApplyPreNumber(Integer areaId) {
        Area area = areaService.selectByPrimaryKey(areaId);
        String deptcode = area.getDistrictId();
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        String number = "";
        if (deptcode.length() >= 7) {
            number = deptcode.substring(0, 6) + year;
        } else {
            number = "320100" + year;
        }
        return number;
    }

    @Override
    public synchronized String createApplyNewNumber(Integer areaId) {
        String number = "";
        try {
            number = this.createApplyPreNumber(areaId);
        } catch (Exception e) {
            return "-1";
        }
        String lastNum = mapper.findByLastNumber(number);
        if (ObjectUtils.isNotNull(lastNum)) {
            number = "" + (Long.parseLong(lastNum) + 1);
        } else {
            number += "00001";
        }
        return number;
    }
}
