package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author fan
 * 血氧
 */
public class BloodOxygen implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 血氧值，单位%
     */
    private Integer spoValue;

    /**
     * 血氧级别 0:低氧血症,1:失饱和状态，2正常
     */
    private Integer level;

    private String levelName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSpoValue() {
        return spoValue;
    }

    public void setSpoValue(Integer spoValue) {
        this.spoValue = spoValue;
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
