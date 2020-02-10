package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author miaoyueming
 * 身体指数
 */
public class BodyIndex implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    //体脂率
    private Double bodyFatValue;

    //BMI
    private Double bmi;

    //基础代谢率
    private Double bmr;

    //身体水份
    private Double bodyWater;

    //骨量
    private Double bone;

    // 皮下脂肪
    private Double skinFat;

    //内脏脂肪
    private Double visceralFat;

    //肌肉比例
    private Double muscle;

    //身体年龄
    private Integer bodyAge;

    /**体脂率级别 0:正常,1:偏高,2:偏低*/
    private Integer level;

    private String levelName;

    /**BMI级别 -1:偏轻,0:正常,1:超重,2:肥胖*/
    private Integer bmiLevel;

    private String bmiLevelName;

    /**基础代谢率级别 0:未达标,1:达标*/
    private Integer bmrLevel;

    private String bmrLevelName;

    /**身体水份级别 1:偏低,2:标准,3:偏高*/
    private Integer bodyWaterLevel;

    private String bodyWaterLevelName;

    /** 骨量级别 1:偏低,2:标准,3:偏高*/
    private Integer boneLevel;

    private String boneLevelName;

    /** 皮下脂肪级别 1:偏低,2:标准,3:偏高*/
    private Integer skinFatLevel;

    private String skinFatLevelName;

    /**内脏脂肪级别 1:标准,2:偏高,3:过高*/
    private Integer visceralFatLevel;

    private String visceralFatLevelName;

    /** 肌肉比例级别 1:偏低,2:标准,3:偏高*/
    private Integer muscleLevel;

    private String muscleLevelName;

    /** 身体年龄级别 1:小于实际年龄,2:等于实际年龄,3:大于实际年龄*/
    private Integer bodyAgeLevel;

    private String bodyAgeLevelName;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getBodyFatValue() {
        return bodyFatValue;
    }

    public void setBodyFatValue(Double bodyFatValue) {
        this.bodyFatValue = bodyFatValue;
    }

    public Double getBmi() {
        return bmi;
    }

    public void setBmi(Double bmi) {
        this.bmi = bmi;
    }

    public Double getBmr() {
        return bmr;
    }

    public void setBmr(Double bmr) {
        this.bmr = bmr;
    }

    public Double getBodyWater() {
        return bodyWater;
    }

    public void setBodyWater(Double bodyWater) {
        this.bodyWater = bodyWater;
    }

    public Double getBone() {
        return bone;
    }

    public void setBone(Double bone) {
        this.bone = bone;
    }

    public Double getSkinFat() {
        return skinFat;
    }

    public void setSkinFat(Double skinFat) {
        this.skinFat = skinFat;
    }

    public Double getVisceralFat() {
        return visceralFat;
    }

    public void setVisceralFat(Double visceralFat) {
        this.visceralFat = visceralFat;
    }

    public Double getMuscle() {
        return muscle;
    }

    public void setMuscle(Double muscle) {
        this.muscle = muscle;
    }

    public Integer getBodyAge() {
        return bodyAge;
    }

    public void setBodyAge(Integer bodyAge) {
        this.bodyAge = bodyAge;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    public Integer getBmiLevel() {
        return bmiLevel;
    }

    public void setBmiLevel(Integer bmiLevel) {
        this.bmiLevel = bmiLevel;
    }

    public String getBmiLevelName() {
        return bmiLevelName;
    }

    public void setBmiLevelName(String bmiLevelName) {
        this.bmiLevelName = bmiLevelName;
    }

    public Integer getBmrLevel() {
        return bmrLevel;
    }

    public void setBmrLevel(Integer bmrLevel) {
        this.bmrLevel = bmrLevel;
    }

    public String getBmrLevelName() {
        return bmrLevelName;
    }

    public void setBmrLevelName(String bmrLevelName) {
        this.bmrLevelName = bmrLevelName;
    }

    public Integer getBodyWaterLevel() {
        return bodyWaterLevel;
    }

    public void setBodyWaterLevel(Integer bodyWaterLevel) {
        this.bodyWaterLevel = bodyWaterLevel;
    }

    public String getBodyWaterLevelName() {
        return bodyWaterLevelName;
    }

    public void setBodyWaterLevelName(String bodyWaterLevelName) {
        this.bodyWaterLevelName = bodyWaterLevelName;
    }

    public Integer getBoneLevel() {
        return boneLevel;
    }

    public void setBoneLevel(Integer boneLevel) {
        this.boneLevel = boneLevel;
    }

    public String getBoneLevelName() {
        return boneLevelName;
    }

    public void setBoneLevelName(String boneLevelName) {
        this.boneLevelName = boneLevelName;
    }

    public Integer getSkinFatLevel() {
        return skinFatLevel;
    }

    public void setSkinFatLevel(Integer skinFatLevel) {
        this.skinFatLevel = skinFatLevel;
    }

    public String getSkinFatLevelName() {
        return skinFatLevelName;
    }

    public void setSkinFatLevelName(String skinFatLevelName) {
        this.skinFatLevelName = skinFatLevelName;
    }

    public Integer getVisceralFatLevel() {
        return visceralFatLevel;
    }

    public void setVisceralFatLevel(Integer visceralFatLevel) {
        this.visceralFatLevel = visceralFatLevel;
    }

    public String getVisceralFatLevelName() {
        return visceralFatLevelName;
    }

    public void setVisceralFatLevelName(String visceralFatLevelName) {
        this.visceralFatLevelName = visceralFatLevelName;
    }

    public Integer getMuscleLevel() {
        return muscleLevel;
    }

    public void setMuscleLevel(Integer muscleLevel) {
        this.muscleLevel = muscleLevel;
    }

    public String getMuscleLevelName() {
        return muscleLevelName;
    }

    public void setMuscleLevelName(String muscleLevelName) {
        this.muscleLevelName = muscleLevelName;
    }

    public Integer getBodyAgeLevel() {
        return bodyAgeLevel;
    }

    public void setBodyAgeLevel(Integer bodyAgeLevel) {
        this.bodyAgeLevel = bodyAgeLevel;
    }

    public String getBodyAgeLevelName() {
        return bodyAgeLevelName;
    }

    public void setBodyAgeLevelName(String bodyAgeLevelName) {
        this.bodyAgeLevelName = bodyAgeLevelName;
    }
}
