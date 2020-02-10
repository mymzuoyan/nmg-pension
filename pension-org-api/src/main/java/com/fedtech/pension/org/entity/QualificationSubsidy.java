package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author DMJ
 * @date 2019/4/1
 */
public class QualificationSubsidy implements Serializable{

    private static final Long serialVersionUID = 1L;
    private Integer id;
    //外键 组织ID
    private Integer serviceOrgId;
    //区域id
    private Integer areaId;
    //区域名称
    private String areaName;
    //组织名称
    private String institutionName;
    //资格证书复印件
    private String qualificationAttach;
    //当年健康证明复印件
    private String healthAttach;
    //身份证复印件
        private String idcardAttach;
    //居住证复印件（外地户籍）
    private String liveAttach;
    //从业两年以上证明（由机构出具）及社保缴纳证明
    private String sbAttach;
    //养老服务人员资格补贴申请表
    private String applyAttach;
    //申请时间
    private Date applyTime;
    //审核状态0、未审核 1、审核通过 2、审核未通过
    private Integer verityStatus;
    //备注
    private String remark;
    //有效标识0、无效 1、有效
    private Integer isFlag;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
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

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getQualificationAttach() {
        return qualificationAttach;
    }

    public void setQualificationAttach(String qualificationAttach) {
        this.qualificationAttach = qualificationAttach;
    }

    public String getHealthAttach() {
        return healthAttach;
    }

    public void setHealthAttach(String healthAttach) {
        this.healthAttach = healthAttach;
    }

    public String getIdcardAttach() {
        return idcardAttach;
    }

    public void setIdcardAttach(String idcardAttach) {
        this.idcardAttach = idcardAttach;
    }

    public String getLiveAttach() {
        return liveAttach;
    }

    public void setLiveAttach(String liveAttach) {
        this.liveAttach = liveAttach;
    }

    public String getSbAttach() {
        return sbAttach;
    }

    public void setSbAttach(String sbAttach) {
        this.sbAttach = sbAttach;
    }

    public String getApplyAttach() {
        return applyAttach;
    }

    public void setApplyAttach(String applyAttach) {
        this.applyAttach = applyAttach;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public Integer getVerityStatus() {
        return verityStatus;
    }

    public void setVerityStatus(Integer verityStatus) {
        this.verityStatus = verityStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getIsFlag() {
        return isFlag;
    }

    public void setIsFlag(Integer isFlag) {
        this.isFlag = isFlag;
    }
}
