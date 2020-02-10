package com.fedtech.commons.data;

import java.io.Serializable;

/**
 * @author Gong
 * @date 2016/5/11
 */
public class TreeBean implements Serializable {

    private static final Long serialVersionUID = 1L;

    private String id;
    private String text;
    private String parent;
    private String type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        try {
            this.parent = formatParent(Integer.parseInt(parent));
        } catch (NumberFormatException e) {
            this.parent = parent;

        }
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public static String formatParent(int parentId) {
        return parentId == 0 ? "#" : String.valueOf(parentId);
    }
}
