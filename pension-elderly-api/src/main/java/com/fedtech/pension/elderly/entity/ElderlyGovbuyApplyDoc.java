package com.fedtech.pension.elderly.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ElderlyGovbuyApplyDoc implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 申请记录
     */
    private Integer applyId;
    /**
     * 文书类型
     */
    private Integer type;
    /**
     * 文书类型名称
     */
    private String typeName;

    private String content;
    /**
     * 创建时间
     */
    private Date createTime;

    public ElderlyGovbuyApplyDoc() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}