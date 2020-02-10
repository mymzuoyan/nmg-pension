package com.fedtech.pension.portal.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 广告信息表
 * @author Administrator
 * @date 2016/12/15
 */
public class Advertisement implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //标题
    private String title;

    //关联地址
    private String linkUrl;

    //图片路径
    private String imageFile;

    //用途
    private Integer purpose;

    //开始时间
    private Date startTime;

    //结束时间
    private Date endTime;

    //排序
    private Integer sort;

    public Advertisement() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getImageFile() {
        return imageFile;
    }

    public void setImageFile(String imageFile) {
        this.imageFile = imageFile;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }


    public Integer getPurpose() {
        return purpose;
    }

    public void setPurpose(Integer purpose) {
        this.purpose = purpose;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
