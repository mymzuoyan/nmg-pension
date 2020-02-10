package com.fedtech.pension.cdr.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Cdr implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private Date calldate;

    private String clid;

    private String src;

    private String dst;

    private String dcontext;

    private String channel;

    private String dstchannel;

    private String lastapp;

    private String lastdata;

    private Date start;

    private Date answer;

    private Date end;

    private Integer duration;

    private Integer billsec;

    private String disposition;

    private Integer amaflags;

    private String accountcode;

    private String peeraccount;

    private String uniqueid;

    private String linkedid;

    private String userfield;

    private String sequence;

    private String billingid;

    private Byte billed;

    private String city;

    private String samecall;

    private Integer succ;

    private BigDecimal bill;

    private Boolean musictype;

    private Integer servicelevel;

    private String agentid;

    private String recording;

    private String option;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCalldate() {
        return calldate;
    }

    public void setCalldate(Date calldate) {
        this.calldate = calldate;
    }

    public String getClid() {
        return clid;
    }

    public void setClid(String clid) {
        this.clid = clid == null ? null : clid.trim();
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src == null ? null : src.trim();
    }

    public String getDst() {
        return dst;
    }

    public void setDst(String dst) {
        this.dst = dst == null ? null : dst.trim();
    }

    public String getDcontext() {
        return dcontext;
    }

    public void setDcontext(String dcontext) {
        this.dcontext = dcontext == null ? null : dcontext.trim();
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel == null ? null : channel.trim();
    }

    public String getDstchannel() {
        return dstchannel;
    }

    public void setDstchannel(String dstchannel) {
        this.dstchannel = dstchannel == null ? null : dstchannel.trim();
    }

    public String getLastapp() {
        return lastapp;
    }

    public void setLastapp(String lastapp) {
        this.lastapp = lastapp == null ? null : lastapp.trim();
    }

    public String getLastdata() {
        return lastdata;
    }

    public void setLastdata(String lastdata) {
        this.lastdata = lastdata == null ? null : lastdata.trim();
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getAnswer() {
        return answer;
    }

    public void setAnswer(Date answer) {
        this.answer = answer;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Integer getBillsec() {
        return billsec;
    }

    public void setBillsec(Integer billsec) {
        this.billsec = billsec;
    }

    public String getDisposition() {
        return disposition;
    }

    public void setDisposition(String disposition) {
        this.disposition = disposition == null ? null : disposition.trim();
    }

    public Integer getAmaflags() {
        return amaflags;
    }

    public void setAmaflags(Integer amaflags) {
        this.amaflags = amaflags;
    }

    public String getAccountcode() {
        return accountcode;
    }

    public void setAccountcode(String accountcode) {
        this.accountcode = accountcode == null ? null : accountcode.trim();
    }

    public String getPeeraccount() {
        return peeraccount;
    }

    public void setPeeraccount(String peeraccount) {
        this.peeraccount = peeraccount == null ? null : peeraccount.trim();
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

    public String getUserfield() {
        return userfield;
    }

    public void setUserfield(String userfield) {
        this.userfield = userfield == null ? null : userfield.trim();
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence == null ? null : sequence.trim();
    }

    public String getBillingid() {
        return billingid;
    }

    public void setBillingid(String billingid) {
        this.billingid = billingid == null ? null : billingid.trim();
    }

    public Byte getBilled() {
        return billed;
    }

    public void setBilled(Byte billed) {
        this.billed = billed;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getSamecall() {
        return samecall;
    }

    public void setSamecall(String samecall) {
        this.samecall = samecall == null ? null : samecall.trim();
    }

    public Integer getSucc() {
        return succ;
    }

    public void setSucc(Integer succ) {
        this.succ = succ;
    }

    public BigDecimal getBill() {
        return bill;
    }

    public void setBill(BigDecimal bill) {
        this.bill = bill;
    }

    public Boolean getMusictype() {
        return musictype;
    }

    public void setMusictype(Boolean musictype) {
        this.musictype = musictype;
    }

    public Integer getServicelevel() {
        return servicelevel;
    }

    public void setServicelevel(Integer servicelevel) {
        this.servicelevel = servicelevel;
    }

    public String getAgentid() {
        return agentid;
    }

    public void setAgentid(String agentid) {
        this.agentid = agentid == null ? null : agentid.trim();
    }

    public String getRecording() {
        return recording;
    }

    public void setRecording(String recording) {
        this.recording = recording == null ? null : recording.trim();
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option == null ? null : option.trim();
    }

    @Override
    public String toString() {
        return "Cdr{" +
                "id=" + id +
                ", calldate=" + calldate +
                ", clid='" + clid + '\'' +
                ", src='" + src + '\'' +
                ", dst='" + dst + '\'' +
                ", dcontext='" + dcontext + '\'' +
                ", channel='" + channel + '\'' +
                ", dstchannel='" + dstchannel + '\'' +
                ", lastapp='" + lastapp + '\'' +
                ", lastdata='" + lastdata + '\'' +
                ", start=" + start +
                ", answer=" + answer +
                ", end=" + end +
                ", duration=" + duration +
                ", billsec=" + billsec +
                ", disposition='" + disposition + '\'' +
                ", amaflags=" + amaflags +
                ", accountcode='" + accountcode + '\'' +
                ", peeraccount='" + peeraccount + '\'' +
                ", uniqueid='" + uniqueid + '\'' +
                ", linkedid='" + linkedid + '\'' +
                ", userfield='" + userfield + '\'' +
                ", sequence='" + sequence + '\'' +
                ", billingid='" + billingid + '\'' +
                ", billed=" + billed +
                ", city='" + city + '\'' +
                ", samecall='" + samecall + '\'' +
                ", succ=" + succ +
                ", bill=" + bill +
                ", musictype=" + musictype +
                ", servicelevel=" + servicelevel +
                ", agentid='" + agentid + '\'' +
                ", recording='" + recording + '\'' +
                ", option='" + option + '\'' +
                '}';
    }

    public Cdr() {
    }
}