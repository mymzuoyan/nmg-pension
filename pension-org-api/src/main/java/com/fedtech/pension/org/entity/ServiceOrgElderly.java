package com.fedtech.pension.org.entity;

import com.fedtech.pension.elderly.entity.ElderlyMsg;
import org.omg.CORBA.PRIVATE_MEMBER;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrgElderly implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String number;

    private ServiceOrg serviceOrg;

    private ElderlyMsg elderlyMsg;

    private Date checkInTime;

    private Date checkOutTime;

    private String bedNumber;

    private Integer bedType;

    private String bedInfo;

    private Integer status;

    private Integer serviceOrgId;

    private String serviceOrgName;

    private String organizationName;

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    private Integer elderlyId;

    private Integer disableStutiation;

    private Date startCheckInTime;

    private Date endCheckInTime;

    private Date startCheckOutTime;

    private Date endCheckOutTime;

    private Integer roomStatus;

    private String roomNum;

    private Integer operatingSubsidies;

    public Integer getOperatingSubsidies() {
        return operatingSubsidies;
    }

    public void setOperatingSubsidies(Integer operatingSubsidies) {
        this.operatingSubsidies = operatingSubsidies;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public Integer getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(Integer roomStatus) {
        this.roomStatus = roomStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public ServiceOrg getServiceOrg() {
        return serviceOrg;
    }

    public void setServiceOrg(ServiceOrg serviceOrg) {
        this.serviceOrg = serviceOrg;
    }

    public ElderlyMsg getElderlyMsg() {
        return elderlyMsg;
    }

    public void setElderlyMsg(ElderlyMsg elderlyMsg) {
        this.elderlyMsg = elderlyMsg;
    }

    public Date getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(String checkInTime) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.checkInTime = simpleDateFormat.parse(checkInTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public Date getCheckOutTime() {
        return checkOutTime;
    }
    public void setCheckOutTime(String checkOutTime) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.checkOutTime = simpleDateFormat.parse(checkOutTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
    public String getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber) {
        this.bedNumber = bedNumber;
    }

    public Integer getBedType() {
        return bedType;
    }

    public void setBedType(Integer bedType) {
        this.bedType = bedType;
    }

    public String getBedInfo() {
        return bedInfo;
    }

    public void setBedInfo(String bedInfo) {
        this.bedInfo = bedInfo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Integer getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(Integer elderlyId) {
        this.elderlyId = elderlyId;
    }

    public Integer getDisableStutiation() {
        return disableStutiation;
    }

    public void setDisableStutiation(Integer disableStutiation) {
        this.disableStutiation = disableStutiation;
    }

    public Date getStartCheckInTime() {
        return startCheckInTime;
    }

    public void setStartCheckInTime(Date startCheckInTime) {
        this.startCheckInTime = startCheckInTime;
    }

    public Date getEndCheckInTime() {
        return endCheckInTime;
    }

    public void setEndCheckInTime(Date endCheckInTime) {
        this.endCheckInTime = endCheckInTime;
    }

    public Date getStartCheckOutTime() {
        return startCheckOutTime;
    }

    public void setStartCheckOutTime(Date startCheckOutTime) {
        this.startCheckOutTime = startCheckOutTime;
    }

    public Date getEndCheckOutTime() {
        return endCheckOutTime;
    }

    public void setEndCheckOutTime(Date endCheckOutTime) {
        this.endCheckOutTime = endCheckOutTime;
    }
}