package com.fedtech.pension.org.entity;


import java.io.Serializable;
import java.util.Date;

/**
 * @author miaoyueming
 * @date 2019/8/16
 */
public class StarRatingOfInstitutions implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**外键机构Id*/
    private Integer serviceOrgId;

    /**评估人员Id*/
    private Integer userId;

    /**1:机构自评 2:评估人员评*/
    private Integer type;

    /**查看状态*/
    private Integer listDetail;

    /**评估状态(0:未评估 1:已评估)*/
    private Integer status;

    /**机构名称*/
    private String institutionName;

    /**区域名称*/
    private String areaName;

    private Integer in09Score;

    private Integer in11Score;

    private Integer in18Score;

    private Integer in21Score;

    private Integer in26Score;

    private Integer in28Score;

    private Integer in32Score;

    private Integer in38Score;

    private Integer in39Score;

    private Integer in40Score;

    private Integer in54Score;

    private Integer in57Score;

    /**等级评定总评分*/
    private Integer totalScore;

    /**评定时间*/
    private Date assessmentTime;

    /**星级*/
    private Integer starClass;

    /**建筑面积中通过消防验收的面积*/
    private String area;

    /**护理员与入住老人配比要求*/
    private String proportRequirements;

    /**院长、副院长学历要求*/
    private String educationalRequirements;

    /**配备专业人员要求*/
    private String professionalRequirements;

    /**设独立卫生间的老年人居室占居室总数的比例*/
    private String proportion;

    /**养老机构入住率*/
    private String occupancyRate;

    /**就餐功能区域要求*/
    private String diningAreaRequirements;

    /**康复区域要求*/
    private String rehabilitationAreaRequirements;

    /**提供的服务项目*/
    private String serviceItems;

    /**年内无责任事故*/
    private String fraction01;

    /**周边环境远离噪声、污染源；救护车、消防车可出入*/
    private String fraction02;

    /**主要步行通道平坦、无高差；有无障碍设施，方便轮椅通行，配有夜间照明和标识*/
    private String fraction03;

    /**（1）室外地面平整；（2）室内地面选用平整、防滑、耐磨材料，厨房、卫生间、浴室地面选防滑材料*/
    private String fraction04;

    /**（1）出入口不少于2处，有效宽度不小于1.20m；（2）出入口处内、外应有不小于1.50m×1.50m轮椅回转面积；（3）出入口处的平台与建筑室外采用缓步台阶和轮椅坡道过渡，起止处有异色警示条*/
    private String fraction05;

    /**（1）主要出入口的门不选用旋转门、推拉门；公共外门、重度照护室门净宽不小于1.10m；卧室、走道、卫生间、浴室、防火等门净宽不小于0.80m；开向公共走道门不影响安全疏散；室内面积大于60m2时，门向疏散方向开启；（2）公共区域的门配有方便观察的玻璃*/
    private String fraction06;

    /**（1）室内装饰材料符合消防环保要求；大面积使用玻璃材质时应有异色警示标识；（2）有漏电保护装置；（3）走廊墙面无突出物，灭火器和标识板等设置应不妨碍老年人正常通行*/
    private String fraction07;

    /**（1）入口、大厅、楼层、电梯间、各类用房应设置标识；（2）安全出入口、紧急出口、上下楼梯、灭火器等应设置标识；（3）标识设置应醒目且有一定导向作用*/
    private String fraction08;

    /**消防设施做好维护保养，并有完整记录*/
    private String fraction09;

    /**有明显标注，安全出口、疏散通道，应急照明设备*/
    private String fraction10;

    /**老年人居住用房内及公共部位等区域的明显位置设置该区域的安全疏散指示图，指示图上应标明老年人容易识别的疏散路线、安全出口、人员所在位置和必要的文字说明*/
    private String fraction11;

    /**防火门开启方向有明显标注（推、拉），如有常闭式防火门应处于关闭状态*/
    private String fraction12;

    /**无裸露、老化的电线；禁止随意拉接和安装用电线路和设备；定期组织对电器产品及其线路、管路进行维护保养和检测；老年人居室未使用电热毯、热炉、热得快等大功率电气设备；未违规存放易燃易爆危险品*/
    private String fraction13;

    /**设备放置安全，如：开水炉、氧气瓶、热水瓶、饮水机、微波炉等设备放置在安全位置，并处于受控状态*/
    private String fraction14;

    /**划定吸烟区域，老人居室内严禁吸烟*/
    private String fraction15;

    /**厨房管道燃气、液化气钢瓶等设施、设备的安装存放（液化气钢瓶）与使用应符合消防及燃气专业机构的要求，并出具检查验收合格证明*/
    private String fraction16;

    /**1）厨房做到明厨亮灶；（2）食堂生熟分开，成品与半成品分开制作、存储；（3）食品留样至少48小时且有留样记录*/
    private String fraction17;

    /**建立特种设施、设备台帐（电梯、空调、锅炉等）；特种设备定期接受专业单位检验*/
    private String fraction18;

    /**制定消防安全、特种设备设施安全、食品安全、突发事件等相关管理制度、预警机制及应急预案*/
    private String fraction19;

    /**每半年至少开展一次安全培训，针对本院所制定的各项“突发事件预案”开展定期演练，并有完整记录和照片*/
    private String fraction20;

    /**每月组织一次安全工作自查，自查项目覆盖全院各项工作（如：消防安全、食品采购及安全设施等），安全工作自查记录完整*/
    private String fraction21;

    /**配备有资质的专（兼）职消防管理人员；建立微型消防站、并达到“三知四会一联通，处置要在三分钟”要求*/
    private String fraction22;

    /**开展居家养老服务，主要为老年人提供生活照料、短期托养、助医、助餐、助浴、助洁、助行、关怀访视、心理咨询和应急救援等服务*/
    private String fraction23;

    /**对每一位入住的服务对象进行入院评估，评估等级与实际状况相符*/
    private String fraction24;

    /**根据服务对象的评估等级与实际状况选择照护服务项目，并设置老年人照护项目服务卡，注明该老年人所需服务项目、膳食要求、特殊体质等（如：糖尿病、严重骨质疏松等）*/
    private String fraction25;

    /**有24小时当班、值班服务，护理交接班记录规范*/
    private String fraction26;

    /**开展护理员培训，提高护理员服务水平*/
    private String fraction27;

    /**护理员熟悉服务对象的照护等级，服务内容及各服务项目的流程*/
    private String fraction28;

    /**提升护理型床位占比，重点为失能、半失能老年人提供养老护理服务*/
    private String fraction29;

    /**（1）老人2期及以上压疮在院新发生率应低于5%；（2）制定压疮预防制度、压疮护理流程*/
    private String fraction30;

    /**老人居室内物品分类放置整齐有序，及时清理保持橱柜整洁；对有认知缺失、情绪行为异常的被照护者，易造成伤害的利器等应集中管理且有记录*/
    private String fraction31;

    /**各场所卫生状况良好；老人个人卫生状况良好*/
    private String fraction32;

    /**制定日常用品分类消毒制度，对老年人的日常用品（口杯、毛巾、衣、被等物）分类清洗消毒，不少于1次/周，且有记录*/
    private String fraction33;

    /**制定出院、死亡后及疑似传染性疾病使用过的各类物品消毒制度，并按终、末消毒程序处置；按消毒隔离原则规范处置且有记录*/
    private String fraction34;

    /**（1）每年至少为老年人体检1次；（2）为老年人建立健康档案；老年人在院期间健康状况动态变化记入健康档案，如无特殊情况每月记录一次，特殊情况随时记录*/
    private String fraction35;

    /**“非内设医疗机构”外配药物发放须按约定进行，按医嘱接受收物且有规范登记；设置专用药柜，药品按规定储存、区分，且均在有效期内；药品有外包装，包装上标注用药老人姓名、床号；特殊药品（镇静类、抗精神病药品）专柜上锁保管；遵医嘱发放药品，设置服药单；特殊药物发放时送药到口或看服*/
    private String fraction36;

    /**开展适合老年人身心特点的歌舞、书画、手工、棋牌等文化娱乐活动和康乐活动；活动有计划，组织实施有记录，活动中有防范措施*/
    private String fraction37;

    /**每年组织两次以上大型活动，活动有记录，制定大型活动突发事件预案*/
    private String fraction38;

    /**建立餐具及配、送餐用具（如：送餐车、送餐专用电梯等）消毒制度；实施消毒规范并记录完整*/
    private String fraction39;

    /**膳食荤素搭配合理，每周公布食谱，膳食符合地域、民族、宗教习惯*/
    private String fraction40;

    /**遵医嘱为需特殊膳食的老年人提供“特殊膳食”（如：低糖、低脂及酥、烂或流质膳食等），其膳食要求应有记录*/
    private String fraction41;

    /**医护人员*/
    private String fraction42;

    /**社工、心理咨询师*/
    private String fraction43;

    /**营养师*/
    private String fraction44;

    /**康复师*/
    private String fraction45;

    /**开展人员培训，培训内容包括以人为本、爱老尊老孝老服务理念、相关政策法规及管理服务技能*/
    private String fraction46;

    /**每日开展房间及防火巡查，观察老年人的身心状况，特殊情况及时报告并协助处理，必要时通知监护人；夜间防火巡查不少于两次，并做好记录*/
    private String fraction47;

    /**建立老人出入请销假、家属探视等制度*/
    private String fraction48;

    /**建有入出院流程，有专人负责并按规定执行*/
    private String fraction49;

    /**当老年人的状况和需求发生变化或机构提供的服务有更改时，应及时与监护人沟通，并再次确认和修订相关服务内容*/
    private String fraction50;

    /**有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：执业证照、人员资质、相关证照、地理位置、收费标准、照护服务项目*/
    private String fraction51;

    /**建立入住老年人档案，档案资料应包括：入住（离院）登记、评估等级告知单、养老服务合同、体检报告、老年人身份证复印件、户口簿首页及本人页复印件、担保人的身份证复印件及联系方式*/
    private String fraction52;

    /**制订各部门岗位职责，有完整的各项规章制度且有资料可查*/
    private String fraction53;

    /**建立员工考核制度，制订各部门、各岗位考核细则，确保各职能部门每月考核且有记录可查*/
    private String fraction54;

    /**建立入住老人代表会议制度，每年活动不少于4次，且有记录可查*/
    private String fraction55;

    /**设有多渠道的投诉途径，投诉渠道通畅并张贴于机构醒目处。对投诉处理有专人负责，信息的核实、处理、整改、反馈及时并有记录*/
    private String fraction56;

    /**建立服务绩效的自评分析机制。必要时采取预防和纠正措施，自评分析（服务差错、意外事件、对象投诉、压疮发生率、服务满意度测评等）有记录*/
    private String fraction57;

    /**多渠道（家属代表座谈会或个别访谈等）听取服务对象及家属对服务质量的评价与改进，确保每年参与者为服务对象的10%，且有记录可查*/
    private String fraction58;

    /**院部对全年服务质量评价和改进情况有总结并向全院通报*/
    private String fraction59;

    /**建立捐赠物品登记明细表、分配登记表，且有记录可查*/
    private String fraction60;

    /**提供财务年度审计报告；财务人员须持证上岗；出纳、会计不能一人兼任；制定财务管理制度，财务账目规范，财务收入做到单人核算*/
    private String fraction61;

    /**遵守《中华人民共和国劳动法》，保护员工合法权益，建立员工激励机制*/
    private String fraction62;

    /**人员住宿和主要活动场所不使用易燃可燃装饰装修材料，有人居住或者活动的建筑不采用夹芯材料燃烧性能低于A级的彩钢板搭建*/
    private String fraction63;

    /**（1）独立设置室外坡道且有效宽度不小于1.50m；（2）坡道的起止点有≥1.50m×1.50m回转面积（3）坡道、过厅、走廊设置双侧扶手*/
    private String fraction64;

    /**楼梯设置双侧扶手，不采用弧形楼梯和螺旋楼梯，楼段通行净宽不小于1.2m，各级踏步均匀一致*/
    private String fraction65;

    /**三层及以上建筑物至少应设置一部电梯，并应符合有关规定。电梯井不应与卧室、起居室贴邻设置*/
    private String fraction66;

    /**老年人居室不设置在地下室、半地下室，有自然通风和采光条件，室内净高不低于2.6m*/
    private String fraction67;

    /**每间老年人居室床位数不大于4张，重度照护居室床位数不多于6张*/
    private String fraction68;

    /**老年人居室内留有轮椅回转空间，不设门槛，主要通道的净宽不小于1m，床边留有护理、急救操作空间，相邻床位的长边间距不小于0.8m*/
    private String fraction69;

    /**餐饮区域空间布置满足餐车进出、送餐到位服务的需求*/
    private String fraction70;

    /**每个楼层设置公用卫生间；坐便器旁设安全扶手*/
    private String fraction71;

    /**（1）配有洗衣机等设施，操作场所布局合理，洁污分开、通风良好；（2）设置污染衣物预洗和消毒水池*/
    private String fraction72;

    /**（1）文娱与健身区域总面积不小于2m2/床；（2）文娱与健身区域不对老年人居室产生干扰*/
    private String fraction73;

    /**配备医务室且使用面积不小于10m2，空间满足开展基本医疗服务的需求*/
    private String fraction74;

    /**配置老年人交流、活动用房，康复用房；配置有空调、彩电、橱柜等相应设备及康复器材*/
    private String fraction75;

    /**公用浴室空间便于轮椅进出，留有助浴空间，地面无高差*/
    private String fraction76;

    /**厨房无虫害迹象，如蟑螂、老鼠或老鼠排泄物；厨房操作区域地面无大量积水，设备设施的清洁状况满足食品加工的基本要求*/
    private String fraction77;

    /**（1）卧室、卫生间、浴室、公用浴室、公用卫生间、公共活动区域需安装呼叫装置且触摸方便；（2）呼叫装置终端与每个楼层照护站相连；（3）每个楼层有视线可及的显示屏*/
    private String fraction78;

    /**（1）老人居室设置顶灯、床头灯、脚灯等照明设备；（2）出入口内、外及平台、阳台、走道、楼梯等公共部位设有照明设备*/
    private String fraction79;

    private Date startDate;

    private Date endDate;

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStarClass() {
        return starClass;
    }

    public void setStarClass(Integer starClass) {
        this.starClass = starClass;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getProportRequirements() {
        return proportRequirements;
    }

    public void setProportRequirements(String proportRequirements) {
        this.proportRequirements = proportRequirements;
    }

    public String getEducationalRequirements() {
        return educationalRequirements;
    }

    public void setEducationalRequirements(String educationalRequirements) {
        this.educationalRequirements = educationalRequirements;
    }

    public String getProfessionalRequirements() {
        return professionalRequirements;
    }

    public void setProfessionalRequirements(String professionalRequirements) {
        this.professionalRequirements = professionalRequirements;
    }

    public String getProportion() {
        return proportion;
    }

    public void setProportion(String proportion) {
        this.proportion = proportion;
    }

    public String getOccupancyRate() {
        return occupancyRate;
    }

    public void setOccupancyRate(String occupancyRate) {
        this.occupancyRate = occupancyRate;
    }

    public String getDiningAreaRequirements() {
        return diningAreaRequirements;
    }

    public void setDiningAreaRequirements(String diningAreaRequirements) {
        this.diningAreaRequirements = diningAreaRequirements;
    }

    public String getRehabilitationAreaRequirements() {
        return rehabilitationAreaRequirements;
    }

    public void setRehabilitationAreaRequirements(String rehabilitationAreaRequirements) {
        this.rehabilitationAreaRequirements = rehabilitationAreaRequirements;
    }

    public String getServiceItems() {
        return serviceItems;
    }

    public void setServiceItems(String serviceItems) {
        this.serviceItems = serviceItems;
    }

    public String getFraction01() {
        return fraction01;
    }

    public void setFraction01(String fraction01) {
        this.fraction01 = fraction01;
    }

    public String getFraction02() {
        return fraction02;
    }

    public void setFraction02(String fraction02) {
        this.fraction02 = fraction02;
    }

    public String getFraction03() {
        return fraction03;
    }

    public void setFraction03(String fraction03) {
        this.fraction03 = fraction03;
    }

    public String getFraction04() {
        return fraction04;
    }

    public void setFraction04(String fraction04) {
        this.fraction04 = fraction04;
    }

    public String getFraction05() {
        return fraction05;
    }

    public void setFraction05(String fraction05) {
        this.fraction05 = fraction05;
    }

    public String getFraction06() {
        return fraction06;
    }

    public void setFraction06(String fraction06) {
        this.fraction06 = fraction06;
    }

    public String getFraction07() {
        return fraction07;
    }

    public void setFraction07(String fraction07) {
        this.fraction07 = fraction07;
    }

    public String getFraction08() {
        return fraction08;
    }

    public void setFraction08(String fraction08) {
        this.fraction08 = fraction08;
    }

    public String getFraction09() {
        return fraction09;
    }

    public void setFraction09(String fraction09) {
        this.fraction09 = fraction09;
    }

    public String getFraction10() {
        return fraction10;
    }

    public void setFraction10(String fraction10) {
        this.fraction10 = fraction10;
    }

    public String getFraction11() {
        return fraction11;
    }

    public void setFraction11(String fraction11) {
        this.fraction11 = fraction11;
    }

    public String getFraction12() {
        return fraction12;
    }

    public void setFraction12(String fraction12) {
        this.fraction12 = fraction12;
    }

    public String getFraction13() {
        return fraction13;
    }

    public void setFraction13(String fraction13) {
        this.fraction13 = fraction13;
    }

    public String getFraction14() {
        return fraction14;
    }

    public void setFraction14(String fraction14) {
        this.fraction14 = fraction14;
    }

    public String getFraction15() {
        return fraction15;
    }

    public void setFraction15(String fraction15) {
        this.fraction15 = fraction15;
    }

    public String getFraction16() {
        return fraction16;
    }

    public void setFraction16(String fraction16) {
        this.fraction16 = fraction16;
    }

    public String getFraction17() {
        return fraction17;
    }

    public void setFraction17(String fraction17) {
        this.fraction17 = fraction17;
    }

    public String getFraction18() {
        return fraction18;
    }

    public void setFraction18(String fraction18) {
        this.fraction18 = fraction18;
    }

    public String getFraction19() {
        return fraction19;
    }

    public void setFraction19(String fraction19) {
        this.fraction19 = fraction19;
    }

    public String getFraction20() {
        return fraction20;
    }

    public void setFraction20(String fraction20) {
        this.fraction20 = fraction20;
    }

    public String getFraction21() {
        return fraction21;
    }

    public void setFraction21(String fraction21) {
        this.fraction21 = fraction21;
    }

    public String getFraction22() {
        return fraction22;
    }

    public void setFraction22(String fraction22) {
        this.fraction22 = fraction22;
    }

    public String getFraction23() {
        return fraction23;
    }

    public void setFraction23(String fraction23) {
        this.fraction23 = fraction23;
    }

    public String getFraction24() {
        return fraction24;
    }

    public void setFraction24(String fraction24) {
        this.fraction24 = fraction24;
    }

    public String getFraction25() {
        return fraction25;
    }

    public void setFraction25(String fraction25) {
        this.fraction25 = fraction25;
    }

    public String getFraction26() {
        return fraction26;
    }

    public void setFraction26(String fraction26) {
        this.fraction26 = fraction26;
    }

    public String getFraction27() {
        return fraction27;
    }

    public void setFraction27(String fraction27) {
        this.fraction27 = fraction27;
    }

    public String getFraction28() {
        return fraction28;
    }

    public void setFraction28(String fraction28) {
        this.fraction28 = fraction28;
    }

    public String getFraction29() {
        return fraction29;
    }

    public void setFraction29(String fraction29) {
        this.fraction29 = fraction29;
    }

    public String getFraction30() {
        return fraction30;
    }

    public void setFraction30(String fraction30) {
        this.fraction30 = fraction30;
    }

    public String getFraction31() {
        return fraction31;
    }

    public void setFraction31(String fraction31) {
        this.fraction31 = fraction31;
    }

    public String getFraction32() {
        return fraction32;
    }

    public void setFraction32(String fraction32) {
        this.fraction32 = fraction32;
    }

    public String getFraction33() {
        return fraction33;
    }

    public void setFraction33(String fraction33) {
        this.fraction33 = fraction33;
    }

    public String getFraction34() {
        return fraction34;
    }

    public void setFraction34(String fraction34) {
        this.fraction34 = fraction34;
    }

    public String getFraction35() {
        return fraction35;
    }

    public void setFraction35(String fraction35) {
        this.fraction35 = fraction35;
    }

    public String getFraction36() {
        return fraction36;
    }

    public void setFraction36(String fraction36) {
        this.fraction36 = fraction36;
    }

    public String getFraction37() {
        return fraction37;
    }

    public void setFraction37(String fraction37) {
        this.fraction37 = fraction37;
    }

    public String getFraction38() {
        return fraction38;
    }

    public void setFraction38(String fraction38) {
        this.fraction38 = fraction38;
    }

    public String getFraction39() {
        return fraction39;
    }

    public void setFraction39(String fraction39) {
        this.fraction39 = fraction39;
    }

    public String getFraction40() {
        return fraction40;
    }

    public void setFraction40(String fraction40) {
        this.fraction40 = fraction40;
    }

    public String getFraction41() {
        return fraction41;
    }

    public void setFraction41(String fraction41) {
        this.fraction41 = fraction41;
    }

    public String getFraction42() {
        return fraction42;
    }

    public void setFraction42(String fraction42) {
        this.fraction42 = fraction42;
    }

    public String getFraction43() {
        return fraction43;
    }

    public void setFraction43(String fraction43) {
        this.fraction43 = fraction43;
    }

    public String getFraction44() {
        return fraction44;
    }

    public void setFraction44(String fraction44) {
        this.fraction44 = fraction44;
    }

    public String getFraction45() {
        return fraction45;
    }

    public void setFraction45(String fraction45) {
        this.fraction45 = fraction45;
    }

    public String getFraction46() {
        return fraction46;
    }

    public void setFraction46(String fraction46) {
        this.fraction46 = fraction46;
    }

    public String getFraction47() {
        return fraction47;
    }

    public void setFraction47(String fraction47) {
        this.fraction47 = fraction47;
    }

    public String getFraction48() {
        return fraction48;
    }

    public void setFraction48(String fraction48) {
        this.fraction48 = fraction48;
    }

    public String getFraction49() {
        return fraction49;
    }

    public void setFraction49(String fraction49) {
        this.fraction49 = fraction49;
    }

    public String getFraction50() {
        return fraction50;
    }

    public void setFraction50(String fraction50) {
        this.fraction50 = fraction50;
    }

    public String getFraction51() {
        return fraction51;
    }

    public void setFraction51(String fraction51) {
        this.fraction51 = fraction51;
    }

    public String getFraction52() {
        return fraction52;
    }

    public void setFraction52(String fraction52) {
        this.fraction52 = fraction52;
    }

    public String getFraction53() {
        return fraction53;
    }

    public void setFraction53(String fraction53) {
        this.fraction53 = fraction53;
    }

    public String getFraction54() {
        return fraction54;
    }

    public void setFraction54(String fraction54) {
        this.fraction54 = fraction54;
    }

    public String getFraction55() {
        return fraction55;
    }

    public void setFraction55(String fraction55) {
        this.fraction55 = fraction55;
    }

    public String getFraction56() {
        return fraction56;
    }

    public void setFraction56(String fraction56) {
        this.fraction56 = fraction56;
    }

    public String getFraction57() {
        return fraction57;
    }

    public void setFraction57(String fraction57) {
        this.fraction57 = fraction57;
    }

    public String getFraction58() {
        return fraction58;
    }

    public void setFraction58(String fraction58) {
        this.fraction58 = fraction58;
    }

    public String getFraction59() {
        return fraction59;
    }

    public void setFraction59(String fraction59) {
        this.fraction59 = fraction59;
    }

    public String getFraction60() {
        return fraction60;
    }

    public void setFraction60(String fraction60) {
        this.fraction60 = fraction60;
    }

    public String getFraction61() {
        return fraction61;
    }

    public void setFraction61(String fraction61) {
        this.fraction61 = fraction61;
    }

    public String getFraction62() {
        return fraction62;
    }

    public void setFraction62(String fraction62) {
        this.fraction62 = fraction62;
    }

    public String getFraction63() {
        return fraction63;
    }

    public void setFraction63(String fraction63) {
        this.fraction63 = fraction63;
    }

    public String getFraction64() {
        return fraction64;
    }

    public void setFraction64(String fraction64) {
        this.fraction64 = fraction64;
    }

    public String getFraction65() {
        return fraction65;
    }

    public void setFraction65(String fraction65) {
        this.fraction65 = fraction65;
    }

    public String getFraction66() {
        return fraction66;
    }

    public void setFraction66(String fraction66) {
        this.fraction66 = fraction66;
    }

    public String getFraction67() {
        return fraction67;
    }

    public void setFraction67(String fraction67) {
        this.fraction67 = fraction67;
    }

    public String getFraction68() {
        return fraction68;
    }

    public void setFraction68(String fraction68) {
        this.fraction68 = fraction68;
    }

    public String getFraction69() {
        return fraction69;
    }

    public void setFraction69(String fraction69) {
        this.fraction69 = fraction69;
    }

    public String getFraction70() {
        return fraction70;
    }

    public void setFraction70(String fraction70) {
        this.fraction70 = fraction70;
    }

    public String getFraction71() {
        return fraction71;
    }

    public void setFraction71(String fraction71) {
        this.fraction71 = fraction71;
    }

    public String getFraction72() {
        return fraction72;
    }

    public void setFraction72(String fraction72) {
        this.fraction72 = fraction72;
    }

    public String getFraction73() {
        return fraction73;
    }

    public void setFraction73(String fraction73) {
        this.fraction73 = fraction73;
    }

    public String getFraction74() {
        return fraction74;
    }

    public void setFraction74(String fraction74) {
        this.fraction74 = fraction74;
    }

    public String getFraction75() {
        return fraction75;
    }

    public void setFraction75(String fraction75) {
        this.fraction75 = fraction75;
    }

    public String getFraction76() {
        return fraction76;
    }

    public void setFraction76(String fraction76) {
        this.fraction76 = fraction76;
    }

    public String getFraction77() {
        return fraction77;
    }

    public void setFraction77(String fraction77) {
        this.fraction77 = fraction77;
    }

    public String getFraction78() {
        return fraction78;
    }

    public void setFraction78(String fraction78) {
        this.fraction78 = fraction78;
    }

    public String getFraction79() {
        return fraction79;
    }

    public void setFraction79(String fraction79) {
        this.fraction79 = fraction79;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public Date getAssessmentTime() {
        return assessmentTime;
    }

    public void setAssessmentTime(Date assessmentTime) {
        this.assessmentTime = assessmentTime;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public Integer getListDetail() {
        return listDetail;
    }

    public void setListDetail(Integer listDetail) {
        this.listDetail = listDetail;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIn09Score() {
        return in09Score;
    }

    public void setIn09Score(Integer in09Score) {
        this.in09Score = in09Score;
    }

    public Integer getIn11Score() {
        return in11Score;
    }

    public void setIn11Score(Integer in11Score) {
        this.in11Score = in11Score;
    }

    public Integer getIn18Score() {
        return in18Score;
    }

    public void setIn18Score(Integer in18Score) {
        this.in18Score = in18Score;
    }

    public Integer getIn21Score() {
        return in21Score;
    }

    public void setIn21Score(Integer in21Score) {
        this.in21Score = in21Score;
    }

    public Integer getIn26Score() {
        return in26Score;
    }

    public void setIn26Score(Integer in26Score) {
        this.in26Score = in26Score;
    }

    public Integer getIn28Score() {
        return in28Score;
    }

    public void setIn28Score(Integer in28Score) {
        this.in28Score = in28Score;
    }

    public Integer getIn32Score() {
        return in32Score;
    }

    public void setIn32Score(Integer in32Score) {
        this.in32Score = in32Score;
    }

    public Integer getIn38Score() {
        return in38Score;
    }

    public void setIn38Score(Integer in38Score) {
        this.in38Score = in38Score;
    }

    public Integer getIn39Score() {
        return in39Score;
    }

    public void setIn39Score(Integer in39Score) {
        this.in39Score = in39Score;
    }

    public Integer getIn40Score() {
        return in40Score;
    }

    public void setIn40Score(Integer in40Score) {
        this.in40Score = in40Score;
    }

    public Integer getIn54Score() {
        return in54Score;
    }

    public void setIn54Score(Integer in54Score) {
        this.in54Score = in54Score;
    }

    public Integer getIn57Score() {
        return in57Score;
    }

    public void setIn57Score(Integer in57Score) {
        this.in57Score = in57Score;
    }
}
