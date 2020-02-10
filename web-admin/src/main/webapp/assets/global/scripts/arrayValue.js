/**
 * Created by gengqiang on 2017/7/18.
 */
/**
 * 支付方式
 * @type {[*]}
 */
var payTypeValue = ["现金支付", "刷卡支付", "支付宝", "微信"];
/**
 * 健康服务记录类型
 * @type {[*]}
 */
var healthServiceTypeValue = ["", "血压", "血氧", "血糖", "身高", "体重", "体温", "心率"];
/**
 * 性别
 * @type {[*]}
 */
var sexValue = ["未知", "男", "女"];

/**
 * 子女状况
 * @type {[*]}
 */
var childrenDictIdValue = ["", "有子女", "未生育子女", "失去子女"];
/**
 * 居住状况
 * @type {[*]}
 */
var residenceDictIdValue = ["", "合居", "独居", "空巢"];
/**
 * 能力等级
 * @type {[*]}
 */
var resultDictIdValue = ["", "自理", "半失能", "失能"]

/**
 * 政府购买服务申请状态
 * @type {[*]}
 */
var applyStatusName = ["已登记", "已受理", "不予受理", "初审(街道)通过", "街道初审不通过,需补正", "区审核通过", "区审核不通过，不予批准",
    "评估组织发评估报告", "区再审核通过", "区再审核不通过，不予批准", "公示／反馈", "审核通过", "区三审核不通过，需街道复审",
    "区三审核不通过，需评估组织复检", "街道复审通过"]
/**
 * 政府购买服务申请文书类型
 * @type {[*]}
 */
var applyDocTypeName = ["受理通知书", "不予受理通知书", "补正通知书", "初审结果通知书", "评估任务通知书", "不予批准通知书", "评估报告",
    "公示通知", "不予批准通知书", "公示结果反馈", "复审通知书", "复审结果通知书", "复检评估任务通知书", "政府购买居家养老服务通知书"]
/**
 * 政府购买服务标准
 * @type {[*]}
 */
var govBuyStandardValue = ["", "安装和使用固定信息呼叫终端，个人支付20%费用。", "安装和使用移动信息呼叫终端，个人支付20%费用。", "安装和使用固定信息呼叫终端，300元/月的助老金。",
    "安装和使用移动信息呼叫终端，300元/月的助老金。", "不安装固定/移动信息呼叫终端，300元/月的助老金。", "安装和使用固定信息呼叫终端，400元/月的助老金。", "安装和使用移动信息呼叫终端，400元/月的助老金。",
    "不安装固定/移动信息呼叫终端，400元/月的助老金。"]
/**
 * 城乡特困人员申请状态
 * @type {Array}
 */
var poorApplyStatusName = ["已登记", "初审(街道)通过", "初审(街道)不通过", "街道已公示", "公示无异议", "公示有异议", "区审核通过", "区审核不通过"];
/**
 * 城乡特困人员结果
 * @type {[*]}
 */
var poorApplyResultName = ["<span class='label label-warning'>审核中</span>", "<span class='label label-success'>审核通过</span>", "<span class='label label-danger'> 审核不通过</span>"];

/**
 * 告警类型
 * @type {[*]}
 */
var alarmTypeName = ["围栏告警", "SOS告警", "体征告警", "异常告警"];
/**
 * 体征类型
 * @type {[*]}
 */
var signTypeName = ["", "心率", "", "", ""];

/**
 * 考核项目的类型
 * @type {[*]}
 */
var assessProjectTaskTypeValue = ["", "市重点任务", "中央试点任务", "省重点任务", "省现代民政指标", "市政府民生实事", "市民政局蓝皮书项目"];


/**
 * 机构性质
 * @type {[*]}
 */
var organNatureValue = ["全额拨款事业", "差额拨款事业", "自收自支事业", "事业单位登记", "民非登记", "非登记", "民办非企业", "企业", "其他"];

/**
 * 机构老人状态
 * @type {[*]}
 */
var institutionElderlyStatus = ["删除", "登记中", "待缴费", "已住院", "外出", "待结算", "已退住"];

/**
 * 服务人员用户类型
 * @type {[*]}
 */
var userFuFuType = ["", "养老护理员", "营养师", "心理学咨询师", "医生", "护士", "康复师","管理人员","服务人员","其他人员"];



