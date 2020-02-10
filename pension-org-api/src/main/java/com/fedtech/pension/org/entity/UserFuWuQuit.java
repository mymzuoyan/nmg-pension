package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 从业人员离职登记表
 * @author miaoyueming
 * @date 2019/10/12
 */
public class UserFuWuQuit implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**序号Id*/
    private Integer id;

    /**外键机构id*/
    private Integer serviceOrgId;

    /**老人身份证号*/
    private String idcardno;

    /**从业人员姓名*/
    private String name;

    /**离职日期*/
    private String quitTime;

    /**离职原因(1.辞退 2.辞职 3.开除 4.到期终止)*/
    private String quitReason;

    /**离职描述*/
    private String quitContext;

    /**是否共享（1.共享 2.不共享）*/
    private String isOpen;

    /**用户类型：1.养老护理员 2.营养师 3.心理学咨询师4.医生 5.护士6.康复师*/
    private String userType;

    /**性别（1.男 2.女）*/
    private String gender;

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

    public String getQuitTime() {
        return quitTime;
    }

    public void setQuitTime(String quitTime) {
        this.quitTime = quitTime;
    }

    public String getQuitReason() {
        return quitReason;
    }

    public void setQuitReason(String quitReason) {
        this.quitReason = quitReason;
    }

    public String getQuitContext() {
        return quitContext;
    }

    public void setQuitContext(String quitContext) {
        this.quitContext = quitContext;
    }

    public String getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(String isOpen) {
        this.isOpen = isOpen;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
