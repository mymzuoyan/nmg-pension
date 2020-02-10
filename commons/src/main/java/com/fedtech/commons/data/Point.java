package com.fedtech.commons.data;

import java.io.Serializable;

/**
 * @author GQ
 * @date 16/5/9
 */
public class Point implements Serializable {

    private static final Long serialVersionUID = 1L;

    private double lat;
    private double lng;

    public double getLat() {
        return lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public Point(double lat, double lng) {
        this.lat = lat;
        this.lng = lng;
    }

    public Point() {
    }

    @Override
    public String toString() {
        return "Point{" +
                "lat=" + lat +
                ", lng=" + lng +
                '}';
    }
}
