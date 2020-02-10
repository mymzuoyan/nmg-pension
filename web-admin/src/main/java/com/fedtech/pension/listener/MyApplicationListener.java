package com.fedtech.pension.listener;

import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;


/**
 * @author CodingQiang
 * @date 2016/12/30
 */
@Service
public class MyApplicationListener implements InitializingBean, ApplicationListener<ApplicationEvent> {

    static Logger logger = LoggerFactory.getLogger(MyApplicationListener.class);

    @Autowired
    private AreaService areaService;

    @Autowired
    private RedisAreaUtil redisAreaUtil;

    @Override
    public void afterPropertiesSet() throws Exception {
        saveArea();
    }


    @Override
    public void onApplicationEvent(ApplicationEvent event) {
        if (event instanceof ContextRefreshedEvent) {
        } else if (event instanceof ContextClosedEvent) {
        }
    }


    public void saveArea() {
        Set<Integer> ids = redisAreaUtil.getKeys();
        if (ids.size() > 0) {
            return;
        }
        // 加载所有Area
        List<Area> areas = areaService.getAllRecode(null);
        //将用基本信息(负责区域)存入缓存
        for (Area a : areas) {
            redisAreaUtil.putArea(a.getId(), a);
        }
    }


}
