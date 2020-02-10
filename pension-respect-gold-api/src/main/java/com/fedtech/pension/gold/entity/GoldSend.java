package com.fedtech.pension.gold.entity;

import java.io.Serializable;
import java.util.Date;

/**
 *  高领补贴发放表
 * @author csn
 * @date 2018/1/11
 */
public class GoldSend implements Serializable {

    private Integer id;

    private Integer elderId;

    //发放时间
    private Date fafangTime;

    //发放金额
    private Double money;

    //补发金额
    private Double bufaMoney;

    //开始时间
    private Date startTime;

    //结束时间
    private Date endTime;

    //补发月数
    private Integer monthCount;

    private Integer monthCount1;

    private Integer monthCount2;

    private Integer monthCount3;

    private Integer monthCount4;

    //补发总金额
    private Double totalMoney;

    //--
    private GoldElderly goldElderly;

    //发放标准
    private GoldSendStandard goldSendStandard;

    //--
    private String  elderName;

    private String  idcardno;

    private Integer areaId;

    private String  areaName;

    //申请类别
    private Integer applyType;

    private Integer fafangWay;

    //金额标注
    private Double moneyStandard;

    //标准1,2,3,4
    private Double moneyStandard1;
    private Double moneyStandard2;
    private Double moneyStandard3;
    private Double moneyStandard4;

    private String bankCardno;

    private String bankCardOwner;

    private Date registerTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public Date getFafangTime() {
        return fafangTime;
    }

    public void setFafangTime(Date fafangTime) {
        this.fafangTime = fafangTime;
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getMonthCount() {
        return monthCount;
    }

    public void setMonthCount(Integer monthCount) {
        this.monthCount = monthCount;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public GoldElderly getGoldElderly() {
        return goldElderly;
    }

    public void setGoldElderly(GoldElderly goldElderly) {
        this.goldElderly = goldElderly;
    }

    public GoldSendStandard getGoldSendStandard() {
        return goldSendStandard;
    }

    public void setGoldSendStandard(GoldSendStandard goldSendStandard) {
        this.goldSendStandard = goldSendStandard;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getApplyType() {
        return applyType;
    }

    public void setApplyType(Integer applyType) {
        this.applyType = applyType;
    }

    public Integer getFafangWay() {
        return fafangWay;
    }

    public void setFafangWay(Integer fafangWay) {
        this.fafangWay = fafangWay;
    }

    public Double getMoneyStandard() {
        return moneyStandard;
    }

    public void setMoneyStandard(Double moneyStandard) {
        this.moneyStandard = moneyStandard;
    }

    public Double getMoneyStandard1() {
        return moneyStandard1;
    }

    public void setMoneyStandard1(Double moneyStandard1) {
        this.moneyStandard1 = moneyStandard1;
    }

    public Double getMoneyStandard2() {
        return moneyStandard2;
    }

    public void setMoneyStandard2(Double moneyStandard2) {
        this.moneyStandard2 = moneyStandard2;
    }

    public Double getMoneyStandard3() {
        return moneyStandard3;
    }

    public void setMoneyStandard3(Double moneyStandard3) {
        this.moneyStandard3 = moneyStandard3;
    }

    public Double getMoneyStandard4() {
        return moneyStandard4;
    }

    public void setMoneyStandard4(Double moneyStandard4) {
        this.moneyStandard4 = moneyStandard4;
    }

    public String getBankCardno() {
        return bankCardno;
    }

    public void setBankCardno(String bankCardno) {
        this.bankCardno = bankCardno;
    }

    public String getBankCardOwner() {
        return bankCardOwner;
    }

    public void setBankCardOwner(String bankCardOwner) {
        this.bankCardOwner = bankCardOwner;
    }

    public Integer getMonthCount1() {
        return monthCount1;
    }

    public void setMonthCount1(Integer monthCount1) {
        this.monthCount1 = monthCount1;
    }

    public Integer getMonthCount2() {
        return monthCount2;
    }

    public void setMonthCount2(Integer monthCount2) {
        this.monthCount2 = monthCount2;
    }

    public Integer getMonthCount3() {
        return monthCount3;
    }

    public void setMonthCount3(Integer monthCount3) {
        this.monthCount3 = monthCount3;
    }

    public Integer getMonthCount4() {
        return monthCount4;
    }

    public void setMonthCount4(Integer monthCount4) {
        this.monthCount4 = monthCount4;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}
