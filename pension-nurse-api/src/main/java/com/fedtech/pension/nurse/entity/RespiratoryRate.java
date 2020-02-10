package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author fan
 * 呼吸率
 */
public class RespiratoryRate implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 呼吸率 1:呼吸过缓 2:正常 3:呼吸过快
     */
    private Double breathFreq;

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

    public Double getBreathFreq() {
        return breathFreq;
    }

    public void setBreathFreq(Double breathFreq) {
        this.breathFreq = breathFreq;
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
