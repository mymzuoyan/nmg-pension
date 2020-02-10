package com.fedtech.config;

import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;

import javax.sql.DataSource;

/**
 * 配置Druid监控数据源
 *
 * @author Shawn
 * @date 2017/10/17
 */
@Configuration
public class DruidConfig {

    @Primary
    @Bean(name = "dataSource")
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource() {
        return DataSourceBuilder.create().type(com.alibaba.druid.pool.DruidDataSource.class).build();
    }

    @Bean(name = "readDataSource0")
    @ConfigurationProperties(prefix = "spring.db.read0")
    public DataSource readDataSource0() {
        return DataSourceBuilder.create().type(com.alibaba.druid.pool.DruidDataSource.class).build();
    }

    @Bean(name = "readDataSource1")
    @ConfigurationProperties(prefix = "spring.db.read1")
    public DataSource readDataSource1() {
        return DataSourceBuilder.create().type(com.alibaba.druid.pool.DruidDataSource.class).build();
    }

    @Bean(name = "readDataSource2")
    @ConfigurationProperties(prefix = "spring.db.read2")
    public DataSource readDataSource2() {
        return DataSourceBuilder.create().type(com.alibaba.druid.pool.DruidDataSource.class).build();
    }

    @Bean(name = "readCdrDataSource")
    @ConfigurationProperties(prefix = "spring.db.readCdr")
    public DataSource readCdrDataSource() {
        return DataSourceBuilder.create().type(com.alibaba.druid.pool.DruidDataSource.class).build();
    }

    @Bean(name = "readIpccpDataSource")
    @ConfigurationProperties(prefix = "spring.db.readIpccp")
    public DataSource readIpccpDataSource() {
        return DataSourceBuilder.create().type(com.alibaba.druid.pool.DruidDataSource.class).build();
    }

    @Bean
    PersistenceExceptionTranslationPostProcessor persistenceExceptionTranslationPostProcessor() {
        return new PersistenceExceptionTranslationPostProcessor();
    }

}
