
package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 *  血糖
 * @author gxy
 * @date 2019/6/24 - 12:01
 */
public class BloodSugar implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 血糖值，单位mmol/L
     */
    private Double sugarValue;

    /**
     * 血糖类别，如此为空则根据typeDetailCode判断。空腹血糖:1,餐后血糖:2
     */
    private Integer typeCode;

    /**
     * 血糖类别明细。空腹1、早餐后2、午餐前3、午餐后4、晚餐前5、晚餐后6、睡前7、夜间8
     */
    private Integer typeDetailCode;

    /**
     * 血糖级别 0:偏低,1:正常,2:偏高,3:较高,4:过高
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

    public Double getSugarValue() {
        return sugarValue;
    }

    public void setSugarValue(Double sugarValue) {
        this.sugarValue = sugarValue;
    }

    public Integer getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(Integer typeCode) {
        this.typeCode = typeCode;
    }

    public Integer getTypeDetailCodeint() {
        return typeDetailCode;
    }

    public void setTypeDetailCodeint(Integer typeDetailCodeint) {
        this.typeDetailCode = typeDetailCodeint;
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
