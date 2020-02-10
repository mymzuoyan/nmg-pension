package com.fedtech.pension.sys.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告接受表
 * @author gengqiang
 */
public class MessageReceive implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 信息id
     */
    private Integer messageId;

    /**
     * 接受人id
     */
    private Integer receiverId;

    /**
     * 0:未读  1:已读
     */
    private Integer read;

    /**
     * 阅读时间
     */
    private Date readTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public Integer getRead() {
        return read;
    }

    public void setRead(Integer read) {
        this.read = read;
    }

    public Date getReadTime() {
        return readTime;
    }

    public void setReadTime(Date readTime) {
        this.readTime = readTime;
    }

    public MessageReceive() {
    }
}