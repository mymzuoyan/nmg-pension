package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author miaoyueming
 *  体温
 */
public class Temperature implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //体温
    private Double bodyTemperature;

    /**体温级别 1:正常,2:低热,3:中度发热,4:高热*/
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

    public Double getBodyTemperature() {
        return bodyTemperature;
    }

    public void setBodyTemperature(Double bodyTemperature) {
        this.bodyTemperature = bodyTemperature;
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
