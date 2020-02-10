package com.fedtech.pension.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;

/**
 * Created by CodingQiang on 2016/12/30.
 */
public class AppLifecycleListener extends ContextLoaderListener {
    Logger logger = LoggerFactory.getLogger(AppLifecycleListener.class);

    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);
        logger.info("contextInitialized...");
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        super.contextDestroyed(event);
        logger.info("contextDestroyed...");
    }

}
