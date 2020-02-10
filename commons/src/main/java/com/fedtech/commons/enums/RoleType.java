package com.fedtech.commons.enums;

/**
 * @author Qiang
 * @date 16/7/27
 */
public enum RoleType {
    SuAdmin("suadmin", 1, "超级管理员", 1),
    MuAdmin("muadmin", 2, "市级管理员", 2),
    ReAdmin("readmin", 3, "区域管理员", 3),
    StAdmin("stadmin", 4, "街道管理员", 4),
    CoAdmin("coadmin", 5, "社区管理员", 5),
    ZuAdmin("zuadmin", 6, "组织管理员", 6),
    MonitorAdmin("monitoradmin", 7, "班长坐席", 7),
    MonitorUser("monitoruser", 8, "普通坐席", 8),
    ServiceUser("serviceuser", 9, "服务人员", 9),
    ServiceObject("serviceobject", 10, "服务对象", 10),
    AssessAdmin("assessadmin", 11, "评估机构管理员", 11),
    AssessUser("assessuser", 14, "评估人员", 11),
    JgAdmin("jgadmin", 12, "机构管理员", 7),
    ApiUser("apiuser", 13, "接口账号", 15);

    private String value;
    private int id;
    private String name;
    private int level;

    RoleType(String value, int id, String name, int level) {
        this.value = value;
        this.id = id;
        this.name = name;
        this.level = level;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
