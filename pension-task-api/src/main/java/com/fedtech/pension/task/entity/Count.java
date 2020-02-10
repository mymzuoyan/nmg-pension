package com.fedtech.pension.task.entity;

import java.io.Serializable;

/** 数量统计
 * @author ykp
 */
public class Count implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer appCount;//App所有订单数量

    private Integer webCount;//Web所有订单数量

    private Integer telCount;//呼叫中心通话数量

    private Integer beeperCount;//呼叫器呼叫数量

    private Integer todayAppCount;//App今日订单数量

    private Integer todayWebCount;//Web今日订单数量

    private Integer todayBeeperCount;//呼叫器今日呼叫数量

    private Integer todayTelCount;//呼叫中心今日通话数量

    private Integer undone;//app今日undone订单数量

    private Integer doing;//app今日doing订单数量

    private Integer done;//app今日done订单数量

    public Integer getAppCount() {
        return appCount;
    }

    public void setAppCount(Integer appCount) {
        this.appCount = appCount;
    }

    public Integer getWebCount() {
        return webCount;
    }

    public void setWebCount(Integer webCount) {
        this.webCount = webCount;
    }

    public Integer getTelCount() {
        return telCount;
    }

    public void setTelCount(Integer telCount) {
        this.telCount = telCount;
    }

    public Integer getBeeperCount() {
        return beeperCount;
    }

    public void setBeeperCount(Integer beeperCount) {
        this.beeperCount = beeperCount;
    }

    public Integer getTodayAppCount() {
        return todayAppCount;
    }

    public void setTodayAppCount(Integer todayAppCount) {
        this.todayAppCount = todayAppCount;
    }

    public Integer getTodayWebCount() {
        return todayWebCount;
    }

    public void setTodayWebCount(Integer todayWebCount) {
        this.todayWebCount = todayWebCount;
    }

    public Integer getTodayBeeperCount() {
        return todayBeeperCount;
    }

    public void setTodayBeeperCount(Integer todayBeeperCount) {
        this.todayBeeperCount = todayBeeperCount;
    }

    public Integer getTodayTelCount() {
        return todayTelCount;
    }

    public void setTodayTelCount(Integer todayTelCount) {
        this.todayTelCount = todayTelCount;
    }

    public Integer getUndone() {
        return undone;
    }

    public void setUndone(Integer undone) {
        this.undone = undone;
    }

    public Integer getDoing() {
        return doing;
    }

    public void setDoing(Integer doing) {
        this.doing = doing;
    }

    public Integer getDone() {
        return done;
    }

    public void setDone(Integer done) {
        this.done = done;
    }
}