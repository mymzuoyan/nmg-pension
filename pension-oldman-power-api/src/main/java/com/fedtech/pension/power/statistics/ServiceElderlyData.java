package com.fedtech.pension.power.statistics;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 * @date 2019/6/17
 */
public class ServiceElderlyData implements Serializable {
    private static final Long serialVersionUID = 1L;

    /**
     * 身份证
     */
    private String idcardno;

    /**
     * 今年的服务量
     */
    private Integer yearCount;


    /**
     * 当天的服务量
     */
    private Integer DayCount;


    /**
     * 刷卡
     */
    private Integer cardYearCount;

    /**
     * 二维码
     */
    private Integer qrCodeYearCount;

    /**
     * 刷卡
     */
    private Integer cardDayCount;

    /**
     * 二维码
     */
    private Integer qrCodeDayCount;

    /**
     * 最近的服务时间
     */
    private Date lastDate;

    public ServiceElderlyData() {
        yearCount = 0;
        cardYearCount = 0;
        cardDayCount = 0;
        DayCount = 0;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public Integer getYearCount() {
        return yearCount;
    }

    public void setYearCount(Integer yearCount) {
        this.yearCount = yearCount;
    }

    public Integer getDayCount() {
        return DayCount;
    }

    public void setDayCount(Integer dayCount) {
        DayCount = dayCount;
    }

    public Date getLastDate() {
        return lastDate;
    }

    public void setLastDate(Date lastDate) {
        this.lastDate = lastDate;
    }

    public Integer getCardYearCount() {
        return cardYearCount;
    }

    public void setCardYearCount(Integer cardYearCount) {
        this.cardYearCount = cardYearCount;
    }

    public Integer getQrCodeYearCount() {
        return qrCodeYearCount;
    }

    public void setQrCodeYearCount(Integer qrCodeYearCount) {
        this.qrCodeYearCount = qrCodeYearCount;
    }

    public Integer getCardDayCount() {
        return cardDayCount;
    }

    public void setCardDayCount(Integer cardDayCount) {
        this.cardDayCount = cardDayCount;
    }

    public Integer getQrCodeDayCount() {
        return qrCodeDayCount;
    }

    public void setQrCodeDayCount(Integer qrCodeDayCount) {
        this.qrCodeDayCount = qrCodeDayCount;
    }
}
