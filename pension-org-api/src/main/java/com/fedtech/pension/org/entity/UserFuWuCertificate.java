package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 证书信息登记表
 * @author miaoyueming
 * @date 2019/10/11
 */
public class UserFuWuCertificate implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**序号Id*/
    private Integer id;

    /**外键机构id*/
    private Integer serviceOrgId;

    /**老人身份证号*/
    private String idcardno;

    /**从业人员姓名*/
    private String name;

    /**证书名称*/
    private String certificateName;

    /**证书类型（1.从业资格证 2.培训班）*/
    private String certificateType;

    /**发证时间*/
    private String issuingTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCertificateName() {
        return certificateName;
    }

    public void setCertificateName(String certificateName) {
        this.certificateName = certificateName;
    }

    public String getCertificateType() {
        return certificateType;
    }

    public void setCertificateType(String certificateType) {
        this.certificateType = certificateType;
    }

    public String getIssuingTime() {
        return issuingTime;
    }

    public void setIssuingTime(String issuingTime) {
        this.issuingTime = issuingTime;
    }
}
