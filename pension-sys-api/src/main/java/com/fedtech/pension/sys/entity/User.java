package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * 用户信息表
 * @author GQ
 * @date 16/5/30
 */
public class User implements Serializable {

    private static final Long serialVersionUID =  1L;

    /**
     * uid
     */
    private Integer uid;

    /**
     * 登录名称
     */
    private String login_name;

    /**
     * 密码
     */
    private String pass_word;

    /**
     * 昵称
     */
    private String nick_name;

    /**
     * 所属区域
     */
    private Integer areaId;

    /**
     * 区域名称
     */
    private String areaName;

    /**
     * 组织id
     */
    private String serviceOrgId;

    /**
     * 组织名称
     */
    private String serviceOrgName;

    /**
     * 评估机构id
     */
    private Integer assessOrgId;

    /**
     * 评估机构名称
     */
    private String assessOrgName;

    /**
     * 联系人
     */
    private String linkName;

    /**
     * 电话
     */
    private String phone;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 0女1男2保密
     */
    private Integer gender;

    /**
     * app验证信息
     */
    private String appToken;

    /**
     * 工单量
     */
    private Integer taskCount;

    /**
     * 设备号（服务人员）
     */
    private String registrationId;

    /**
     * 服务人员姓名
     */
    private String name;

    /**
     * 服务人员 身份证号码
     */
    private String idcardno;

    /**
     * 身份证号码
     */
    private String userIdCardNo;

    /**
     * 服务人员 年龄
     */
    private Integer age;

    /**
     * 服务人员 实际居住地
     */
    private String realAddress;

    /**
     *  服务人员 手机
     */
    private String mobile;

    /**
     *  服务人员 组织类型
     */
    private String serviceType;

    /**
     *  服务人员 0女1男2保密
     */
    private String gender1;


    /**
     * 队列
     */
    private String queue;

    /**
     * 听筒
     */
    private String disphone;

    /**
     * 代理人
     */
    private String agent;

    /**
     * 呼叫中心密码
     */
    private String pwd;

    /**
     * 0待激活 1正常 2删除
     */
    private Integer status;

    /**
     * 单位职责
     */
    private String unitAndDuty;

    /**
     * 邮箱
     */
    private String email;

    private Long create_time;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public String getPass_word() {
        return pass_word;
    }

    public void setPass_word(String pass_word) {
        this.pass_word = pass_word;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
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

    public String getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(String serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public Integer getAssessOrgId() {
        return assessOrgId;
    }

    public void setAssessOrgId(Integer assessOrgId) {
        this.assessOrgId = assessOrgId;
    }

    public String getAssessOrgName() {
        return assessOrgName;
    }

    public void setAssessOrgName(String assessOrgName) {
        this.assessOrgName = assessOrgName;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Long create_time) {
        this.create_time = create_time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAppToken() {
        return appToken;
    }

    public void setAppToken(String appToken) {
        this.appToken = appToken;
    }

    public Integer getTaskCount() {
        return taskCount;
    }

    public void setTaskCount(Integer taskCount) {
        this.taskCount = taskCount;
    }

    public String getRegistrationId() {
        return registrationId;
    }

    public void setRegistrationId(String registrationId) {
        this.registrationId = registrationId;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getGender1() {
        return gender1;
    }

    public void setGender1(String gender1) {
        this.gender1 = gender1;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public User() {
        super();
    }

    public User(Integer uid, String login_name, String nick_name, String areaName) {
        this.uid = uid;
        this.login_name = login_name;
        this.nick_name = nick_name;
        this.areaName = areaName;
    }

    public String getQueue(){ return queue; }

    public void setQueue(String queue) {
        this.queue = queue;
    }

    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    public String getDisphone() {
        return disphone;
    }

    public void setDisphone(String disphone) {
        this.disphone = disphone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd){
        this.pwd = pwd;
    }

    public String getUnitAndDuty() {
        return unitAndDuty;
    }

    public void setUnitAndDuty(String unitAndDuty) {
        this.unitAndDuty = unitAndDuty;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserIdCardNo() {
        return userIdCardNo;
    }

    public void setUserIdCardNo(String userIdCardNo) {
        this.userIdCardNo = userIdCardNo;
    }
}
