package com.fedtech.pension.call.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 客户相关联系人信息
 * @author gengqiang
 */
public class CustomerRelate implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 0：未知 1:男 2：女
     */
    private Integer gender;

    /**
     * 出身日期
     */
    private Date birthDate;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 固定电话
     */
    private String tel;

    /**
     * 手机
     */
    private String phone;

    /**
     * 地址
     */
    private String address;

    /**
     * 关联的客户id
     */
    private Integer relateCustomerId;

    /**
     * 与客户关系
     */
    private String relateType;

    /**
     * 是否有备用钥匙
     */
    private String spareKey;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }


    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Integer getRelateCustomerId() {
        return relateCustomerId;
    }

    public void setRelateCustomerId(Integer relateCustomerId) {
        this.relateCustomerId = relateCustomerId;
    }

    public String getRelateType() {
        return relateType;
    }

    public void setRelateType(String relateType) {
        this.relateType = relateType;
    }

    public String getSpareKey() {
        return spareKey;
    }

    public void setSpareKey(String spareKey) {
        this.spareKey = spareKey;
    }

    public CustomerRelate() {
    }
}