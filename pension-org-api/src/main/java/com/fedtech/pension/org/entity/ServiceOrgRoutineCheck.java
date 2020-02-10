package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 日常检查信息
 * @author yisuqin
 * @date 2019/10/23
 */
public class ServiceOrgRoutineCheck implements Serializable{

    private static final Long serialVersionUID = 1L;
    private Integer id;
    /**
     *检查时间
     */
    private String checkTime;
    /**
     *检查人员
     */
    private String person;
    /**
     *检查单位
     */
    private String unit;
    /**
     *检查内容
     */
    private String content;
    /**
     * 主要问题
     */
    private String problem;
    /**
     * 整改意见
     */
    private String reformOpinion;
    /**
     * 整改时间
     */
    private String reformTime;
    /**
     * 检查照片
     */
    private String attach;
    /**
     * 备注
     */
    private String remark;

    private ServiceOrg serviceOrg;

    public ServiceOrgRoutineCheck(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(String checkTime) {
        this.checkTime = checkTime;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAttach() { return attach; }

    public void setAttach(String attach) { this.attach = attach; }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getReformOpinion() {
        return reformOpinion;
    }

    public void setReformOpinion(String reformOpinion) {
        this.reformOpinion = reformOpinion;
    }

    public String getReformTime() {
        return reformTime;
    }

    public void setReformTime(String reformTime) {
        this.reformTime = reformTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public ServiceOrg getServiceOrg() {
        return serviceOrg;
    }

    public void setServiceOrg(ServiceOrg serviceOrg) {
        this.serviceOrg = serviceOrg;
    }

}
