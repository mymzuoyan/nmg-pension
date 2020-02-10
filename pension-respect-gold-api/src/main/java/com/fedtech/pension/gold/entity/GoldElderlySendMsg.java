package com.fedtech.pension.gold.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 80岁以上老人发送信息实体
 *  @author DMJ
 *  @date 2019/3/15
 */

public class GoldElderlySendMsg implements Serializable {

      private Integer id;
      //老人id
      private Integer elderId;
      //姓名
      private  String elderName;
      //手机号
      private String telPhone;
      //发送内容
      private String sendContent;
      //发送时间
      private Date sendTime;
      //发送结果
      private Integer result;
      //有效标识
      private Integer isFlag;

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

    public String getTelPhone() {
        return telPhone;
    }

    public void setTelPhone(String telPhone) {
        this.telPhone = telPhone;
    }

    public String getSendContent() {
        return sendContent;
    }

    public void setSendContent(String sendContent) {
        this.sendContent = sendContent;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Integer getIsFlag() {
        return isFlag;
    }

    public void setIsFlag(Integer isFlag) {
        this.isFlag = isFlag;
    }
}
