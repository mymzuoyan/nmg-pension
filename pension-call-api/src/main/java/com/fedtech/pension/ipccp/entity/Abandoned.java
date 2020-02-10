package com.fedtech.pension.ipccp.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class Abandoned implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private Date qtime;

    private String callerid;

    private Date calldate;

    private String uniqueid;

    private String linkedid;

    private String queue;

    private String digits;

    private Date hanguptime;

    private Integer position;

    private Integer duration;

    private Boolean callbacked;

    private Date callbackdate;

    private String callbackagent;

    private String ivrselection;

    private String billingid;

    private String recording;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getQtime() {
        return qtime;
    }

    public void setQtime(Date qtime) {
        this.qtime = qtime;
    }

    public String getCallerid() {
        return callerid;
    }

    public void setCallerid(String callerid) {
        this.callerid = callerid == null ? null : callerid.trim();
    }

    public Date getCalldate() {
        return calldate;
    }

    public void setCalldate(Date calldate) {
        this.calldate = calldate;
    }

    public String getUniqueid() {
        return uniqueid;
    }

    public void setUniqueid(String uniqueid) {
        this.uniqueid = uniqueid == null ? null : uniqueid.trim();
    }

    public String getLinkedid() {
        return linkedid;
    }

    public void setLinkedid(String linkedid) {
        this.linkedid = linkedid == null ? null : linkedid.trim();
    }

    public String getQueue() {
        return queue;
    }

    public void setQueue(String queue) {
        this.queue = queue == null ? null : queue.trim();
    }

    public String getDigits() {
        return digits;
    }

    public void setDigits(String digits) {
        this.digits = digits == null ? null : digits.trim();
    }

    public Date getHanguptime() {
        return hanguptime;
    }

    public void setHanguptime(Date hanguptime) {
        this.hanguptime = hanguptime;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Boolean getCallbacked() {
        return callbacked;
    }

    public void setCallbacked(Boolean callbacked) {
        this.callbacked = callbacked;
    }

    public Date getCallbackdate() {
        return callbackdate;
    }

    public void setCallbackdate(Date callbackdate) {
        this.callbackdate = callbackdate;
    }

    public String getCallbackagent() {
        return callbackagent;
    }

    public void setCallbackagent(String callbackagent) {
        this.callbackagent = callbackagent == null ? null : callbackagent.trim();
    }

    public String getIvrselection() {
        return ivrselection;
    }

    public void setIvrselection(String ivrselection) {
        this.ivrselection = ivrselection == null ? null : ivrselection.trim();
    }

    public String getBillingid() {
        return billingid;
    }

    public void setBillingid(String billingid) {
        this.billingid = billingid == null ? null : billingid.trim();
    }

    public String getRecording() {
        return recording;
    }

    public void setRecording(String recording) {
        this.recording = recording == null ? null : recording.trim();
    }


}