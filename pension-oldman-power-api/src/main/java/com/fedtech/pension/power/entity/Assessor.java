package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Assessor  implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;//id
    private String  loginName;//登陆名
    private String  password;//登陆密码
    private String  area;//地区
    private String  express;//说明
    private String useStatus;//帐户启用状态
    private String  beginUseTime;//账号有效期
    private String  endUseTime;//账号有效期
    private String  name;//姓名
    private String  sex;//性别
    private String  serverStatus;//服务状态
    private String photoId;//头像url
    private String  phone;//手机
    private String  secondPhone;//第二手机
    private String  addressPhone;//家庭号码
    private String  address;//户籍地址
    private String  lifePlace;//现居地
    private String  birthday;//生日
    private String  idCard;//身份证号码
    private String  nation;//民族
    private String  party;//政治面貌
    private String  education;//文化程度
    private String  onDutyTime;//入职时间
    private String  leaveDutyTime;//离职时间
    private String certNoId;//无证照片
    private String certSmallId;//初级照片
    private String certMiddleId;//中级照片
    private String certHighId;//高级照片

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    private String  createDate;//时间
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }

    public String getUseStatus() {
        return useStatus;
    }

    public void setUseStatus(String useStatus) {
        this.useStatus = useStatus;
    }

    public String getBeginUseTime() {
        return beginUseTime;
    }

    public void setBeginUseTime(String beginUseTime) {
        this.beginUseTime = beginUseTime;
    }

    public String getEndUseTime() {
        return endUseTime;
    }

    public void setEndUseTime(String endUseTime) {
        this.endUseTime = endUseTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getServerStatus() {
        return serverStatus;
    }

    public void setServerStatus(String serverStatus) {
        this.serverStatus = serverStatus;
    }



    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSecondPhone() {
        return secondPhone;
    }

    public void setSecondPhone(String secondPhone) {
        this.secondPhone = secondPhone;
    }

    public String getAddressPhone() {
        return addressPhone;
    }

    public void setAddressPhone(String addressPhone) {
        this.addressPhone = addressPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLifePlace() {
        return lifePlace;
    }

    public void setLifePlace(String lifePlace) {
        this.lifePlace = lifePlace;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getOnDutyTime() {
        return onDutyTime;
    }

    public void setOnDutyTime(String onDutyTime) {
        this.onDutyTime = onDutyTime;
    }

    public String getLeaveDutyTime() {
        return leaveDutyTime;
    }

    public void setLeaveDutyTime(String leaveDutyTime) {
        this.leaveDutyTime = leaveDutyTime;
    }

    public String getPhotoId() {
        return photoId;
    }

    public void setPhotoId(String photoId) {
        this.photoId = photoId;
    }

    public String getCertNoId() {
        return certNoId;
    }

    public void setCertNoId(String certNoId) {
        this.certNoId = certNoId;
    }

    public String getCertSmallId() {
        return certSmallId;
    }

    public void setCertSmallId(String certSmallId) {
        this.certSmallId = certSmallId;
    }

    public String getCertMiddleId() {
        return certMiddleId;
    }

    public void setCertMiddleId(String certMiddleId) {
        this.certMiddleId = certMiddleId;
    }

    public String getCertHighId() {
        return certHighId;
    }

    public void setCertHighId(String certHighId) {
        this.certHighId = certHighId;
    }
}
