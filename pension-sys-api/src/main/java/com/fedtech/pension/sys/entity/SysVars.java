package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * 系统参数
 * @author GQ
 * @date 16/5/12
 */
public class SysVars implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer varsId;
    /**
     * 参数名称
     */
    private String varsName;

    /**
     * 参数值
     */
    private String varsValue;

    /**
     * 参数说明
     */
    private String varsContent;

    public Integer getVarsId() {
        return varsId;
    }

    public void setVarsId(Integer varsId) {
        this.varsId = varsId;
    }

    public String getVarsName() {
        return varsName;
    }

    public void setVarsName(String varsName) {
        this.varsName = varsName;
    }

    public String getVarsValue() {
        return varsValue;
    }

    public void setVarsValue(String varsValue) {
        this.varsValue = varsValue;
    }

    public String getVarsContent() {
        return varsContent;
    }

    public void setVarsContent(String varsContent) {
        this.varsContent = varsContent;
    }
}
