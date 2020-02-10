package com.fedtech.pension.call.vo;

import java.io.Serializable;

/**
 *
 * @author Administrator
 * @date 2016/9/29
 */
public class CustomerGroupVo implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;
    private String name;
    private Long customerCount;
    private String contactName;
    private String contactPhone;

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
        this.name = name;
    }

    public Long getCustomerCount() {
        return customerCount;
    }

    public void setCustomerCount(Long customerCount) {
        this.customerCount = customerCount;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public CustomerGroupVo() {
    }
}
