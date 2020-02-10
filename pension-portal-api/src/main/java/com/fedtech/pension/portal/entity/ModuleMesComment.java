package com.fedtech.pension.portal.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 新闻评论表
 * @author CoderQiang
 * @date 2017/5/18
 */
public class ModuleMesComment implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //模块信息id
    private Integer mesId;

    //评论内容
    private String content;

    //评估人
    private Integer fromId;

    //评估人姓名
    private String fromName;

    //--
    private String fromAvatar;

    //被评论人
    private Integer toId;

    //被评论人的姓名
    private String toName;

    //创建时间
    private Date createTime;

    public ModuleMesComment() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMesId() {
        return mesId;
    }

    public void setMesId(Integer mesId) {
        this.mesId = mesId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getFromId() {
        return fromId;
    }

    public void setFromId(Integer fromId) {
        this.fromId = fromId;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public String getFromAvatar() {
        return fromAvatar;
    }

    public void setFromAvatar(String fromAvatar) {
        this.fromAvatar = fromAvatar;
    }

    public Integer getToId() {
        return toId;
    }

    public void setToId(Integer toId) {
        this.toId = toId;
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}

