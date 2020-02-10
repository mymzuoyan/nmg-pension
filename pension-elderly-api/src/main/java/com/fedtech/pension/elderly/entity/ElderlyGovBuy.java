package com.fedtech.pension.elderly.entity;

import java.io.Serializable;

/**
 * @author gengqiang
 */
public class ElderlyGovBuy implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 服务组织id
     */
    private Integer serviceOrgId;

    private String serviceOrgIds;

    private String serviceOrgName;
    /**
     * 老人id
     */
    private Integer elderId;

    private String elderName;

    private String areaName;

    private String idcardno;

    private Integer age;

    private Integer sexDictId;

    private String elderTypeDictIds;

    private Integer childrenDictId;

    private Integer residenceDictId;

    private Long mobile;

    private String realAddress;
    /**
     * 市区补贴
     */
    private Integer city;
    /**
     * 区补贴
     */
    private Integer area;
    /**
     * 街道补贴
     */
    private Integer street;
    /**
     * 社区补贴
     */
    private Integer village;
    /**
     * 补贴金额
     */
    private Integer subsidy;
    /**
     * 呼叫器类型0:无 1：固定 2：移动
     */
    private Integer callertype;
    /**
     * 呼叫器厂商
     * 0：无
     * 1：12349
     * 2安康通
     * '3'  康惠通
     * '4'  奥维
     * '5' 96180
     * 6'  平安保
     * 7' 962069
     * '8'  电信
     * '9'  移动
     * 10：品牌不详
     */
    private Integer callerlabel;
    /**
     * 呼叫器安装费
     */
    private Double callerinitfee;
    /**
     * 呼叫器月租费
     */
    private Double callermonthfee;
    /**
     * 呼叫器号码
     */
    private String callerno;
    /**
     * 安装状态 0:未安装 1：已安装
     */
    private Integer callerstatus;
    /**
     * 呼叫器服务人员
     */
    private String callerstaff;
    /**
     * 服务人员电话
     */
    private String callerstafftel;
    /**
     * 市民卡号
     */
    private String cardno;
    /**
     * 附件
     */
    private String attach;
    /**
     * 0:未审核 1：已审核
     */
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
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

    public Integer getSexDictId() {
        return sexDictId;
    }

    public void setSexDictId(Integer sexDictId) {
        this.sexDictId = sexDictId;
    }

    public String getElderTypeDictIds() {
        return elderTypeDictIds;
    }

    public void setElderTypeDictIds(String elderTypeDictIds) {
        this.elderTypeDictIds = elderTypeDictIds;
    }

    public Integer getChildrenDictId() {
        return childrenDictId;
    }

    public void setChildrenDictId(Integer childrenDictId) {
        this.childrenDictId = childrenDictId;
    }

    public Integer getResidenceDictId() {
        return residenceDictId;
    }

    public void setResidenceDictId(Integer residenceDictId) {
        this.residenceDictId = residenceDictId;
    }

    public Long getMobile() {
        return mobile;
    }

    public void setMobile(Long mobile) {
        this.mobile = mobile;
    }

    public Integer getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(Integer subsidy) {
        this.subsidy = subsidy;
    }

    public Integer getCallertype() {
        return callertype;
    }

    public void setCallertype(Integer callertype) {
        this.callertype = callertype;
    }

    public Integer getCallerlabel() {
        return callerlabel;
    }

    public void setCallerlabel(Integer callerlabel) {
        this.callerlabel = callerlabel;
    }

    public Double getCallerinitfee() {
        return callerinitfee;
    }

    public void setCallerinitfee(Double callerinitfee) {
        this.callerinitfee = callerinitfee;
    }

    public Double getCallermonthfee() {
        return callermonthfee;
    }

    public void setCallermonthfee(Double callermonthfee) {
        this.callermonthfee = callermonthfee;
    }

    public String getCallerno() {
        return callerno;
    }

    public void setCallerno(String callerno) {
        this.callerno = callerno;
    }

    public Integer getCallerstatus() {
        return callerstatus;
    }

    public void setCallerstatus(Integer callerstatus) {
        this.callerstatus = callerstatus;
    }

    public String getCallerstaff() {
        return callerstaff;
    }

    public void setCallerstaff(String callerstaff) {
        this.callerstaff = callerstaff;
    }

    public String getCallerstafftel() {
        return callerstafftel;
    }

    public void setCallerstafftel(String callerstafftel) {
        this.callerstafftel = callerstafftel;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Integer getStreet() {
        return street;
    }

    public void setStreet(Integer street) {
        this.street = street;
    }

    public Integer getVillage() {
        return village;
    }

    public void setVillage(Integer village) {
        this.village = village;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getServiceOrgIds() {
        return serviceOrgIds;
    }

    public void setServiceOrgIds(String serviceOrgIds) {
        this.serviceOrgIds = serviceOrgIds;
    }

    public ElderlyGovBuy() {
    }
}