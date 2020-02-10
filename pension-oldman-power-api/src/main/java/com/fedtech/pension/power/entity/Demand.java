package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Demand implements Serializable {
    private Integer id;
    private Integer impoverishedObject ;//特困对象
    private Integer subsistenceObject;//低保对象
    private Integer liveAlone;//独居
    private Integer emptyNest;//空巢
    private Integer livingChildren;//与子女共住
    private Integer agaa;//90岁<=age
    private Integer ageb;//80岁 <age<=89岁
    private Integer agec;//70岁<age<= 79岁
    private Integer aged;//60岁<age<= 69岁
    private Integer modelWorker;//市（州）级以上劳模
    private Integer preferentialObject;//重点优抚对象
    private Integer planObject;//计生特扶对象
    private Integer minimumScore;//一档最低分
    private Integer highestScore;//一档最高分
    private Integer secondMinimumScore;//二档最低分
    private Integer secondHighestScore;//二档最高分

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getImpoverishedObject() {
        return impoverishedObject;
    }

    public void setImpoverishedObject(Integer impoverishedObject) {
        this.impoverishedObject = impoverishedObject;
    }

    public Integer getSubsistenceObject() {
        return subsistenceObject;
    }

    public void setSubsistenceObject(Integer subsistenceObject) {
        this.subsistenceObject = subsistenceObject;
    }

    public Integer getLiveAlone() {
        return liveAlone;
    }

    public void setLiveAlone(Integer liveAlone) {
        this.liveAlone = liveAlone;
    }

    public Integer getEmptyNest() {
        return emptyNest;
    }

    public void setEmptyNest(Integer emptyNest) {
        this.emptyNest = emptyNest;
    }

    public Integer getLivingChildren() {
        return livingChildren;
    }

    public void setLivingChildren(Integer livingChildren) {
        this.livingChildren = livingChildren;
    }

    public Integer getAgaa() {
        return agaa;
    }

    public void setAgaa(Integer agaa) {
        this.agaa = agaa;
    }

    public Integer getAgeb() {
        return ageb;
    }

    public void setAgeb(Integer ageb) {
        this.ageb = ageb;
    }

    public Integer getAgec() {
        return agec;
    }

    public void setAgec(Integer agec) {
        this.agec = agec;
    }

    public Integer getAged() {
        return aged;
    }

    public void setAged(Integer aged) {
        this.aged = aged;
    }

    public Integer getModelWorker() {
        return modelWorker;
    }

    public void setModelWorker(Integer modelWorker) {
        this.modelWorker = modelWorker;
    }

    public Integer getPreferentialObject() {
        return preferentialObject;
    }

    public void setPreferentialObject(Integer preferentialObject) {
        this.preferentialObject = preferentialObject;
    }

    public Integer getPlanObject() {
        return planObject;
    }

    public void setPlanObject(Integer planObject) {
        this.planObject = planObject;
    }

    public Integer getMinimumScore() {
        return minimumScore;
    }

    public void setMinimumScore(Integer minimumScore) {
        this.minimumScore = minimumScore;
    }

    public Integer getHighestScore() {
        return highestScore;
    }

    public void setHighestScore(Integer highestScore) {
        this.highestScore = highestScore;
    }

    public Integer getSecondMinimumScore() {
        return secondMinimumScore;
    }

    public void setSecondMinimumScore(Integer secondMinimumScore) {
        this.secondMinimumScore = secondMinimumScore;
    }

    public Integer getSecondHighestScore() {
        return secondHighestScore;
    }

    public void setSecondHighestScore(Integer secondHighestScore) {
        this.secondHighestScore = secondHighestScore;
    }
}
