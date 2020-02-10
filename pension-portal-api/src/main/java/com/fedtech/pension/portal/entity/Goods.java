package com.fedtech.pension.portal.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 商品列表
 * @author gengqiang
 */
public class Goods implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //类目id
    private Integer typeId;

    //类目名称
    private String typeName;

    //商品编号
    private String num;

    private String name;

    //缩略图
    private String pic;

    private String img;

    private Double price;

    //库存
    private Integer amount;

    //购买次数
    private Integer account;

    private String info;

    //上传人
    private Integer creatorId;

    //上传时间
    private Date createTime;

    //修改时间
    private Date updateTime;

    //状态：0:下架 1:上架。默认0下架状态
    private Integer status;

    //置顶
    private Integer putTop;

    private List<GoodsAttr> goodsAttrs;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getAccount() {
        return account;
    }

    public void setAccount(Integer account) {
        this.account = account;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPutTop() {
        return putTop;
    }

    public void setPutTop(Integer putTop) {
        this.putTop = putTop;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<GoodsAttr> getGoodsAttrs() {
        return goodsAttrs;
    }

    public void setGoodsAttrs(List<GoodsAttr> goodsAttrs) {
        this.goodsAttrs = goodsAttrs;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}