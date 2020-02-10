package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 床位信息
 * @author gxy
 * @date 2019/10/10
 */
public class ServiceOrgBedsInformation implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 床位编号
     */
    private String bedNumber;
    /**
     * 床位状态1未使用2已使用
     */
    private Integer bedsState;
    /**
     * 备注
     */
    private String remark;
    /**
     * 房间id
     */
    private Integer roomId;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber) {
        this.bedNumber = bedNumber;
    }

    public Integer getBedsState() {
        return bedsState;
    }

    public void setBedsState(Integer bedsState) {
        this.bedsState = bedsState;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }
}