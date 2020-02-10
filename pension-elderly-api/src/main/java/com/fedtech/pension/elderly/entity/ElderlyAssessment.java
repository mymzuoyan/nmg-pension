package com.fedtech.pension.elderly.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by DELL on 2016/9/28.
 */
public class ElderlyAssessment implements Serializable {
    private Integer id;
    /**
     * 老人id
     */
    private Integer elderId;
    /**
     * 项目：吃饭 描述：能完成入口、咀嚼、吞咽等步骤 （状态：1正常2轻丧失3中丧失）
     */
    private Integer attr1;
    /**
     * 吃饭能力评分
     */
    private Integer score01;
    /**
     *项目：穿衣 描述：完成取衣、穿衣、系带、扣扣子等 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr2;
    /**
     *穿衣评分
     */
    private Integer score02;
    /**
     *项目：如厕 描述：如厕、便后能自理及整理衣裤 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr3;
    /**
     *如厕评分
     */
    private Integer score03;
    /**
     *项目：室内走动 描述：外出、上下楼正常 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr4;
    /**
     *室内走动评分
     */
    private Integer score04;
    /**
     *项目：洗澡 描述： 能完成洗澡的全部过程（状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr5;
    /**
     *洗澡评分
     */
    private Integer score05;
    /**
     *项目：控制大小便 描述：能控制大小便 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr6;
    /**
     *控制大小便评分
     */
    private Integer score06;
    /**
     *项目：近期记忆 描述：能回想近期发生的事情 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr7;
    /**
     *近期记忆评分
     */
    private Integer score07;
    /**
     *项目：程序记忆 描述： 完成洗衣、做饭、做菜等（状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr8;
    /**
     *程序记忆评分
     */
    private Integer score08;
    /**
     *项目：定向记忆 描述：外出、回家不迷路 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr9;
    /**
     *定向记忆评分
     */
    private Integer score09;
    /**
     *项目：判断能力 描述： 对日常事物的判断不违背常理（状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr10;
    /**
     *判断能力评分
     */
    private Integer score10;
    /**
     *项目：情绪 描述：与人和睦相处，不偏激 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr11;
    /**
     *情绪评分
     */
    private Integer score11;
    /**
     *项目：行为 描述：动作行为表现是否异常 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr12;
    /**
     *行为评分
     */
    private Integer score12;
    /**
     *项目：沟通 描述：在交流中能否互相理解 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr13;
    /**
     *沟通评分
     */
    private Integer score13;
    /**
     *项目：视觉 描述：能正常看电视、读报等 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr14;
    /**
     *视觉评分
     */
    private Integer score14;
    /**
     *项目：听觉 描述：能正常接听电话、交谈 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr15;
    /**
     *听觉评分
     */
    private Integer score15;
    /**
     *失能分
     */
    private Integer resultScore;
    /**
     * 状态：1自理  3 半失能  2失能
     */
    private Integer resultDictId;
    /**
     *本人（或代理人）签字
     */
    private String familyName;
    /**
     *日期
     */
    private String familyDate;
    /**
     *街道审定人
     */
    private String audit1;
    /**
     *街道审定日期
     */
    private String auditDate1;
    /**
     *评估员1（签字）
     */
    private String workerName1;
    /**
     *工作证号
     */
    private String workerCard1;
    /**
     *日期
     */
    private String workerDate1;
    /**
     * 评估员2（签字）
     */
    private String workerName2;
    /**
     *工作证号
     */
    private String workerCard2;
    /**
     *日期
     */
    private String workerDate2;
    /**
     *评估编号
     */
    private String tid;
    /**
     *创建时间
     */
    private Date createDate;
    /**
     *更新时间
     */
    private Date updateDate;
    /**
     *状态 1有效 0无效
     */
    private Integer status;
    /**
     *
     */
    private String elderTypeDictIds;
    /**
     *
     */
    private String serviceNeed;
    /**
     *
     */
    private String areaName;
    /**
     *
     */
    private Integer serviceOrgId;
    /**
     *
     */
    private String serviceOrgIds;

    public ElderlyAssessment() {
    }

    public String getElderTypeDictIds() {
        return elderTypeDictIds;
    }

    public void setElderTypeDictIds(String elderTypeDictIds) {
        this.elderTypeDictIds = elderTypeDictIds;
    }

    public String getServiceNeed() {
        return serviceNeed;
    }

    public void setServiceNeed(String serviceNeed) {
        this.serviceNeed = serviceNeed;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public Integer getAttr1() {
        return attr1;
    }

    public void setAttr1(Integer attr1) {
        this.attr1 = attr1;
    }

    public Integer getScore01() {
        return score01;
    }

    public void setScore01(Integer score01) {
        this.score01 = score01;
    }

    public Integer getAttr2() {
        return attr2;
    }

    public void setAttr2(Integer attr2) {
        this.attr2 = attr2;
    }

    public Integer getScore02() {
        return score02;
    }

    public void setScore02(Integer score02) {
        this.score02 = score02;
    }

    public Integer getAttr3() {
        return attr3;
    }

    public void setAttr3(Integer attr3) {
        this.attr3 = attr3;
    }

    public Integer getScore03() {
        return score03;
    }

    public void setScore03(Integer score03) {
        this.score03 = score03;
    }

    public Integer getAttr4() {
        return attr4;
    }

    public void setAttr4(Integer attr4) {
        this.attr4 = attr4;
    }

    public Integer getScore04() {
        return score04;
    }

    public void setScore04(Integer score04) {
        this.score04 = score04;
    }

    public Integer getAttr5() {
        return attr5;
    }

    public void setAttr5(Integer attr5) {
        this.attr5 = attr5;
    }

    public Integer getScore05() {
        return score05;
    }

    public void setScore05(Integer score05) {
        this.score05 = score05;
    }

    public Integer getAttr6() {
        return attr6;
    }

    public void setAttr6(Integer attr6) {
        this.attr6 = attr6;
    }

    public Integer getScore06() {
        return score06;
    }

    public void setScore06(Integer score06) {
        this.score06 = score06;
    }

    public Integer getAttr7() {
        return attr7;
    }

    public void setAttr7(Integer attr7) {
        this.attr7 = attr7;
    }

    public Integer getScore07() {
        return score07;
    }

    public void setScore07(Integer score07) {
        this.score07 = score07;
    }

    public Integer getAttr8() {
        return attr8;
    }

    public void setAttr8(Integer attr8) {
        this.attr8 = attr8;
    }

    public Integer getScore08() {
        return score08;
    }

    public void setScore08(Integer score08) {
        this.score08 = score08;
    }

    public Integer getAttr9() {
        return attr9;
    }

    public void setAttr9(Integer attr9) {
        this.attr9 = attr9;
    }

    public Integer getScore09() {
        return score09;
    }

    public void setScore09(Integer score09) {
        this.score09 = score09;
    }

    public Integer getAttr10() {
        return attr10;
    }

    public void setAttr10(Integer attr10) {
        this.attr10 = attr10;
    }

    public Integer getScore10() {
        return score10;
    }

    public void setScore10(Integer score10) {
        this.score10 = score10;
    }

    public Integer getAttr11() {
        return attr11;
    }

    public void setAttr11(Integer attr11) {
        this.attr11 = attr11;
    }

    public Integer getScore11() {
        return score11;
    }

    public void setScore11(Integer score11) {
        this.score11 = score11;
    }

    public Integer getAttr12() {
        return attr12;
    }

    public void setAttr12(Integer attr12) {
        this.attr12 = attr12;
    }

    public Integer getScore12() {
        return score12;
    }

    public void setScore12(Integer score12) {
        this.score12 = score12;
    }

    public Integer getAttr13() {
        return attr13;
    }

    public void setAttr13(Integer attr13) {
        this.attr13 = attr13;
    }

    public Integer getScore13() {
        return score13;
    }

    public void setScore13(Integer score13) {
        this.score13 = score13;
    }

    public Integer getAttr14() {
        return attr14;
    }

    public void setAttr14(Integer attr14) {
        this.attr14 = attr14;
    }

    public Integer getScore14() {
        return score14;
    }

    public void setScore14(Integer score14) {
        this.score14 = score14;
    }

    public Integer getAttr15() {
        return attr15;
    }

    public void setAttr15(Integer attr15) {
        this.attr15 = attr15;
    }

    public Integer getScore15() {
        return score15;
    }

    public void setScore15(Integer score15) {
        this.score15 = score15;
    }

    public Integer getResultScore() {
        return resultScore;
    }

    public void setResultScore(Integer resultScore) {
        this.resultScore = resultScore;
    }

    public Integer getResultDictId() {
        return resultDictId;
    }

    public void setResultDictId(Integer resultDictId) {
        this.resultDictId = resultDictId;
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

    public String getAudit1() {
        return audit1;
    }

    public void setAudit1(String audit1) {
        this.audit1 = audit1;
    }

    public String getAuditDate1() {
        return auditDate1;
    }

    public void setAuditDate1(String auditDate1) {
        this.auditDate1 = auditDate1;
    }

    public String getWorkerName1() {
        return workerName1;
    }

    public void setWorkerName1(String workerName1) {
        this.workerName1 = workerName1;
    }

    public String getWorkerCard1() {
        return workerCard1;
    }

    public void setWorkerCard1(String workerCard1) {
        this.workerCard1 = workerCard1;
    }

    public String getWorkerDate1() {
        return workerDate1;
    }

    public void setWorkerDate1(String workerDate1) {
        this.workerDate1 = workerDate1;
    }

    public String getWorkerName2() {
        return workerName2;
    }

    public void setWorkerName2(String workerName2) {
        this.workerName2 = workerName2;
    }

    public String getWorkerCard2() {
        return workerCard2;
    }

    public void setWorkerCard2(String workerCard2) {
        this.workerCard2 = workerCard2;
    }

    public String getWorkerDate2() {
        return workerDate2;
    }

    public void setWorkerDate2(String workerDate2) {
        this.workerDate2 = workerDate2;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getServiceOrgIds() {
        return serviceOrgIds;
    }

    public void setServiceOrgIds(String serviceOrgIds) {
        this.serviceOrgIds = serviceOrgIds;
    }
}
