package com.fedtech.pension.org.vo;

import java.io.Serializable;

/**
 * @author gengqiang
 * @date 2019/7/3
 */
public class ServiceOrgSubsidyApplyStatistic implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**
     * 区划名称
     */
    private String areaName;


    private Long count;

    /**
     * 数量 建设补贴
     */
    private Long jsCount;

    /**
     * 待审核 建设补贴
     */
    private Long jsUndoCount;

    /**
     * 审核通过 建设补贴
     */
    private Long jsDoneCount;

    /**
     * 审核不通过 建设补贴
     */
    private Long jsRefuseCount;

    /**
     * 数量 运营补贴
     */
    private Long yyCount;

    /**
     * 待审核 运营补贴
     */
    private Long yyUndoCount;

    /**
     * 审核通过 运营补贴
     */
    private Long yyDoneCount;

    /**
     * 审核不通过 运营补贴
     */
    private Long yyRefuseCount;


    /**
     * 区划id
     */
    private Integer areaId;


    /**
     * 区域级别
     */
    private Integer areaLevel;

    /**
     * 补贴类型 1.建设补贴 2:运营补贴
     */
    private Integer subsidyType;

    /**
     * 补贴对象 1:养老机构 2.养老服务组织 3。助餐点 4.助浴点
     */
    private Integer subsidyObject;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }


    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Long getJsCount() {
        return jsCount;
    }

    public void setJsCount(Long jsCount) {
        this.jsCount = jsCount;
    }

    public Long getJsUndoCount() {
        return jsUndoCount;
    }

    public void setJsUndoCount(Long jsUndoCount) {
        this.jsUndoCount = jsUndoCount;
    }

    public Long getJsDoneCount() {
        return jsDoneCount;
    }

    public void setJsDoneCount(Long jsDoneCount) {
        this.jsDoneCount = jsDoneCount;
    }

    public Long getJsRefuseCount() {
        return jsRefuseCount;
    }

    public void setJsRefuseCount(Long jsRefuseCount) {
        this.jsRefuseCount = jsRefuseCount;
    }

    public Long getYyCount() {
        return yyCount;
    }

    public void setYyCount(Long yyCount) {
        this.yyCount = yyCount;
    }

    public Long getYyUndoCount() {
        return yyUndoCount;
    }

    public void setYyUndoCount(Long yyUndoCount) {
        this.yyUndoCount = yyUndoCount;
    }

    public Long getYyDoneCount() {
        return yyDoneCount;
    }

    public void setYyDoneCount(Long yyDoneCount) {
        this.yyDoneCount = yyDoneCount;
    }

    public Long getYyRefuseCount() {
        return yyRefuseCount;
    }

    public void setYyRefuseCount(Long yyRefuseCount) {
        this.yyRefuseCount = yyRefuseCount;
    }

    public Integer getAreaLevel() {
        return areaLevel;
    }

    public void setAreaLevel(Integer areaLevel) {
        this.areaLevel = areaLevel;
    }

    public Integer getSubsidyType() {
        return subsidyType;
    }

    public void setSubsidyType(Integer subsidyType) {
        this.subsidyType = subsidyType;
    }

    public Integer getSubsidyObject() {
        return subsidyObject;
    }

    public void setSubsidyObject(Integer subsidyObject) {
        this.subsidyObject = subsidyObject;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }
}
