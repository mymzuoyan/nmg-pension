package com.fedtech.pension.elderly.entity;


import java.io.Serializable;

/**
 * @author gengqiang
 */
public class ElderlyMsgApp implements Serializable {

    private static final Long serialVersionUID = 1L;


    private Integer id;
    /**
     * 老人id
     */
    private Integer elderId;
    /**
     * 老人姓名
     */
    private String elderName;
    /**
     * 身份证
     */
    private String idcardno;
    /**
     * 手机
     */
    private String mobile;
    /**
     *地址
     */
    private String realAddress;
    private Integer userId;

    private Integer count;//列表上拉更多
    private String searchWord;//搜索词

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}