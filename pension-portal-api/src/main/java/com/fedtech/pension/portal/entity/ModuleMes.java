package com.fedtech.pension.portal.entity;


import com.fedtech.commons.utils.ObjectUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * 新闻表
 * @author Administrator
 * @date 2016/10/12
 */
public class ModuleMes implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //类型id
    private Integer moduleId;

    //类型
    private String module;

    //标题
    private String title;

    //摘要
    private String startText;

    //内容
    private String content;

    //图片
    private String image;

    //发布时间
    private Date createTime;

    //发布者Id
    private Integer creatorId;

    //发布者姓名
    private String creatorName;

    //更新者Id
    private Integer updaterId;

    //更新者姓名
    private String updaterName;

    //更新时间
    private Date updateTime;

    //0未置顶1置顶
    private Integer putTop;

    //阅读数
    private Long viewCount;

    //0:待审核 1：已审核
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public Integer getUpdaterId() {
        return updaterId;
    }

    public void setUpdaterId(Integer updaterId) {
        this.updaterId = updaterId;
    }

    public String getUpdaterName() {
        return updaterName;
    }

    public void setUpdaterName(String updaterName) {
        this.updaterName = updaterName;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStartText() {
        return startText;
    }

    public void setStartText(String startText) {
        this.startText = startText;
    }

    public Integer getPutTop() {
        return putTop;
    }

    public void setPutTop(Integer putTop) {
        this.putTop = putTop;
    }

    public Long getViewCount() {
        return viewCount;
    }

    public void setViewCount(Long viewCount) {
        this.viewCount = viewCount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public ModuleMes() {
        super();
    }

    @Override
    public boolean equals(Object obj) {
        if (ObjectUtils.isNotNull(getId()) && ObjectUtils.isNotNull(((ModuleMes) obj).getId())) {
            if (getId().equals(((ModuleMes) obj).getId()))
                return true;
            else {
                return false;
            }
        } else {
            return false;
        }
    }

   /* @Override
    public int hashCode() {
        return getId().hashCode();
    }*/
}
