package com.fedtech.pension.call.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 知识库类型表
 * @author CoderQiang
 * @date 2017/2/24
 */
public class KnowledgeType implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 知识库类型名称
     */
    private String name;

    /**
     * 创建人id
     */
    private Integer creatorId;

    /**
     * 创建时间
     */
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public KnowledgeType() {
    }
}
