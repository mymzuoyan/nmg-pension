package com.fedtech.commons.data;

import java.io.Serializable;
import java.util.List;

/**
 * 用于jqPagination插件分页
 *
 * @author Gong
 * @date 2016/7/6
 */
public class PaginationResponse<T> implements Serializable {

    private static final Long serialVersionUID = 1L;

    private int page;
    private int totalPage;
    private List<T> data;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
