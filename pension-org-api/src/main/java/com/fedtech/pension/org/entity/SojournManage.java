package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 *  旅居养老机构管理
 * @author guxiangyang
 * @date 2019/8/7
 */
public class SojournManage implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 所在城市
     */
    private String city;

    /**
     * 机构名称
     */
    private String organizationName;

    /**
     * 联系人
     */
    private String contacts;

    /**
     * 联系方式
     */
    private String contactInformation;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getContactInformation() {
        return contactInformation;
    }

    public void setContactInformation(String contactInformation) {
        this.contactInformation = contactInformation;
    }
}
