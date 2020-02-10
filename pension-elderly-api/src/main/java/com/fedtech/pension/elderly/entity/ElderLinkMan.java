package com.fedtech.pension.elderly.entity;

import java.io.Serializable;

/**
 * @author zhangcz
 */
public class ElderLinkMan implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;
    /**
     * 老人id
     */
    private Integer elderId;
    /**
     * 联系人
     */
    private String linkName;
    /**
     * 联系电话
     */
    private String linkTel;
    /**
     * 关系
     */
    private String relationship;
    /**
     * 是否有钥匙
     */
    private String haveKey;
    /**
     * 备注
     */
    private String remark;
    private String idcardno;

    public Integer getElderId() {
        return elderId;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getElderId(Integer id) {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkTel() {
        return linkTel;
    }

    public void setLinkTel(String linkTel) {
        this.linkTel = linkTel;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getHaveKey() {
        return haveKey;
    }

    public void setHaveKey(String haveKey) {
        this.haveKey = haveKey;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public ElderLinkMan() {
        super();
    }
}
