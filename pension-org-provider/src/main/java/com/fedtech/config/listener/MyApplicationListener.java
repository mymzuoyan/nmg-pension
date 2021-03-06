package com.fedtech.config.listener;

import com.fedtech.commons.utils.RedisUtils;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.redis.RedisTemplateUtil;
import com.fedtech.pension.org.service.ServiceOrgLocationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


/**
 * @author CodingQiang
 * @date 2016/12/30
 */
@Service
public class MyApplicationListener implements InitializingBean, ApplicationListener<ApplicationEvent> {

    static Logger logger = LoggerFactory.getLogger(MyApplicationListener.class);

    @Autowired
    private ServiceOrgLocationService serviceOrgLocationService;

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    @Override
    public void onApplicationEvent(ApplicationEvent event) {
        if (event instanceof ContextRefreshedEvent) {
        } else if (event instanceof ContextClosedEvent) {
        }
    }


    @Override
    public void afterPropertiesSet() throws Exception {
        saveServiceOrgLocation();
    }


    public void saveServiceOrgLocation() {
        HashMap cache = (HashMap<Integer, ServiceOrgLocation>) redisTemplateUtil.getHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION);
        if (cache.entrySet().size() > 0) {
            logger.info("缓存恢复组织地理位置{}条记录....", cache.entrySet().size());
            return;
        }
        List<ServiceOrgLocation> serviceOrgLocations = serviceOrgLocationService.getAllRecode(null);
        int k = 0;
        //将用基本信息(负责区域)存入缓存
        HashMap<Integer, ServiceOrgLocation> hashMap = new HashMap<>();
        for (ServiceOrgLocation a : serviceOrgLocations) {
            hashMap.put(a.getServiceOrgId(), a);
            k++;
        }
        redisTemplateUtil.setHash(RedisUtils.CACHE_SERVICE_ORG_LOCATION, hashMap);
        logger.info("缓存组织地理位置循环次数{},key数量{}", k, hashMap.entrySet().size());

    }


}
