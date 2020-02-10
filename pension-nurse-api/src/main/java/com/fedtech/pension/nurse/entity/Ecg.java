package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author fan
 * 心电
 */
public class Ecg implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 心率
     */
    private Integer heartRate;

    /**
     * 漏博次数
     */
    private Integer leakCount;

    /**
     * 停博次数
     */
    private Integer stopCount;

    /**
     * 心律不齐次数
     */
    private  Integer irregularCount;

    /**
     * 心率过快次数
     */
    private Integer fastCount;

    /**
     * 心率过慢次数
     */
    private Integer slowCount;

    /**
     * 心电波形
     */
    private Integer filteredEcgPoints;

    /**
     * 心电级别1:疑似窦性停博
     *         2:窦性心动过缓
     *         3:窦性心动稍缓，窦性心律正常
     *         4:窦性心动稍缓，窦性心律不齐
     *         5:窦性心动正常，窦性心律不齐
     *         6:窦性心动正常
     *         7:窦性心动稍快，窦性心律正常
     *         8:窦性心动稍快，窦性心律不齐
     *         9:窦性心动过快
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

    public Integer getHeartRate() {
        return heartRate;
    }

    public void setHeartRate(Integer heartRate) {
        this.heartRate = heartRate;
    }

    public Integer getLeakCount() {
        return leakCount;
    }

    public void setLeakCount(Integer leakCount) {
        this.leakCount = leakCount;
    }

    public Integer getStopCount() {
        return stopCount;
    }

    public void setStopCount(Integer stopCount) {
        this.stopCount = stopCount;
    }

    public Integer getIrregularCount() {
        return irregularCount;
    }

    public void setIrregularCount(Integer irregularCount) {
        this.irregularCount = irregularCount;
    }

    public Integer getFastCount() {
        return fastCount;
    }

    public void setFastCount(Integer fastCount) {
        this.fastCount = fastCount;
    }

    public Integer getSlowCount() {
        return slowCount;
    }

    public void setSlowCount(Integer slowCount) {
        this.slowCount = slowCount;
    }

    public Integer getFilteredEcgPoints() {
        return filteredEcgPoints;
    }

    public void setFilteredEcgPoints(Integer filteredEcgPoints) {
        this.filteredEcgPoints = filteredEcgPoints;
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
