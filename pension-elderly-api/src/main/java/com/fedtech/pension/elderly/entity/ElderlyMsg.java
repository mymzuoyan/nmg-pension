package com.fedtech.pension.elderly.entity;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author gengqiang
 */
public class ElderlyMsg implements Serializable {

    private static final Long serialVersionUID = 1L;


    private Integer id;
    /**
     * 老人照片
     */
    private String photo;
    /**
     * 老人姓名
     */
    private String elderName;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 性别 （状态1男 2女）
     */
    private Integer sexDictId;
    /**
     * 生日
     */
    private String birthday;
    /**
     * 民族 （状态：99未登记、1汉族、2回族、3布依族、4藏族、5朝鲜族、6满族、7蒙古族、8维吾尔族、9土家族、10壮族、11苗族）
     */
    private Integer nationDictId;
    /**
     * 身份证号码
     */
    private String idcardno;
    /**
     * 住宅电话
     */
    private String homeTel;
    /**
     * 移动电话
     */
    private String mobile;
    /**
     * 户籍所在地
     */
    private String regPlace;
    /**
     * 实际居住地
     */
    private String realAddress;
    /**
     * 婚姻状况 (状态：1未婚、2已婚、3丧偶、4离异、5未说明)
     */
    private Integer maritalStatus;
    /**
     * 部门编号
     */
    private String deptCode;
    /**
     * 区域编号
     */
    private Integer areaId;
    /**
     * 服务组织id
     */
    private Integer serviceOrgId;
    /**
     *
     */
    private String serviceOrgIds;
    /**
     * 社区编号
     */
    private Integer communityId;
    /**
     * 享受保障待遇(状态1乘公交免费、2免费接种、3护理补贴)
     */
    private Integer ensureTreaDictId;
    /**
     * 社保卡号
     */
    private Integer socialCardCode;
    /**
     * 养老方式(状态1退休金养老、2以房养老、3理财养老、4养老补贴、5失地农民、6怃恤金）
     */
    private Integer liveTypeDictId;
    /**
     * 是否开通定位(是或否)
     */
    private String isLocation;
    /**
     * 优待证编号
     */
    private String serialNumber;
    /**
     * 文化程度(状态1文盲、2小学、3初中、4高中和中专、5大专、6本科及以上、0其他)
     */
    private Integer educationDictId;
    /**
     * 常住时间（状态1半年以下、2常住）
     */
    private Integer liveYearDictId;
    /**
     * 1.城市三无/农村五保
     * 2.低保/低保边缘
     * 3.经济困难的失能/半失能老人
     * 4.70周岁及以上的计生特扶老人
     * 5.百岁老人
     * 6.空巢
     * 7.独居
     */
    private String elderTypeDictIds;
    /**
     * 邮编
     */
    private Integer zipCode;
    /**
     * 原职业（状态242教师、243军人、244公务员、245事业职工、246企业职工、247农民、248商人、249无业）
     */
    private Integer jobDictId;
    /**
     * 来源
     */
    private Integer incomeSource;
    /**
     * 子女情况（状态:270有子女、271未生育子女、272失去独生子女）
     */
    private Integer childrenDictId;
    /**
     * 医疗类别（状态：274公费、275职工医保、276居民医保、277新农合、278自费）
     */
    private Integer medicalType;
    /**
     * 生活状况（状态 280独居、511空巢、284合居）
     */
    private Integer residenceDictId;
    /**
     * 备注
     */
    private String residenceRemark;
    /**
     * 原照料情况1(状态：316配偶照顾、317子女照顾、318自购家政服务、319送餐服务、320自我照顾、530其他)
     */
    private Integer careCondition1;
    /**
     * 原照料情况2(状态：322政府买单居家养老服务、323居家照料、324安康能通、325居家保险、326互助门铃)
     */
    private Integer careCondition2;
    /**
     * 服务需求(状态：410日托、411家政服务、412康复保健、413紧急呼叫、414助餐送餐、415心理关爱、416法律援助、417文化娱乐、418福利机构)
     */
    private String serviceNeed;
    /**
     * 其他慢性病(状态:328恶性肿瘤、329尿毒症透析、330器官移植（含手术后的抗拓j异治疗）、331白血病)
     */
    private String otherSlow;
    /**
     * 肢体残疾（状态：352一级、353二级、354三级、355四级）
     */
    private Integer bodyDictId;
    /**
     * 智力残疾（状态：362一级、363二级、364三级、365四级）
     */
    private Integer inteDisabled;
    /**
     * 听力残疾（状态：372一级、373二级、374三级、375四级）
     */
    private Integer listenDictId;
    /**
     * 多重残疾（状态：382一级、383二级、384三级、385四级）
     */
    private Integer manyDictId;
    /**
     * 精神残疾（状态：357一级、358二级、359三级、360四级）
     */
    private Integer spiritDictId;
    /**
     * 言语残疾（状态：367一级、368二级、369三级、370四级）
     */
    private Integer speakDictId;
    /**
     * 视力残疾（状态：377一级、378二级、379三级、380四级）
     */
    private Integer visionDictId;
    /**
     * 社会活动情况（状态：387经常、388偶尔、389从不）
     */
    private Integer socialActiDictId;
    /**
     * 特长
     */
    private String specialAbility;
    /**
     * 退休类别（状态：500离休、501退休、502城镇居民）
     */
    private Integer retiredType;
    /**
     * 老年疾病
     */
    private String elderDisease;
    /**
     * 特殊对象(状态：522颈椎病、523腰椎病、524双膝关节退变、525关节置换术后、526关节炎、527骨折后)
     */
    private Integer specialDictIds;
    /**
     * 其他
     */
    private String otherSlowplus;
    /**
     * 住房性质（状态1有产权、2无产权）
     */
    private Integer houseTypeDictId;
    /**
     * 居室（状态：287一居、288二居、289三居、290其他）
     */
    private Integer roomTypeDictId;
    /**
     * 出入无障碍设施(状态：301有、302无)
     */
    private Integer livingCondition1;
    /**
     * 室内无障碍设施（状态：304有、305无）
     */
    private Integer livingCondition2;
    /**
     * 室内厕所(状态：307有、308无)
     */
    private Integer livingCondition3;
    /**
     * 室内洗浴设施(状态：310有、311无)
     */
    private Integer livingCondition4;
    /**
     * 居住安全风险(状态：313有、314无)
     */
    private Integer livingCondition5;
    /**
     * 表单状态1有效，0无效
     */
    private Integer status;
    /**
     * 删除
     */
    private String deleted;
    /**
     * 创建人工号
     */
    private Integer createUserId;
    /**
     * 组织Id
     */
    private Integer createOrgId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * objid
     */
    private Integer objid;
    /**
     * 是否是80岁
     */
    private String isImport80;
    /**
     * 是否死亡(状态：1正常 0去世)
     */
    private Integer isDeath;
    /**
     * 所属区域
     */
    private String areaName;
    private String communityName;
    private String deptName;
    /**
     * 更新用户id
     */
    private Integer updateUserId;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 心理状况(状态：1正常、2偶尔有孤独感、3经常觉得孤独)
     */
    private Integer psychologicDictId;
    /**
     * 社会活动类型（状态：1文艺类、2教育类、3健身类、4慈善类、5经济类、6宗教类、7其他）
     */
    private Integer saTypeDictIds;
    /**
     * 楼层电梯(状态：1有、2无)
     */
    private Integer hasElevator;
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
    private Integer startAge;
    private Integer endAge;
    private Integer resultScore;
    private Integer resultDictId;
    private String familyDate;
    private String tid;
    private String workerName1;
    private String workerName2;
    private String Region1;
    private String Region2;
    private String Region3;
    private String serviceNeedCheckbox;
    private String elderTypeDictIdsCheckbox;
    /**
     * 老人二维码
     */
    private String qrCoder;
    /**
     * 死亡时间
     */
    private Date deathTime;
    /**
     * 火化时间
     */
    private Date cremationTime;
    private List<Integer> elderTypeList;
    private List<Integer> serviceNeedList;
    /**
     * 血型（0：o型 1：A型 2：B 3：AB 4：其他）
     */
    private Integer bloodType;
    /**
     * 是否是独身子女家庭 0：否 1：是
     */
    private Integer isOneChild;
    /**
     * 户籍性质 ：0:城市 1：农村
     */
    private Integer houseNature;
    /**
     * 台湾民主自治同盟盟员
     * 政治面貌0：
     * 中国共产党党员
     * 1
     * 中国共产党预备党员
     * 2
     * 中国国民党国民委员会会员
     * 3
     * 中国民主同盟盟员
     * 4
     * 中国民主建国会会员
     * 5
     * 中国民主促进会会员
     * 6
     * 中国农工民主党党员
     * 7
     * 中国致公党党员
     * 8
     * 九三学社社员
     * 9
     * 台湾民主自治同盟盟员
     *
     *
     * 10无党派民主人士
     *
     *
     * 11群众
     *
     *
     * 12其他
     *
     *
     *
     */
    private Integer politics;
    /**
     * 健康状况 0：健康 1：患有疾病
     *
     */
    private Integer healthStatus;
    /**
     *  药物过敏史
     *
     */
    private String drugAllergy;
    /**
     *  生活自理能力 0：失能，1：半失能 2：自理
     *
     */
    private Integer selfcareAbility;
    /**
     * 助老卡申请标志
     */
    private String helpCardApplyFlag;
    /**
     * 区域排序
     */
    private Integer areaOrder;
    /**
     * 火化单位
     */
    private String cremationUnit;
    /**
     * 能力评估
     */
    private String abilityAssess;
    /**
     * 助老卡卡号
     */
    private String helpCardNo;
    private String funeralmode;
    private Integer page_num;
    private Integer page_size;

    private Date checkInTime;

    private String bedNumber;

    private Integer disableStutiation;

    private String linkName;

    private String linkTel;

    public Integer getDisableStutiation() {
        return disableStutiation;
    }

    public void setDisableStutiation(Integer disableStutiation) {
        this.disableStutiation = disableStutiation;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkTel() {
        return linkTel;
    }

    public void setLinkTel(String linkTel) {
        this.linkTel = linkTel;
    }

    public Date getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(Date checkInTime) {
        this.checkInTime = checkInTime;
    }



    public String getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber) {
        this.bedNumber = bedNumber;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getPage_num() {
        return page_num;
    }

    public void setPage_num(Integer page_num) {
        this.page_num = page_num;
    }

    public Integer getPage_size() {
        return page_size;
    }

    public void setPage_size(Integer page_size) {
        this.page_size = page_size;
    }

    public Integer getPage_ye() {
        return page_ye;
    }

    public void setPage_ye(Integer page_ye) {
        this.page_ye = page_ye;
    }

    private Integer page_ye;

    public ElderlyMsg() {
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getWorkerName1() {
        return workerName1;
    }

    public void setWorkerName1(String workerName1) {
        this.workerName1 = workerName1;
    }

    public String getWorkerName2() {
        return workerName2;
    }

    public void setWorkerName2(String workerName2) {
        this.workerName2 = workerName2;
    }

    public Integer getPsychologicDictId() {
        return psychologicDictId;
    }

    public void setPsychologicDictId(Integer psychologicDictId) {
        this.psychologicDictId = psychologicDictId;
    }

    public Integer getSaTypeDictIds() {
        return saTypeDictIds;
    }

    public void setSaTypeDictIds(Integer saTypeDictIds) {
        this.saTypeDictIds = saTypeDictIds;
    }

    public Integer getHasElevator() {
        return hasElevator;
    }

    public void setHasElevator(Integer hasElevator) {
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

    public String getRegion1() {
        return Region1;
    }

    public void setRegion1(String region1) {
        Region1 = region1;
    }

    public String getRegion2() {
        return Region2;
    }

    public void setRegion2(String region2) {
        Region2 = region2;
    }

    public String getRegion3() {
        return Region3;
    }

    public void setRegion3(String region3) {
        Region3 = region3;
    }

    public String getServiceNeedCheckbox() {
        return serviceNeedCheckbox;
    }

    public void setServiceNeedCheckbox(String serviceNeedCheckbox) {
        this.serviceNeedCheckbox = serviceNeedCheckbox;
    }

    public String getElderTypeDictIdsCheckbox() {
        return elderTypeDictIdsCheckbox;
    }

    public void setElderTypeDictIdsCheckbox(String elderTypeDictIdsCheckbox) {
        this.elderTypeDictIdsCheckbox = elderTypeDictIdsCheckbox;
    }

    public String getFamilyDate() {
        return familyDate;
    }

    public void setFamilyDate(String familyDate) {
        this.familyDate = familyDate;
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

    public Integer getStartAge() {
        return startAge;
    }

    public void setStartAge(Integer startAge) {
        this.startAge = startAge;
    }

    public Integer getEndAge() {
        return endAge;
    }

    public void setEndAge(Integer endAge) {
        this.endAge = endAge;
    }

    public Integer getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(Integer updateUserId) {
        this.updateUserId = updateUserId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getNationDictId() {
        return nationDictId;
    }

    public void setNationDictId(Integer nationDictId) {
        this.nationDictId = nationDictId;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
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

    public String getRegPlace() {
        return regPlace;
    }

    public void setRegPlace(String regPlace) {
        this.regPlace = regPlace;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public Integer getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(Integer maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }

    public Integer getEnsureTreaDictId() {
        return ensureTreaDictId;
    }

    public void setEnsureTreaDictId(Integer ensureTreaDictId) {
        this.ensureTreaDictId = ensureTreaDictId;
    }

    public Integer getSocialCardCode() {
        return socialCardCode;
    }

    public void setSocialCardCode(Integer socialCardCode) {
        this.socialCardCode = socialCardCode;
    }

    public Integer getLiveTypeDictId() {
        return liveTypeDictId;
    }

    public void setLiveTypeDictId(Integer liveTypeDictId) {
        this.liveTypeDictId = liveTypeDictId;
    }

    public String getIsLocation() {
        return isLocation;
    }

    public void setIsLocation(String isLocation) {
        this.isLocation = isLocation;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Integer getEducationDictId() {
        return educationDictId;
    }

    public void setEducationDictId(Integer educationDictId) {
        this.educationDictId = educationDictId;
    }

    public Integer getLiveYearDictId() {
        return liveYearDictId;
    }

    public void setLiveYearDictId(Integer liveYearDictId) {
        this.liveYearDictId = liveYearDictId;
    }

    public String getElderTypeDictIds() {
        return elderTypeDictIds;
    }

    public void setElderTypeDictIds(String elderTypeDictIds) {
        this.elderTypeDictIds = elderTypeDictIds;
    }

    public Integer getZipCode() {
        return zipCode;
    }

    public void setZipCode(Integer zipCode) {
        this.zipCode = zipCode;
    }

    public Integer getJobDictId() {
        return jobDictId;
    }

    public void setJobDictId(Integer jobDictId) {
        this.jobDictId = jobDictId;
    }

    public Integer getIncomeSource() {
        return incomeSource;
    }

    public void setIncomeSource(Integer incomeSource) {
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

    public String getResidenceRemark() {
        return residenceRemark;
    }

    public void setResidenceRemark(String residenceRemark) {
        this.residenceRemark = residenceRemark;
    }

    public Integer getCareCondition1() {
        return careCondition1;
    }

    public void setCareCondition1(Integer careCondition1) {
        this.careCondition1 = careCondition1;
    }

    public Integer getCareCondition2() {
        return careCondition2;
    }

    public void setCareCondition2(Integer careCondition2) {
        this.careCondition2 = careCondition2;
    }

    public String getServiceNeed() {
        return serviceNeed;
    }

    public void setServiceNeed(String serviceNeed) {
        this.serviceNeed = serviceNeed;
    }

    public String getOtherSlow() {
        return otherSlow;
    }

    public void setOtherSlow(String otherSlow) {
        this.otherSlow = otherSlow;
    }

    public Integer getBodyDictId() {
        return bodyDictId;
    }

    public void setBodyDictId(Integer bodyDictId) {
        this.bodyDictId = bodyDictId;
    }

    public Integer getInteDisabled() {
        return inteDisabled;
    }

    public void setInteDisabled(Integer inteDisabled) {
        this.inteDisabled = inteDisabled;
    }

    public Integer getListenDictId() {
        return listenDictId;
    }

    public void setListenDictId(Integer listenDictId) {
        this.listenDictId = listenDictId;
    }

    public Integer getManyDictId() {
        return manyDictId;
    }

    public void setManyDictId(Integer manyDictId) {
        this.manyDictId = manyDictId;
    }

    public Integer getSpiritDictId() {
        return spiritDictId;
    }

    public void setSpiritDictId(Integer spiritDictId) {
        this.spiritDictId = spiritDictId;
    }

    public Integer getSpeakDictId() {
        return speakDictId;
    }

    public void setSpeakDictId(Integer speakDictId) {
        this.speakDictId = speakDictId;
    }

    public Integer getVisionDictId() {
        return visionDictId;
    }

    public void setVisionDictId(Integer visionDictId) {
        this.visionDictId = visionDictId;
    }

    public Integer getSocialActiDictId() {
        return socialActiDictId;
    }

    public void setSocialActiDictId(Integer socialActiDictId) {
        this.socialActiDictId = socialActiDictId;
    }

    public String getSpecialAbility() {
        return specialAbility;
    }

    public void setSpecialAbility(String specialAbility) {
        this.specialAbility = specialAbility;
    }

    public Integer getRetiredType() {
        return retiredType;
    }

    public void setRetiredType(Integer retiredType) {
        this.retiredType = retiredType;
    }

    public String getElderDisease() {
        return elderDisease;
    }

    public void setElderDisease(String elderDisease) {
        this.elderDisease = elderDisease;
    }

    public Integer getSpecialDictIds() {
        return specialDictIds;
    }

    public void setSpecialDictIds(Integer specialDictIds) {
        this.specialDictIds = specialDictIds;
    }

    public String getOtherSlowplus() {
        return otherSlowplus;
    }

    public void setOtherSlowplus(String otherSlowplus) {
        this.otherSlowplus = otherSlowplus;
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

    public Integer getLivingCondition1() {
        return livingCondition1;
    }

    public void setLivingCondition1(Integer livingCondition1) {
        this.livingCondition1 = livingCondition1;
    }

    public Integer getLivingCondition2() {
        return livingCondition2;
    }

    public void setLivingCondition2(Integer livingCondition2) {
        this.livingCondition2 = livingCondition2;
    }

    public Integer getLivingCondition3() {
        return livingCondition3;
    }

    public void setLivingCondition3(Integer livingCondition3) {
        this.livingCondition3 = livingCondition3;
    }

    public Integer getLivingCondition4() {
        return livingCondition4;
    }

    public void setLivingCondition4(Integer livingCondition4) {
        this.livingCondition4 = livingCondition4;
    }

    public Integer getLivingCondition5() {
        return livingCondition5;
    }

    public void setLivingCondition5(Integer livingCondition5) {
        this.livingCondition5 = livingCondition5;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Integer getCreateOrgId() {
        return createOrgId;
    }

    public void setCreateOrgId(Integer createOrgId) {
        this.createOrgId = createOrgId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getObjid() {
        return objid;
    }

    public void setObjid(Integer objid) {
        this.objid = objid;
    }

    public String getIsImport80() {
        return isImport80;
    }

    public void setIsImport80(String isImport80) {
        this.isImport80 = isImport80;
    }

    public Integer getIsDeath() {
        return isDeath;
    }

    public void setIsDeath(Integer isDeath) {
        this.isDeath = isDeath;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getCommunityName() {
        return communityName;
    }

    public void setCommunityName(String communityName) {
        this.communityName = communityName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getQrCoder() {
        return qrCoder;
    }

    public void setQrCoder(String qrCoder) {
        this.qrCoder = qrCoder;
    }

    public Date getDeathTime() {
        return deathTime;
    }

    public void setDeathTime(Date deathTime) {
        this.deathTime = deathTime;
    }

    public Date getCremationTime() {
        return cremationTime;
    }

    public void setCremationTime(Date cremationTime) {
        this.cremationTime = cremationTime;
    }

    public List<Integer> getElderTypeList() {
        return elderTypeList;
    }

    public void setElderTypeList(List<Integer> elderTypeList) {
        this.elderTypeList = elderTypeList;
    }

    public List<Integer> getServiceNeedList() {
        return serviceNeedList;
    }

    public void setServiceNeedList(List<Integer> serviceNeedList) {
        this.serviceNeedList = serviceNeedList;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Integer getBloodType() {
        return bloodType;
    }

    public void setBloodType(Integer bloodType) {
        this.bloodType = bloodType;
    }

    public Integer getIsOneChild() {
        return isOneChild;
    }

    public void setIsOneChild(Integer isOneChild) {
        this.isOneChild = isOneChild;
    }

    public Integer getHouseNature() {
        return houseNature;
    }

    public void setHouseNature(Integer houseNature) {
        this.houseNature = houseNature;
    }

    public Integer getPolitics() {
        return politics;
    }

    public void setPolitics(Integer politics) {
        this.politics = politics;
    }

    public Integer getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(Integer healthStatus) {
        this.healthStatus = healthStatus;
    }

    public String getDrugAllergy() {
        return drugAllergy;
    }

    public void setDrugAllergy(String drugAllergy) {
        this.drugAllergy = drugAllergy;
    }

    public Integer getSelfcareAbility() {
        return selfcareAbility;
    }

    public void setSelfcareAbility(Integer selfcareAbility) {
        this.selfcareAbility = selfcareAbility;
    }

    public String getServiceOrgIds() {
        return serviceOrgIds;
    }

    public void setServiceOrgIds(String serviceOrgIds) {
        this.serviceOrgIds = serviceOrgIds;
    }

    public String getHelpCardApplyFlag() {
        return helpCardApplyFlag;
    }

    public void setHelpCardApplyFlag(String helpCardApplyFlag) {
        this.helpCardApplyFlag = helpCardApplyFlag;
    }

    public void setAreaOrder(Integer areaOrder) {
        this.areaOrder = areaOrder;
    }

    public Integer getAreaOrder() {
        return areaOrder;
    }

    public String getCremationUnit() {
        return cremationUnit;
    }

    public void setCremationUnit(String cremationUnit) {
        this.cremationUnit = cremationUnit;
    }

    public String getAbilityAssess() {
        return abilityAssess;
    }

    public void setAbilityAssess(String abilityAssess) {
        this.abilityAssess = abilityAssess;
    }

    public String getHelpCardNo() {
        return helpCardNo;
    }

    public void setHelpCardNo(String helpCardNo) {
        this.helpCardNo = helpCardNo;
    }

    public String getFuneralmode() {
        return funeralmode;
    }

    public void setFuneralmode(String funeralmode) {
        this.funeralmode = funeralmode;
    }
}