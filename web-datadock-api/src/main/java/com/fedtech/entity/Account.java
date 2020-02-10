package com.fedtech.entity;

/**
 * @author gengqiang
 * @date 2019/6/28
 */
public class Account {
    /**
     * uid
     */
    private Integer uid;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
