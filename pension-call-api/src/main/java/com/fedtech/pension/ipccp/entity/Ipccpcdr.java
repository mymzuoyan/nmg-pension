package com.fedtech.pension.ipccp.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class Ipccpcdr implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String channel;

    private String callerid;

    private Date calldate;

    private String customerid;

    private String sheetid;

    private String queue;

    private String uniqueid;

    private String linkedid;

    private Date qtime;

    private String digits;

    private String agentid;

    private String name;

    private Date ringtime;

    private Date answertime;

    private Integer waittime;

    private Date hanguptime;

    private Integer duration;

    private String extension;

    private Integer servicelevel;

    private String billingid;

    private String ivrselection;

    private Boolean musictype;

    private String hangupreason;

    private String recording;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getCallerid() {
        return callerid;
    }

    public void setCallerid(String callerid) {
        this.callerid = callerid;
    }

    public Date getCalldate() {
        return calldate;
    }

    public void setCalldate(Date calldate) {
        this.calldate = calldate;
    }

    public String getCustomerid() {
        return customerid;
    }

    public void setCustomerid(String customerid) {
        this.customerid = customerid;
    }

    public String getSheetid() {
        return sheetid;
    }

    public void setSheetid(String sheetid) {
        this.sheetid = sheetid;
    }

    public String getQueue() {
        return queue;
    }

    public void setQueue(String queue) {
        this.queue = queue;
    }

    public String getUniqueid() {
        return uniqueid;
    }

    public void setUniqueid(String uniqueid) {
        this.uniqueid = uniqueid;
    }

    public String getLinkedid() {
        return linkedid;
    }

    public void setLinkedid(String linkedid) {
        this.linkedid = linkedid;
    }

    public Date getQtime() {
        return qtime;
    }

    public void setQtime(Date qtime) {
        this.qtime = qtime;
    }

    public String getDigits() {
        return digits;
    }

    public void setDigits(String digits) {
        this.digits = digits;
    }

    public String getAgentid() {
        return agentid;
    }

    public void setAgentid(String agentid) {
        this.agentid = agentid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getRingtime() {
        return ringtime;
    }

    public void setRingtime(Date ringtime) {
        this.ringtime = ringtime;
    }

    public Date getAnswertime() {
        return answertime;
    }

    public void setAnswertime(Date answertime) {
        this.answertime = answertime;
    }

    public Integer getWaittime() {
        return waittime;
    }

    public void setWaittime(Integer waittime) {
        this.waittime = waittime;
    }

    public Date getHanguptime() {
        return hanguptime;
    }

    public void setHanguptime(Date hanguptime) {
        this.hanguptime = hanguptime;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public Integer getServicelevel() {
        return servicelevel;
    }

    public void setServicelevel(Integer servicelevel) {
        this.servicelevel = servicelevel;
    }

    public String getBillingid() {
        return billingid;
    }

    public void setBillingid(String billingid) {
        this.billingid = billingid;
    }

    public String getIvrselection() {
        return ivrselection;
    }

    public void setIvrselection(String ivrselection) {
        this.ivrselection = ivrselection;
    }

    public Boolean getMusictype() {
        return musictype;
    }

    public void setMusictype(Boolean musictype) {
        this.musictype = musictype;
    }

    public String getHangupreason() {
        return hangupreason;
    }

    public void setHangupreason(String hangupreason) {
        this.hangupreason = hangupreason;
    }

    public String getRecording() {
        return recording;
    }

    public void setRecording(String recording) {
        this.recording = recording;
    }
}