package com.fedtech.pension.gold.entity;

import com.fedtech.pension.elderly.entity.ElderlyMsg;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 *  高领补贴表
 * @author csn
 * @date 2018/1/4
 */
public class GoldElderly implements Serializable{

    private ElderlyMsg elderlyMsg;

    private Integer id;

    //申请类别
    private Integer applyType;

    //注册时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date registerTime;

    //注销时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date cancelTime;

    //联系人
    private String linkMan;

    //联系人电话
    private String linkManTel;

    //银行卡号
    private String bankCardno;

    //银行卡持有人
    private String bankCardOwner;

    //与老人关系 0：本人
    //1：子女
    //2：近亲属
    //3：其他
    private Integer relationElderly;

    //0：市民卡
    //1：工商银行
    //2：农业银行
    //3：中国银行
    //4：建设银行
    //5：交通银行
    private Integer fafangWay;

    //备注
    private String remark;

    //老人姓名
    private String  elderName;

    //老人身份证号
    private String  idcardno;

    //注销原因
    private Integer cancelReason;

    private GoldSendStandard goldSendStandard;

    //注销状态（0:正常，1:已注销）
    private String status;

    //性别
    private Integer sexDictId;

    //真实居住地址
    private String realAddress;

    //区域名称
    private String areaName;

    public Integer getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(Integer cancelReason) {
        this.cancelReason = cancelReason;
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

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getLinkManTel() {
        return linkManTel;
    }

    public void setLinkManTel(String linkManTel) {
        this.linkManTel = linkManTel;
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

    public Integer getRelationElderly() {
        return relationElderly;
    }

    public void setRelationElderly(Integer relationElderly) {
        this.relationElderly = relationElderly;
    }

    public Integer getFafangWay() {
        return fafangWay;
    }

    public void setFafangWay(Integer fafangWay) {
        this.fafangWay = fafangWay;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public ElderlyMsg getElderlyMsg() {
        return elderlyMsg;
    }

    public void setElderlyMsg(ElderlyMsg elderlyMsg) {
        this.elderlyMsg = elderlyMsg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplyType() {
        return applyType;
    }

    public void setApplyType(Integer applyType) {
        this.applyType = applyType;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(Date cancelTime) {
        this.cancelTime = cancelTime;
    }

    public Integer getSexDictId() {
        return sexDictId;
    }

    public void setSexDictId(Integer sexDictId) {
        this.sexDictId = sexDictId;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "GoldElderly{" +
                "elderlyMsg=" + elderlyMsg +
                ", id=" + id +
                ", applyType=" + applyType +
                ", registerTime=" + registerTime +
                ", cancelTime=" + cancelTime +
                ", linkMan='" + linkMan + '\'' +
                ", linkManTel='" + linkManTel + '\'' +
                ", bankCardno='" + bankCardno + '\'' +
                ", bankCardOwner='" + bankCardOwner + '\'' +
                ", relationElderly=" + relationElderly +
                ", fafangWay=" + fafangWay +
                ", remark='" + remark + '\'' +
                '}';
    }
}