package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class ElderCapacity implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 组织名称
     */
    private String receiverServiceOrg;

    private String oldmanName; //姓名

    private String idCard;  //身份证号

    private String oldmanPreferentialCard; //老年优待证号

    private String phone1; //固话

    private String phone2; //手机

    private String oldmanPhoto; //老人照片

    private Integer degreeOfEducation; //文化程度

    private Integer conservationTime; //常住时间

    private String domicileAddress; //户籍地址

    private String nowAddress; //现居地址

    private String emergencyContact1; //联系人1姓名

    private String emergencyContact1Relatives; //联系人1与老人关系

    private String emergencyContact1Tel; //联系人1联系方式

    private Integer isKey1; //联系人1是否有老年人钥匙

    private String emergencyContact2; //联系人2姓名

    private String emergencyContact2Relatives; //联系人2与老人关系

    private String emergencyContact2Tel; //联系人2联系方式

    private Integer isKey2; //联系人2是否有老年人钥匙

    private String emergencyContact3; //联系人3姓名

    private String emergencyContact3Relatives; //联系人3与老人关系

    private String emergencyContact3Tel; //联系人3联系方式

    private Integer isKey3; //联系人3是否有老年人钥匙

    private Integer oldmanZy; //原职业

    private Integer oldmanCategory; //人员类别

    private Integer specialObject; //特殊对象

    private Integer sourcesOfIncome; //收入来源

    private Integer statusOfChildren; //子女状况

    private Integer medicalCategory; //医疗类别

    private Integer residentialStatus; //居住状况

    private Integer housingNature; //住房性质

    private Integer habitableRoom; //居室

    private Integer floorLift; //楼层电梯

    private Integer residentialFloor; //居住楼层（楼层无电梯的）

    private Integer indoorToilet; //室内厕所

    private Integer indoorBathEquipment; //室内洗浴设备

    private Integer careSituation; //原照料情况

    private Integer governmentPurchase; //政府购买居家养老服务

    private Integer servicesRequested; //服务需求

    private Integer physiclalHealthStatus; //身体健康

    private Integer physiclalIllnessStatus; //重病

    private Integer physiclalChronicStatus; //慢性病

    private Integer psychologicStatus; //心理状况

    private Integer socialActivities; //社会活动情况

    private Integer socialActivitiesType; //社会活动类型

    private Integer dayActivity1; //1-10依次对应页面更改后日常生活能力

    private Integer dayActivity2; //

    private Integer dayActivity3; //

    private Integer dayActivity4; //

    private Integer dayActivity5; //

    private Integer dayActivity6; //

    private Integer dayActivity7; //

    private Integer dayActivity8;

    private Integer dayActivity9;

    private Integer dayActivity10;

    private Integer cognitiveAbility1; //1-4依次对应感知与沟通

    private Integer cognitiveAbility2; //

    private Integer cognitiveAbility3; //

    private Integer cognitiveAbility4; //

    private Integer moodAction1; //1-3依次对应精神状态

    private Integer moodAction2; //

    private Integer moodAction3; //

    private Integer audiovisual1; //1-5依次对应社会参与

    private Integer audiovisual2; //

    private Integer audiovisual3;

    private Integer audiovisual4;

    private Integer audiovisual5;

    private String areaName; //区域

    private String community; //社区

    private String sign; //本人(或家属)签字

    private String judgeSign; //评估员签字

    private Double  infoIntegrity;//完善度

    private Double  bilityCount;//能力分

    private  Integer  foolStatus;//痴呆

    private  Integer  spiritStatus;//精神疾病

    private  Integer  accident1;//意外事件1-4及其他

    private  Integer  accident2;

    private  Integer  accident3;

    private  Integer  accident4;

    private  String  accidentOther;

    private String  dailyRank;//日常分级

    private String  spiritRank;//精神分级

    private String  perceptionRank;//感知分级

    private String  socialRank;//社会参与分级

    private  Integer  demandScore;//需求分

    private  String  demandRank;//需求分级

    private  String capacity ; // 行为能力

    private String  economic ; //经济条件

    private String sex; //  性别

    private String household;//户籍区

    private String domicile;//户籍乡镇

    private String village;//户籍村

    private String emergencyContact; //紧急联系人

    private String  emergencyContactMode; //紧急联系方式

    private String  age; //年龄

    private String specialContribution; //特殊贡献

    private String familyPlan;  //计划生育特困家庭

    private String disability;  //残疾情况

    private String subsidyLevel;//补贴等级

    private String householdType; //户籍类型

    private String livingConditions; //居住状况

    private Integer isFlag;//是否注销 0、已注销 1、未注销

    private Integer photoFlag;//图片标识 1、app端上传 2、后台系统上传

    public String getReceiverServiceOrg() {
        return receiverServiceOrg;
    }

    public void setReceiverServiceOrg(String receiverServiceOrg) {
        this.receiverServiceOrg = receiverServiceOrg;
    }

    public Integer getPhotoFlag() {
        return photoFlag;
    }

    public void setPhotoFlag(Integer photoFlag) {
        this.photoFlag = photoFlag;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOldmanName() {
        return oldmanName;
    }

    public void setOldmanName(String oldmanName) {
        this.oldmanName = oldmanName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getOldmanPreferentialCard() {
        return oldmanPreferentialCard;
    }

    public void setOldmanPreferentialCard(String oldmanPreferentialCard) {
        this.oldmanPreferentialCard = oldmanPreferentialCard;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getOldmanPhoto() {
        return oldmanPhoto;
    }

    public void setOldmanPhoto(String oldmanPhoto) {
        this.oldmanPhoto = oldmanPhoto;
    }

    public Integer getDegreeOfEducation() {
        return degreeOfEducation;
    }

    public void setDegreeOfEducation(Integer degreeOfEducation) {
        this.degreeOfEducation = degreeOfEducation;
    }

    public Integer getConservationTime() {
        return conservationTime;
    }

    public void setConservationTime(Integer conservationTime) {
        this.conservationTime = conservationTime;
    }

    public String getDomicileAddress() {
        return domicileAddress;
    }

    public void setDomicileAddress(String domicileAddress) {
        this.domicileAddress = domicileAddress;
    }

    public String getNowAddress() {
        return nowAddress;
    }

    public void setNowAddress(String nowAddress) {
        this.nowAddress = nowAddress;
    }

    public String getEmergencyContact1() {
        return emergencyContact1;
    }

    public void setEmergencyContact1(String emergencyContact1) {
        this.emergencyContact1 = emergencyContact1;
    }

    public String getEmergencyContact1Relatives() {
        return emergencyContact1Relatives;
    }

    public void setEmergencyContact1Relatives(String emergencyContact1Relatives) {
        this.emergencyContact1Relatives = emergencyContact1Relatives;
    }

    public String getEmergencyContact1Tel() {
        return emergencyContact1Tel;
    }

    public void setEmergencyContact1Tel(String emergencyContact1Tel) {
        this.emergencyContact1Tel = emergencyContact1Tel;
    }

    public Integer getIsKey1() {
        return isKey1;
    }

    public void setIsKey1(Integer isKey1) {
        this.isKey1 = isKey1;
    }

    public String getEmergencyContact2() {
        return emergencyContact2;
    }

    public void setEmergencyContact2(String emergencyContact2) {
        this.emergencyContact2 = emergencyContact2;
    }

    public String getEmergencyContact2Relatives() {
        return emergencyContact2Relatives;
    }

    public void setEmergencyContact2Relatives(String emergencyContact2Relatives) {
        this.emergencyContact2Relatives = emergencyContact2Relatives;
    }

    public String getEmergencyContact2Tel() {
        return emergencyContact2Tel;
    }

    public void setEmergencyContact2Tel(String emergencyContact2Tel) {
        this.emergencyContact2Tel = emergencyContact2Tel;
    }

    public Integer getIsKey2() {
        return isKey2;
    }

    public void setIsKey2(Integer isKey2) {
        this.isKey2 = isKey2;
    }

    public String getEmergencyContact3() {
        return emergencyContact3;
    }

    public void setEmergencyContact3(String emergencyContact3) {
        this.emergencyContact3 = emergencyContact3;
    }

    public String getEmergencyContact3Relatives() {
        return emergencyContact3Relatives;
    }

    public void setEmergencyContact3Relatives(String emergencyContact3Relatives) {
        this.emergencyContact3Relatives = emergencyContact3Relatives;
    }

    public String getEmergencyContact3Tel() {
        return emergencyContact3Tel;
    }

    public void setEmergencyContact3Tel(String emergencyContact3Tel) {
        this.emergencyContact3Tel = emergencyContact3Tel;
    }

    public Integer getIsKey3() {
        return isKey3;
    }

    public void setIsKey3(Integer isKey3) {
        this.isKey3 = isKey3;
    }

    public Integer getOldmanZy() {
        return oldmanZy;
    }

    public void setOldmanZy(Integer oldmanZy) {
        this.oldmanZy = oldmanZy;
    }

    public Integer getOldmanCategory() {
        return oldmanCategory;
    }

    public void setOldmanCategory(Integer oldmanCategory) {
        this.oldmanCategory = oldmanCategory;
    }

    public Integer getSpecialObject() {
        return specialObject;
    }

    public void setSpecialObject(Integer specialObject) {
        this.specialObject = specialObject;
    }

    public Integer getSourcesOfIncome() {
        return sourcesOfIncome;
    }

    public void setSourcesOfIncome(Integer sourcesOfIncome) {
        this.sourcesOfIncome = sourcesOfIncome;
    }

    public Integer getStatusOfChildren() {
        return statusOfChildren;
    }

    public void setStatusOfChildren(Integer statusOfChildren) {
        this.statusOfChildren = statusOfChildren;
    }

    public Integer getMedicalCategory() {
        return medicalCategory;
    }

    public void setMedicalCategory(Integer medicalCategory) {
        this.medicalCategory = medicalCategory;
    }

    public Integer getResidentialStatus() {
        return residentialStatus;
    }

    public void setResidentialStatus(Integer residentialStatus) {
        this.residentialStatus = residentialStatus;
    }

    public Integer getHousingNature() {
        return housingNature;
    }

    public void setHousingNature(Integer housingNature) {
        this.housingNature = housingNature;
    }

    public Integer getHabitableRoom() {
        return habitableRoom;
    }

    public void setHabitableRoom(Integer habitableRoom) {
        this.habitableRoom = habitableRoom;
    }

    public Integer getFloorLift() {
        return floorLift;
    }

    public void setFloorLift(Integer floorLift) {
        this.floorLift = floorLift;
    }

    public Integer getResidentialFloor() {
        return residentialFloor;
    }

    public void setResidentialFloor(Integer residentialFloor) {
        this.residentialFloor = residentialFloor;
    }

    public Integer getIndoorToilet() {
        return indoorToilet;
    }

    public void setIndoorToilet(Integer indoorToilet) {
        this.indoorToilet = indoorToilet;
    }

    public Integer getIndoorBathEquipment() {
        return indoorBathEquipment;
    }

    public void setIndoorBathEquipment(Integer indoorBathEquipment) {
        this.indoorBathEquipment = indoorBathEquipment;
    }

    public Integer getCareSituation() {
        return careSituation;
    }

    public void setCareSituation(Integer careSituation) {
        this.careSituation = careSituation;
    }

    public Integer getGovernmentPurchase() {
        return governmentPurchase;
    }

    public void setGovernmentPurchase(Integer governmentPurchase) {
        this.governmentPurchase = governmentPurchase;
    }

    public Integer getServicesRequested() {
        return servicesRequested;
    }

    public void setServicesRequested(Integer servicesRequested) {
        this.servicesRequested = servicesRequested;
    }

    public Integer getPhysiclalHealthStatus() {
        return physiclalHealthStatus;
    }

    public void setPhysiclalHealthStatus(Integer physiclalHealthStatus) {
        this.physiclalHealthStatus = physiclalHealthStatus;
    }

    public Integer getPhysiclalIllnessStatus() {
        return physiclalIllnessStatus;
    }

    public void setPhysiclalIllnessStatus(Integer physiclalIllnessStatus) {
        this.physiclalIllnessStatus = physiclalIllnessStatus;
    }

    public Integer getPhysiclalChronicStatus() {
        return physiclalChronicStatus;
    }

    public void setPhysiclalChronicStatus(Integer physiclalChronicStatus) {
        this.physiclalChronicStatus = physiclalChronicStatus;
    }

    public Integer getPsychologicStatus() {
        return psychologicStatus;
    }

    public void setPsychologicStatus(Integer psychologicStatus) {
        this.psychologicStatus = psychologicStatus;
    }

    public Integer getSocialActivities() {
        return socialActivities;
    }

    public void setSocialActivities(Integer socialActivities) {
        this.socialActivities = socialActivities;
    }

    public Integer getSocialActivitiesType() {
        return socialActivitiesType;
    }

    public void setSocialActivitiesType(Integer socialActivitiesType) {
        this.socialActivitiesType = socialActivitiesType;
    }

    public Integer getDayActivity1() {
        return dayActivity1;
    }

    public void setDayActivity1(Integer dayActivity1) {
        this.dayActivity1 = dayActivity1;
    }

    public Integer getDayActivity2() {
        return dayActivity2;
    }

    public void setDayActivity2(Integer dayActivity2) {
        this.dayActivity2 = dayActivity2;
    }

    public Integer getDayActivity3() {
        return dayActivity3;
    }

    public void setDayActivity3(Integer dayActivity3) {
        this.dayActivity3 = dayActivity3;
    }

    public Integer getDayActivity4() {
        return dayActivity4;
    }

    public void setDayActivity4(Integer dayActivity4) {
        this.dayActivity4 = dayActivity4;
    }

    public Integer getDayActivity5() {
        return dayActivity5;
    }

    public void setDayActivity5(Integer dayActivity5) {
        this.dayActivity5 = dayActivity5;
    }

    public Integer getDayActivity6() {
        return dayActivity6;
    }

    public void setDayActivity6(Integer dayActivity6) {
        this.dayActivity6 = dayActivity6;
    }

    public Integer getDayActivity7() {
        return dayActivity7;
    }

    public void setDayActivity7(Integer dayActivity7) {
        this.dayActivity7 = dayActivity7;
    }

    public Integer getCognitiveAbility1() {
        return cognitiveAbility1;
    }

    public void setCognitiveAbility1(Integer cognitiveAbility1) {
        this.cognitiveAbility1 = cognitiveAbility1;
    }

    public Integer getCognitiveAbility2() {
        return cognitiveAbility2;
    }

    public void setCognitiveAbility2(Integer cognitiveAbility2) {
        this.cognitiveAbility2 = cognitiveAbility2;
    }

    public Integer getCognitiveAbility3() {
        return cognitiveAbility3;
    }

    public void setCognitiveAbility3(Integer cognitiveAbility3) {
        this.cognitiveAbility3 = cognitiveAbility3;
    }

    public Integer getCognitiveAbility4() {
        return cognitiveAbility4;
    }

    public void setCognitiveAbility4(Integer cognitiveAbility4) {
        this.cognitiveAbility4 = cognitiveAbility4;
    }

    public Integer getMoodAction1() {
        return moodAction1;
    }

    public void setMoodAction1(Integer moodAction1) {
        this.moodAction1 = moodAction1;
    }

    public Integer getMoodAction2() {
        return moodAction2;
    }

    public void setMoodAction2(Integer moodAction2) {
        this.moodAction2 = moodAction2;
    }

    public Integer getMoodAction3() {
        return moodAction3;
    }

    public void setMoodAction3(Integer moodAction3) {
        this.moodAction3 = moodAction3;
    }

    public Integer getAudiovisual1() {
        return audiovisual1;
    }

    public void setAudiovisual1(Integer audiovisual1) {
        this.audiovisual1 = audiovisual1;
    }

    public Integer getAudiovisual2() {
        return audiovisual2;
    }

    public void setAudiovisual2(Integer audiovisual2) {
        this.audiovisual2 = audiovisual2;
    }

    public String getCommunity() {
        return community;
    }

    public void setCommunity(String community) {
        this.community = community;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getJudgeSign() {
        return judgeSign;
    }

    public void setJudgeSign(String judgeSign) {
        this.judgeSign = judgeSign;
    }

    public Double getInfoIntegrity() {
        return infoIntegrity;
    }

    public void setInfoIntegrity(Double infoIntegrity) {
        this.infoIntegrity = infoIntegrity;
    }

    public Double getBilityCount() {
        return bilityCount;
    }

    public void setBilityCount(Double bilityCount) {
        this.bilityCount = bilityCount;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getEconomic() {
        return economic;
    }

    public void setEconomic(String economic) {
        this.economic = economic;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHousehold() {
        return household;
    }

    public void setHousehold(String household) {
        this.household = household;
    }

    public String getDomicile() {
        return domicile;
    }

    public void setDomicile(String domicile) {
        this.domicile = domicile;
    }

    public String getVillage() {
        return village;
    }

    public void setVillage(String village) {
        this.village = village;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public String getEmergencyContactMode() {
        return emergencyContactMode;
    }

    public void setEmergencyContactMode(String emergencyContactMode) {
        this.emergencyContactMode = emergencyContactMode;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSpecialContribution() {
        return specialContribution;
    }

    public void setSpecialContribution(String specialContribution) {
        this.specialContribution = specialContribution;
    }

    public String getFamilyPlan() {
        return familyPlan;
    }

    public void setFamilyPlan(String familyPlan) {
        this.familyPlan = familyPlan;
    }

    public String getDisability() {
        return disability;
    }

    public void setDisability(String disability) {
        this.disability = disability;
    }

    public String getSubsidyLevel() {
        return subsidyLevel;
    }

    public void setSubsidyLevel(String subsidyLevel) {
        this.subsidyLevel = subsidyLevel;
    }

    public String getHouseholdType() {
        return householdType;
    }

    public void setHouseholdType(String householdType) {
        this.householdType = householdType;
    }

    public String getLivingConditions() {
        return livingConditions;
    }

    public void setLivingConditions(String livingConditions) {
        this.livingConditions = livingConditions;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getDayActivity8() {
        return dayActivity8;
    }

    public void setDayActivity8(Integer dayActivity8) {
        this.dayActivity8 = dayActivity8;
    }

    public Integer getDayActivity9() {
        return dayActivity9;
    }

    public void setDayActivity9(Integer dayActivity9) {
        this.dayActivity9 = dayActivity9;
    }

    public Integer getDayActivity10() {
        return dayActivity10;
    }

    public void setDayActivity10(Integer dayActivity10) {
        this.dayActivity10 = dayActivity10;
    }

    public Integer getAudiovisual3() {
        return audiovisual3;
    }

    public void setAudiovisual3(Integer audiovisual3) {
        this.audiovisual3 = audiovisual3;
    }

    public Integer getAudiovisual4() {
        return audiovisual4;
    }

    public void setAudiovisual4(Integer audiovisual4) {
        this.audiovisual4 = audiovisual4;
    }

    public Integer getAudiovisual5() {
        return audiovisual5;
    }

    public void setAudiovisual5(Integer audiovisual5) {
        this.audiovisual5 = audiovisual5;
    }

    public Integer getFoolStatus() {
        return foolStatus;
    }

    public void setFoolStatus(Integer foolStatus) {
        this.foolStatus = foolStatus;
    }

    public Integer getSpiritStatus() {
        return spiritStatus;
    }

    public void setSpiritStatus(Integer spiritStatus) {
        this.spiritStatus = spiritStatus;
    }

    public Integer getAccident1() {
        return accident1;
    }

    public void setAccident1(Integer accident1) {
        this.accident1 = accident1;
    }

    public Integer getAccident2() {
        return accident2;
    }

    public void setAccident2(Integer accident2) {
        this.accident2 = accident2;
    }

    public Integer getAccident3() {
        return accident3;
    }

    public void setAccident3(Integer accident3) {
        this.accident3 = accident3;
    }

    public Integer getAccident4() {
        return accident4;
    }

    public void setAccident4(Integer accident4) {
        this.accident4 = accident4;
    }

    public String getAccidentOther() {
        return accidentOther;
    }

    public void setAccidentOther(String accidentOther) {
        this.accidentOther = accidentOther;
    }

    public String getDailyRank() {
        return dailyRank;
    }

    public void setDailyRank(String dailyRank) {
        this.dailyRank = dailyRank;
    }

    public String getSpiritRank() {
        return spiritRank;
    }

    public void setSpiritRank(String spiritRank) {
        this.spiritRank = spiritRank;
    }

    public String getPerceptionRank() {
        return perceptionRank;
    }

    public void setPerceptionRank(String perceptionRank) {
        this.perceptionRank = perceptionRank;
    }

    public String getSocialRank() {
        return socialRank;
    }

    public void setSocialRank(String socialRank) {
        this.socialRank = socialRank;
    }

    public Integer getDemandScore() {
        return demandScore;
    }

    public void setDemandScore(Integer demandScore) {
        this.demandScore = demandScore;
    }

    public String getDemandRank() {
        return demandRank;
    }

    public void setDemandRank(String demandRank) {
        this.demandRank = demandRank;
    }

    public Integer getIsFlag() {
        return isFlag;
    }

    public void setIsFlag(Integer isFlag) {
        this.isFlag = isFlag;
    }
}
