package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Wcdfzsz implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;

    private Integer oldman_name; //姓名

    private Integer id_card;  //身份证号

    private Integer oldman_preferential_card; //老年优待证号

    private Integer phone1; //固话

    private Integer phone2; //手机

    private Integer oldman_photo; //老人照片

    private Integer degree_of_education; //文化程度

    private Integer conservation_time; //常住时间

    private Integer domicile_address; //户籍地址

    private Integer now_address; //现居地址

    private Integer emergency_contact1; //联系人1姓名

    private Integer emergency_contact1_relatives; //联系人1与老人关系

    private Integer emergency_contact1_tel; //联系人1联系方式

    private Integer is_key1; //联系人1是否有老年人钥匙

    private Integer emergency_contact2; //联系人2姓名

    private Integer emergency_contact2_relatives; //联系人2与老人关系

    private Integer emergency_contact2_tel; //联系人2联系方式

    private Integer is_key2; //联系人2是否有老年人钥匙

    private Integer emergency_contact3; //联系人3姓名

    private Integer emergency_contact3_relatives; //联系人3与老人关系

    private Integer emergency_contact3_tel; //联系人3联系方式

    private Integer is_key3; //联系人3是否有老年人钥匙

    private Integer oldman_zy; //原职业

    private Integer oldman_category; //人员类别

    private Integer special_object; //特殊对象

    private Integer sources_of_income; //收入来源

    private Integer status_of_children; //子女状况

    private Integer medical_category; //医疗类别

    private Integer residential_status; //居住状况

    private Integer housing_nature; //住房性质

    private Integer habitable_room; //居室

    private Integer floor_lift; //楼层电梯

    private Integer residential_floor; //居住楼层（楼层无电梯的）

    private Integer indoor_toilet; //室内厕所

    private Integer indoor_bath_equipment; //室内洗浴设备

    private Integer care_situation; //原照料情况

    private Integer government_purchase; //政府购买居家养老服务

    private Integer services_requested; //服务需求

    private Integer physiclal_health_status; //身体健康

    private Integer physiclal_illness_status; //重病

    private Integer physiclal_chronic_status; //慢性病

    private Integer psychologic_status; //心理状况

    private Integer social_activities; //社会活动情况

    private Integer social_activities_type; //社会活动类型

    private Integer day_activity1; //1-10依次对应页面更改后日常生活能力

    private Integer day_activity2; //

    private Integer day_activity3; //

    private Integer day_activity4; //

    private Integer day_activity5; //

    private Integer day_activity6; //

    private Integer day_activity7; //



    private Integer cognitive_ability1; //近期记忆(能回想近期发生的事情)

    private Integer cognitive_ability2; //程序记忆(完成洗衣、做饭、做菜等)

    private Integer cognitive_ability3; //定向记忆(外出、回家不迷路)

    private Integer cognitive_ability4; //判断能力(对日常事物的判断不违背常理)

    private Integer mood_action1; //情绪(与人和睦相处，不偏激)

    private Integer mood_action2; //行为(动作行为表现是否异常)

    private Integer mood_action3; //沟通(在交流中能否互相理解)

    private Integer audiovisual1; //视觉(能正常看电视、读报等)

    private Integer audiovisual2; //听觉(能正常接听电话、交谈)

    private Integer areaId; //区域

    private Integer community; //社区

    private Integer sign; //本人(或家属)签字

    private Integer judge_sign; //评估员签字
//新增字段
    private  Integer  foolStatus;//痴呆
    private  Integer  spiritStatus;//精神疾病
    private  Integer  accident1;//意外事件1-4及其他
    private  Integer  accident2;
    private  Integer  accident3;
    private  Integer  accident4;
    private  Integer  accidentOther;
    private Integer day_activity8; //
    private Integer day_activity9; //
    private Integer day_activity10; //
    private Integer audiovisual3; //
    private Integer audiovisual4; //
    private Integer audiovisual5; //


    public Wcdfzsz(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOldman_name() {
        return oldman_name;
    }

    public void setOldman_name(Integer oldman_name) {
        this.oldman_name = oldman_name;
    }

    public Integer getId_card() {
        return id_card;
    }

    public void setId_card(Integer id_card) {
        this.id_card = id_card;
    }

    public Integer getOldman_preferential_card() {
        return oldman_preferential_card;
    }

    public void setOldman_preferential_card(Integer oldman_preferential_card) {
        this.oldman_preferential_card = oldman_preferential_card;
    }

    public Integer getPhone1() {
        return phone1;
    }

    public void setPhone1(Integer phone1) {
        this.phone1 = phone1;
    }

    public Integer getPhone2() {
        return phone2;
    }

    public void setPhone2(Integer phone2) {
        this.phone2 = phone2;
    }

    public Integer getOldman_photo() {
        return oldman_photo;
    }

    public void setOldman_photo(Integer oldman_photo) {
        this.oldman_photo = oldman_photo;
    }

    public Integer getDegree_of_education() {
        return degree_of_education;
    }

    public void setDegree_of_education(Integer degree_of_education) {
        this.degree_of_education = degree_of_education;
    }

    public Integer getConservation_time() {
        return conservation_time;
    }

    public void setConservation_time(Integer conservation_time) {
        this.conservation_time = conservation_time;
    }

    public Integer getDomicile_address() {
        return domicile_address;
    }

    public void setDomicile_address(Integer domicile_address) {
        this.domicile_address = domicile_address;
    }

    public Integer getNow_address() {
        return now_address;
    }

    public void setNow_address(Integer now_address) {
        this.now_address = now_address;
    }

    public Integer getEmergency_contact1() {
        return emergency_contact1;
    }

    public void setEmergency_contact1(Integer emergency_contact1) {
        this.emergency_contact1 = emergency_contact1;
    }

    public Integer getEmergency_contact1_relatives() {
        return emergency_contact1_relatives;
    }

    public void setEmergency_contact1_relatives(Integer emergency_contact1_relatives) {
        this.emergency_contact1_relatives = emergency_contact1_relatives;
    }

    public Integer getEmergency_contact1_tel() {
        return emergency_contact1_tel;
    }

    public void setEmergency_contact1_tel(Integer emergency_contact1_tel) {
        this.emergency_contact1_tel = emergency_contact1_tel;
    }

    public Integer getIs_key1() {
        return is_key1;
    }

    public void setIs_key1(Integer is_key1) {
        this.is_key1 = is_key1;
    }

    public Integer getEmergency_contact2() {
        return emergency_contact2;
    }

    public void setEmergency_contact2(Integer emergency_contact2) {
        this.emergency_contact2 = emergency_contact2;
    }

    public Integer getEmergency_contact2_relatives() {
        return emergency_contact2_relatives;
    }

    public void setEmergency_contact2_relatives(Integer emergency_contact2_relatives) {
        this.emergency_contact2_relatives = emergency_contact2_relatives;
    }

    public Integer getEmergency_contact2_tel() {
        return emergency_contact2_tel;
    }

    public void setEmergency_contact2_tel(Integer emergency_contact2_tel) {
        this.emergency_contact2_tel = emergency_contact2_tel;
    }

    public Integer getIs_key2() {
        return is_key2;
    }

    public void setIs_key2(Integer is_key2) {
        this.is_key2 = is_key2;
    }

    public Integer getEmergency_contact3() {
        return emergency_contact3;
    }

    public void setEmergency_contact3(Integer emergency_contact3) {
        this.emergency_contact3 = emergency_contact3;
    }

    public Integer getEmergency_contact3_relatives() {
        return emergency_contact3_relatives;
    }

    public void setEmergency_contact3_relatives(Integer emergency_contact3_relatives) {
        this.emergency_contact3_relatives = emergency_contact3_relatives;
    }

    public Integer getEmergency_contact3_tel() {
        return emergency_contact3_tel;
    }

    public void setEmergency_contact3_tel(Integer emergency_contact3_tel) {
        this.emergency_contact3_tel = emergency_contact3_tel;
    }

    public Integer getIs_key3() {
        return is_key3;
    }

    public void setIs_key3(Integer is_key3) {
        this.is_key3 = is_key3;
    }

    public Integer getOldman_zy() {
        return oldman_zy;
    }

    public void setOldman_zy(Integer oldman_zy) {
        this.oldman_zy = oldman_zy;
    }

    public Integer getOldman_category() {
        return oldman_category;
    }

    public void setOldman_category(Integer oldman_category) {
        this.oldman_category = oldman_category;
    }

    public Integer getSpecial_object() {
        return special_object;
    }

    public void setSpecial_object(Integer special_object) {
        this.special_object = special_object;
    }

    public Integer getSources_of_income() {
        return sources_of_income;
    }

    public void setSources_of_income(Integer sources_of_income) {
        this.sources_of_income = sources_of_income;
    }

    public Integer getStatus_of_children() {
        return status_of_children;
    }

    public void setStatus_of_children(Integer status_of_children) {
        this.status_of_children = status_of_children;
    }

    public Integer getMedical_category() {
        return medical_category;
    }

    public void setMedical_category(Integer medical_category) {
        this.medical_category = medical_category;
    }

    public Integer getResidential_status() {
        return residential_status;
    }

    public void setResidential_status(Integer residential_status) {
        this.residential_status = residential_status;
    }

    public Integer getHousing_nature() {
        return housing_nature;
    }

    public void setHousing_nature(Integer housing_nature) {
        this.housing_nature = housing_nature;
    }

    public Integer getHabitable_room() {
        return habitable_room;
    }

    public void setHabitable_room(Integer habitable_room) {
        this.habitable_room = habitable_room;
    }

    public Integer getFloor_lift() {
        return floor_lift;
    }

    public void setFloor_lift(Integer floor_lift) {
        this.floor_lift = floor_lift;
    }

    public Integer getResidential_floor() {
        return residential_floor;
    }

    public void setResidential_floor(Integer residential_floor) {
        this.residential_floor = residential_floor;
    }

    public Integer getIndoor_toilet() {
        return indoor_toilet;
    }

    public void setIndoor_toilet(Integer indoor_toilet) {
        this.indoor_toilet = indoor_toilet;
    }

    public Integer getIndoor_bath_equipment() {
        return indoor_bath_equipment;
    }

    public void setIndoor_bath_equipment(Integer indoor_bath_equipment) {
        this.indoor_bath_equipment = indoor_bath_equipment;
    }

    public Integer getCare_situation() {
        return care_situation;
    }

    public void setCare_situation(Integer care_situation) {
        this.care_situation = care_situation;
    }

    public Integer getGovernment_purchase() {
        return government_purchase;
    }

    public void setGovernment_purchase(Integer government_purchase) {
        this.government_purchase = government_purchase;
    }

    public Integer getServices_requested() {
        return services_requested;
    }

    public void setServices_requested(Integer services_requested) {
        this.services_requested = services_requested;
    }

    public Integer getPhysiclal_health_status() {
        return physiclal_health_status;
    }

    public void setPhysiclal_health_status(Integer physiclal_health_status) {
        this.physiclal_health_status = physiclal_health_status;
    }

    public Integer getPhysiclal_illness_status() {
        return physiclal_illness_status;
    }

    public void setPhysiclal_illness_status(Integer physiclal_illness_status) {
        this.physiclal_illness_status = physiclal_illness_status;
    }

    public Integer getPhysiclal_chronic_status() {
        return physiclal_chronic_status;
    }

    public void setPhysiclal_chronic_status(Integer physiclal_chronic_status) {
        this.physiclal_chronic_status = physiclal_chronic_status;
    }

    public Integer getPsychologic_status() {
        return psychologic_status;
    }

    public void setPsychologic_status(Integer psychologic_status) {
        this.psychologic_status = psychologic_status;
    }

    public Integer getSocial_activities() {
        return social_activities;
    }

    public void setSocial_activities(Integer social_activities) {
        this.social_activities = social_activities;
    }

    public Integer getSocial_activities_type() {
        return social_activities_type;
    }

    public void setSocial_activities_type(Integer social_activities_type) {
        this.social_activities_type = social_activities_type;
    }

    public Integer getDay_activity1() {
        return day_activity1;
    }

    public void setDay_activity1(Integer day_activity1) {
        this.day_activity1 = day_activity1;
    }

    public Integer getDay_activity2() {
        return day_activity2;
    }

    public void setDay_activity2(Integer day_activity2) {
        this.day_activity2 = day_activity2;
    }

    public Integer getDay_activity3() {
        return day_activity3;
    }

    public void setDay_activity3(Integer day_activity3) {
        this.day_activity3 = day_activity3;
    }

    public Integer getDay_activity4() {
        return day_activity4;
    }

    public void setDay_activity4(Integer day_activity4) {
        this.day_activity4 = day_activity4;
    }

    public Integer getDay_activity5() {
        return day_activity5;
    }

    public void setDay_activity5(Integer day_activity5) {
        this.day_activity5 = day_activity5;
    }

    public Integer getDay_activity6() {
        return day_activity6;
    }

    public void setDay_activity6(Integer day_activity6) {
        this.day_activity6 = day_activity6;
    }

    public Integer getDay_activity7() {
        return day_activity7;
    }

    public void setDay_activity7(Integer day_activity7) {
        this.day_activity7 = day_activity7;
    }

    public Integer getCognitive_ability1() {
        return cognitive_ability1;
    }

    public void setCognitive_ability1(Integer cognitive_ability1) {
        this.cognitive_ability1 = cognitive_ability1;
    }

    public Integer getCognitive_ability2() {
        return cognitive_ability2;
    }

    public void setCognitive_ability2(Integer cognitive_ability2) {
        this.cognitive_ability2 = cognitive_ability2;
    }

    public Integer getCognitive_ability3() {
        return cognitive_ability3;
    }

    public void setCognitive_ability3(Integer cognitive_ability3) {
        this.cognitive_ability3 = cognitive_ability3;
    }

    public Integer getCognitive_ability4() {
        return cognitive_ability4;
    }

    public void setCognitive_ability4(Integer cognitive_ability4) {
        this.cognitive_ability4 = cognitive_ability4;
    }

    public Integer getMood_action1() {
        return mood_action1;
    }

    public void setMood_action1(Integer mood_action1) {
        this.mood_action1 = mood_action1;
    }

    public Integer getMood_action2() {
        return mood_action2;
    }

    public void setMood_action2(Integer mood_action2) {
        this.mood_action2 = mood_action2;
    }

    public Integer getMood_action3() {
        return mood_action3;
    }

    public void setMood_action3(Integer mood_action3) {
        this.mood_action3 = mood_action3;
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

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getCommunity() {
        return community;
    }

    public void setCommunity(Integer community) {
        this.community = community;
    }

    public Integer getSign() {
        return sign;
    }

    public void setSign(Integer sign) {
        this.sign = sign;
    }

    public Integer getJudge_sign() {
        return judge_sign;
    }

    public void setJudge_sign(Integer judge_sign) {
        this.judge_sign = judge_sign;
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

    public Integer getAccidentOther() {
        return accidentOther;
    }

    public void setAccidentOther(Integer accidentOther) {
        this.accidentOther = accidentOther;
    }

    public Integer getDay_activity8() {
        return day_activity8;
    }

    public void setDay_activity8(Integer day_activity8) {
        this.day_activity8 = day_activity8;
    }

    public Integer getDay_activity9() {
        return day_activity9;
    }

    public void setDay_activity9(Integer day_activity9) {
        this.day_activity9 = day_activity9;
    }

    public Integer getDay_activity10() {
        return day_activity10;
    }

    public void setDay_activity10(Integer day_activity10) {
        this.day_activity10 = day_activity10;
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
}
