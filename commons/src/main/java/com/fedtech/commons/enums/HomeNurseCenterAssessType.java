package com.fedtech.commons.enums;

/**
 * 居家护理综合中心文件上传字段
 * Created by zhnn on 2017/8/25.
 */
public enum HomeNurseCenterAssessType {

    File1("Category1", "Thumb1", "Remark1"),
    File2("Category2", "Thumb2", "Remark2"),
    File3("Category3", "Thumb3", "Remark3"),
    File4("Category4", "Thumb4", "Remark4");

    private String category;
    private String thumb;
    private String remark;

    HomeNurseCenterAssessType(String category, String thumb, String remark) {
        this.category = category;
        this.thumb = thumb;
        this.remark = remark;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
