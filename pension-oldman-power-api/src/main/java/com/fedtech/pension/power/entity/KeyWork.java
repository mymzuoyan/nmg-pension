package com.fedtech.pension.power.entity;

import java.io.Serializable;
import java.util.List;


/**
 * @author gengqiang
 */
public class KeyWork implements Serializable {

    /**
     *
     */
    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String title;//项目名称

    private String fundtype;//资金管理

    private String aimNum;//目标数

    private String finishNum;//完成目标数

    private String worktype;//重点工作类型

    private String content;//内容

    private String alarmTime;//

    private String createTime;//

    private List<Integer> worktypeList;

    private String worktypeCheckbox;


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

    public String getWorktype() {
        return worktype;
    }

    public void setWorktype(String worktype) {
        this.worktype = worktype;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAlarmTime() {
        return alarmTime;
    }

    public void setAlarmTime(String alarmTime) {
        this.alarmTime = alarmTime;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getFundtype() {
        return fundtype;
    }

    public void setFundtype(String fundtype) {
        this.fundtype = fundtype;
    }

    public String getAimNum() {
        return aimNum;
    }

    public void setAimNum(String aimNum) {
        this.aimNum = aimNum;
    }

    public String getFinishNum() {
        return finishNum;
    }

    public void setFinishNum(String finishNum) {
        this.finishNum = finishNum;
    }

    public List<Integer> getWorktypeList() {
        return worktypeList;
    }

    public void setWorktypeList(List<Integer> worktypeList) {
        this.worktypeList = worktypeList;
    }

    public String getWorktypeCheckbox() {
        return worktypeCheckbox;
    }

    public void setWorktypeCheckbox(String worktypeCheckbox) {
        this.worktypeCheckbox = worktypeCheckbox;
    }
}