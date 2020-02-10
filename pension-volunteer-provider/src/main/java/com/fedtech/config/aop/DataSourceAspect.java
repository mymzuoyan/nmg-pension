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

    @Before("execution(* com.fedtech..*.*ServiceImpl.find*(..)) " +
            "|| execution(* com.fedtech..*.*ServiceImpl.get*(..))" +
            "|| execution(* com.fedtech..*.*ServiceImpl.select*(..))")
    public void setReadDataSourceType() {
        logger.debug("拦截[read]操作");
        DataSourceContextHolder.read();
    }

    @Before("execution(* com.fedtech..*.*ServiceImpl.insert*(..)) " +
            "|| execution(* com.fedtech..*.*ServiceImpl.save*(..))" +
            "|| execution(* com.fedtech..*.*ServiceImpl.update*(..))" +
            "|| execution(* com.fedtech..*.*ServiceImpl.del*(..))")
    public void setWriteDataSourceType() {
        logger.debug("拦截[write]操作");
        DataSourceContextHolder.write();
    }
}
