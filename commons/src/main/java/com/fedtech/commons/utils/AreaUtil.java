package com.fedtech.commons.utils;

/**
 * @author gengqiang
 * @date 2018/1/2
 */
public class AreaUtil {

    public static Integer getAreaOrder(String areaName) {
        Integer areaOrder = 0;
        if (areaName.indexOf("海陵区") >= 0) {
            areaOrder = 1;
        } else if (areaName.indexOf("高港区") >= 0) {
            areaOrder = 2;
        } else if (areaName.indexOf("姜堰区") >= 0) {
            areaOrder = 3;
        } else if (areaName.indexOf("兴化市") >= 0) {
            areaOrder = 4;
        } else if (areaName.indexOf("靖江市") >= 0) {
            areaOrder = 5;
        } else if (areaName.indexOf("泰兴市") >= 0) {
            areaOrder = 6;
        }
        return areaOrder;
    }

}
