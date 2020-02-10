package com.fedtech.pension.call.vo;

import com.fedtech.pension.call.entity.CallBack;
import com.fedtech.pension.call.entity.ReturnVisit;
import com.fedtech.pension.ipccp.entity.Ipccpcdr;

import java.io.Serializable;

/**
 *
 * @author CoderQiang
 * @date 2017/3/1
 */
public class MonitorInfo implements Serializable {

    private static final Long serialVersionUID = 1L;

    private String agentId;//座席号
    private String extension;//分机号
    private String callInfo;
    private String uniqueId;
    private String state;
    private String isCall;
    private String isShow;
    private String linkedId;
    private Ipccpcdr ipccpcdr;
    private CallBack callBack;
    private ReturnVisit returnVisit;

    public MonitorInfo() {
        agentId = "";
        extension = "";
        callInfo = "";
        uniqueId = "";
        state = "";
        isCall = "false";
        isShow = "false";
    }

    public String getAgentId() {
        return agentId;
    }

    public void setAgentId(String agentId) {
        this.agentId = agentId;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getCallInfo() {
        return callInfo;
    }

    public void setCallInfo(String callInfo) {
        this.callInfo = callInfo;
    }

    public String getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIsCall() {
        return isCall;
    }

    public void setIsCall(String isCall) {
        this.isCall = isCall;
    }

    public String getLinkedId() {
        return linkedId;
    }

    public void setLinkedId(String linkedId) {
        this.linkedId = linkedId;
    }

    public CallBack getCallBack() {
        return callBack;
    }

    public void setCallBack(CallBack callBack) {
        this.callBack = callBack;
    }

    public ReturnVisit getReturnVisit() {
        return returnVisit;
    }

    public void setReturnVisit(ReturnVisit returnVisit) {
        this.returnVisit = returnVisit;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    public Ipccpcdr getIpccpcdr() {
        return ipccpcdr;
    }

    public void setIpccpcdr(Ipccpcdr ipccpcdr) {
        this.ipccpcdr = ipccpcdr;
    }
}
