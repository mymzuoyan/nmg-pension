package com.fedtech.pension.org.service;


import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.org.mapper.ServiceOrgAssessmentMapper;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.org.entity.ServiceOrgAssessment;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service(interfaceClass = ServiceOrgAssessmentService.class, version = "1.0.0")
public class ServiceOrgAssessmentServiceImpl extends BaseServiceImpl<ServiceOrgAssessment> implements ServiceOrgAssessmentService {

    @Autowired
    private ServiceOrgAssessmentMapper serviceOrgAssessmentMapper;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Override
    public BaseMapper<ServiceOrgAssessment> getMapper() {
        return serviceOrgAssessmentMapper;
    }

    @Override
    public ServiceOrgAssessment selectByServiceOrgId(Integer id) {
        return serviceOrgAssessmentMapper.selectByServiceOrgId(id);
    }

    @Override
    public Map<String, List<Integer>> getStatistic(Integer areaId) {
        Map<String, List<Integer>> result = new LinkedHashMap<>();
        List<Area> areas = areaService.selectByParentId(areaId);
        ServiceOrgAssessment filter = new ServiceOrgAssessment();
        List<ServiceOrgAssessment> serviceOrgAssessments = this.getAllRecode(filter);
        Integer[] allCount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        for (Area a : areas) {
            Integer[] count = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            for (ServiceOrgAssessment s : serviceOrgAssessments) {
                if (ObjectUtils.isNotNull(s.getAreaName()) && s.getAreaName().contains(a.getName())) {
                    count[0]++;
                    allCount[0]++;
                    switch (s.getGradeDictId()) {
                        case 2:
                            count[2]++;
                            allCount[2]++;
                            break;
                        case 3:
                            count[4]++;
                            allCount[4]++;
                            break;
                        case 4:
                            count[6]++;
                            allCount[6]++;
                            break;
                        default:
                            count[8]++;
                            allCount[8]++;
                            break;
                    }
                    if (ObjectUtils.isNotNull(s.getQustandard()) && s.getQustandard() == 1 && ObjectUtils.isNotNull(s.getStandard()) && s.getStandard() == 1) {
                        count[1]++;
                        allCount[1]++;
                        switch (s.getGradeDictId()) {
                            case 2:
                                count[3]++;
                                allCount[3]++;
                                break;
                            case 3:
                                count[5]++;
                                allCount[5]++;
                                break;
                            case 4:
                                count[7]++;
                                allCount[7]++;
                                break;
                            default:
                                count[9]++;
                                allCount[9]++;
                                break;
                        }
                    }

                }
            }
            result.put(a.getName(), Arrays.asList(count));
        }
        Area area = areaService.selectByPrimaryKey(areaId);
        result.put(area.getName(), Arrays.asList(allCount));
        return result;
    }
}
