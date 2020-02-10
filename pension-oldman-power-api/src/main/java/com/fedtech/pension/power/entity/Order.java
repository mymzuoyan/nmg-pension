package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Order implements Serializable {
    private Integer id; //主键id
    private Double unitPrice;//项目单价
    private Integer billId;//账单id
    private Integer serObjectId;//项目id
    private String objectName;//项目名称
    private Double obprice;//总额
    private Integer obcount;//数量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getBillId() {
        return billId;
    }

    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public Integer getSerObjectId() {
        return serObjectId;
    }

    public void setSerObjectId(Integer serObjectId) {
        this.serObjectId = serObjectId;
    }

    public String getObjectName() {
        return objectName;
    }

    public void setObjectName(String objectName) {
        this.objectName = objectName;
    }


    public Double getObprice() {
        return obprice;
    }

    public void setObprice(Double obprice) {
        this.obprice = obprice;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", unitPrice=" + unitPrice +
                ", billId=" + billId +
                ", serObjectId=" + serObjectId +
                ", objectName='" + objectName + '\'' +
                ", obprice=" + obprice +
                ", obcount=" + obcount +
                '}';
    }

    public Integer getObcount() {
        return obcount;
    }

    public void setObcount(Integer obcount) {
        this.obcount = obcount;
    }
}
