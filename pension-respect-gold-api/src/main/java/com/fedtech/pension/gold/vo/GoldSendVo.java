package com.fedtech.pension.gold.vo;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author csn
 * @date 2018/1/17
 */
public class GoldSendVo implements Serializable{
    private String areaName;

    private Integer areaId;

    private Integer count;

    private Double money;

    private Double bufaMoney;

    private Integer applyType;

    private Integer allCount=0;

    private Double allMoney =0d;

    private Integer countPer1 = 0;

    private Double countMoney1 = 0d;

    private Integer countPer2 = 0;

    private Double countMoney2 = 0d;

    private Integer countPer3 = 0;

    private Double countMoney3 = 0d;

    private Integer countPer4 = 0;

    private Double countMoney4 = 0d;

    private Date endTime;

    private Date startTime;

    private Date fafangTime;

    public Date getFafangTime() {
        return fafangTime;
    }

    public void setFafangTime(Date fafangTime) {
        this.fafangTime = fafangTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Integer getApplyType() {
        return applyType;
    }

    public void setApplyType(Integer applyType) {
        this.applyType = applyType;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Double getBufaMoney() {
        return bufaMoney;
    }

    public void setBufaMoney(Double bufaMoney) {
        this.bufaMoney = bufaMoney;
    }

    public Integer getAllCount() {
        return allCount;
    }

    public void setAllCount(Integer allCount) {
        this.allCount = allCount;
    }

    public Double getAllMoney() {
        return allMoney;
    }

    public void setAllMoney(Double allMoney) {
        this.allMoney = allMoney;
    }

    public Integer getCountPer1() {
        return countPer1;
    }

    public void setCountPer1(Integer countPer1) {
        this.countPer1 = countPer1;
    }

    public Double getCountMoney1() {
        return countMoney1;
    }

    public void setCountMoney1(Double countMoney1) {
        this.countMoney1 = countMoney1;
    }

    public Integer getCountPer2() {
        return countPer2;
    }

    public void setCountPer2(Integer countPer2) {
        this.countPer2 = countPer2;
    }

    public Double getCountMoney2() {
        return countMoney2;
    }

    public void setCountMoney2(Double countMoney2) {
        this.countMoney2 = countMoney2;
    }

    public Integer getCountPer3() {
        return countPer3;
    }

    public void setCountPer3(Integer countPer3) {
        this.countPer3 = countPer3;
    }

    public Double getCountMoney3() {
        return countMoney3;
    }

    public void setCountMoney3(Double countMoney3) {
        this.countMoney3 = countMoney3;
    }

    public Integer getCountPer4() {
        return countPer4;
    }

    public void setCountPer4(Integer countPer4) {
        this.countPer4 = countPer4;
    }

    public Double getCountMoney4() {
        return countMoney4;
    }

    public void setCountMoney4(Double countMoney4) {
        this.countMoney4 = countMoney4;
    }
}

