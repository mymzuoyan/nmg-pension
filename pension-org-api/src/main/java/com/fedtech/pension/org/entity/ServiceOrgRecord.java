package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author miaoyueming
 * @date 2019/8/9
 * 建档内容
 */

public class ServiceOrgRecord implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**外键 组织ID*/
    private Integer serviceOrgId;

    /**内蒙古市社区居家养老服务设施基本信息表*/
    private String homeBaseAttach;

    /**企业法人营业执照或民办非企业单位登记证书复印件*/
    private String qiYeAttach;

    /**房产证明复印件（无房产证明的，需提供房屋归属证明及第三方机构出具的房屋安全检测报告）*/
    private String fangChanAttach;

    /**由政府无偿提供房产的，需有区、县（市）民政局或街道*/
    private String zFAttach;

    /**消防安全相关资料*/
    private String xFAttach;

    /**社区居家养老服务设施平面图（标注各功能室及面积）*/
    private String sQAttach;

    /**设置医疗卫生机构的，需有医疗机构执业许可证复印件*/
    private String wSAttach;

    /**相关技术人员、医务人员、养老护理员及其他服务人员的相关资质证明复印件，餐饮人员的健康证复印件*/
    private String peopleAttach;

    /**服务记录台账复印件*/
    private String fwAttach;

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    /**建档时间*/
    private Date applyTime;

    public Integer getVerityStatus() {
        return verityStatus;
    }

    public void setVerityStatus(Integer verityStatus) {
        this.verityStatus = verityStatus;
    }

    /**审核状态 0、未审核 1、审核通过 2、审核未通过*/

    private Integer verityStatus;

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

    public String getHomeBaseAttach() {
        return homeBaseAttach;
    }

    public void setHomeBaseAttach(String homeBaseAttach) {
        this.homeBaseAttach = homeBaseAttach;
    }

    public String getQiYeAttach() {
        return qiYeAttach;
    }

    public void setQiYeAttach(String qiYeAttach) {
        this.qiYeAttach = qiYeAttach;
    }

    public String getFangChanAttach() {
        return fangChanAttach;
    }

    public void setFangChanAttach(String fangChanAttach) {
        this.fangChanAttach = fangChanAttach;
    }

    public String getzFAttach() {
        return zFAttach;
    }

    public void setzFAttach(String zFAttach) {
        this.zFAttach = zFAttach;
    }

    public String getxFAttach() {
        return xFAttach;
    }

    public void setxFAttach(String xFAttach) {
        this.xFAttach = xFAttach;
    }

    public String getsQAttach() {
        return sQAttach;
    }

    public void setsQAttach(String sQAttach) {
        this.sQAttach = sQAttach;
    }

    public String getwSAttach() {
        return wSAttach;
    }

    public void setwSAttach(String wSAttach) {
        this.wSAttach = wSAttach;
    }

    public String getPeopleAttach() {
        return peopleAttach;
    }

    public void setPeopleAttach(String peopleAttach) {
        this.peopleAttach = peopleAttach;
    }

    public String getFwAttach() {
        return fwAttach;
    }

    public void setFwAttach(String fwAttach) {
        this.fwAttach = fwAttach;
    }
}
