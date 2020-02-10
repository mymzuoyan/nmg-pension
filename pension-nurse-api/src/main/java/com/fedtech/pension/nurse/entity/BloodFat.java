package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 *  血脂
 * @author gxy
 * @date 2019/6/24 - 13:03
 */
public class BloodFat implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 总胆固醇，单位mmol
     */
    private Double cholValue;

    /**
     * 甘油三酯，单位mmol
     */
    private Double trigValue;

    /**
     * 高密度脂蛋白胆固醇，单位mmol
     */
    private  Double hdlValue;

    /**
     * 低密度脂蛋白胆固醇，单位mmol
     */
    private  Double ldlValue;

    /**
     * 血脂级别 1:正常,2:异常
     */
    private Integer level;

    private String levelName;

    /**
     * 总胆固醇级别 0:正常1:偏高
     */
    private Integer cholLevel;

    private String cholLevelName;

    /**
     * 高密度脂蛋白胆固醇级别 0:正常,1:偏低
     */
    private Integer hdlLevel;

    private String hdlLevelName;

    /**
     *  //低密度脂蛋白胆固醇级别 0:正常,1:偏高
     */
    private Integer ldlLevel;

    private String ldlLevelName;

    /**
     * 甘油三酯级别 0:正常,1:偏高
     */
    private Integer trigLevel;

    private String trigLevelName;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getCholValue() {
        return cholValue;
    }

    public void setCholValue(Double cholValue) {
        this.cholValue = cholValue;
    }

    public Double getTrigValue() {
        return trigValue;
    }

    public void setTrigValue(Double trigValue) {
        this.trigValue = trigValue;
    }

    public Double getHdlValue() {
        return hdlValue;
    }

    public void setHdlValue(Double hdlValue) {
        this.hdlValue = hdlValue;
    }

    public Double getLdlValue() {
        return ldlValue;
    }

    public void setLdlValue(Double ldlValue) {
        this.ldlValue = ldlValue;
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

    public Integer getCholLevel() {
        return cholLevel;
    }

    public void setCholLevel(Integer cholLevel) {
        this.cholLevel = cholLevel;
    }

    public String getCholLevelName() {
        return cholLevelName;
    }

    public void setCholLevelName(String cholLevelName) {
        this.cholLevelName = cholLevelName;
    }

    public Integer getHdlLevel() {
        return hdlLevel;
    }

    public void setHdlLevel(Integer hdlLevel) {
        this.hdlLevel = hdlLevel;
    }

    public String getHdlLevelName() {
        return hdlLevelName;
    }

    public void setHdlLevelName(String hdlLevelName) {
        this.hdlLevelName = hdlLevelName;
    }

    public Integer getLdlLevel() {
        return ldlLevel;
    }

    public void setLdlLevel(Integer ldlLevel) {
        this.ldlLevel = ldlLevel;
    }

    public String getLdlLevelName() {
        return ldlLevelName;
    }

    public void setLdlLevelName(String ldlLevelName) {
        this.ldlLevelName = ldlLevelName;
    }

    public Integer getTrigLevel() {
        return trigLevel;
    }

    public void setTrigLevel(Integer trigLevel) {
        this.trigLevel = trigLevel;
    }

    public String getTrigLevelName() {
        return trigLevelName;
    }

    public void setTrigLevelName(String trigLevelName) {
        this.trigLevelName = trigLevelName;
    }
}
