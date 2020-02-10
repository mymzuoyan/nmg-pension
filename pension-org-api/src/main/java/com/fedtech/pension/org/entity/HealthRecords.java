package com.fedtech.pension.org.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author guxiangyang
 * @date 2019/9/17
 */
public class HealthRecords implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 年龄
     */
    private String age;

    /**
     * 性别
     */
    private String gender;

    /**
     * 记录时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") //入参
    private Date clock;
    /**
     * 肝炎患病时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") //入参
    private Date hepatitis;
    /**
     * 痢疾患病时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") //入参
    private Date dysentery;
    /**
     * 伤寒患病时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") //入参
    private Date typhia;
    /**
     * 肺结核患病时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") //入参
    private Date tuberculosis;
    /**
     * 皮肤病患病时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") //入参
    private Date tetter;
    /**
     * 心
     */
    private String heart;
    /**
     * 肝
     */
    private String liver;
    /**
     * 脾
     */
    private String spleen;
    /**
     * 肺
     */
    private String lung;
    /**
     * 其他病史
     */
    private String rests;
    /**
     * 体征1.皮肤2.手癣3.银屑（或鳞屑）病4.渗出性皮肤病5.化脓性皮肤病
     */
    private String sign;

    private Integer startAge;
    private Integer endAge;

    private String signCheckbox;

    private List<Integer> elderTypeList;

    public List<Integer> getElderTypeList() {
        return elderTypeList;
    }

    public void setElderTypeList(List<Integer> elderTypeList) {
        this.elderTypeList = elderTypeList;
    }

    public String getSignCheckbox() {
        return signCheckbox;
    }

    public void setSignCheckbox(String signCheckbox) {
        this.signCheckbox = signCheckbox;
    }

    public Integer getStartAge() {
        return startAge;
    }

    public void setStartAge(Integer startAge) {
        this.startAge = startAge;
    }

    public Integer getEndAge() {
        return endAge;
    }

    public void setEndAge(Integer endAge) {
        this.endAge = endAge;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getClock() {
        return clock;
    }

    public void setClock(Date clock) {
        this.clock = clock;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getHepatitis() {
        return hepatitis;
    }

    public void setHepatitis(Date hepatitis) {
        this.hepatitis = hepatitis;
    }

    public Date getDysentery() {
        return dysentery;
    }

    public void setDysentery(Date dysentery) {
        this.dysentery = dysentery;
    }

    public Date getTyphia() {
        return typhia;
    }

    public void setTyphia(Date typhia) {
        this.typhia = typhia;
    }

    public Date getTuberculosis() {
        return tuberculosis;
    }

    public void setTuberculosis(Date tuberculosis) {
        this.tuberculosis = tuberculosis;
    }

    public Date getTetter() {
        return tetter;
    }

    public void setTetter(Date tetter) {
        this.tetter = tetter;
    }

    public String getHeart() {
        return heart;
    }

    public void setHeart(String heart) {
        this.heart = heart == null ? null : heart.trim();
    }

    public String getLiver() {
        return liver;
    }

    public void setLiver(String liver) {
        this.liver = liver == null ? null : liver.trim();
    }

    public String getSpleen() {
        return spleen;
    }

    public void setSpleen(String spleen) {
        this.spleen = spleen == null ? null : spleen.trim();
    }

    public String getLung() {
        return lung;
    }

    public void setLung(String lung) {
        this.lung = lung == null ? null : lung.trim();
    }

    public String getRests() {
        return rests;
    }

    public void setRests(String rests) {
        this.rests = rests == null ? null : rests.trim();
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign == null ? null : sign.trim();
    }
}