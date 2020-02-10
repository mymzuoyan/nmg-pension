package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 培训信息登记表
 * @author miaoyueming
 * @date 2019/10/12
 */
public class UserFuWuTrain implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**序号Id*/
    private Integer id;

    /**外键机构id*/
    private Integer serviceOrgId;

    /**老人身份证号*/
    private String idcardno;

    /**从业人员姓名*/
    private String name;

    /**培训机构*/
    private String trainingInstitutions;

    /**培训内容*/
    private String trainingContents;

    /**培训时间*/
    private String trainingTime;

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

    public String getTrainingInstitutions() {
        return trainingInstitutions;
    }

    public void setTrainingInstitutions(String trainingInstitutions) {
        this.trainingInstitutions = trainingInstitutions;
    }

    public String getTrainingContents() {
        return trainingContents;
    }

    public void setTrainingContents(String trainingContents) {
        this.trainingContents = trainingContents;
    }

    public String getTrainingTime() {
        return trainingTime;
    }

    public void setTrainingTime(String trainingTime) {
        this.trainingTime = trainingTime;
    }
}
