package com.fedtech.config.aop;

import com.fedtech.config.db.DataSourceContextHolder;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 拦截数据库读写
 *
 * @author Shawn
 */

@Aspect
@Component
public class DataSourceAspect {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Before("execution(* com.fedtech.pension.call..*.*ServiceImpl.find*(..)) " +
            "|| execution(* com.fedtech.pension.call..*.*ServiceImpl.get*(..))" +
            "|| execution(* com.fedtech.pension.call..*.*ServiceImpl.select*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.find*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.get*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.count*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.select*(..))")
    public void setReadDataSourceType() {
        logger.info("拦截[read]操作");
        DataSourceContextHolder.read();
    }

    @Before("execution(* com.fedtech.pension.call..*.*ServiceImpl.insert*(..)) " +
            "|| execution(* com.fedtech.pension.call..*.*ServiceImpl.save*(..))" +
            "|| execution(* com.fedtech.pension.call..*.*ServiceImpl.update*(..))" +
            "|| execution(* com.fedtech.pension.call..*.*ServiceImpl.del*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.insert*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.save*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.update*(..))" +
            "|| execution(* com.fedtech.commons..*.*ServiceImpl.del*(..))")
    public void setWriteDataSourceType() {
        logger.info("拦截[write]操作");
        DataSourceContextHolder.write();
    }


    @Before("execution(* com.fedtech.pension.cdr..*.*ServiceImpl.*(..)) ")
    public void setReadCdrDataSourceType() {
        logger.info("拦截[readCdr]操作");
        DataSourceContextHolder.readCdr();
    }


//    @Before("execution(* com.fedtech.pension.ipccp..*.*ServiceImpl.*(..))")
//    public void setReadIpccpDataSourceType() {
//        logger.info("拦截[readIpccp]操作");
//        DataSourceContextHolder.readIpccp();
//    }


}
