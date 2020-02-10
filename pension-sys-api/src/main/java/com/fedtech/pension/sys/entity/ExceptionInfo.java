package com.fedtech.pension.sys.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统异常信息表
 * @author gengqiang
 */
public class ExceptionInfo implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String loginName;

    private Date createTime;

    private String content;

    public ExceptionInfo() {
    }

    @Override
    public String toString() {
        return "ExceptionInfo{" +
                "id=" + id +
                ", loginName='" + loginName + '\'' +
                ", createTime=" + createTime +
                ", content='" + content + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }


}