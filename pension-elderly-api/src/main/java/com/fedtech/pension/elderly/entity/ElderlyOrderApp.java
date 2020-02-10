package com.fedtech.pension.elderly.entity;


import java.io.Serializable;
import java.util.List;

/**
 */
public class ElderlyOrderApp implements Serializable {

    private static final Long serialVersionUID = 1L;


    private Integer id;
    /**
     * 老人id
     */
    private Integer elderId;
    /**
     * 老人姓名
     */
    private String elderName;
    private Integer age;//老人年龄
    private String addr;//地点名称
    private Double lng;//经度
    private Double lat;//纬度
    private Integer varsId;//服务内容id
    private String varsName;//服务内容
    private String sendTime;//下单时间
    private String serviceTime;//服务时间
    private Integer userId;//
    private Integer serviceOrgId;//服务组织id
    private String serviceOrgName;//服务组织名称
    private String remark;//服务备注
    private String comment;//订单评价
    private Integer commentUserId;//评价人id
    private String commentTime;//评价时间
    private Integer orgserviceId;//具体服务Id
    private String orgserviceName;//具体服务名称
    //以下抢单字段
    private String orderNum;//工单编号
    private Integer serviceUserId; //服务人员id(初始为空,留备抢单时填入)
    private String pubPhone;//服务对象电话号码,
    private String servicePhone;//服务人员电话号码,
    private Double price;//工单价格字段,(时价)
    private Integer orderStatus;//服务处于的状态,对应抢到后的几个状态:1已抢单未服务,2已签到服务中3服务完毕结算待付款4付款完毕待评价6.已评价11启动服务待签到
    private Integer  robStatus;//抢单状态,2已被抢单,null,0,1未被抢单
    private   Integer sourceType;//订单来源，0：移动端(app)；1：web端
    //映射字段
    private  Integer count;
    private  Integer tance;
    private  String  varsRole;
    private  Double  localLat;//当前纬度
    private  Double  localLng;//当前经度
    private  String  endTime;//仅作比较用开始时间
    private  String  beginTime;//仅作比较用结束时间
    private  String  commonUserName;//详情查看发布对象姓名

    private   List<String> idList;
    private  String startDate;
    private  String endDate;



    //订单流程字段
    private   String signCoordinate;//签到坐标
    private   String signPlace;//签到地址(服务地址)
    private   String signTime;//签到时间
    private   String balanceCoordinate;//结算坐标
    private   String balancePlace;//结算地址(签退地址)
    private   String balanceTime;//结算时间
    private   Integer whoRobStatus;//机构或个人抢单,1个人2机构
    private   Double realPay;//实际支付
    private   String payMethod;//支付方式
    private   String varsTitle;//服务标题

    //服务人员映射字段
    private String serviceUserName; //服务人员名字(初始为空,留备抢单时填入)


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Integer getVarsId() {
        return varsId;
    }

    public void setVarsId(Integer varsId) {
        this.varsId = varsId;
    }

    public String getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public String getVarsName() {
        return varsName;
    }

    public void setVarsName(String varsName) {
        this.varsName = varsName;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getServiceUserId() {
        return serviceUserId;
    }

    public void setServiceUserId(Integer serviceUserId) {
        this.serviceUserId = serviceUserId;
    }

    public String getPubPhone() {
        return pubPhone;
    }

    public void setPubPhone(String pubPhone) {
        this.pubPhone = pubPhone;
    }

    public String getServicePhone() {
        return servicePhone;
    }

    public void setServicePhone(String servicePhone) {
        this.servicePhone = servicePhone;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getRobStatus() {
        return robStatus;
    }

    public void setRobStatus(Integer robStatus) {
        this.robStatus = robStatus;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(Integer commentUserId) {
        this.commentUserId = commentUserId;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getSignCoordinate() {
        return signCoordinate;
    }

    public void setSignCoordinate(String signCoordinate) {
        this.signCoordinate = signCoordinate;
    }

    public String getSignPlace() {
        return signPlace;
    }

    public void setSignPlace(String signPlace) {
        this.signPlace = signPlace;
    }

    public String getSignTime() {
        return signTime;
    }

    public void setSignTime(String signTime) {
        this.signTime = signTime;
    }

    public String getBalanceCoordinate() {
        return balanceCoordinate;
    }

    public void setBalanceCoordinate(String balanceCoordinate) {
        this.balanceCoordinate = balanceCoordinate;
    }

    public String getBalancePlace() {
        return balancePlace;
    }

    public void setBalancePlace(String balancePlace) {
        this.balancePlace = balancePlace;
    }

    public String getBalanceTime() {
        return balanceTime;
    }

    public void setBalanceTime(String balanceTime) {
        this.balanceTime = balanceTime;
    }

    public Integer getWhoRobStatus() {
        return whoRobStatus;
    }

    public void setWhoRobStatus(Integer whoRobStatus) {
        this.whoRobStatus = whoRobStatus;
    }

    public Double getRealPay() {
        return realPay;
    }

    public void setRealPay(Double realPay) {
        this.realPay = realPay;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public String getVarsTitle() {
        return varsTitle;
    }

    public void setVarsTitle(String varsTitle) {
        this.varsTitle = varsTitle;
    }

    public List<String> getIdList() {
        return idList;
    }

    public void setIdList(List<String> idList) {
        this.idList = idList;
    }



    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getOrgserviceId() {
        return orgserviceId;
    }

    public void setOrgserviceId(Integer orgserviceId) {
        this.orgserviceId = orgserviceId;
    }

    public String getOrgserviceName() {
        return orgserviceName;
    }

    public void setOrgserviceName(String orgserviceName) {
        this.orgserviceName = orgserviceName;
    }

    public Integer getTance() {
        return tance;
    }

    public void setTance(Integer tance) {
        this.tance = tance;
    }

    public String getVarsRole() {
        return varsRole;
    }

    public void setVarsRole(String varsRole) {
        this.varsRole = varsRole;
    }

    public Double getLocalLat() {
        return localLat;
    }

    public void setLocalLat(Double localLat) {
        this.localLat = localLat;
    }

    public Double getLocalLng() {
        return localLng;
    }

    public void setLocalLng(Double localLng) {
        this.localLng = localLng;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getCommonUserName() {
        return commonUserName;
    }

    public void setCommonUserName(String commonUserName) {
        this.commonUserName = commonUserName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getServiceUserName() {
        return serviceUserName;
    }

    public void setServiceUserName(String serviceUserName) {
        this.serviceUserName = serviceUserName;
    }

    public Integer getSourceType() {
        return sourceType;
    }

    public void setSourceType(Integer sourceType) {
        this.sourceType = sourceType;
    }
}