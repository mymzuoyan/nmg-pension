package com.fedtech.pension.org.entity;

import com.fedtech.pension.elderly.entity.ElderlyMsg;

import java.io.Serializable;
import java.util.List;

/**
 * 房间信息
 * @author gxy
 * @date 2019/10/10
 */
public class ServiceOrgTowerRoomInformation implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 房间号
     */
    private String roomNum;
    /**
     * 朝向1.朝东2朝南3朝西4朝北
     */
    private Integer orientation;
    /**
     * 1自理老人房间2.半自理完全不能自理老人房间
     */
    private Integer roomType;
    /**
     * 房间面积
     */
    private String roomArea;
    /**
     * 辅助用房设施1卫生间2.厨房3.客厅4.阳台
     */
    private String auxiliaryFacilities;
    /**
     * 其他辅助用房设施
     */
    private String elseAuxiliaryFacilities;
    /**
     * 房间设备1.呼叫器2.床头灯3.电视机4.电风扇5.暖气6.空调7电冰箱8电话9洗衣机10电脑11网络12其他
     */
    private String roomEquipment;
    /**
     * 备注
     */
    private String remark;
    /**
     * 房间状态1已使用2.空闲3.包房
     */
    private Integer roomStatus;
    /**
     * 床位数
     */
    private Integer bedNum;
    /**
     * 楼层id
     */
    private Integer floorId;


    private String serviceOrgId;

    private List<ElderlyMsg> elderlyMsgs;

    private List<String> leisureBedNumber;

    public List<String> getLeisureBedNumber() {
        return leisureBedNumber;
    }

    public void setLeisureBedNumber(List<String> leisureBedNumber) {
        this.leisureBedNumber = leisureBedNumber;
    }

    public List<ElderlyMsg> getElderlyMsgs() {
        return elderlyMsgs;
    }

    public void setElderlyMsgs(List<ElderlyMsg> elderlyMsgs) {
        this.elderlyMsgs = elderlyMsgs;
    }

    public String getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(String serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public Integer getOrientation() {
        return orientation;
    }

    public void setOrientation(Integer orientation) {
        this.orientation = orientation;
    }

    public Integer getRoomType() {
        return roomType;
    }

    public void setRoomType(Integer roomType) {
        this.roomType = roomType;
    }

    public String getRoomArea() {
        return roomArea;
    }

    public void setRoomArea(String roomArea) {
        this.roomArea = roomArea;
    }


    public String getElseAuxiliaryFacilities() {
        return elseAuxiliaryFacilities;
    }

    public void setElseAuxiliaryFacilities(String elseAuxiliaryFacilities) {
        this.elseAuxiliaryFacilities = elseAuxiliaryFacilities;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(Integer roomStatus) {
        this.roomStatus = roomStatus;
    }

    public Integer getBedNum() {
        return bedNum;
    }

    public void setBedNum(Integer bedNum) {
        this.bedNum = bedNum;
    }

    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public String getAuxiliaryFacilities() {
        return auxiliaryFacilities;
    }

    public void setAuxiliaryFacilities(String auxiliaryFacilities) {
        this.auxiliaryFacilities = auxiliaryFacilities;
    }

    public String getRoomEquipment() {
        return roomEquipment;
    }

    public void setRoomEquipment(String roomEquipment) {
        this.roomEquipment = roomEquipment;
    }
}