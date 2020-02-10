package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 建设补助申请
 * @author miaoyueming
 * @date 2019/9/29
 */
public class ServiceOrgConstructionSubsidyApply implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**序号*/
    private Integer id;

    /**机构id*/
    private Integer serviceOrgId;

    /**机构类型(1.机构 2.组织）*/
    private Integer type;

    /**申请类型（1.建设补助申请 2.运营补贴申请）*/
    private Integer object;

    /**机构名称*/
    private String serviceOrgName;

    /**区域名称*/
    private String areaName;

    /**开业时间*/
    private String openingHours;

    /**法定代表*/
    private String legalRepresentative;

    /**详细地址*/
    private String address;

    /**联系电话*/
    private String mobile;

    /**总数*/
    private String total;

    /**管理人员*/
    private String management;

    /**服务人员*/
    private String servicePersonal;

    /**其他人员*/
    private String otherPersonal;

    /**特困老年人*/
    private String extremelyPoorElderly;

    /**其他*/
    private String other;

    /**申请补贴床位数*/
    private String bedNum;

    /**一月补贴床位数*/
    private String bedNum1;

    /**二月补贴床位数*/
    private String bedNum2;

    /**三月补贴床位数*/
    private String bedNum3;

    /**四月补贴床位数*/
    private String bedNum4;

    /**五月补贴床位数*/
    private String bedNum5;

    /**六月补贴床位数*/
    private String bedNum6;

    /**七月补贴床位数*/
    private String bedNum7;

    /**八月补贴床位数*/
    private String bedNum8;

    /**九月补贴床位数*/
    private String bedNum9;

    /**十月补贴床位数*/
    private String bedNum10;

    /**十一月补贴床位数*/
    private String bedNum11;

    /**十二月补贴床位数*/
    private String bedNum12;

    /**申请人*/
    private String applyer;

    /**申请时间*/
    private String applyTime;

    /**审批状态（0.未审批 1.审批通过 2.审批不通过）*/
    private String status;

    /**提交状态（0.未提交 1.已提交）*/
    private String submitStatus;

    /**申请年度*/
    private String applyYear;

    /**特困老人和其他的总数*/
    private String totalElderAndOther;
    /**
     * 养老机构许可证编号
     */
    private String institutionNum;
    /**
     * 民办机构企业登记证书编号和机构代码证号
     */
    private String orgCode;
    /**
     * 建筑面积
     */
    private String landArea;

    private String bedNums;

    /*
    城市状态
     */
    private String  cityStatus;

    /**
     * 区状态
     * @return
     */
    private String areaStaus;
    /**
     * 老人Id
     */
    private String elderlyId;
    /**
     * 星级（1.一星级 2.二星级 3.三星级 4.四星级 5.五星级）
     */
    private Integer starClass;

    /**
     * 运营补贴金额
     * @return
     */
    private Integer money;

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Integer getStarClass() {
        return starClass;
    }

    public void setStarClass(Integer starClass) {
        this.starClass = starClass;
    }

    public String getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(String elderlyId) {
        this.elderlyId = elderlyId;
    }

    public String getCityStatus() {
        return cityStatus;
    }

    public void setCityStatus(String cityStatus) {
        this.cityStatus = cityStatus;
    }

    public String getAreaStaus() {
        return areaStaus;
    }

    public void setAreaStaus(String areaStaus) {
        this.areaStaus = areaStaus;
    }

    public String getLandArea() {
        return landArea;
    }

    public void setLandArea(String landArea) {
        this.landArea = landArea;
    }

    public String getBedNums() {
        return bedNums;
    }

    public void setBedNums(String bedNums) {
        this.bedNums = bedNums;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getInstitutionNum() {
        return institutionNum;
    }

    public void setInstitutionNum(String institutionNum) {
        this.institutionNum = institutionNum;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getTotalElderAndOther() {
        return totalElderAndOther;
    }

    public void setTotalElderAndOther(String totalElderAndOther) {
        this.totalElderAndOther = totalElderAndOther;
    }

    public String getApplyYear() {
        return applyYear;
    }

    public void setApplyYear(String applyYear) {
        this.applyYear = applyYear;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getObject() {
        return object;
    }

    public void setObject(Integer object) {
        this.object = object;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSubmitStatus() {
        return submitStatus;
    }

    public void setSubmitStatus(String submitStatus) {
        this.submitStatus = submitStatus;
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

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(String openingHours) {
        this.openingHours = openingHours;
    }

    public String getLegalRepresentative() {
        return legalRepresentative;
    }

    public void setLegalRepresentative(String legalRepresentative) {
        this.legalRepresentative = legalRepresentative;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getManagement() {
        return management;
    }

    public void setManagement(String management) {
        this.management = management;
    }

    public String getServicePersonal() {
        return servicePersonal;
    }

    public void setServicePersonal(String servicePersonal) {
        this.servicePersonal = servicePersonal;
    }

    public String getOtherPersonal() {
        return otherPersonal;
    }

    public void setOtherPersonal(String otherPersonal) {
        this.otherPersonal = otherPersonal;
    }

    public String getExtremelyPoorElderly() {
        return extremelyPoorElderly;
    }

    public void setExtremelyPoorElderly(String extremelyPoorElderly) {
        this.extremelyPoorElderly = extremelyPoorElderly;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public String getBedNum() {
        return bedNum;
    }

    public void setBedNum(String bedNum) {
        this.bedNum = bedNum;
    }

    public String getBedNum1() {
        return bedNum1;
    }

    public void setBedNum1(String bedNum1) {
        this.bedNum1 = bedNum1;
    }

    public String getBedNum2() {
        return bedNum2;
    }

    public void setBedNum2(String bedNum2) {
        this.bedNum2 = bedNum2;
    }

    public String getBedNum3() {
        return bedNum3;
    }

    public void setBedNum3(String bedNum3) {
        this.bedNum3 = bedNum3;
    }

    public String getBedNum4() {
        return bedNum4;
    }

    public void setBedNum4(String bedNum4) {
        this.bedNum4 = bedNum4;
    }

    public String getBedNum5() {
        return bedNum5;
    }

    public void setBedNum5(String bedNum5) {
        this.bedNum5 = bedNum5;
    }

    public String getBedNum6() {
        return bedNum6;
    }

    public void setBedNum6(String bedNum6) {
        this.bedNum6 = bedNum6;
    }

    public String getBedNum7() {
        return bedNum7;
    }

    public void setBedNum7(String bedNum7) {
        this.bedNum7 = bedNum7;
    }

    public String getBedNum8() {
        return bedNum8;
    }

    public void setBedNum8(String bedNum8) {
        this.bedNum8 = bedNum8;
    }

    public String getBedNum9() {
        return bedNum9;
    }

    public void setBedNum9(String bedNum9) {
        this.bedNum9 = bedNum9;
    }

    public String getBedNum10() {
        return bedNum10;
    }

    public void setBedNum10(String bedNum10) {
        this.bedNum10 = bedNum10;
    }

    public String getBedNum11() {
        return bedNum11;
    }

    public void setBedNum11(String bedNum11) {
        this.bedNum11 = bedNum11;
    }

    public String getBedNum12() {
        return bedNum12;
    }

    public void setBedNum12(String bedNum12) {
        this.bedNum12 = bedNum12;
    }

    public String getApplyer() {
        return applyer;
    }

    public void setApplyer(String applyer) {
        this.applyer = applyer;
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }
}
