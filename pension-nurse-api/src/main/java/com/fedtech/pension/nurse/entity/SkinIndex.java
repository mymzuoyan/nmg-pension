package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author miaoyueming
 *  皮肤指数
 */
public class SkinIndex implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //水份百分比
    private Double waterPercent;

    //油份百分比
    private Double oilPercent;

    /**1——额头 2——眼部 3——脸颊 4——手心 5——手背 6——手腕*/
    private Integer bodyPart;

    /**水份百分比级别 1:干燥,2:正常,3:湿润*/
    private Integer waterPercentLevel;

    private String waterPercentLevelName;

    //油份百分比级别 1:湿润,2:一般,3:偏油
    private Integer oilPercentLevel;

    private String oilPercentLevelName;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getWaterPercent() {
        return waterPercent;
    }

    public void setWaterPercent(Double waterPercent) {
        this.waterPercent = waterPercent;
    }

    public Double getOilPercent() {
        return oilPercent;
    }

    public void setOilPercent(Double oilPercent) {
        this.oilPercent = oilPercent;
    }

    public Integer getBodyPart() {
        return bodyPart;
    }

    public void setBodyPart(Integer bodyPart) {
        this.bodyPart = bodyPart;
    }

    public Integer getWaterPercentLevel() {
        return waterPercentLevel;
    }

    public void setWaterPercentLevel(Integer waterPercentLevel) {
        this.waterPercentLevel = waterPercentLevel;
    }

    public String getWaterPercentLevelName() {
        return waterPercentLevelName;
    }

    public void setWaterPercentLevelName(String waterPercentLevelName) {
        this.waterPercentLevelName = waterPercentLevelName;
    }

    public Integer getOilPercentLevel() {
        return oilPercentLevel;
    }

    public void setOilPercentLevel(Integer oilPercentLevel) {
        this.oilPercentLevel = oilPercentLevel;
    }

    public String getOilPercentLevelName() {
        return oilPercentLevelName;
    }

    public void setOilPercentLevelName(String oilPercentLevelName) {
        this.oilPercentLevelName = oilPercentLevelName;
    }
}
