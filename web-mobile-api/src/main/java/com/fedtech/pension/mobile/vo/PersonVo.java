package com.fedtech.pension.mobile.vo;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author CoderQiang
 * @date 2017/5/5
 */
public class PersonVo {
    private Integer id;
    private String name;
    private String idcardno;
    private String mobile;
    private String realAddress;
    private MultipartFile[] idPhotos;
    private String serviceType;
    private Integer serviceOrgId;

    public PersonVo() {
    }

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

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public MultipartFile[] getIdPhotos() {
        return idPhotos;
    }

    public void setIdPhotos(MultipartFile[] idPhotos) {
        this.idPhotos = idPhotos;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }
}
