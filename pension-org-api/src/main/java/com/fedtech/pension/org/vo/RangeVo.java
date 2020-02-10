package com.fedtech.pension.org.vo;

import java.io.Serializable;

/**
 * @author CoderQiang
 * @date 2017/6/1
 */
public class RangeVo implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Double max;
    private Double min;

    public RangeVo() {
    }

    public Double getMax() {
        return max;
    }

    public void setMax(Double max) {
        this.max = max;
    }

    public Double getMin() {
        return min;
    }

    public void setMin(Double min) {
        this.min = min;
    }
}
