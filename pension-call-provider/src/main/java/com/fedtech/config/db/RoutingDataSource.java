package com.fedtech.config.db;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * 数据源路由
 *
 * @author Shawn
 */
public class RoutingDataSource extends AbstractRoutingDataSource {

    private AtomicInteger count = new AtomicInteger(0);

    private int readsize;

    public RoutingDataSource(int readsize) {
        this.readsize = readsize;
    }

    @Override
    protected Object determineCurrentLookupKey() {
        String typeKey = DataSourceContextHolder.getJdbcType();
        if (typeKey == null) {
            System.out.println("无法确定数据源");
            return DataSourceType.WRITE.getType();
        }
        if (typeKey.equals(DataSourceType.WRITE.getType())) {
            return DataSourceType.WRITE.getType();
        }
        if (typeKey.equals(DataSourceType.READCDR.getType())) {
            return DataSourceType.READCDR.getType();
        }
        if (typeKey.equals(DataSourceType.READIPCCP.getType())) {
            return DataSourceType.READIPCCP.getType();
        }
        //读库进行负载均衡
        int a = count.getAndAdd(1);
        int lookupkey = a % readsize;
        return lookupkey;
    }

}
