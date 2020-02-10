package com.fedtech.pension.task.vo;

import java.io.Serializable;
import java.util.List;

/**
 * @author gengqiang
 * @date 2017/7/17
 */
public class ServiceOrgTaskMoneyVo implements Serializable {
    private Integer serviceOrgId;
    private String serviceOrgName;
    private String areaName;
    private List<TaskMoneyVo> taskMoneyVos;

    public ServiceOrgTaskMoneyVo() {
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public List<TaskMoneyVo> getTaskMoneyVos() {
        return taskMoneyVos;
    }

    public void setTaskMoneyVos(List<TaskMoneyVo> taskMoneyVos) {
        this.taskMoneyVos = taskMoneyVos;
    }
}
