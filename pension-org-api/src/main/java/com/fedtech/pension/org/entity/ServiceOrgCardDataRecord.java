package com.fedtech.pension.org.entity;

import java.util.Date;

/**
 * Created by zhnn on 2018/5/2.
 */
public class ServiceOrgCardDataRecord {
    private Integer id;
    private String result;
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public ServiceOrgCardDataRecord() {
        super();
    }
}
