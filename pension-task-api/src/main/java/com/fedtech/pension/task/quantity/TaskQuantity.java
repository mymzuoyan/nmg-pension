package com.fedtech.pension.task.quantity;

/**
 * Created by zhnn on 2017/3/10.
 */
public class TaskQuantity {

    //状态值
    /**
     * 订单删除、撤销
     */
    public static Integer DETELED = 0;
    /**
     * 未响应
     */
    public static Integer NOT_RESPONSE = 1;
    /**
     * 组织已响应
     */
    public static Integer SERVICEORG_RESPONSE = 2;
    /**
     * 组织已派遣
     */
    public static Integer SERVICEORG_DISPATCH = 3;
    /**
     * 组织已拒绝
     */
    public static Integer SERVICEORG_REFUSE = 4;
    /**
     * 服务人员已接单
     */
    public static Integer SERVICEUSER_RESPONSE = 5;
    /**
     * 服务人员已上门
     */
    public static Integer SERVICEUSER_REGISTER = 6;
    /**
     * 服务人员已拒绝
     */
    public static Integer SERVICEUSER_REFUSE = 7;
    /**
     * 待付款
     */
    public static Integer PAY = 8;
    /**
     * 已完成
     */
    public static Integer COMPLETE = 9;

    /**
     * 已评价
     */
    public static Integer EVALUATED = 10;


    /**
     * 已调度
     */
    public static Integer ADMIN_DISPATCH = 11;


    //工单类型
    /**
     * 下发工单
     */
    public static Integer TYPE_DOWNTASK = 0;

    /**
     * 需求
     */
    public static Integer TYPE_DEMAND = 1;


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
