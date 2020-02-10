package com.fedtech.pension.elderly.entity;

import java.io.Serializable;

public class ElderlyOperatingSubsidies implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;

    private String eldername;

    private String birthday;

    private Integer sexdictid;

    private String realaddress;

    private String idcardno;

    private String checkInTime;

    private String checkOutTime;

    private String serviceorgname;

    private String mobile;

    private Integer insconsuid;

    private String state;

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEldername() {
        return eldername;
    }

    public void setEldername(String eldername) {
        this.eldername = eldername == null ? null : eldername.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public Integer getSexdictid() {
        return sexdictid;
    }

    public void setSexdictid(Integer sexdictid) {
        this.sexdictid = sexdictid;
    }

    public String getRealaddress() {
        return realaddress;
    }

    public void setRealaddress(String realaddress) {
        this.realaddress = realaddress == null ? null : realaddress.trim();
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno == null ? null : idcardno.trim();
    }

    public String getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(String checkInTime) {
        this.checkInTime = checkInTime == null ? null : checkInTime.trim();
    }

    public String getCheckOutTime() {
        return checkOutTime;
    }

    public void setCheckOutTime(String checkOutTime) {
        this.checkOutTime = checkOutTime == null ? null : checkOutTime.trim();
    }

    public String getServiceorgname() {
        return serviceorgname;
    }

    public void setServiceorgname(String serviceorgname) {
        this.serviceorgname = serviceorgname == null ? null : serviceorgname.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public Integer getInsconsuid() {
        return insconsuid;
    }

    public void setInsconsuid(Integer insconsuid) {
        this.insconsuid = insconsuid;
    }
}