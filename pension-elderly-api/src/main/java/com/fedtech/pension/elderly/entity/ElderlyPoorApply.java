package com.fedtech.pension.elderly.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ElderlyPoorApply implements Serializable {

    private static final Long serialVersionUID = 1L;
    
    private Integer id;

    private String number;

    private Integer areaId;
    /**
     * 区
     */
    private String region1;
    /**
     * 街道
     */
    private String region2;
    /**
     * 社区
     */
    private String region3;
    /**
     * 老人id
     */
    private Integer elderId;
    /**
     * 老人姓名
     */
    private String name;

    private String avatar;
    /**
     * 身份证号码
     */
    private String idcardno;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 出生日期
     */
    private String birthday;
    /**
     * 性别
     */
    private Integer sex;
    /**
     * 民族
     */
    private String nation;
    /**
     * 户籍地址
     */
    private String regPlace;
    /**
     * 地址
     */
    private String address;
    /**
     * 街道审定人
     */
    private String operator;
    /**
     * 审定时间
     */
    private String estimateDate;
    /**
     * 状态 0:已登记 1:已受理2:
     */
    private Integer status;

    private String selectStatus;
    /**
     * 0:审核中1:通过 2:未通过
     */
    private Integer result;
    /**
     * 创建人
     */
    private Integer creatorId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 姓氏
     */
    private String familyName;

    private String familyDate;
    /**
     * 身份证明
     */
    private String identification;
    /**
     * 收入证明
     */
    private String incomeCertificate;
    /**
     * 房产证明
     */
    private String propertyCertificate;
    /**
     * 劳动能力、生活来源、财产状况以及赡养、抚养、扶养情况的书面声明
     */
    private String writtenStatement;
    /**
     * 承诺所提供信息真实、完整的承诺书
     */
    private String commitment;
    /**
     * 能证明特困人员的其它材料
     */
    private String otherAttches;
    /**
     * 电子签名
     */
    private String sign;
    /**
     * 记录
     */
    private String note;

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

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getRegion1() {
        return region1;
    }

    public void setRegion1(String region1) {
        this.region1 = region1;
    }

    public String getRegion2() {
        return region2;
    }

    public void setRegion2(String region2) {
        this.region2 = region2;
    }

    public String getRegion3() {
        return region3;
    }

    public void setRegion3(String region3) {
        this.region3 = region3;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getRegPlace() {
        return regPlace;
    }

    public void setRegPlace(String regPlace) {
        this.regPlace = regPlace;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getEstimateDate() {
        return estimateDate;
    }

    public void setEstimateDate(String estimateDate) {
        this.estimateDate = estimateDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getFamilyDate() {
        return familyDate;
    }

    public void setFamilyDate(String familyDate) {
        this.familyDate = familyDate;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public String getIncomeCertificate() {
        return incomeCertificate;
    }

    public void setIncomeCertificate(String incomeCertificate) {
        this.incomeCertificate = incomeCertificate;
    }

    public String getPropertyCertificate() {
        return propertyCertificate;
    }

    public void setPropertyCertificate(String propertyCertificate) {
        this.propertyCertificate = propertyCertificate;
    }

    public String getWrittenStatement() {
        return writtenStatement;
    }

    public void setWrittenStatement(String writtenStatement) {
        this.writtenStatement = writtenStatement;
    }

    public String getCommitment() {
        return commitment;
    }

    public void setCommitment(String commitment) {
        this.commitment = commitment;
    }

    public String getOtherAttches() {
        return otherAttches;
    }

    public void setOtherAttches(String otherAttches) {
        this.otherAttches = otherAttches;
    }

    public String getSelectStatus() {
        return selectStatus;
    }

    public void setSelectStatus(String selectStatus) {
        this.selectStatus = selectStatus;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}