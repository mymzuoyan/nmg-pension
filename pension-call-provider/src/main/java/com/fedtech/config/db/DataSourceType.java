package com.fedtech.config.db;

/**
 * @author Shawn
 */
public enum DataSourceType {
    READ("read", "读库"), WRITE("write", "写库"), READCDR("readCdr", "读Cdr库"), READIPCCP("readIpccp", "读IPCCP库");
    private String type;
    private String name;

    DataSourceType(String type, String name) {
        this.type = type;
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
