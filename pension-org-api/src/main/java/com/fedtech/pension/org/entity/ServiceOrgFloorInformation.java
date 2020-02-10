package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 楼层信息
 * @author gxy
 * @date 2019/10/10
 */
public class ServiceOrgFloorInformation implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 楼层编号
     */
    private String floorNumber;
    /**
     * 房间数
     */
    private Integer rooms;
    /**
     * 床位数
     */
    private Integer bedNum;
    /**
     * 备注
     */
    private String remark;
    /**
     * 楼院id
     */
    private Integer towerCourtyardId;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(String floorNumber) {
        this.floorNumber = floorNumber;
    }

    public Integer getRooms() {
        return rooms;
    }

    public void setRooms(Integer rooms) {
        this.rooms = rooms;
    }

    public Integer getBedNum() {
        return bedNum;
    }

    public void setBedNum(Integer bedNum) {
        this.bedNum = bedNum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getTowerCourtyardId() {
        return towerCourtyardId;
    }

    public void setTowerCourtyardId(Integer towerCourtyardId) {
        this.towerCourtyardId = towerCourtyardId;
    }
}