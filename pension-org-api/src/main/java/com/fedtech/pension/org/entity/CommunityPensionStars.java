package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 *
 * @author guxiangyang
 * @date 2018/8/16
 */
public class CommunityPensionStars implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private Integer serviceOrgId ;

    private Integer userId;

    private Integer pgType;

    public Integer getPgType() {
        return pgType;
    }

    public void setPgType(Integer pgType) {
        this.pgType = pgType;
    }

    /**
     * 申请状态
     */

    private Integer applicationStatus;



    /**
     * 所属区域
     */
    private String area;

    /**
     * 机构名称
     */
    private String organizationNames;

    /**
     * 星级评定
     */
    private String starRating;

    /**
     * 申请时间
     */
    private String applicationTime;

    /**
     * 申请状态
     */


    /**
     * 总评分
     */
    private Integer totalScore;

    /**
     * 年内无责任事故
     */
    private String safetyScore1;

    /**
     * （1）周边环境远离噪声、污染源及危险品生产、储运等区域；（2）救护车、消防车可出入
     */
    private String safetyScore2;

    /**
     * （1）室内外地面平整；（2）主要步行通道平坦、无高差；（3）有无障碍设施，方便轮椅通行
     */
    private String safetyScore3;

    /**
     * （1）出入口有效宽度不小于1.20m；（2）出入口处内、外应有不小于1.50m×1.50m轮椅回转面积；（3）出入口处的平台与建筑室外采用缓步台阶和轮椅坡道过渡，起止处有异色警示条
     */
    private String safetyScore4;

    /**
     * （1）主要出入口的门不选用旋转门；公共外门净宽不小于1.10m；走廊、防火等门净宽不小于0.80m；开向公共走廊门不影响安全疏散；室内面积大于60㎡时，门向疏散方向开启；（2）公共区域的门配有方便观察的玻璃
     */
    private String safetyScore5;

    /**
     * （1）室内装饰材料符合消防环保要求，人员住宿和主要活动场所不使用易燃可燃装饰装修材料，有人居住或者活动的建筑不采用夹芯材料燃烧性能低于A级的彩钢板搭建；大面积使用玻璃材质时应有异色警示标识；（2）有漏电保护装置；（3）走廊墙面无突出物，灭火器和标识板等设置应不妨碍老年人正常通行
     */
    private String safetyScore6;

    /**
     * 消防设施做好维护保养，并有完整记录
     */
    private String safetyScore7;

    /**
     * 有安全出口、疏散通道，应急照明设备
     */
    private String safetyScore8;

    /**
     * 公共区域明显位置设置该区域的安全疏散指示图，指示图上应标明老年人容易识别的疏散路线、安全出口、人员所在位置和必要的文字说明
     */
    private String safetyScore9;

    /**
     * 防火门开启方向有明显标注（推、拉），如有常闭式防火门应处于关闭状态
     */
    private String safetyScore10;

    /**
     * （1）无裸露、老化的电线；无随意拉接和安装用电线路和设备；（2）定期组织对电器产品及其线路、管路进行维护保养和检测；（3）未使用电热毯、热炉、热得快等大功率电气设备；（4）未违规存放易燃易爆危险品
     */
    private String safetyScore11;

    /**
     * （1）入口、大厅、楼层、电梯间、各类用房应设置标识；（2）安全出入口、紧急出口、上下楼梯、灭火器等应设置标识
     */
    private String safetyScore12;

    /**
     * 服务站购买养老服务设施公众责任险
     */
    private String safetyScore13;

    /**
     * 服务站室内全部区域严禁吸烟
     */
    private String safetyScore14;

    /**
     * 每月组织一次安全工作自查，自查项目覆盖全服务站各项工作（如：消防安全及安全设施等），安全工作自查记录完整
     */
    private String safetyScore15;

    /**
     * 能够为老人提供照料护理和健康管理等服务
     */
    private String serviceScore1;

    /**
     * 提供助餐服务
     */
    private String serviceScore2;

    /**
     * 为社区内有需求的老年人提供居家保洁服务，包括房间打扫、清洁灶具、清洗门窗、洗涤衣物等，也包括维修、疏通等其他家政服务
     */
    private String serviceScore3;

    /**
     * 能够陪同有需求的老年人户外散步、外出；能够提供助行器具
     */
    private String serviceScore4;

    /**
     * 能够为老人开展文化、教育、体育、康复、娱乐等活动
     */
    private String serviceScore5;

    /**
     * 能够为老人提供陪同聊天、情绪安抚等心理慰藉
     */
    private String serviceScore6;

    /**
     * 代办服务：根据老年人需求提供代购、代领物品，代缴费用等服务
     */
    private String serviceScore7;

    /**
     * 针对社区老年人实际需求开展其他为老服务项目
     */
    private String serviceScore8;

    /**
     * 配备依托医疗卫生服务机构提供签约服务的医护人员；配有社工、心理咨询师
     */
    private String manageScore1;

    /**
     * 各场所卫生状况良好，物品分类放置整齐有序，橱柜及时清理保持整洁，地面干燥，空气无异味
     */
    private String manageScore2;

    /**
     * 有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：相关证照、人员资质、地理位置、收费标准、照护服务项目
     */
    private String manageScore3;

    /**
     * 建立档案管理制度：（1）管理档案，包括文书档案、财务档案、员工信息等资料；（2）服务档案，包括老年人信息、服务协议、服务项目、服务安排、服务记录等资料。
     */
    private String manageScore4;

    /**
     * 制订各部门岗位职责，有完整的各项规章制度且有资料可查
     */
    private String manageScore5;

    /**
     * 设有多渠道的投诉途径，投诉渠道通畅并张贴于机构醒目处。对投诉处理有专人负责，信息的核实、处理、整改、反馈及时并有记录
     */
    private String manageScore6;

    /**
     * 建立服务绩效的自评分析机制。必要时采取预防和纠正措施，自评分析（服务差错、意外事件、对象投诉、压疮发生率、服务满意度测评等）有记录
     */
    private String manageScore7;

    /**
     * 多渠道（家属代表座谈会或个别访谈等）听取服务对象及家属对服务质量的评价与改进，且有记录可查
     */
    private String manageScore8;

    /**
     * 提供财务年度审计报告；财务人员须持证上岗；出纳、会计不能一人兼任；制定财务管理制度，财务账目规范
     */
    private String manageScore9;

    /**
     * （1）服务站设置在交通便利、社区生活配套设施或公共绿地附近；（2）靠近医疗服务设施、公园等其他公共服务设施；（3）保持相对独立，有较高的可识别性，可就近解决老年人的基本需求；（4）有良好的朝向和日照条件，满足通风、防寒、防灾等要求
     */
    private String facilityScore1;

    /**
     * 服务站设置在建筑物一层，或设置担架电梯或无障碍通道的二层、三层
     */
    private String facilityScore2;

    /**
     * （1）独立设置室外坡道且有效宽度不小于1.50m；（2）坡道的起止点有≥1.50m×1.50m回转面积（3）坡道、过厅、走廊、楼梯设置双侧扶手
     */
    private String facilityScore3;

    /**
     * （1）设置日间休息室，位置在相对安静区域，具有良好的采光、通风条件并有防寒防暑设备；（2）供老年人日间休息的躺椅或床位在高度、舒适性等方面充分考虑老年人实际情况合理配置，墙面设有扶手，并配备必要的辅助生活设施及用品。
     */
    private String facilityScore4;

    /**
     * （1）设有休闲娱乐室，能基本满足聊天、娱乐、培训、讲座等集体活动的需要；（2）具备小型多功能厅的基本功用，配置包括有线电视、音响、棋牌、乐器等老年人喜爱的娱乐器材及设备
     */
    private String facilityScore5;

    /**
     * （1）设有图书学习室，配备书架、阅览桌、坐椅,有一定数量的适应老年人阅读的书籍和报刊；（2）设立上网、书画等兴趣专区,提供相应用具。
     */
    private String facilityScore6;

    /**
     * 设置老年人保健康复用房，配置有适合老年人的健身康复器械
     */
    private String facilityScore7;

    /**
     * （1）设置公共卫生间，与老年人经常使用的公共活动用房同层且邻近，设置便器、洗手盆，且光线明亮，具备通风换气条件，空气无异味；（2）设置无障碍厕位，便器旁安装扶手，地面选防滑材料
     */
    private String facilityScore8;

    /**
     * （1）设有公共餐厅，使用可移动的、牢固的桌椅；（2）为护理员留有分餐、助餐空间；采用柜台式售饭方式的，设置低位服务窗口
     */
    private String facilityScore9;

    /**
     * 配有监控系统、供电设施、给水设施、排水设施、热水供应设施、采暖设施、空调设备，出入口内、外及平台、阳台、走廊、楼梯等公共部位设有照明设备
     */
    private String facilityScore10;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getOrganizationNames() {
        return organizationNames;
    }

    public void setOrganizationNames(String organizationNames) {
        this.organizationNames = organizationNames;
    }

    public String getStarRating() {
        return starRating;
    }

    public void setStarRating(String starRating) {
        this.starRating = starRating;
    }

    public String getApplicationTime() {
        return applicationTime;
    }

    public void setApplicationTime(String applicationTime) {
        this.applicationTime = applicationTime;
    }


    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public String getSafetyScore1() {
        return safetyScore1;
    }

    public void setSafetyScore1(String safetyScore1) {
        this.safetyScore1 = safetyScore1;
    }

    public String getSafetyScore2() {
        return safetyScore2;
    }

    public void setSafetyScore2(String safetyScore2) {
        this.safetyScore2 = safetyScore2;
    }

    public String getSafetyScore3() {
        return safetyScore3;
    }

    public void setSafetyScore3(String safetyScore3) {
        this.safetyScore3 = safetyScore3;
    }

    public String getSafetyScore4() {
        return safetyScore4;
    }

    public void setSafetyScore4(String safetyScore4) {
        this.safetyScore4 = safetyScore4;
    }

    public String getSafetyScore5() {
        return safetyScore5;
    }

    public void setSafetyScore5(String safetyScore5) {
        this.safetyScore5 = safetyScore5;
    }

    public String getSafetyScore6() {
        return safetyScore6;
    }

    public void setSafetyScore6(String safetyScore6) {
        this.safetyScore6 = safetyScore6;
    }

    public String getSafetyScore7() {
        return safetyScore7;
    }

    public void setSafetyScore7(String safetyScore7) {
        this.safetyScore7 = safetyScore7;
    }

    public String getSafetyScore8() {
        return safetyScore8;
    }

    public void setSafetyScore8(String safetyScore8) {
        this.safetyScore8 = safetyScore8;
    }

    public String getSafetyScore9() {
        return safetyScore9;
    }

    public void setSafetyScore9(String safetyScore9) {
        this.safetyScore9 = safetyScore9;
    }

    public String getSafetyScore10() {
        return safetyScore10;
    }

    public void setSafetyScore10(String safetyScore10) {
        this.safetyScore10 = safetyScore10;
    }

    public String getSafetyScore11() {
        return safetyScore11;
    }

    public void setSafetyScore11(String safetyScore11) {
        this.safetyScore11 = safetyScore11;
    }

    public String getSafetyScore12() {
        return safetyScore12;
    }

    public void setSafetyScore12(String safetyScore12) {
        this.safetyScore12 = safetyScore12;
    }

    public String getSafetyScore13() {
        return safetyScore13;
    }

    public void setSafetyScore13(String safetyScore13) {
        this.safetyScore13 = safetyScore13;
    }

    public String getSafetyScore14() {
        return safetyScore14;
    }

    public void setSafetyScore14(String safetyScore14) {
        this.safetyScore14 = safetyScore14;
    }

    public String getSafetyScore15() {
        return safetyScore15;
    }

    public void setSafetyScore15(String safetyScore15) {
        this.safetyScore15 = safetyScore15;
    }

    public String getServiceScore1() {
        return serviceScore1;
    }

    public void setServiceScore1(String serviceScore1) {
        this.serviceScore1 = serviceScore1;
    }

    public String getServiceScore2() {
        return serviceScore2;
    }

    public void setServiceScore2(String serviceScore2) {
        this.serviceScore2 = serviceScore2;
    }

    public String getServiceScore3() {
        return serviceScore3;
    }

    public void setServiceScore3(String serviceScore3) {
        this.serviceScore3 = serviceScore3;
    }

    public String getServiceScore4() {
        return serviceScore4;
    }

    public void setServiceScore4(String serviceScore4) {
        this.serviceScore4 = serviceScore4;
    }

    public String getServiceScore5() {
        return serviceScore5;
    }

    public void setServiceScore5(String serviceScore5) {
        this.serviceScore5 = serviceScore5;
    }

    public String getServiceScore6() {
        return serviceScore6;
    }

    public void setServiceScore6(String serviceScore6) {
        this.serviceScore6 = serviceScore6;
    }

    public String getServiceScore7() {
        return serviceScore7;
    }

    public void setServiceScore7(String serviceScore7) {
        this.serviceScore7 = serviceScore7;
    }

    public String getServiceScore8() {
        return serviceScore8;
    }

    public void setServiceScore8(String serviceScore8) {
        this.serviceScore8 = serviceScore8;
    }

    public String getManageScore1() {
        return manageScore1;
    }

    public void setManageScore1(String manageScore1) {
        this.manageScore1 = manageScore1;
    }

    public String getManageScore2() {
        return manageScore2;
    }

    public void setManageScore2(String manageScore2) {
        this.manageScore2 = manageScore2;
    }

    public String getManageScore3() {
        return manageScore3;
    }

    public void setManageScore3(String manageScore3) {
        this.manageScore3 = manageScore3;
    }

    public String getManageScore4() {
        return manageScore4;
    }

    public void setManageScore4(String manageScore4) {
        this.manageScore4 = manageScore4;
    }

    public String getManageScore5() {
        return manageScore5;
    }

    public void setManageScore5(String manageScore5) {
        this.manageScore5 = manageScore5;
    }

    public String getManageScore6() {
        return manageScore6;
    }

    public void setManageScore6(String manageScore6) {
        this.manageScore6 = manageScore6;
    }

    public String getManageScore7() {
        return manageScore7;
    }

    public void setManageScore7(String manageScore7) {
        this.manageScore7 = manageScore7;
    }

    public String getManageScore8() {
        return manageScore8;
    }

    public void setManageScore8(String manageScore8) {
        this.manageScore8 = manageScore8;
    }

    public String getManageScore9() {
        return manageScore9;
    }

    public void setManageScore9(String manageScore9) {
        this.manageScore9 = manageScore9;
    }

    public String getFacilityScore1() {
        return facilityScore1;
    }

    public void setFacilityScore1(String facilityScore1) {
        this.facilityScore1 = facilityScore1;
    }

    public String getFacilityScore2() {
        return facilityScore2;
    }

    public void setFacilityScore2(String facilityScore2) {
        this.facilityScore2 = facilityScore2;
    }

    public String getFacilityScore3() {
        return facilityScore3;
    }

    public void setFacilityScore3(String facilityScore3) {
        this.facilityScore3 = facilityScore3;
    }

    public String getFacilityScore4() {
        return facilityScore4;
    }

    public void setFacilityScore4(String facilityScore4) {
        this.facilityScore4 = facilityScore4;
    }

    public String getFacilityScore5() {
        return facilityScore5;
    }

    public void setFacilityScore5(String facilityScore5) {
        this.facilityScore5 = facilityScore5;
    }

    public String getFacilityScore6() {
        return facilityScore6;
    }

    public void setFacilityScore6(String facilityScore6) {
        this.facilityScore6 = facilityScore6;
    }

    public String getFacilityScore7() {
        return facilityScore7;
    }

    public void setFacilityScore7(String facilityScore7) {
        this.facilityScore7 = facilityScore7;
    }

    public String getFacilityScore8() {
        return facilityScore8;
    }

    public void setFacilityScore8(String facilityScore8) {
        this.facilityScore8 = facilityScore8;
    }

    public String getFacilityScore9() {
        return facilityScore9;
    }

    public void setFacilityScore9(String facilityScore9) {
        this.facilityScore9 = facilityScore9;
    }

    public String getFacilityScore10() {
        return facilityScore10;
    }

    public void setFacilityScore10(String facilityScore10) {
        this.facilityScore10 = facilityScore10;
    }


    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public Integer getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(Integer applicationStatus) {
        this.applicationStatus = applicationStatus;
    }
}