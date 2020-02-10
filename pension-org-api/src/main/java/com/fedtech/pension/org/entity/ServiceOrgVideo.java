package com.fedtech.pension.org.entity;

import java.io.Serializable;

public class ServiceOrgVideo implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private Integer orgId;

    private String channelId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId;
    }
}
