package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 楼院信息
 * @author gxy
 * @date 2019/10/10
 */
public class ServiceOrgTowerCourtyardInformation implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 楼院编号
     */
    private String towerCourtyardNum;
    /**
     * 楼层数
     */
    private Integer kickafk;
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
     * 机构id
     */
    private Integer ServiceOrgId;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTowerCourtyardNum() {
        return towerCourtyardNum;
    }

    public void setTowerCourtyardNum(String towerCourtyardNum) {
        this.towerCourtyardNum = towerCourtyardNum;
    }

    public Integer getKickafk() {
        return kickafk;
    }

    public void setKickafk(Integer kickafk) {
        this.kickafk = kickafk;
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

    public Integer getServiceOrgId() {
        return ServiceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        ServiceOrgId = serviceOrgId;
    }
}