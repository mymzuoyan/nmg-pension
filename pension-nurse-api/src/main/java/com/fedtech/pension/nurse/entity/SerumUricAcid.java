package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author fan
 * 血尿酸
 */
public class SerumUricAcid implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 血尿酸值，单位μmol/L
     */
    private Integer buaValue;

    /**
     * 血尿酸级别 0:偏低,1:正常,2: 偏高
     */
    private Integer level;

    private String levelName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBuaValue() {
        return buaValue;
    }

    public void setBuaValue(Integer buaValue) {
        this.buaValue = buaValue;
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
