package com.fedtech.pension.elderly.quantity;

/**
 * Created by gengqiang on 2017/8/16.
 */
public class PoorApplyStepQuantity {
    public static Integer DENGJI = 0;// 已登记
    public static Integer CHUSHENTONGGUO = 1;// 初审通过
    public static Integer CHUSHENUBUTONGGUO = 2;// 初审不通过
    public static Integer GONGSHI = 3;// 公示／反馈
    public static Integer GONGSHIWUYIYI = 4;// 公示无异议
    public static Integer GONGSHIYOUYIYI = 5;// 公示有异议
    public static Integer QUSHENHETONGGUO = 6;// 区审核通过
    public static Integer QUSHENHEBUTONGGUO = 7;// 区审核不通过


    public static Integer[] JDNEEDHANDLEAPPLYSTATUS={DENGJI,CHUSHENTONGGUO,GONGSHI,GONGSHIYOUYIYI};
    public static Integer[] QUNEEDHANDLEAPPLYSTATUS={GONGSHIWUYIYI};

}
