package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * 体重
 * @author gxy
 * @date 2019/6/24 - 12:58
 */
public class BodyWeight implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 身高单位cm
     */
    private Double hightVlaue;

    /**
     * 体重，单位kg
     */
    private Double weightValue;

    /**
     * 体质指数
     */
    private Double bmi;

    /**
     * Bmi级别 -1:偏轻,0:正常,1:超重,2:肥胖
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

    public Double getHightVlaue() {
        return hightVlaue;
    }

    public void setHightVlaue(Double hightVlaue) {
        this.hightVlaue = hightVlaue;
    }

    public Double getWeightValue() {
        return weightValue;
    }

    public void setWeightValue(Double weightValue) {
        this.weightValue = weightValue;
    }

    public Double getBmi() {
        return bmi;
    }

    public void setBmi(Double bmi) {
        this.bmi = bmi;
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
