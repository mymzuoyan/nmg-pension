package com.fedtech.pension.org.service;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.Point;
import com.fedtech.commons.utils.GeoUtils;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.mapper.ServiceOrgLocationMapper;
import com.fedtech.pension.org.quantity.ServiceOrgTypeQuantity;
import com.fedtech.pension.org.redis.RedisServiceOrgLocationUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * @author Administrator
 * @date 2016/9/23
 */
@org.springframework.stereotype.Service
@Service(interfaceClass = ServiceOrgLocationService.class, version = "1.0.0")
public class ServiceOrgLocationServiceImpl extends BaseServiceImpl<ServiceOrgLocation> implements ServiceOrgLocationService {

    @Autowired
    private ServiceOrgLocationMapper mapper;
    @Autowired
    private ServiceOrgPriceService serviceOrgPriceService;

    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;


    @Override
    public BaseMapper<ServiceOrgLocation> getMapper() {
        return mapper;
    }

    @Override
    public boolean updateOrInsertLocation(ServiceOrgLocation serviceOrgLocation) {
        if (ObjectUtils.isNotNull(serviceOrgLocation.getServiceOrgId())) {
            if (mapper.updateByServiceOrgId(serviceOrgLocation) == 0) {
                this.insert(serviceOrgLocation);
            }
            ServiceOrgLocation so = this.selectByServiceOrgId(serviceOrgLocation.getServiceOrgId());
            so.setId(serviceOrgLocation.getId());
            so.setLat(serviceOrgLocation.getLat());
            so.setLng(serviceOrgLocation.getLng());
            redisServiceOrgLocationUtil.putServiceOrgLocation(serviceOrgLocation.getServiceOrgId(), so);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<ServiceOrgLocation> selectAllAppServiceOrg(ServiceOrgLocation serviceOrgLocation) {
        return mapper.selectAllAppServiceOrg(serviceOrgLocation);
    }

    @Override
    public List<ServiceOrgLocation> selectAllServiceOrg(ServiceOrgLocation serviceOrgLocation) {
        return mapper.selectAllServiceOrg(serviceOrgLocation);
    }

    @Override
    public List<ServiceOrgLocation> serviceOrgLocationCache(ServiceOrgLocation serviceOrgLocation) {
        List<ServiceOrgLocation> list = new ArrayList<>();
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            ServiceOrgLocation s = (ServiceOrgLocation) hashMap.get(id);
            if (ObjectUtils.isNull(s.getLat()) || ObjectUtils.isNull(s.getLng())) {
                continue;
            }
            if (ObjectUtils.isNotNull(serviceOrgLocation.getAreaName())) {
                if (!StringUtils.isEmpty(s.getAreaName())) {
                    if (!s.getAreaName().contains(serviceOrgLocation.getAreaName())) {
                        continue;
                    }
                }

            }
            if (ObjectUtils.isNotNull(serviceOrgLocation.getType())) {
                if (ObjectUtils.isNotNull(s.getType())) {
                    if (!s.getType().equals(serviceOrgLocation.getType())) {
                        continue;
                    }
                }
            }
            if (ObjectUtils.isNotNull(serviceOrgLocation.getServiceProjectName())) {
                if (!StringUtils.isEmpty(s.getServiceProjectName())) {
                    if (!s.getServiceProjectName().contains(serviceOrgLocation.getServiceProjectName())) {
                        continue;
                    }
                }

            }
            if (ObjectUtils.isNotNull(serviceOrgLocation.getServiceOrgName())) {
                if (!StringUtils.isEmpty(s.getServiceOrgName())) {
                    if (!s.getServiceOrgName().contains(serviceOrgLocation.getServiceOrgName())) {
                        continue;
                    }
                }
            }
            if (ObjectUtils.isNotNull(s.getInstitutionTypeDictId()) && ServiceOrgTypeQuantity.INSTITUTION.equals(s.getType())) {
                continue;
            }
            if (ObjectUtils.isNotNull(serviceOrgLocation.getInstitutionTypeDictId())) {
                if (ObjectUtils.isNull(s.getInstitutionTypeDictId()) || !s.getInstitutionTypeDictId().contains(serviceOrgLocation.getInstitutionTypeDictId())) {
                    continue;
                }
            }
            list.add(s);
        }
        return list;
    }

    @Override
    public ServiceOrgLocation selectByServiceOrgId(Integer serviceOrgId) {
        return (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(serviceOrgId);
    }

    @Override
    public List<ServiceOrgLocation> selectPageListByRange(ServiceOrgLocation filter, Integer pageNum, Integer length, Double lat, Double lng, Double distance) {
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        List<ServiceOrgLocation> result = new ArrayList<>();
        Map<ServiceOrgLocation, Double> map = new HashMap<ServiceOrgLocation, Double>();
        Point user = new Point();
        user.setLat(lat);
        user.setLng(lng);
        for (Integer id : ids) {
            ServiceOrgLocation s = (ServiceOrgLocation) hashMap.get(id);
            if (ObjectUtils.isNotNull(filter.getAreaName())) {
                if (!s.getAreaName().contains(filter.getAreaName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceOrgName())) {
                if (!s.getServiceOrgName().contains(filter.getServiceOrgName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getInstitutionTypeDictId())) {
                if (ObjectUtils.isNull(s.getInstitutionTypeDictId()) || !s.getInstitutionTypeDictId().contains(filter.getInstitutionTypeDictId())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceProjectName())) {
                if (ObjectUtils.isNull(s.getServiceProjectName()) || !s.getServiceProjectName().contains(filter.getServiceProjectName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(s.getLat()) && ObjectUtils.isNotNull(s.getLng()) && ObjectUtils.isNotNull(distance)) {
                Point point = new Point();
                point.setLat(s.getLat());
                point.setLng(s.getLng());
                map.put(s, GeoUtils.getDistance(user, point));
            } else {
                map.put(s, 1000000.0);
            }
        }
        //排序
        if (ObjectUtils.isNotNull(map)) {
            List<Map.Entry<ServiceOrgLocation, Double>> list = new ArrayList<Map.Entry<ServiceOrgLocation, Double>>(map.entrySet());
            Collections.sort(list, new Comparator<Map.Entry<ServiceOrgLocation, Double>>() {
                public int compare(Map.Entry<ServiceOrgLocation, Double> o1,
                                   Map.Entry<ServiceOrgLocation, Double> o2) {
                    return (o1.getValue().compareTo(o2.getValue()));
                }
            });
            for (Map.Entry<ServiceOrgLocation, Double> entry : list) {
                result.add(entry.getKey());
            }
        }
        return result;
    }

    @Override
    public List<ServiceOrgLocation> selectPageListByPrice(ServiceOrgLocation filter, Integer pageNum, Integer length, String orderDir, Double lat, Double lng, Double distance) {

        List<ServiceOrgLocation> priceResult = new ArrayList<>();
        PageRequest pageRequest = new PageRequest();
        pageRequest.setOrderDir(orderDir);
        pageRequest.setOrderField("b.price");
        List<ServiceOrgPrice> serviceOrgPrices = serviceOrgPriceService.selectServiceOrgsByName(filter.getServiceProjectName(), pageRequest);
        List<Integer> sid = new ArrayList<>();
        for (ServiceOrgPrice s : serviceOrgPrices) {
            try {
                sid.add(s.getServiceOrgId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        int sum = 0;
        for (Integer id : sid) {
            ServiceOrgLocation s = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(id);
            if (ObjectUtils.isNotNull(filter.getAreaName())) {
                if (!s.getAreaName().contains(filter.getAreaName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceOrgName())) {
                if (!s.getServiceOrgName().contains(filter.getServiceOrgName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getInstitutionTypeDictId())) {
                if (ObjectUtils.isNull(s.getInstitutionTypeDictId()) || !s.getInstitutionTypeDictId().contains(filter.getInstitutionTypeDictId())) {
                    continue;
                }
            }
            sum++;
            ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(s.getServiceOrgId());
            serviceOrgLocation.setSort(sum);
            priceResult.add(serviceOrgLocation);
        }
        return priceResult;
    }

    @Override
    public List<ServiceOrgLocation> selectPageListByFeedback(ServiceOrgLocation filter, Integer pageNum, Integer length, Double lat, Double lng, Double distance) {
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        List<ServiceOrgLocation> result = new ArrayList<>();
        Map<ServiceOrgLocation, Double> map = new HashMap<ServiceOrgLocation, Double>();
        Point user = new Point();
        user.setLat(lat);
        user.setLng(lng);
        for (Integer id : ids) {
            ServiceOrgLocation s = (ServiceOrgLocation) hashMap.get(id);
            if (ObjectUtils.isNotNull(filter.getAreaName())) {
                if (!s.getAreaName().contains(filter.getAreaName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceOrgName())) {
                if (!s.getServiceOrgName().contains(filter.getServiceOrgName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getInstitutionTypeDictId())) {
                if (ObjectUtils.isNull(s.getInstitutionTypeDictId()) || !s.getInstitutionTypeDictId().contains(filter.getInstitutionTypeDictId())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceProjectName())) {
                if (ObjectUtils.isNull(s.getServiceProjectName()) || !s.getServiceProjectName().contains(filter.getServiceProjectName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(s.getLat()) && ObjectUtils.isNotNull(s.getLng()) && ObjectUtils.isNotNull(distance)) {
                Point point = new Point();
                point.setLat(s.getLat());
                point.setLng(s.getLng());
                if (ObjectUtils.isNotNull(s.getFeedbackRate())) {
                    map.put(s, s.getFeedbackRate().doubleValue());
                } else {
                    map.put(s, 0D);
                }

            }
        }
        //排序
        if (ObjectUtils.isNotNull(map)) {
            List<Map.Entry<ServiceOrgLocation, Double>> list = new ArrayList<Map.Entry<ServiceOrgLocation, Double>>(map.entrySet());
            Collections.sort(list, new Comparator<Map.Entry<ServiceOrgLocation, Double>>() {
                public int compare(Map.Entry<ServiceOrgLocation, Double> o1,
                                   Map.Entry<ServiceOrgLocation, Double> o2) {
                    return (o2.getValue().compareTo(o1.getValue()));
                }
            });
            for (Map.Entry<ServiceOrgLocation, Double> entry : list) {
                result.add(entry.getKey());
            }
        }
        return result;
    }

    @Override
    public List<ServiceOrgLocation> selectPageListByGrade(ServiceOrgLocation filter, Integer pageNum, Integer length, Double lat, Double lng, Double distance) {
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        List<ServiceOrgLocation> result = new ArrayList<>();
        Map<ServiceOrgLocation, Double> map = new HashMap<ServiceOrgLocation, Double>();
        Point user = new Point();
        user.setLat(lat);
        user.setLng(lng);
        for (Integer id : ids) {
            ServiceOrgLocation s = (ServiceOrgLocation) hashMap.get(id);
            if (ObjectUtils.isNotNull(filter.getAreaName())) {
                if (!s.getAreaName().contains(filter.getAreaName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceOrgName())) {
                if (!s.getServiceOrgName().contains(filter.getServiceOrgName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getInstitutionTypeDictId())) {
                if (ObjectUtils.isNull(s.getInstitutionTypeDictId()) || !s.getInstitutionTypeDictId().contains(filter.getInstitutionTypeDictId())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceProjectName())) {
                if (ObjectUtils.isNull(s.getServiceProjectName()) || !s.getServiceProjectName().contains(filter.getServiceProjectName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(s.getLat()) && ObjectUtils.isNotNull(s.getLng()) && ObjectUtils.isNotNull(distance)) {
                Point point = new Point();
                point.setLat(s.getLat());
                point.setLng(s.getLng());
                if (ObjectUtils.isNotNull(s.getGradeDictId())) {
                    map.put(s, s.getGradeDictId().doubleValue());
                } else {
                    map.put(s, 0D);
                }

            }
        }
        //排序
        if (ObjectUtils.isNotNull(map)) {
            List<Map.Entry<ServiceOrgLocation, Double>> list = new ArrayList<Map.Entry<ServiceOrgLocation, Double>>(map.entrySet());
            Collections.sort(list, new Comparator<Map.Entry<ServiceOrgLocation, Double>>() {
                public int compare(Map.Entry<ServiceOrgLocation, Double> o1,
                                   Map.Entry<ServiceOrgLocation, Double> o2) {
                    return (o2.getValue().compareTo(o1.getValue()));
                }
            });
            for (Map.Entry<ServiceOrgLocation, Double> entry : list) {
                result.add(entry.getKey());
            }
        }
        return result;
    }

    @Override
    public List<ServiceOrgLocation> getServiceOrgByFilter(ServiceOrgLocation filter) {
        HashMap hashMap = redisServiceOrgLocationUtil.getHasMap();
        Set<Integer> ids = hashMap.keySet();
        List<ServiceOrgLocation> result = new ArrayList<>();
        for (Integer id : ids) {
            ServiceOrgLocation s = (ServiceOrgLocation) hashMap.get(id);
            if (ObjectUtils.isNotNull(filter.getAreaName())) {
                if (!s.getAreaName().contains(filter.getAreaName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceOrgName())) {
                if (!s.getServiceOrgName().contains(filter.getServiceOrgName())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getInstitutionTypeDictId())) {
                if (ObjectUtils.isNotNull(s.getInstitutionTypeDictId()) && !s.getInstitutionTypeDictId().contains(filter.getInstitutionTypeDictId())) {
                    continue;
                }
            }
            if (ObjectUtils.isNotNull(filter.getServiceProjectName())) {
                if (ObjectUtils.isNotNull(s.getServiceProjectName()) && !s.getServiceProjectName().contains(filter.getServiceProjectName())) {
                    continue;
                }
            }
            result.add(s);
        }
        return result;
    }
}
