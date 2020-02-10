package com.fedtech.pension.task.quantity;

/**
 * Created by zhnn on 2017/3/10.
 */
public class TaskPlanQuantity {

    //状态值
    /**
     * 未完成
     */
    public static Integer NOTCOMPLETE = 0;
    /**
     * 已完成
     */
    public static Integer COMPLETE = 1;


    //工单类型
    /**
     * 二维码数据
     */
    public static Integer TYPE_CODER = 1;
    /**
     * 刷卡数据
     */
    public static Integer TYPE_CARDDATA = 2;

    //工单来源
    /**
     * app端
     */
    public static String APP = "app";

    /**
     * web端（平台下发）
     */
    public static String web = "web";

}
