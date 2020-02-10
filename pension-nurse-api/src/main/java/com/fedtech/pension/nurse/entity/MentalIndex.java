package com.fedtech.pension.nurse.entity;

import java.io.Serializable;

/**
 * @author miaoyueming
 * 精神指数
 */
public class MentalIndex implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    //fatigue——精神疲劳;sentiment——情绪指数;resistance——抵抗力
    private static String testType;

    //情绪指数-1：正常 2：紧张 3：焦急 4：抑郁
    //精神疲劳-1：正常 2：轻度 3：中度 4：重度
    //抵抗力-1：好 2：正常 3：下降 4：严重下降
    private static Integer level;

    private static String levelName;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public static String getTestType() {
        return testType;
    }

    public static void setTestType(String testType) {
        MentalIndex.testType = testType;
    }

    public static Integer getLevel() {
        return level;
    }

    public static void setLevel(Integer level) {
        MentalIndex.level = level;
    }

    public static String getLevelName() {
        return levelName;
    }

    public static void setLevelName(String levelName) {
        MentalIndex.levelName = levelName;
    }
}
