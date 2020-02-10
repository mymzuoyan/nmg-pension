package com.fedtech.commons.data;

import java.io.Serializable;
import java.util.List;

/**
 * 用于datatable插件分页
 *
 * @author Gong
 * @date 2016/4/7
 */
public class PageResponse<T> implements Serializable {

    private static final Long serialVersionUID = 1L;


    private List<T> data;
    private Integer draw;
    private int recordsTotal;
    private int recordsFiltered;
    private String error;

    public PageResponse() {
    }

    public PageResponse(List<T> data, Integer draw, int recordsTotal, int recordsFiltered, String error) {
        this.data = data;
        this.draw = draw;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.error = error;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
