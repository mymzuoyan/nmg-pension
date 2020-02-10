package com.fedtech.config.listener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;


/**
 * @author CodingQiang
 * @date 2016/12/30
 */
@Service
public class MyApplicationListener implements InitializingBean, ApplicationListener<ApplicationEvent> {

    static Logger logger = LoggerFactory.getLogger(MyApplicationListener.class);

    @Override
    public void onApplicationEvent(ApplicationEvent event) {
        if (event instanceof ContextRefreshedEvent) {
        } else if (event instanceof ContextClosedEvent) {
        }
    }
    @Override
    public void afterPropertiesSet() throws Exception {
    }


}
