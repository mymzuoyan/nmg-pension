package com.fedtech.pension.call.vo;

import java.io.Serializable;

/**
 * @author CoderQiang
 * @date 2017/1/19
 */
public class ComingCallInfoVo implements Serializable {
    private static final Long serialVersionUID = 1L;


    private Integer id;

    private String name;

    private String callNum;

    private String address;

    private String moreAddress;

    private String callType;

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
        this.name = name;
    }

    public String getCallNum() {
        return callNum;
    }

    public void setCallNum(String callNum) {
        this.callNum = callNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMoreAddress() {
        return moreAddress;
    }

    public void setMoreAddress(String moreAddress) {
        this.moreAddress = moreAddress;
    }

    public String getCallType() {
        return callType;
    }

    public void setCallType(String callType) {
        this.callType = callType;
    }

    public ComingCallInfoVo(Integer id, String name, String callNum, String address, String moreAddress, String callType) {
        this.id = id;
        this.name = name;
        this.callNum = callNum;
        this.address = address;
        this.moreAddress = moreAddress;
        this.callType = callType;
    }
}
