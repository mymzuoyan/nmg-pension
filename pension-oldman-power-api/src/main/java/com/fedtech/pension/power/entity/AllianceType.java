package com.fedtech.pension.power.entity;

/**
 * 数据库没有此表
 */
public class AllianceType {
    private Integer id;

    private String inClassic;

    private String inType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getInClassic() {
        return inClassic;
    }

    public void setInClassic(String inClassic) {
        this.inClassic = inClassic == null ? null : inClassic.trim();
    }

    public String getInType() {
        return inType;
    }

    public void setInType(String inType) {
        this.inType = inType == null ? null : inType.trim();
    }

    public AllianceType() {
        super();
    }
}