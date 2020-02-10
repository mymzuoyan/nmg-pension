package com.fedtech.pension.portal.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 12349信箱交流表
 * @author gengqiang
 */
public class Letter implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //1-意见 2-咨询 3-投诉 4-其他
    private Integer letterType;

    //意见标题
    private String letterTitle;

    //意见
    private String letterContent;

    //创建时间
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLetterType() {
        return letterType;
    }

    public void setLetterType(Integer letterType) {
        this.letterType = letterType;
    }

    public String getLetterTitle() {
        return letterTitle;
    }

    public void setLetterTitle(String letterTitle) {
        this.letterTitle = letterTitle;
    }

    public String getLetterContent() {
        return letterContent;
    }

    public void setLetterContent(String letterContent) {
        this.letterContent = letterContent;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Letter() {
        super();
    }
}
