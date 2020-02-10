package com.fedtech.pension.elderly.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ElderlyGovbuyApply implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String number;
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
     * 固化
     */
    private String homeTel;
    /**
     * 手机
     */
    private String mobile;
    /**
     * 文化程度(状态1文盲、2小学、3初中、4高中和中专、5大专、6本科及以上、0其他)
     */
    private Integer educationDictId;
    /**
     * 户籍地址
     */
    private String regPlace;
    /**
     * 常住时间（状态1半年以下、2常住）
     */
    private Integer liveYearDictId;
    /**
     * 地址
     */
    private String address;
    /**
     * 实名卡号
     */
    private String cardno;
    /**
     * 人员类别（1.城市三无/农村五保2.低保/低保边缘3.经济困难的失能/半失能老人4.70周岁及以上的计生特扶老人5.百岁老人6.空巢7.独居）
     */
    private String elderTypeDictIds;
    /**
     * 联系人1
     */
    private String linkManName1;
    /**
     * 联系人关系
     */
    private String linkManRelat1;
    /**
     * 联系方式
     */
    private String linkManLink1;
    /**
     * 联系人是否有钥匙1有2无
     */
    private String linkManKey1;
    /**
     * 联系人
     */
    private String linkManName2;
    /**
     * 联系人关系
     */
    private String linkManRelat2;
    /**
     * 联系方式
     */
    private String linkManLink2;
    /**
     * 联系人是否有钥匙1有2无
     */
    private String linkManKey2;
    /**
     * 联系人
     */
    private String linkManName3;
    /**
     * 联系人关系
     */
    private String linkManRelat3;
    /**
     * 联系方式
     */
    private String linkManLink3;
    /**
     * 联系人是否有钥匙1有2无
     */
    private String linkManKey3;
    /**
     * 原职业（状态242教师、243军人、244公务员、245事业职工、246企业职工、247农民、248商人、249无业）
     */
    private Integer jobDictId;
    /**
     * 1机关事业单位离休金2机关事业单位退休金3养老金4三无下放人员补贴5三线老军工补贴6  城乡居民养老保险7供养人员补贴8低保金9 拆迁补助（ 元/月）10失地农民补助11其他
     */
    private String incomeSource;
    /**
     * 子女情况（状态:1有子女、2未生育子女、3失去子女）
     */
    private Integer childrenDictId;
    /**
     * 医疗类别（状态：1公费、2职工医保、3居民医保、4新农合、5自费）
     */
    private Integer medicalType;
    /**
     *  居住状况状态 1独居、2空巢、3合居）
     */
    private Integer residenceDictId;
    /**
     * 住房性质（状态1有产权、2无产权）
     */
    private Integer houseTypeDictId;
    /**
     * 居室（状态：287一居、288二居、289三居、290其他）
     */
    private Integer roomTypeDictId;
    /**
     * 楼层电梯(状态：1有、2无)
     */
    private String hasElevator;
    /**
     * 居住楼层（楼层无电梯的）（状态：1一层、2二层、3三层）
     */
    private Integer floor;
    /**
     * 室内厕所(状态：1有、2无)
     */
    private Integer hasToilet;
    /**
     * 室内洗浴设备(状态1有、2无)
     */
    private Integer hasBath;
    /**
     * 原照料情况1(状态：1配偶照顾、2子女照顾、3自购家政服务、4送餐服务、5自我照顾、6 互助门铃7.居家照料8 紧急呼叫终端9老年人意外伤害保险
     * 10 其他)
     */
    private String careCondition;
    /**
     * 服务需求1家务料理 2代购物品 3康复保健4紧急呼叫5心理关爱 6法律援助 7文化娱乐 8助餐 9送餐 10陪聊 11陪住 12陪外出13陪旅游 14日托 15其他
     * </td>
     */
    private String serviceNeed;
    /**
     * 重 病:
     * 1恶性肿瘤 2尿毒症透析3器官移植（含手术后的抗排异治疗）4白血病 5急性心肌梗塞 6脑中风 7急性坏死性胰腺炎8脑外伤 9主动脉手术 10冠状动脉旁路手术 11慢性肾功能性衰竭 12急慢性重症肝炎 13危及生命的良性脑瘤 14重症糖尿病15消化道出血 16系统性红斑狼疮 17慢性再生障碍性贫血18血友病 19重症精神病。
     * 慢性病：
     * 20高血压21冠心病 22前列腺增生23糖尿病 24其他
     */
    private String sickenDictId;
    /**
     * 心理状况：1正常 2: 偶尔有孤独感3经常觉得孤独
     */
    private Integer psychologicDictId;
    /**
     * 社会活动情况
     * 1经常 2偶尔 3从不
     */
    private Integer socialActiDictId;
    /**
     * 社会活动类型：
     * 1文艺类 2教育类 3健身类 4慈善类 5经济类 6宗教类 7其他
     */
    private String saTypeDictId;
    /**
     * 街道审定人
     */
    private String operator;
    /**
     * 审定时间
     */
    private String estimateDate;
    /**
     * 项目：吃饭 描述：能完成入口、咀嚼、吞咽等步骤 （状态：1正常2轻丧失3中丧失）
     */
    private Integer attr1;
    /**
     * 吃饭能力评分
     */
    private Integer score01;
    /**
     * 项目：穿衣 描述：完成取衣、穿衣、系带、扣扣子等 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr2;
    /**
     * 穿衣评分
     */
    private Integer score02;
    /**
     * 项目：如厕 描述：如厕、便后能自理及整理衣裤 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr3;
    /**
     * 如厕评分
     */
    private Integer score03;
    /**
     * 项目：室内走动 描述：外出、上下楼正常 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr4;
    /**
     * 室内走动评分
     */
    private Integer score04;
    /**
     * 项目：洗澡 描述： 能完成洗澡的全部过程（状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr5;
    /**
     * 洗澡评分
     */
    private Integer score05;
    /**
     * 项目：控制大小便 描述：能控制大小便 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr6;
    /**
     * 控制大小便评分
     */
    private Integer score06;
    /**
     * 项目：近期记忆 描述：能回想近期发生的事情 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr7;
    /**
     * 近期记忆评分
     */
    private Integer score07;
    /**
     * 项目：程序记忆 描述： 完成洗衣、做饭、做菜等（状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr8;
    /**
     * 程序记忆评分
     */
    private Integer score08;
    /**
     * 项目：定向记忆 描述：外出、回家不迷路 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr9;
    /**
     * 定向记忆评分
     */
    private Integer score09;
    /**
     * 项目：判断能力 描述： 对日常事物的判断不违背常理（状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr10;
    /**
     * 判断能力评分
     */
    private Integer score10;
    /**
     * 项目：情绪 描述：与人和睦相处，不偏激 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr11;
    /**
     * 情绪评分
     */
    private Integer score11;
    /**
     * 项目：行为 描述：动作行为表现是否异常 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr12;
    /**
     * 行为评分
     */
    private Integer score12;
    /**
     * 项目：沟通 描述：在交流中能否互相理解 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr13;
    /**
     * 沟通评分
     */
    private Integer score13;
    /**
     * 项目：视觉 描述：能正常看电视、读报等 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr14;
    /**
     * 视觉评分
     */
    private Integer score14;
    /**
     * 项目：听觉 描述：能正常接听电话、交谈 （状态：1正常2轻丧失3中丧失4完全丧失）
     */
    private Integer attr15;
    /**
     * 听觉评分
     */
    private Integer score15;
    /**
     * 失能分
     */
    private Integer resultScore;
    /**
     *  状态：1自理  3 半失能  2失能
     */
    private Integer resultDictId;
    /**
     * 本人（或代理人）签字
     */
    private String familyName;
    /**
     * 日期
     */
    private String familyDate;
    /**
     * 评估员1（签字）
     */
    private String workerName1;
    /**
     * 工作证号
     */
    private String workerCard1;
    /**
     * 日期
     */
    private String workerDate1;
    /**
     *  评估员2（签字）
     */
    private String workerName2;
    /**
     * 工作证号
     */
    private String workerCard2;
    /**
     * 日期
     */
    private String workerDate2;
    /**
     * 区民政局制定信息呼叫终端 1:固定终端 2移动终端
     */
    private Integer callerType;
    /**
     * 服务商1：123492安康通3康惠通4奥维5 96180 6 平安保7  962069
     */
    private String callerLabel;
    /**
     * 状态 0:已登记 1:已受理2:
     */
    private Integer status;

    private String selectStatus;
    /**
     * 评估id
     */
    private Integer assessOrgId;

    private String assessOrgName;
    /**
     * 组织id
     */
    private Integer serviceOrgId;

    private String serviceOrgName;
    /**
     * 创建人
     */
    private Integer standard;
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
     * 0:审核中1:通过 2:未通过
     */
    private Integer result;

    public ElderlyGovbuyApply() {
    }

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

    public String getHomeTel() {
        return homeTel;
    }

    public void setHomeTel(String homeTel) {
        this.homeTel = homeTel;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getEducationDictId() {
        return educationDictId;
    }

    public void setEducationDictId(Integer educationDictId) {
        this.educationDictId = educationDictId;
    }

    public String getRegPlace() {
        return regPlace;
    }

    public void setRegPlace(String regPlace) {
        this.regPlace = regPlace;
    }

    public Integer getLiveYearDictId() {
        return liveYearDictId;
    }

    public void setLiveYearDictId(Integer liveYearDictId) {
        this.liveYearDictId = liveYearDictId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getElderTypeDictIds() {
        return elderTypeDictIds;
    }

    public void setElderTypeDictIds(String elderTypeDictIds) {
        this.elderTypeDictIds = elderTypeDictIds;
    }

    public String getLinkManName1() {
        return linkManName1;
    }

    public void setLinkManName1(String linkManName1) {
        this.linkManName1 = linkManName1;
    }

    public String getLinkManRelat1() {
        return linkManRelat1;
    }

    public void setLinkManRelat1(String linkManRelat1) {
        this.linkManRelat1 = linkManRelat1;
    }

    public String getLinkManLink1() {
        return linkManLink1;
    }

    public void setLinkManLink1(String linkManLink1) {
        this.linkManLink1 = linkManLink1;
    }

    public String getLinkManKey1() {
        return linkManKey1;
    }

    public void setLinkManKey1(String linkManKey1) {
        this.linkManKey1 = linkManKey1;
    }

    public String getLinkManName2() {
        return linkManName2;
    }

    public void setLinkManName2(String linkManName2) {
        this.linkManName2 = linkManName2;
    }

    public String getLinkManRelat2() {
        return linkManRelat2;
    }

    public void setLinkManRelat2(String linkManRelat2) {
        this.linkManRelat2 = linkManRelat2;
    }

    public String getLinkManLink2() {
        return linkManLink2;
    }

    public void setLinkManLink2(String linkManLink2) {
        this.linkManLink2 = linkManLink2;
    }

    public String getLinkManKey2() {
        return linkManKey2;
    }

    public void setLinkManKey2(String linkManKey2) {
        this.linkManKey2 = linkManKey2;
    }

    public String getLinkManName3() {
        return linkManName3;
    }

    public void setLinkManName3(String linkManName3) {
        this.linkManName3 = linkManName3;
    }

    public String getLinkManRelat3() {
        return linkManRelat3;
    }

    public void setLinkManRelat3(String linkManRelat3) {
        this.linkManRelat3 = linkManRelat3;
    }

    public String getLinkManLink3() {
        return linkManLink3;
    }

    public void setLinkManLink3(String linkManLink3) {
        this.linkManLink3 = linkManLink3;
    }

    public String getLinkManKey3() {
        return linkManKey3;
    }

    public void setLinkManKey3(String linkManKey3) {
        this.linkManKey3 = linkManKey3;
    }

    public Integer getJobDictId() {
        return jobDictId;
    }

    public void setJobDictId(Integer jobDictId) {
        this.jobDictId = jobDictId;
    }

    public String getIncomeSource() {
        return incomeSource;
    }

    public void setIncomeSource(String incomeSource) {
        this.incomeSource = incomeSource;
    }

    public Integer getChildrenDictId() {
        return childrenDictId;
    }

    public void setChildrenDictId(Integer childrenDictId) {
        this.childrenDictId = childrenDictId;
    }

    public Integer getMedicalType() {
        return medicalType;
    }

    public void setMedicalType(Integer medicalType) {
        this.medicalType = medicalType;
    }

    public Integer getResidenceDictId() {
        return residenceDictId;
    }

    public void setResidenceDictId(Integer residenceDictId) {
        this.residenceDictId = residenceDictId;
    }

    public Integer getHouseTypeDictId() {
        return houseTypeDictId;
    }

    public void setHouseTypeDictId(Integer houseTypeDictId) {
        this.houseTypeDictId = houseTypeDictId;
    }

    public Integer getRoomTypeDictId() {
        return roomTypeDictId;
    }

    public void setRoomTypeDictId(Integer roomTypeDictId) {
        this.roomTypeDictId = roomTypeDictId;
    }

    public String getHasElevator() {
        return hasElevator;
    }

    public void setHasElevator(String hasElevator) {
        this.hasElevator = hasElevator;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getHasToilet() {
        return hasToilet;
    }

    public void setHasToilet(Integer hasToilet) {
        this.hasToilet = hasToilet;
    }

    public Integer getHasBath() {
        return hasBath;
    }

    public void setHasBath(Integer hasBath) {
        this.hasBath = hasBath;
    }

    public String getCareCondition() {
        return careCondition;
    }

    public void setCareCondition(String careCondition) {
        this.careCondition = careCondition;
    }

    public String getServiceNeed() {
        return serviceNeed;
    }

    public void setServiceNeed(String serviceNeed) {
        this.serviceNeed = serviceNeed;
    }

    public String getSickenDictId() {
        return sickenDictId;
    }

    public void setSickenDictId(String sickenDictId) {
        this.sickenDictId = sickenDictId;
    }

    public Integer getPsychologicDictId() {
        return psychologicDictId;
    }

    public void setPsychologicDictId(Integer psychologicDictId) {
        this.psychologicDictId = psychologicDictId;
    }

    public Integer getSocialActiDictId() {
        return socialActiDictId;
    }

    public void setSocialActiDictId(Integer socialActiDictId) {
        this.socialActiDictId = socialActiDictId;
    }

    public String getSaTypeDictId() {
        return saTypeDictId;
    }

    public void setSaTypeDictId(String saTypeDictId) {
        this.saTypeDictId = saTypeDictId;
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

    public Integer getCallerType() {
        return callerType;
    }

    public void setCallerType(Integer callerType) {
        this.callerType = callerType;
    }

    public String getCallerLabel() {
        return callerLabel;
    }

    public void setCallerLabel(String callerLabel) {
        this.callerLabel = callerLabel;
    }


    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSelectStatus() {
        return selectStatus;
    }

    public void setSelectStatus(String selectStatus) {
        this.selectStatus = selectStatus;
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

    public Integer getStandard() {
        return standard;
    }

    public void setStandard(Integer standard) {
        this.standard = standard;
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

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }
}