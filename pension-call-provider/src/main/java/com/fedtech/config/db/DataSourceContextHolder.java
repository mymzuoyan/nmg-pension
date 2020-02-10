package com.fedtech.config.db;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 全局数据源
 *
 * @author Shawn
 */
public class DataSourceContextHolder {

    private static Logger logger = LoggerFactory.getLogger(DataSourceContextHolder.class);

    private final static ThreadLocal<String> local = new ThreadLocal<>();

    public static ThreadLocal<String> getLocal() {
        return local;
    }

    public static void read() {
        logger.info("切换至[读]数据源");
        local.set(DataSourceType.READ.getType());
    }

    public static void readCdr() {
        logger.info("切换至[读]数据源");
        local.set(DataSourceType.READCDR.getType());
    }

    public static void readIpccp() {
        logger.info("切换至[读]数据源");
        local.set(DataSourceType.READIPCCP.getType());
    }

    public static void write() {
        logger.info("切换至[写]数据源");
        local.set(DataSourceType.WRITE.getType());
    }

    public static String getJdbcType() {
        return local.get();
    }

}
