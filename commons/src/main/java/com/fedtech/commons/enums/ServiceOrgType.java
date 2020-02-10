package com.fedtech.commons.enums;

/**
 * Created by Gong on 16/7/27.
 */
public enum ServiceOrgType {
    Jjylfwzx(1, "居家养老服务中心"),
    Czxxtls(2, "城镇小型托老所"),
    Nclngazj(3, "农村老年关爱之家"),
    Zcd(4, "助餐点"),
    Lnhdzx(5, "老年活动中心"),
    Qt(6, "其他"),
    Scqy(7, "市场企业"),
    Gyzyzzz(8, "公益志愿者组织");
    private int id;
    private String name;

    ServiceOrgType(int id, String name) {
        this.id = id;
        this.name = name;
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

}
