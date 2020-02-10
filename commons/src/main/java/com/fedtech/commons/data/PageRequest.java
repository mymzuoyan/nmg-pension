package com.fedtech.commons.data;

import java.io.Serializable;

/**
 *
 * @author Gong
 * @date 2016/4/7
 */
public class PageRequest implements Serializable{

    private static final Long serialVersionUID = 1L;


    private Integer draw;
    private Integer length;
    private Integer start;
    private String orderField;
    private String orderDir;

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public String getOrderField() {
        return orderField;
    }

    public void setOrderField(String orderField) {
        this.orderField = orderField;
    }

    public String getOrderDir() {
        return orderDir;
    }

    public void setOrderDir(String orderDir) {
        this.orderDir = orderDir;
    }
}
