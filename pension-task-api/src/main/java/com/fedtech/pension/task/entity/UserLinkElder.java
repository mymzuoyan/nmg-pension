package com.fedtech.pension.task.entity;

import java.io.Serializable;

/**
 * 服务对象关联老人
 * @author CoderQiang
 * @date 2017/3/8
 */
public class UserLinkElder implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 服务对象id
     */
    private Integer userId;

    /**
     * 老人姓名
     */
    private String elderName;
    /**
     * 老人身份证
     */
    private String elderCardNo;

    /**
     * 老人年龄
     */
    private Integer elderAge;

    /**
     * 老人性别
     */
    private Integer elderSex;

    /**
     * 老人区域
     */
    private String elderArea;

    /**
     * 老人地址
     */
    private String elderAddress;

    /**
     * 老人号码
     */
    private String elderMobile;

    /**
     * 二维码
     */
    private String qrcode;

    /**
     * 0为删除
     * 默认为1、
     */
    private Integer status;

    /**
     * 工单实体
     */
    private Task task;

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public UserLinkElder() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getElderCardNo() {
        return elderCardNo;
    }

    public void setElderCardNo(String elderCardNo) {
        this.elderCardNo = elderCardNo;
    }

    public Integer getElderAge() {
        return elderAge;
    }

    public void setElderAge(Integer elderAge) {
        this.elderAge = elderAge;
    }

    public Integer getElderSex() {
        return elderSex;
    }

    public void setElderSex(Integer elderSex) {
        this.elderSex = elderSex;
    }

    public String getElderArea() {
        return elderArea;
    }

    public void setElderArea(String elderArea) {
        this.elderArea = elderArea;
    }

    public String getElderAddress() {
        return elderAddress;
    }

    public void setElderAddress(String elderAddress) {
        this.elderAddress = elderAddress;
    }

    public String getElderMobile() {
        return elderMobile;
    }

    public void setElderMobile(String elderMobile) {
        this.elderMobile = elderMobile;
    }

    public String getQrcode() {
        return qrcode;
    }

    public void setQrcode(String qrcode) {
        this.qrcode = qrcode;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
