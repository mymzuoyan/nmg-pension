package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 *  血压
 * @author gxy
 * @date 2019/6/24 - 11:55
 */
public class BloodPressure implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 收缩压（高压），单位mmHg
     */
    private Double highValue;

    /**
     * 舒张压（低压），单位mmHg
     */
    private Double lowValue;

    /**
     * 脉率单位b
     */
    private Integer pulseValue;

    /**
     * 血压级别 -1:偏低, 0:正常, 1:正常高值,2:1级高血压, 3:2级高血压, 4:3级高血压
     */
    private Integer level;

    private String levelName;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getHighValue() {
        return highValue;
    }

    public void setHighValue(Double highValue) {
        this.highValue = highValue;
    }

    public Double getLowValue() {
        return lowValue;
    }

    public void setLowValue(Double lowValue) {
        this.lowValue = lowValue;
    }

    public Integer getPulseValue() {
        return pulseValue;
    }

    public void setPulseValue(Integer pulseValue) {
        this.pulseValue = pulseValue;
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
}
