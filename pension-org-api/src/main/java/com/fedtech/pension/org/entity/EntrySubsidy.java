package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author DMJ
 * @date 2019/4/1
 */
public class EntrySubsidy implements Serializable{

    private static final Long serialVersionUID = 1L;
    private Integer id;
    //外键 组织ID
    private Integer serviceOrgId;
    //组织名称
    private String institutionName;
    //内蒙古市养老护理岗位工作人员入职奖励申请表
    private String sqbAttach;
    //学历证书复印件
    private String xlAttach;
    //劳动合同或劳务派遣协议
    private String ldhtAttach;
    //社会保险(连续交满两年)
    private String sbAttach;
    //从事养老护理岗位证明（用人单位出具）
    private String gwzmAttach;
    //养老护理员职业资格证书复印件
    private String zgzsAttach;
    //申请人承诺书
    private String cnsAttach;
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

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getSqbAttach() {
        return sqbAttach;
    }

    public void setSqbAttach(String sqbAttach) {
        this.sqbAttach = sqbAttach;
    }

    public String getXlAttach() {
        return xlAttach;
    }

    public void setXlAttach(String xlAttach) {
        this.xlAttach = xlAttach;
    }

    public String getLdhtAttach() {
        return ldhtAttach;
    }

    public void setLdhtAttach(String ldhtAttach) {
        this.ldhtAttach = ldhtAttach;
    }

    public String getSbAttach() {
        return sbAttach;
    }

    public void setSbAttach(String sbAttach) {
        this.sbAttach = sbAttach;
    }

    public String getGwzmAttach() {
        return gwzmAttach;
    }

    public void setGwzmAttach(String gwzmAttach) {
        this.gwzmAttach = gwzmAttach;
    }

    public String getZgzsAttach() {
        return zgzsAttach;
    }

    public void setZgzsAttach(String zgzsAttach) {
        this.zgzsAttach = zgzsAttach;
    }

    public String getCnsAttach() {
        return cnsAttach;
    }

    public void setCnsAttach(String cnsAttach) {
        this.cnsAttach = cnsAttach;
    }

    public Integer getIsFlag() {
        return isFlag;
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

    public void setIsFlag(Integer isFlag) {
        this.isFlag = isFlag;
    }
}
