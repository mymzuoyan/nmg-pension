package com.fedtech.config.listener;

import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.quantity.StatisticDataQuantity;
import com.fedtech.pension.elderly.redis.RedisTemplateUtil;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;


/**
 * @author CodingQiang
 * @date 2016/12/30
 */
@Service
public class MyApplicationListener implements InitializingBean, ApplicationListener<ApplicationEvent> {

    static Logger logger = LoggerFactory.getLogger(MyApplicationListener.class);


    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    @Autowired
    private ElderlyMsgService elderlyMsgService;


    @Override
    public void onApplicationEvent(ApplicationEvent event) {
        if (event instanceof ContextRefreshedEvent) {
        } else if (event instanceof ContextClosedEvent) {
        }
    }


    @Override
    public void afterPropertiesSet() throws Exception {
        loadStatisticData();
    }


    public void loadStatisticData() {
        if (!redisTemplate.hasKey(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE)) {
            redisTemplateUtil.setHash(StatisticDataQuantity.STATISTIC_ELDERLY_AREA_TYPE, elderlyMsgService.getCountByAreaAndelderTypeDictIds(new ElderlyMsg()));
        }
        if (!redisTemplate.hasKey(StatisticDataQuantity.STATISTIC_AREA_ADD_UP_ZLYELDER)) {
            redisTemplateUtil.setHash(StatisticDataQuantity.STATISTIC_AREA_ADD_UP_ZLYELDER, elderlyMsgService.getAddAndUpElderInfo());
        }
    }

}
