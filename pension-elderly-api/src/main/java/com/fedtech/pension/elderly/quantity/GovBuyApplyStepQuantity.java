package com.fedtech.pension.elderly.quantity;

/**
 * Created by gengqiang on 2017/7/25.
 */
public class GovBuyApplyStepQuantity {
    public static Integer DENGJI = 0;// 已登记
    public static Integer SHOULI = 1;// 已受理
    public static Integer BUYUSHOULI = 2;// 不予受理
    public static Integer CHUSHENTONGGUO = 3;// 初审通过
    public static Integer CHUSHENUBUTONGGUO = 4;// 初审不通过
    public static Integer QUSHENHETONGGUO = 5;// 区审核通过
    public static Integer QUSHENHEBUTONGGUO = 6;// 区审核不通过
    public static Integer PINGUGUZUZHIFABAOGAO = 7;// 评估组织发评估报告
    public static Integer QUZAISHENHETONGGUO = 8;// 区再审核通过
    public static Integer QUZAISHENHEBUTONGGUO = 9;// 区再审核不通过
    public static Integer GONGSHI = 10;// 公示／反馈
    public static Integer QUSANSHEHETONGGUO = 11;// 区三审核通过
    public static Integer JIEDAOFUSHEN = 12;// 区三审核不通过，需街道复审
    public static Integer PINGGUZUZHIFUJIAN = 13;// 区三审核不通过，需评估组织复检
    public static Integer JIEFUSHENTONGGUO = 14;// 区三审核不通过，需评估组织复检


    public static Integer[] JDNEEDHANDLEAPPLYSTATUS = {DENGJI, SHOULI, CHUSHENUBUTONGGUO, JIEDAOFUSHEN, QUZAISHENHETONGGUO};
    public static Integer[] QUNEEDHANDLEAPPLYSTATUS = {CHUSHENTONGGUO, PINGUGUZUZHIFABAOGAO, GONGSHI, JIEFUSHENTONGGUO};


}
