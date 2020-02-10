package com.fedtech.pension.org.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrg implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String logoUrl;

    private Integer areaId;

    private String areaName;

    private String institutionName;

    private Integer type;

    private String applyIdcardNo;

    /**
     * 建设类型：1.建设中、2.待运营(已确定运营)、3.运营中、4.停止运营
     */
    private Integer buildType;

    private String institutionTypeDictId;

    private Integer cityOrTown;

    private Integer gradeDictId;

    private String orgCode;

    private Integer regTypeDictId;

    private Double regCapital;

    private String legalRepresentatives;

    private String linkMan;

    private String phone;

    private String mobile;

    private String settlementBank;

    private String settlementBankNo;

    private String address;

    private String zipcode;
    /**
     * 单位性质 1民非法人2事业法人3工商法人4未登记
     */
    private Integer instProp;

    private Integer bedCount;

    private Integer bedEmptyCount;

    private Double bedMoney;

    private Integer bedNurseCount;

    private Integer bedNurseEmptyCount;

    private Double bedNurseMoney;

    private Integer bedCareCount;

    private Integer bedCareEmptyCount;

    private Double bedCareMoney;
    /**
     * （房屋性质1.自有产权2.租赁3.其他）用房属性  1-街道 2-租赁 3-公益
     */
    private Integer roomProp;

    private Double landArea;

    private Double totalInvestment;

    private Double fixedCapital;

    private String serviceProject;

    private String serviceProjectName;

    private Integer serviceArea;

    private String serviceInfo;

    private String applyName;

    private String applyEmail;

    private String deleted;

    private Date createTime;

    private Date deleteTime;

    private Integer levelTextDictId;

    private Integer level;

    private Integer status;

    private String attach;

    private String inBusinessLicenseCode;

    private String inTaxCode;

    private Integer inServiceTimeAm;

    private Integer inServiceTimePm;

    private String inClassic;

    private String inType;

    private String volunteerCount;

    private String postcode;

    private Integer inServiceRangeId;

    private String inServiceRangeName;

    private Integer areaOrder;

    private Double feedbackRate;

    private String alipayCount;

    private String wxpayCount;

    private String cardSystemName;

    private String socialForce;

    private Integer nurseCenterLevel;

    private Integer serviceCount;

    private String nurseServiceCover;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regtime;

    private String streetErr;

    private String countryErr;

    //code
    private  String  zfbCodeUrl;

    private  Integer zfbInUserId;

    private  String  wxCodeUrl;

    private  Integer  wxInUserId;

    private  Double  serverLat;
    private  Double  serverLng;

    //服务半径
    private Double fuwuRadius;

    //信息完整度
    private Double infoIntegrity;

    //条件查询开始 结束输入的数值
    private Double startInfoity;

    private Double endInfoity;

    //服务范围备注
    private String fuwuRangeRemark;

    //居家护理床位个数
    private Integer homeNurseBedCount;

    //是否有养老许可证
    private Integer isPensionPermit;

    //是否有食品安全许可证
    private Integer isFoodSafePermit;

    //------------
    //是否医疗许可证
    private Integer isMedicalPermit;

    //是否具有专业知识
    private Integer isProfessionalKnowledge;

    //是否岗前培训
    private Integer isPerJobTraining;

    //服务人员是否取得健康证
    private Integer isHealthCertificate;

    //是否岗位相适应的专业资格证书或执业证书
    private Integer isPracticeCertificate;

    //是否签署入住合同
    private Integer isSingInContract;

    //是否建立老人健康生活档案
    private Integer isElderlyHealthRecode;

    //是否对入住老人定期评估
    private Integer isRegularAssessment;

    //是否签订外包合同
    private Integer isOutsourcingContract;

    //是否具有消防许可证
    private String isFireLicense;

    //设计床位数
    private String designBedCount;

    /**组织余额*/
    private Double serviceMoney;

    /**视频资源数*/
    private Integer videoMonitors;


    private Integer videoStatus;

    /**（工商登记号）《民办非企业单位登记证书》或《营业执照》编号*/
    private String businessLicenseNo;

    /**房产来源*/
    private String sOfRealEstate;

    /**入住老人数（个）*/
    private String elderNum;

    /**工作人员（人）*/
    private String workNum;

    /**其中护理人员（人）*/
    private String nursingNum;

    /**起始运营时间（开办时间）*/
    private String beginTime;
    /**
     * 机构名称（英文）
     */
    private String institutionNameEnglish;
    /**
     * 机构部门设置
     */
    private String organizationDepartmentsSet;
    /**
     * 一次性投资总额
     */
    private String grossAssets;
    /**
     * 法人资格证书号
     */
    private String corporateQualificationCertificateNum;
    /**
     *兴办主体
     */
    private Integer initiateSubject;
    /**
     * 税务登记号
     */
    private String taxRegistrationNum;
    /**
     * 养老机构类别1.公办养老机构2.民办养老机构3.公建民营机构4.农村敬老院5.农村中心敬老院
     */
    private String institutionsCategory;
    /**
     *运营方式1.公办公营2.公办民营3.民办民营
     */
    private Integer runWay;
    /**
     *医疗服务方式1.内设医务室2.与医疗机构合作3.未开展4.其他
     */
    private Integer medicalServiceMode;
    /**
     *是否具备医保定点资格1.否2.是
     */
    private Integer whetherHealthCareQualification;
    /**
     *是否接收异地老年人1.否2.是
     */
    private Integer whetherToAcceptRemoteElderly;
    /**
     *传真
     */
    private String fax;
    /**
     *电子邮箱
     */
    private String electronicMailbox;
    /**
     *网址
     */
    private String website;
    /**
     *租赁开始时间
     */
    private String leaseCommencementTime;
    /**
     *租赁结束时间
     */
    private String leaseEndTime;
    /**
     * 服务对象类型1.自理老年人 2.半自理老年人 3.完全不能自理老年人4智障老年人
     */
    private String sign;

    /**星级（1.一星级 2.二星级 3.三星级 4.四星级 5.五星级）*/
    private Integer starClass;

    public Integer getBuildType() {
        return buildType;
    }

    public void setBuildType(Integer buildType) {
        this.buildType = buildType;
    }

    public Integer getStarClass() {
        return starClass;
    }

    public void setStarClass(Integer starClass) {
        this.starClass = starClass;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getLeaseCommencementTime() {
        return leaseCommencementTime;
    }

    public void setLeaseCommencementTime(String leaseCommencementTime) {
        this.leaseCommencementTime = leaseCommencementTime;
    }

    public String getLeaseEndTime() {
        return leaseEndTime;
    }

    public void setLeaseEndTime(String leaseEndTime) {
        this.leaseEndTime = leaseEndTime;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getElectronicMailbox() {
        return electronicMailbox;
    }

    public void setElectronicMailbox(String electronicMailbox) {
        this.electronicMailbox = electronicMailbox;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Integer getRunWay() {
        return runWay;
    }

    public void setRunWay(Integer runWay) {
        this.runWay = runWay;
    }

    public Integer getMedicalServiceMode() {
        return medicalServiceMode;
    }

    public void setMedicalServiceMode(Integer medicalServiceMode) {
        this.medicalServiceMode = medicalServiceMode;
    }

    public Integer getWhetherHealthCareQualification() {
        return whetherHealthCareQualification;
    }

    public void setWhetherHealthCareQualification(Integer whetherHealthCareQualification) {
        this.whetherHealthCareQualification = whetherHealthCareQualification;
    }

    public Integer getWhetherToAcceptRemoteElderly() {
        return whetherToAcceptRemoteElderly;
    }

    public void setWhetherToAcceptRemoteElderly(Integer whetherToAcceptRemoteElderly) {
        this.whetherToAcceptRemoteElderly = whetherToAcceptRemoteElderly;
    }

    public String getInstitutionsCategory() {
        return institutionsCategory;
    }

    public void setInstitutionsCategory(String institutionsCategory) {
        this.institutionsCategory = institutionsCategory;
    }

    public String getTaxRegistrationNum() {

        return taxRegistrationNum;
    }

    public void setTaxRegistrationNum(String taxRegistrationNum) {
        this.taxRegistrationNum = taxRegistrationNum;
    }

    public String getApplyIdcardNo() {
        return applyIdcardNo;
    }

    public void setApplyIdcardNo(String applyIdcardNo) {
        this.applyIdcardNo = applyIdcardNo;
    }

    public Integer getInitiateSubject() {
        return initiateSubject;
    }

    public void setInitiateSubject(Integer initiateSubject) {
        this.initiateSubject = initiateSubject;
    }

    public String getInstitutionNameEnglish() {
        return institutionNameEnglish;
    }

    public String getOrganizationDepartmentsSet() {
        return organizationDepartmentsSet;
    }

    public String getGrossAssets() {
        return grossAssets;
    }

    public void setGrossAssets(String grossAssets) {
        this.grossAssets = grossAssets;
    }

    public void setOrganizationDepartmentsSet(String organizationDepartmentsSet) {
        this.organizationDepartmentsSet = organizationDepartmentsSet;
    }

    public void setInstitutionNameEnglish(String institutionNameEnglish) {
        this.institutionNameEnglish = institutionNameEnglish;
    }

    public String getCorporateQualificationCertificateNum() {
        return corporateQualificationCertificateNum;
    }

    public void setCorporateQualificationCertificateNum(String corporateQualificationCertificateNum) {
        this.corporateQualificationCertificateNum = corporateQualificationCertificateNum;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getBusinessLicenseNo() {
        return businessLicenseNo;
    }

    public void setBusinessLicenseNo(String businessLicenseNo) {
        this.businessLicenseNo = businessLicenseNo;
    }

    public String getsOfRealEstate() {
        return sOfRealEstate;
    }

    public void setsOfRealEstate(String sOfRealEstate) {
        this.sOfRealEstate = sOfRealEstate;
    }

    public String getElderNum() {
        return elderNum;
    }

    public void setElderNum(String elderNum) {
        this.elderNum = elderNum;
    }

    public String getWorkNum() {
        return workNum;
    }

    public void setWorkNum(String workNum) {
        this.workNum = workNum;
    }

    public String getNursingNum() {
        return nursingNum;
    }

    public void setNursingNum(String nursingNum) {
        this.nursingNum = nursingNum;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public ServiceOrg() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
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

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getInstitutionTypeDictId() {
        return institutionTypeDictId;
    }

    public void setInstitutionTypeDictId(String institutionTypeDictId) {
        this.institutionTypeDictId = institutionTypeDictId;
    }

    public Integer getCityOrTown() {
        return cityOrTown;
    }

    public void setCityOrTown(Integer cityOrTown) {
        this.cityOrTown = cityOrTown;
    }

    public Integer getGradeDictId() {
        return gradeDictId;
    }

    public void setGradeDictId(Integer gradeDictId) {
        this.gradeDictId = gradeDictId;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public Integer getRegTypeDictId() {
        return regTypeDictId;
    }

    public void setRegTypeDictId(Integer regTypeDictId) {
        this.regTypeDictId = regTypeDictId;
    }

    public Double getRegCapital() {
        return regCapital;
    }

    public void setRegCapital(Double regCapital) {
        this.regCapital = regCapital;
    }

    public String getLegalRepresentatives() {
        return legalRepresentatives;
    }

    public void setLegalRepresentatives(String legalRepresentatives) {
        this.legalRepresentatives = legalRepresentatives;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getSettlementBank() {
        return settlementBank;
    }

    public void setSettlementBank(String settlementBank) {
        this.settlementBank = settlementBank;
    }

    public String getSettlementBankNo() {
        return settlementBankNo;
    }

    public void setSettlementBankNo(String settlementBankNo) {
        this.settlementBankNo = settlementBankNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public Integer getInstProp() {
        return instProp;
    }

    public void setInstProp(Integer instProp) {
        this.instProp = instProp;
    }

    public Integer getBedCount() {
        return bedCount;
    }

    public void setBedCount(Integer bedCount) {
        this.bedCount = bedCount;
    }

    public Integer getBedEmptyCount() {
        return bedEmptyCount;
    }

    public void setBedEmptyCount(Integer bedEmptyCount) {
        this.bedEmptyCount = bedEmptyCount;
    }

    public Double getBedMoney() {
        return bedMoney;
    }

    public void setBedMoney(Double bedMoney) {
        this.bedMoney = bedMoney;
    }

    public Integer getBedNurseCount() {
        return bedNurseCount;
    }

    public void setBedNurseCount(Integer bedNurseCount) {
        this.bedNurseCount = bedNurseCount;
    }

    public Integer getBedNurseEmptyCount() {
        return bedNurseEmptyCount;
    }

    public void setBedNurseEmptyCount(Integer bedNurseEmptyCount) {
        this.bedNurseEmptyCount = bedNurseEmptyCount;
    }

    public Double getBedNurseMoney() {
        return bedNurseMoney;
    }

    public void setBedNurseMoney(Double bedNurseMoney) {
        this.bedNurseMoney = bedNurseMoney;
    }

    public Integer getBedCareCount() {
        return bedCareCount;
    }

    public void setBedCareCount(Integer bedCareCount) {
        this.bedCareCount = bedCareCount;
    }

    public Integer getBedCareEmptyCount() {
        return bedCareEmptyCount;
    }

    public void setBedCareEmptyCount(Integer bedCareEmptyCount) {
        this.bedCareEmptyCount = bedCareEmptyCount;
    }

    public Double getBedCareMoney() {
        return bedCareMoney;
    }

    public void setBedCareMoney(Double bedCareMoney) {
        this.bedCareMoney = bedCareMoney;
    }

    public Integer getRoomProp() {
        return roomProp;
    }

    public void setRoomProp(Integer roomProp) {
        this.roomProp = roomProp;
    }

    public Double getLandArea() {
        return landArea;
    }

    public void setLandArea(Double landArea) {
        this.landArea = landArea;
    }

    public Double getTotalInvestment() {
        return totalInvestment;
    }

    public void setTotalInvestment(Double totalInvestment) {
        this.totalInvestment = totalInvestment;
    }

    public Double getFixedCapital() {
        return fixedCapital;
    }

    public void setFixedCapital(Double fixedCapital) {
        this.fixedCapital = fixedCapital;
    }

    public String getServiceProject() {
        return serviceProject;
    }

    public void setServiceProject(String serviceProject) {
        this.serviceProject = serviceProject;
    }

    public String getServiceProjectName() {
        return serviceProjectName;
    }

    public void setServiceProjectName(String serviceProjectName) {
        this.serviceProjectName = serviceProjectName;
    }

    public Integer getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(Integer serviceArea) {
        this.serviceArea = serviceArea;
    }

    public String getServiceInfo() {
        return serviceInfo;
    }

    public void setServiceInfo(String serviceInfo) {
        this.serviceInfo = serviceInfo;
    }

    public String getApplyName() {
        return applyName;
    }

    public void setApplyName(String applyName) {
        this.applyName = applyName;
    }

    public String getApplyEmail() {
        return applyEmail;
    }

    public void setApplyEmail(String applyEmail) {
        this.applyEmail = applyEmail;
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public Integer getLevelTextDictId() {
        return levelTextDictId;
    }

    public void setLevelTextDictId(Integer levelTextDictId) {
        this.levelTextDictId = levelTextDictId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getInBusinessLicenseCode() {
        return inBusinessLicenseCode;
    }

    public void setInBusinessLicenseCode(String inBusinessLicenseCode) {
        this.inBusinessLicenseCode = inBusinessLicenseCode;
    }

    public String getInTaxCode() {
        return inTaxCode;
    }

    public void setInTaxCode(String inTaxCode) {
        this.inTaxCode = inTaxCode;
    }

    public Integer getInServiceTimeAm() {
        return inServiceTimeAm;
    }

    public void setInServiceTimeAm(Integer inServiceTimeAm) {
        this.inServiceTimeAm = inServiceTimeAm;
    }

    public Integer getInServiceTimePm() {
        return inServiceTimePm;
    }

    public void setInServiceTimePm(Integer inServiceTimePm) {
        this.inServiceTimePm = inServiceTimePm;
    }

    public String getInClassic() {
        return inClassic;
    }

    public void setInClassic(String inClassic) {
        this.inClassic = inClassic;
    }

    public String getInType() {
        return inType;
    }

    public void setInType(String inType) {
        this.inType = inType;
    }

    public String getVolunteerCount() {
        return volunteerCount;
    }

    public void setVolunteerCount(String volunteerCount) {
        this.volunteerCount = volunteerCount;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public Integer getInServiceRangeId() {
        return inServiceRangeId;
    }

    public void setInServiceRangeId(Integer inServiceRangeId) {
        this.inServiceRangeId = inServiceRangeId;
    }

    public String getInServiceRangeName() {
        return inServiceRangeName;
    }

    public void setInServiceRangeName(String inServiceRangeName) {
        this.inServiceRangeName = inServiceRangeName;
    }

    public Integer getAreaOrder() {
        return areaOrder;
    }

    public void setAreaOrder(Integer areaOrder) {
        this.areaOrder = areaOrder;
    }

    public Double getFeedbackRate() {
        return feedbackRate;
    }

    public void setFeedbackRate(Double feedbackRate) {
        this.feedbackRate = feedbackRate;
    }

    public String getAlipayCount() {
        return alipayCount;
    }

    public void setAlipayCount(String alipayCount) {
        this.alipayCount = alipayCount;
    }

    public String getWxpayCount() {
        return wxpayCount;
    }

    public void setWxpayCount(String wxpayCount) {
        this.wxpayCount = wxpayCount;
    }

    public String getCardSystemName() {
        return cardSystemName;
    }

    public void setCardSystemName(String cardSystemName) {
        this.cardSystemName = cardSystemName;
    }

    public String getSocialForce() {
        return socialForce;
    }

    public void setSocialForce(String socialForce) {
        this.socialForce = socialForce;
    }

    public Integer getNurseCenterLevel() {
        return nurseCenterLevel;
    }

    public void setNurseCenterLevel(Integer nurseCenterLevel) {
        this.nurseCenterLevel = nurseCenterLevel;
    }

    public Integer getServiceCount() {
        return serviceCount;
    }

    public void setServiceCount(Integer serviceCount) {
        this.serviceCount = serviceCount;
    }

    public String getNurseServiceCover() {
        return nurseServiceCover;
    }

    public void setNurseServiceCover(String nurseServiceCover) {
        this.nurseServiceCover = nurseServiceCover;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public String getStreetErr() {
        return streetErr;
    }

    public void setStreetErr(String streetErr) {
        this.streetErr = streetErr;
    }

    public String getCountryErr() {
        return countryErr;
    }

    public void setCountryErr(String countryErr) {
        this.countryErr = countryErr;
    }

    public Double getFuwuRadius() {
        return fuwuRadius;
    }

    public void setFuwuRadius(Double fuwuRadius) {
        this.fuwuRadius = fuwuRadius;
    }

    public Double getInfoIntegrity() {
        return infoIntegrity;
    }

    public void setInfoIntegrity(Double infoIntegrity) {
        this.infoIntegrity = infoIntegrity;
    }

    public Double getStartInfoity() {
        return startInfoity;
    }

    public void setStartInfoity(Double startInfoity) {
        this.startInfoity = startInfoity;
    }

    public Double getEndInfoity() {
        return endInfoity;
    }

    public void setEndInfoity(Double endInfoity) {
        this.endInfoity = endInfoity;
    }

    public String getFuwuRangeRemark() {
        return fuwuRangeRemark;
    }

    public void setFuwuRangeRemark(String fuwuRangeRemark) {
        this.fuwuRangeRemark = fuwuRangeRemark;
    }

    public Integer getHomeNurseBedCount() {
        return homeNurseBedCount;
    }

    public void setHomeNurseBedCount(Integer homeNurseBedCount) {
        this.homeNurseBedCount = homeNurseBedCount;
    }

    public Integer getIsPensionPermit() {
        return isPensionPermit;
    }

    public void setIsPensionPermit(Integer isPensionPermit) {
        this.isPensionPermit = isPensionPermit;
    }

    public Integer getIsFoodSafePermit() {
        return isFoodSafePermit;
    }

    public void setIsFoodSafePermit(Integer isFoodSafePermit) {
        this.isFoodSafePermit = isFoodSafePermit;
    }

    public Integer getIsOutsourcingContract() {
        return isOutsourcingContract;
    }

    public void setIsOutsourcingContract(Integer isOutsourcingContract) {
        this.isOutsourcingContract = isOutsourcingContract;
    }

    public Integer getIsMedicalPermit() {
        return isMedicalPermit;
    }

    public void setIsMedicalPermit(Integer isMedicalPermit) {
        this.isMedicalPermit = isMedicalPermit;
    }

    public Integer getIsProfessionalKnowledge() {
        return isProfessionalKnowledge;
    }

    public void setIsProfessionalKnowledge(Integer isProfessionalKnowledge) {
        this.isProfessionalKnowledge = isProfessionalKnowledge;
    }

    public Integer getIsPerJobTraining() {
        return isPerJobTraining;
    }

    public void setIsPerJobTraining(Integer isPerJobTraining) {
        this.isPerJobTraining = isPerJobTraining;
    }

    public Integer getIsHealthCertificate() {
        return isHealthCertificate;
    }

    public void setIsHealthCertificate(Integer isHealthCertificate) {
        this.isHealthCertificate = isHealthCertificate;
    }

    public Integer getIsPracticeCertificate() {
        return isPracticeCertificate;
    }

    public void setIsPracticeCertificate(Integer isPracticeCertificate) {
        this.isPracticeCertificate = isPracticeCertificate;
    }

    public Integer getIsSingInContract() {
        return isSingInContract;
    }

    public void setIsSingInContract(Integer isSingInContract) {
        this.isSingInContract = isSingInContract;
    }

    public Integer getIsElderlyHealthRecode() {
        return isElderlyHealthRecode;
    }

    public void setIsElderlyHealthRecode(Integer isElderlyHealthRecode) {
        this.isElderlyHealthRecode = isElderlyHealthRecode;
    }

    public Integer getIsRegularAssessment() {
        return isRegularAssessment;
    }

    public void setIsRegularAssessment(Integer isRegularAssessment) {
        this.isRegularAssessment = isRegularAssessment;
    }


    public String getIsFireLicense() {
        return isFireLicense;
    }

    public void setIsFireLicense(String isFireLicense) {
        this.isFireLicense = isFireLicense;
    }

    public String getDesignBedCount() {
        return designBedCount;
    }

    public void setDesignBedCount(String designBedCount) {
        this.designBedCount = designBedCount;
    }

    public Double getServiceMoney() {
        return serviceMoney;
    }

    public void setServiceMoney(Double serviceMoney) {
        this.serviceMoney = serviceMoney;
    }

    public Integer getVideoMonitors() {
        return videoMonitors;
    }

    public void setVideoMonitors(Integer videoMonitors) {
        this.videoMonitors = videoMonitors;
    }

    public String getZfbCodeUrl() {
        return zfbCodeUrl;
    }

    public void setZfbCodeUrl(String zfbCodeUrl) {
        this.zfbCodeUrl = zfbCodeUrl;
    }

    public Integer getZfbInUserId() {
        return zfbInUserId;
    }

    public void setZfbInUserId(Integer zfbInUserId) {
        this.zfbInUserId = zfbInUserId;
    }

    public String getWxCodeUrl() {
        return wxCodeUrl;
    }

    public void setWxCodeUrl(String wxCodeUrl) {
        this.wxCodeUrl = wxCodeUrl;
    }

    public Integer getWxInUserId() {
        return wxInUserId;
    }

    public void setWxInUserId(Integer wxInUserId) {
        this.wxInUserId = wxInUserId;
    }

    public Double getServerLat() {
        return serverLat;
    }

    public void setServerLat(Double serverLat) {
        this.serverLat = serverLat;
    }

    public Double getServerLng() {
        return serverLng;
    }

    public void setServerLng(Double serverLng) {
        this.serverLng = serverLng;
    }


    public Integer getVideoStatus() {
        return videoStatus;
    }

    public void setVideoStatus(Integer videoStatus) {
        this.videoStatus = videoStatus;
    }
}