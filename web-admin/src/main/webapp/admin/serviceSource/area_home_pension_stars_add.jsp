<%--
  Created by IntelliJ IDEA.
  User: guxiangyang
  Date: 2019/8/21
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>社区养老服务站星级评定标准</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">机构养老信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">社区养老服务站星级评定标准</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">社区养老服务站星级评定标准列表</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                基本信息</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <%--<td style="width:10%;text-align:center;vertical-align:middle;">
                                            所属区域<span style="color:red"> *</span>
                                        </td>
                                        <td style="width:40%;text-align:center;vertical-align:middle;">
                                            <c:if test="${empty areaName}">
                                                <c:choose>
                                                    <c:when test="${roleId == 3}">
                                                        <input type="text" id="area" name="areaName"
                                                               value="${user.areaName}" style="width: 100%" readonly>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="area" name="areaName"
                                                               data-toggle="modal"
                                                               data-target="#areaModal" placeholder="请选择所属区域"
                                                               style="width: 100%" class="form-control">
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                            <c:if test="${not empty areaName}">
                                                <input type="text" id="areaName" name="areaName"
                                                       value="${areaName}" style="width: 100%" readonly>
                                            </c:if>
                                        </td>--%>
                                        <td class="app_list_search_caption"
                                            style="width:10%;text-align:center;vertical-align:middle;">
                                            机构名称<span style="color:red"> *</span>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input width="50" type="text" id="organizationNames"
                                                   name="organizationNames"  placeholder="请输入机构名称" value="${organizationNames}" disabled
                                                   class="form-control"/>
                                        </td>
                                            <td class="app_list_search_caption"
                                                style="width:10%;text-align:center;vertical-align:middle;">
                                                申请时间<span style="color:red"> *</span>
                                            </td>
                                            <td class="app_list_search_td">
                                                <input type="text" id="applicationTime" name="applicationTime" value=""
                                                       placeholder="请选择申请时间"
                                                       class="form-control date-picker"/>
                                            </td>
                                    </tr>
                                </table>
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                安全部分（50分）</span>
                                        </td>
                                    </tr>
                                    <tr class="thisTr">
                                        <td>序号</td>
                                        <td cospan="5" style="text-align: center">标准要求</td>
                                        <td>分值</td>
                                        <td cospan="5" style="text-align: center">评分标准</td>
                                        <td>评分</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">1</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input1" value="20"
                                                          class="in"/>年内无责任事故</label>
                                        </td>
                                        <td class="fen" style="text-align: center">20</td>
                                        <td cospan="5">发生责任事故不得分</td>
                                        <td  style="text-align: center"><span><font class="pf1" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">2</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input2" value="3" class="in"/>（1）周边环境远离噪声、污染源及危险品生产、储运等区域</label>
                                            <br>
                                            <label><input type="checkbox" name="input2" value="3" class="in"/>（2）救护车、消防车可抵达出入口</label>
                                        </td>
                                        <td class="fen" style="text-align: center">6</td>
                                        <td cospan="5">每有一项不符合要求扣3分</td>
                                        <td  style="text-align: center"><span><font class="pf2" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">3</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input3" value="1"
                                                          class="in"/>（1）室内外地面平整</label><br>
                                            <label><input type="checkbox" name="input3" value="1" class="in"/>（2）主要步行通道平坦、无高差</label><br>
                                            <label><input type="checkbox" name="input3" value="1" class="in"/>（3）有无障碍设施，方便轮椅通行</label>
                                        </td>
                                        <td class="fen" style="text-align: center">3</td>
                                        <td cospan="5">每有一项不符合要求扣1分</td>
                                        <td  style="text-align: center"><span><font class="pf3" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">4</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input4" value="1"
                                                          class="in"/>（1）出入口不少于2处，有效宽度不小于1.20m</label><br>
                                            <label><input type="checkbox" name="input4" value="1" class="in"/>（2）出入口处内、外应有不小于1.50m×1.50m轮椅回转面积</label><br>
                                            <label><input type="checkbox" name="input4" value="3" class="in"/>（3）出入口处的平台与建筑室外采用缓步台阶和轮椅坡道过渡，起止处有异色警示条</label>
                                        </td>
                                        <td class="fen" style="text-align: center">5</td>
                                        <td cospan="5">（1）出入口少于2处不得分，出入口有效宽度小于1.20m扣1分；（2）项不符合要求扣1分；（3）出入口处平台与建筑室外无缓步台阶和轮椅坡道过渡扣2分，起止处无异色警示条扣1分</td>
                                        <td  style="text-align: center"><span><font class="pf4" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">5</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input5" value="6"
                                                          class="in"/>（1）主要出入口的门不选用旋转门；公共外门净宽不小于1.10m；照料护理用房、走廊、卫生间、浴室、防火等门净宽不小于0.80m；开向公共走廊门不影响安全疏散；室内面积大于60㎡时，门向疏散方向开启</label>
                                            <label><input type="checkbox" name="input5" value="2" class="in"/>（2）公共区域的门配有方便观察的玻璃</label>
                                        </td>
                                        <td class="fen" style="text-align: center">8</td>
                                        <td cospan="5">（1）项不符合任意一项要求扣6分；（2）项不符合要求扣2分</td>
                                        <td  style="text-align: center"><span><font class="pf5" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">6</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input6" value="3"
                                                          class="in"/>（1）室内装饰材料符合消防环保要求，人员住宿和主要活动场所不使用易燃可燃装饰装修材料，有人居住或者活动的建筑不采用夹芯材料燃烧性能低于A级的彩钢板搭建；大面积使用玻璃材质时应有异色警示标识</label><br>
                                            <label><input type="checkbox" name="input6" value="3"
                                                          class="in"/>（2）有漏电保护装置</label><br>
                                            <label><input type="checkbox" name="input6" value="3" class="in"/>（3）走廊墙面无突出物，灭火器和标识板等设置应不妨碍老年人正常通行</label>
                                        </td>
                                        <td class="fen" style="text-align: center">9</td>
                                        <td cospan="5">每有一项不符合要求扣3分</td>
                                        <td  style="text-align: center"><span><font class="pf6" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">7</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input7" value="5"
                                                          class="in"/>消防设施做好维护保养</label><br>
                                            <label><input type="checkbox" name="input7" value="3"
                                                          class="in"/>有完整记录</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">8</td>
                                        <td cospan="5">无维护保养记录不得分；记录不规范不完整按照现场查勘情况扣1-3分</td>
                                        <td  style="text-align: center"><span><font class="pf7" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">8</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input8" value="6"
                                                          class="in"/>有安全出口、疏散通道，应急照明设备</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">6</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf8" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">9</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input9" value="3"
                                                          class="in"/>照料护理用房内及公共部位等区域的明显位置设置该区域的安全疏散指示图</label><br>
                                            <label><input type="checkbox" name="input9" value="2"
                                                          class="in"/>指示图上应标明老年人容易识别的疏散路线、安全出口、人员所在位置和必要的文字说明</label><br>

                                        </td>
                                        <td class="fen" style="text-align: center">5</td>
                                        <td cospan="5">无安全疏散指示图不得分，设置不规范按照现场勘查情况扣1-2分</td>
                                        <td  style="text-align: center"><span><font class="pf9" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">10</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input10" value="3"
                                                          class="in"/>防火门开启方向有明显标注（推、拉），如有常闭式防火门应处于关闭状态</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">3</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf10" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">11</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input11" value="2"
                                                          class="in"/>（1）无裸露、老化的电线；无随意拉接和安装用电线路和设备</label><br>
                                            <label><input type="checkbox" name="input11" value="2"
                                                          class="in"/>（2）定期组织对电器产品及其线路、管路进行维护保养和检测</label><br>
                                            <label><input type="checkbox" name="input11" value="2"
                                                          class="in"/>（3）未使用电热毯、热炉、热得快等大功率电气设备</label><br>
                                            <label><input type="checkbox" name="input11" value="2"
                                                          class="in"/>（4）未违规存放易燃易爆危险品</label>
                                        </td>
                                        <td class="fen" style="text-align: center">8</td>
                                        <td cospan="5">每有一项不符合要求扣2分</td>
                                        <td  style="text-align: center"><span><font class="pf11" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">12</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input12" value="2"
                                                          class="in"/>（1）入口、大厅、楼层、电梯间、各类用房应设置标识</label><br>
                                            <label><input type="checkbox" name="input12" value="3"
                                                          class="in"/>（2）安全出入口、紧急出口、上下楼梯、灭火器等应设置标识</label><br>
                                            <label><input type="checkbox" name="input12" value="1"
                                                          class="in"/>（3）老年人活动空间内的墙面凸出或临空突出物，采用醒目色彩或采用图案区分的方式作出警示标识</label><br>
                                            <label><input type="checkbox" name="input12" value="1"
                                                          class="in"/>（4）标识设置应醒目且有一定导向作用</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">7</td>
                                        <td cospan="5">（1）项不符合要求扣2分；（2）项不符合要求扣3分；（3）项不符合要求扣1分；（4）项不符合要求扣1分</td>
                                        <td  style="text-align: center"><span><font class="pf12" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">13</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input13" value="30"
                                                          class="in"/>服务中心购买养老服务设施公众责任险</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">30</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf13" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">14</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input14" value="2"
                                                          class="in"/>服务中心室内全部区域严禁吸烟</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">2</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf14" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">15</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input15" value="10"
                                                          class="in"/>厨房管道燃气、液化气钢瓶等设施、设备的安装存放（液化气钢瓶）与使用应符合消防及燃气专业机构的要求，并出具检查验收合格证明</label><br>

                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf15" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">16</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input16" value="6"
                                                          class="in"/>（1）厨房做到明厨亮灶</label><br>
                                            <label><input type="checkbox" name="input16" value="12"
                                                          class="in"/>（2）食堂生熟分开，成品与半成品分开制作、存储</label><br>
                                            <label><input type="checkbox" name="input16" value="12"
                                                          class="in"/>（3）食品留样至少48小时且有留样记录</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">30</td>
                                        <td cospan="5">（1）项不符合要求扣6分；（2）生熟未分开扣6分；成品半成品未分开制作、存储扣6分；（3）项食品留样时间不足48小时，扣6分；食品留样不全，扣3分；食品留样记录不规范不完整，扣3分。采取配餐方式的，此项不扣分；未开展助餐服务的，此项不得分。</td>
                                        <td  style="text-align: center"><span><font class="pf16" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">17</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input17" value="5"
                                                          class="in"/>建立特种设施、设备台帐（电梯、空调、锅炉等）</label><br>
                                            <label><input type="checkbox" name="input17" value="5"
                                                          class="in"/>特种设备定期接受专业单位检验</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">无台账资料不得分，资料不全或欠规范以现场查勘情况扣1-5分</td>
                                        <td  style="text-align: center"><span><font class="pf17" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">18</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input18" value="5"
                                                          class="in"/>制定消防安全、特种设备设施安全、食品安全、突发事件等相关管理制度、预警机制及应急预案</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">5</td>
                                        <td cospan="5">缺少任意一项制度不得分（如无特种设施设备可不检查相关制度预案）</td>
                                        <td  style="text-align: center"><span><font class="pf18" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">19</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input19" value="2"
                                                          class="in"/>每半年至少开展一次安全培训</label><br>
                                            <label><input type="checkbox" name="input19" value="3"
                                                          class="in"/>针对本服务中心所制定的各项“突发事件预案”开展定期演练，并有完整记录和照片</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">5</td>
                                        <td cospan="5">未组织员工安全培训或未进行“突发事件预案”演练不得分，图片及文字记录不规范不完整，按照现场查勘情况扣分</td>
                                        <td  style="text-align: center"><span><font class="pf19" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">20</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input20" value="5"
                                                          class="in"/>每月组织一次安全工作自查</label><br>
                                            <label><input type="checkbox" name="input20" value="5"
                                                          class="in"/>自查项目覆盖全服务中心各项工作（如：消防安全、食品采购及安全设施等），安全工作自查记录完整</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">每月未组织安全工作自查不得分；安全工作自查记录不规范不完整按照现场查勘情况扣1-5分；自查项目未全覆盖每少一项应自查项目扣1分，最多扣5分</td>
                                        <td  style="text-align: center"><span><font class="pf20" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">21</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input210" value="5"
                                                          class="in"/>（1）配备经过消防业务培训的消防管理人员</label><br>
                                            <label><input type="checkbox" name="input210" value="5"
                                                          class="in"/>（2）建立微型消防站、并达到“三知四会一联通，处置要在三分钟”要求</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">有一项不符合扣5分</td>
                                        <td  style="text-align: center"><span><font class="pf210" color='red'>0</font></span></td>
                                    </tr>


                                    <tr>
                                        <td colspan="6"
                                            style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                            安全部分总评分数(总分200):<span id="all"></span>
                                        </td>
                                    </tr>
                                </table>
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                服务部分（500分）</span>
                                        </td>
                                    </tr>
                                    <tr class="thisTr">
                                        <td>序号</td>
                                        <td cospan="5" style="text-align: center">标准要求</td>
                                        <td>分值</td>
                                        <td cospan="5" style="text-align: center">评分标准</td>
                                        <td>评分</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">1</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input21" value="20"
                                                          class="in"/>照料护理服务：（1）利用服务中心现有设施和资源，为社区内失能失智或有需求的高龄老年人提供长期托养、日间照料服务，实施专业照护</label><br>
                                            <label><input type="checkbox" name="input21" value="40"
                                                          class="in"/>（2）提供上门生活照料服务，包括协助进食、协助排泄及如厕、协助移动、更换衣物、卧位护理，以及洗发、梳头、口腔清洁、洗脸、剃胡须、修剪指甲、洗手洗脚等内容</label>
                                        </td>
                                        <td class="fen" style="text-align: center">60</td>
                                        <td cospan="5">服务内容：最高得20分。其中，能够依托服务中心开展长期托养或日间照料服务并有详细服务记录，得10分；能够上门提供生活照料服务中三种以上服务内容并有详细服务记录，得10分
                                            服务绩效：最高得40分。其中，年服务达200人次，得10分；年服务达500人次，得20分；年服务达800人次，得30分；年服务达1000人次以上，得40分。
                                            长期托养每人每日计1人次，并不再计入助餐、助医、助浴、助洁、助行服务绩效。</td>
                                        <td  style="text-align: center"><span><font class="pf21" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">2</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input22" value="15"
                                                          class="in"/>助餐服务：（1）提供集中用餐服务</label><br>
                                            <label><input type="checkbox" name="input22" value="15"
                                                          class="in"/>（2）提供上门送餐服务</label><br>
                                            <label><input type="checkbox" name="input22" value="15"
                                                          class="in"/>（3）建立餐具及配、送餐用具（如：送餐车、送餐专用电梯等）消毒制度，实施消毒规范并记录完整</label><br>
                                            <label><input type="checkbox" name="input22" value="15"
                                                          class="in"/>（4）膳食荤素搭配合理，每周公布食谱，膳食符合地域、民族、宗教习惯</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">60</td>
                                        <td cospan="5">服务内容：最高得20分。其中，开展（1）项服务并有详细服务记录，得7分；开展（2）项服务并有详细服务记录，得7分；（3）未制定消毒制度、未实施消毒不得分；消毒记录不规范、不完整扣1-3分；（4）未公布食谱，或未做到膳食荤素搭配、符合地域、民族、宗教习惯，扣3分。
                                            服务绩效：最高得40分。其中，年服务达2000人次，得10分；年服务达5000人次，得20分；年服务达8000人次，得30分；年服务达10000人次以上，得40分</td>
                                        <td  style="text-align: center"><span><font class="pf22" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">3</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input23" value="15"
                                                          class="in"/>助医服务：（1）协助监护人陪送老年人到医院就医或代为取药，协助生活不能自理的老年人遵照医嘱管理药品</label><br>
                                            <label><input type="checkbox" name="input23" value="15"
                                                          class="in"/>（2）依托医疗卫生服务机构或专业医生、护士为老年人提供定期体检、上门巡诊、家庭病床、社区护理、健康管理等服务</label><br>
                                            <label><input type="checkbox" name="input23" value="15"
                                                          class="in"/>（3）定期组织专业人员举办健康知识及技能培训，加强老年健康教育，提供疾病预防、伤害预防、自救及自我保健等健康指导</label><br>
                                            <label><input type="checkbox" name="input23" value="15"
                                                          class="in"/>（4）指导老年人开展适当的康复训练</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">60</td>
                                        <td cospan="5">服务内容：最高得20分。其中，能够开展每项服务内容中的一种以上服务并有详细服务记录，得5分
                                            服务绩效：最高得40分。其中，年服务达40人，得10分；年服务达100人，得20分；年服务达160人，得30分；年服务达200人以上，得40分</td>
                                        <td  style="text-align: center"><span><font class="pf23" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">4</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input24" value="20"
                                                          class="in"/>助浴服务：为失能、高龄老人提供助浴服务</label><br>
                                            <label><input type="checkbox" name="input24" value="40"
                                                          class="in"/>上门为老人提供助浴服务</label>
                                        </td>
                                        <td class="fen" style="text-align: center">60</td>
                                        <td cospan="5">服务内容：最高得20分。其中，开展一项服务并有详细服务记录，得10分
                                            服务绩效：最高得40分。其中，年服务达50人次，得10分；年服务达100人次，得20分；年服务达150人次，得30分；年服务达200人次以上，得40分</td>
                                        <td  style="text-align: center"><span><font class="pf24" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">5</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input25" value="20"
                                                          class="in"/>助洁服务：为社区内有需求的老年人提供居家保洁服务</label><br>
                                            <label><input type="checkbox" name="input25" value="40"
                                                          class="in"/>包括房间打扫、清洁灶具、清洗门窗、洗涤衣物等，也包括维修、疏通等其他家政服务</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">60</td>
                                        <td cospan="5">服务内容：能够开展两种以上服务内容并有详细服务记录，得20分
                                            服务绩效：最高得40分。其中，年服务达200人次，得10分；年服务达500人次，得20分；年服务达800人次，得30分；年服务达1000人次以上，得40分</td>
                                        <td  style="text-align: center"><span><font class="pf25" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">6</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input26" value="20"
                                                          class="in"/>助行服务：（1）陪同有需求的老年人户外散步、外出</label><br>
                                            <label><input type="checkbox" name="input26" value="40"
                                                          class="in"/>（2）能够提供助行器具服务</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">60</td>
                                        <td cospan="5">服务内容：最高得20分。其中，能够开展一项服务并有详细服务记录，得10分
                                            服务绩效：最高得40分。其中，年服务达200人次，得10分；年服务达500人次，得20分；年服务达800人次，得30分；年服务达1000人次以上，得40分</td>
                                        <td  style="text-align: center"><span><font class="pf26" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">7</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input27" value="10"
                                                          class="in"/>文教娱乐服务：开展适合老年人身心特点的活动</label><br>
                                            <label><input type="checkbox" name="input27" value="20"
                                                          class="in"/>歌舞、书画、手工、棋牌等文化、教育、体育、娱乐活动</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">30</td>
                                        <td cospan="5">能够开展两类活动，并有详细活动记录，得10分；能够开展三类活动，并有详细活动记录，得20分；能够开展四类活动，并有详细活动记录，得30分</td>
                                        <td  style="text-align: center"><span><font class="pf27" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">8</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input28" value="20"
                                                          class="in"/>心理慰藉服务：由心理咨询师、社会工作师、医护人员或经验丰富的养老护理员以陪同聊天、情绪安抚等形式开展心理慰藉</label><br>
                                            <label><input type="checkbox" name="input28" value="10"
                                                          class="in"/>有相应人员开展过服务并有详细服务记录</label>
                                        </td>
                                        <td class="fen" style="text-align: center">30</td>
                                        <td cospan="5">服务内容：有相应人员开展过服务并有详细服务记录，得10分
                                            服务绩效：最高得20分。其中，年服务达20人，得5分；年服务达50人，得10分；年服务达100人，得15分；年服务达150人以上，得20分</td>
                                        <td  style="text-align: center"><span><font class="pf28" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">9</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input29" value="20"
                                                          class="in"/>代办服务：根据老年人需求提供代购、代领物品，代缴费用等服务</label><br>
                                            <label><input type="checkbox" name="input29" value="10"
                                                          class="in"/>有相应人员开展过服务并有详细服务记录</label>
                                        </td>
                                        <td class="fen" style="text-align: center">30</td>
                                        <td cospan="5">服务内容：有相应人员开展过服务并有详细服务记录，得10分
                                            服务绩效：最高得20分。其中，年服务达100人次，得5分；年服务达150人次，得10分；年服务达200人次，得15分；年服务达250人次以上，得20分</td>
                                        <td  style="text-align: center"><span><font class="pf29" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">10</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input30" value="20"
                                                          class="in"/>针对社区老年人实际需求开展其他为老服务项目</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">20</td>
                                        <td cospan="5">有相应人员开展服务并有详细服务记录，得20分</td>
                                        <td  style="text-align: center"><span><font class="pf30" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">11</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input310" value="30"
                                                          class="in"/>上门服务次数</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">30</td>
                                        <td cospan="5">上门服务达300次/年，得10分；上门服务达600人次/年，得20分；上门服务达900人次/年，得30分</td>
                                        <td  style="text-align: center"><span><font class="pf310" color='red'>0</font></span></td>
                                    </tr>


                                    <tr>
                                        <td colspan="6"
                                            style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                            服务部分总评分数(总分500):<span id="all2"></span>
                                        </td>
                                    </tr>

                                </table>
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                管理部分（150分）</span>
                                        </td>
                                    </tr>
                                    <tr class="thisTr">
                                        <td>序号</td>
                                        <td cospan="5" style="text-align: center">标准要求</td>
                                        <td>分值</td>
                                        <td cospan="5" style="text-align: center">评分标准</td>
                                        <td>评分</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">1</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input31" value="10"
                                                          class="in"/>配有医护人员</label><br>
                                            <label><input type="checkbox" name="input31" value="5"
                                                          class="in"/>社工</label><br>
                                            <label><input type="checkbox" name="input31" value="5"
                                                          class="in"/>心理咨询师</label><br>
                                            <label><input type="checkbox" name="input31" value="5"
                                                          class="in"/>营养师</label><br>
                                            <label><input type="checkbox" name="input31" value="5"
                                                          class="in"/>康复师</label><br>

                                        </td>
                                        <td class="fen" style="text-align: center">30</td>
                                        <td cospan="5">配备依托医疗卫生服务机构提供签约服务的医护人员得3分，内设医疗卫生服务机构配备兼职医护人员得5分，内设医疗卫生服务机构配备专职医护人员得10分；配备兼职社工或心理咨询师得5分，配备专职社工或心理咨询师得10分；配备专（兼）职营养师得5分；配备专（兼）职康复师得5分</td>
                                        <td  style="text-align: center"><span><font class="pf31" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">2</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input32" value="10"
                                                          class="in"/>各场所卫生状况良好，物品分类放置整齐有序，橱柜及时清理保持整洁，地面干燥，空气无异味，入住老人个人卫生状况良好</label>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">以现场查勘情况为准，不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf32" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">3</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input33" value="3"
                                                          class="in"/>有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：相关证照</label><br>
                                            <label><input type="checkbox" name="input33" value="3"
                                                          class="in"/>有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：人员资质</label><br>
                                            <label><input type="checkbox" name="input33" value="3"
                                                          class="in"/>有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：地理位置</label><br>
                                            <label><input type="checkbox" name="input33" value="3"
                                                          class="in"/>有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：收费标准</label><br>
                                            <label><input type="checkbox" name="input33" value="3"
                                                          class="in"/>有介绍机构的宣传栏或手册，公开与机构服务相关的信息，包括：照护服务项目</label>
                                        </td>
                                        <td class="fen" style="text-align: center">15</td>
                                        <td cospan="5">无宣传栏和手册，不得分，公开内容不全，每缺少一项扣3分</td>
                                        <td  style="text-align: center"><span><font class="pf33" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">4</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input34" value="6"
                                                          class="in"/>每半年内开展一次人员培训</label><br>
                                            <label><input type="checkbox" name="input34" value="9"
                                                          class="in"/>培训内容包括以人为本、爱老尊老孝老服务理念、相关政策法规及管理服务技能</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">15</td>
                                        <td cospan="5">未及时开展培训，扣6分；未开展培训不得分</td>
                                        <td  style="text-align: center"><span><font class="pf34" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">5</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input35" value="8"
                                                          class="in"/>建立档案管理制度：（1）管理档案，包括文书档案、财务档案、员工信息等资料</label><br>
                                            <label><input type="checkbox" name="input35" value="4"
                                                          class="in"/>（2）服务档案，包括老年人信息、服务协议、服务项目、服务安排、服务记录等资料</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">12</td>
                                        <td cospan="5">缺少一类档案，扣6分；一类档案记录不规范按照现场查勘情况扣1-4分</td>
                                        <td  style="text-align: center"><span><font class="pf35" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">6</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input36" value="10"
                                                          class="in"/>制订各部门岗位职责，有完整的各项规章制度且有资料可查</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未制定部门岗位职责或未建立完整的规章制度不得分
                                        </td>
                                        <td  style="text-align: center"><span><font class="pf36" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">7</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input37" value="10"
                                                          class="in"/>建立员工考核制度，制订各部门、各岗位考核细则，确保各职能部门每月考核且有记录可查</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">无考核制度、未实施考核工作不得分；考核制度及实施考核不规范视情况扣分</td>
                                        <td  style="text-align: center"><span><font class="pf37" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">8</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input38" value="5"
                                                          class="in"/>设有多渠道的投诉途径，投诉渠道通畅并张贴于机构醒目处</label><br>
                                            <label><input type="checkbox" name="input38" value="5"
                                                          class="in"/>对投诉处理有专人负责，信息的核实、处理、整改、反馈及时并有记录</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未设多渠道的投诉途径不得分；对投诉未处理、记录、整改、反馈，按照现场查勘情况扣1-5分；未指定专人负责或无相关记录扣5分</td>
                                        <td  style="text-align: center"><span><font class="pf38" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">9</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input39" value="5"
                                                          class="in"/>建立服务绩效的自评分析机制。必要时采取预防和纠正措施</label><br>
                                            <label><input type="checkbox" name="input39" value="5"
                                                          class="in"/>自评分析（服务差错、意外事件、对象投诉、压疮发生率、服务满意度测评等）有记录</label><br>

                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未建立自评分析制度、未自评分析不得分；记录不规范按照现场查勘情况扣1-5分</td>
                                        <td  style="text-align: center"><span><font class="pf39" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">10</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input40" value="5"
                                                          class="in"/>多渠道（家属代表座谈会或个别访谈等）听取服务对象及家属对服务质量的评价与改进</label><br>
                                            <label><input type="checkbox" name="input40" value="5"
                                                          class="in"/>确保每年参与者为服务对象的10%，且有记录可查</label><br>

                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未听取服务对象及家属对服务质量的评价不得分；参与者人数不足10%扣5分</td>
                                        <td  style="text-align: center"><span><font class="pf40" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">11</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input410" value="10"
                                                          class="in"/>提供财务年度审计报告；财务人员须持证上岗；出纳、会计不能一人兼任；制定财务管理制度，财务账目规范</label><br>

                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">不符合任意一项要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf410" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">12</td>
                                        <td cospan="5">

                                            <label><input type="checkbox" name="input420" value="8"
                                                          class="in"/>遵守《中华人民共和国劳动法》，保护员工合法权益，建立员工激励机制</label><br>

                                        </td>
                                        <td class="fen" style="text-align: center">8</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf420" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                            管理部分总评分数(总分150):<span id="all3"></span>
                                        </td>
                                    </tr>
                                </table>
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px">
                                            <span class="caption-subject font-red bold uppercase">
                                                设施部分（150分）</span>
                                        </td>
                                    </tr>
                                    <tr class="thisTr">
                                        <td>序号</td>
                                        <td cospan="5" style="text-align: center">标准要求</td>
                                        <td>分值</td>
                                        <td cospan="5" style="text-align: center">评分标准</td>
                                        <td>评分</td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">1</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input41" value="3"
                                                          class="in"/>（1）服务中心设置在交通便利、社区生活配套设施或公共绿地附近</label><br>
                                            <label><input type="checkbox" name="input41" value="3"
                                                          class="in"/>（2）靠近（或内设）医疗服务设施、公园等其他公共服务设施</label><br>
                                            <label><input type="checkbox" name="input41" value="3"
                                                          class="in"/>（3）保持相对独立，有较高的可识别性，可就近解决老年人的基本需求</label><br>
                                            <label><input type="checkbox" name="input41" value="3"
                                                          class="in"/>（4）有良好的朝向和日照条件，满足通风、防寒、防灾等要求</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">12</td>
                                        <td cospan="5">每有一项不符合要求扣3分</td>
                                        <td  style="text-align: center"><span><font class="pf41" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">2</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input42" value="8"
                                                          class="in"/>服务中心设置在建筑物一层，或设置担架电梯或无障碍通道的二层、三层</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">8</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf42" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">3</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input43" value="1"
                                                          class="in"/>（1）独立设置室外坡道且有效宽度不小于1.50m；</label><br>
                                            <label><input type="checkbox" name="input43" value="1"
                                                          class="in"/>（2）坡道的起止点有≥1.50m×1.50m回转面积</label><br>
                                            <label><input type="checkbox" name="input43" value="3"
                                                          class="in"/>（3）坡道、过厅、走廊、楼梯设置双侧扶手</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">5</td>
                                        <td cospan="5">无坡道不得分；（1）项不符合要求扣1分；（2）项不符合要求扣1分；（3）项不符合要求扣3分</td>
                                        <td  style="text-align: center"><span><font class="pf43" color='red'>0</font></span></td>
                                    </tr>


                                    <tr>
                                        <td style="text-align: center">4</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input44" value="3"
                                                          class="in"/>（1）楼梯设置双侧扶手</label><br>
                                            <label><input type="checkbox" name="input44" value="2"
                                                          class="in"/>（2）不采用弧形楼梯和螺旋楼梯，楼段通行净宽不小于1.2m，各级踏步均匀一致</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">5</td>
                                        <td cospan="5">（1）项不符合要求扣3分；（2）项不符合要求扣2分</td>
                                        <td  style="text-align: center"><span><font class="pf44" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">5</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input45" value="6"
                                                          class="in"/>（1）设置照料护理用房，不与电梯井道、有噪声振动的设备机房等邻近，设置床（椅）位平均使用面积每张达到5平方米以上，床和家具符合老年期生理功能需求</label><br>
                                            <label><input type="checkbox" name="input45" value="3"
                                                          class="in"/>（2）照料护理用房有自然通风和采光条件，室内净高不低于2.6m</label><br>
                                            <label><input type="checkbox" name="input45" value="3"
                                                          class="in"/>（3）照料护理用房留有轮椅回转空间，不设门槛，主要通道的净宽不小于1m并设置扶手，床边留有护理、急救操作空间，相邻床位的长边间距不小于0.8m</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">12</td>
                                        <td cospan="5">未按（1）项要求设置照料护理用房不得分；（2）项不符合要求扣3分；（3）项不符合要求扣3分</td>
                                        <td  style="text-align: center"><span><font class="pf45" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">6</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input46" value="5"
                                                          class="in"/>（1）设置公共卫生间，与老年人经常使用的公共活动用房同层且邻近，设置便器、洗手盆，且光线明亮，具备通风换气条件，空气无异味</label><br>
                                            <label><input type="checkbox" name="input46" value="5"
                                                          class="in"/>（2）设置无障碍厕位，便器旁安装扶手，地面选防滑材料</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未按（1）项要求设置公共卫生间不得分；（2）项不符合要求扣5分</td>
                                        <td  style="text-align: center"><span><font class="pf46" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">7</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input47" value="5"
                                                          class="in"/>（1）设有公共餐厅，使用可移动的、牢固的桌椅</label><br>
                                            <label><input type="checkbox" name="input47" value="5"
                                                          class="in"/>（2）为护理员留有分餐、助餐空间；采用柜台式售饭方式的，设置低位服务窗口</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未按（1）项要求设置公共餐厅不得分；（2）项不符合要求扣5分</td>
                                        <td  style="text-align: center"><span><font class="pf47" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">8</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input48" value="5"
                                                          class="in"/>（1）在相对独立的区域设有厨房，且布局合理，温度适宜，有供餐车停放空间和消毒空间，有排风、排烟、排污、消防设施和适当的防潮、消声、隔声、通风、除尘措施，符合卫生、环保和消防要求</label><br>
                                            <label><input type="checkbox" name="input48" value="5"
                                                          class="in"/>（2）墙面使用瓷砖，地面使用防滑材料，配有各种厨房用具，清洗、消毒、储存设备设施</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未按（1）项要求设置厨房不得分；（2）项不符合要求扣5分。采取配餐方式的，此项不扣分；未开展助餐服务的，此项不得分</td>
                                        <td  style="text-align: center"><span><font class="pf48" color='red'>0</font></span></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center">9</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input49" value="5"
                                                          class="in"/>（1）公共活动用房有良好的天然采光与自然通风条件，且对照料护理用房不产生干扰</label><br>
                                            <label><input type="checkbox" name="input49" value="5"
                                                          class="in"/>（2）配备电视、音响、健身器材、休闲棋牌类用品、书籍报刊等</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">未按（1）项要求设置公共活动用房不得分；（2）项不符合要求扣5分</td>
                                        <td  style="text-align: center"><span><font class="pf49" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">10</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input50" value="10"
                                                          class="in"/>设有医疗机构或医疗保健用房</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">设有医疗卫生机构得10分；设有医疗保健用房得6分；不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf50" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">11</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input51" value="10"
                                                          class="in"/>设置老年人康复用房，配置有相应设备及康复器材</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">不符合要求不得分</td>
                                        <td  style="text-align: center"><span><font class="pf51" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">12</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input52" value="10"
                                                          class="in"/>配有公用浴室，有助浴设施、采暖设施和通风换气装置，地面作防滑处理或铺设防滑垫，设置安全扶手，能够根据老年人身体状况调节水温，且空间便于轮椅进出，留有助浴空间，地面无高差</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">不符合要求不得分，如：公用浴室设置不规范无助浴空间、地面有高差等</td>
                                        <td  style="text-align: center"><span><font class="pf52" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">13</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input53" value="5"
                                                          class="in"/>（1）配有洗衣机等设施，且操作场所布局合理，洁污分开、通风良好</label><br>
                                            <label><input type="checkbox" name="input53" value="3"
                                                          class="in"/>（2）设置污染衣物预洗和消毒水池</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">8</td>
                                        <td cospan="5">（1）项不符合要求扣5分；（2）项不符合要求扣3分</td>
                                        <td  style="text-align: center"><span><font class="pf53" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">14</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input54" value="2"
                                                          class="in"/>配有给水设施</label><br>
                                            <label><input type="checkbox" name="input54" value="2"
                                                          class="in"/>排水设施</label><br>
                                            <label><input type="checkbox" name="input54" value="2"
                                                          class="in"/>热水供应设施</label><br>
                                            <label><input type="checkbox" name="input54" value="2"
                                                          class="in"/>采暖设施</label><br>
                                            <label><input type="checkbox" name="input54" value="2"
                                                          class="in"/>空调设备</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">10</td>
                                        <td cospan="5">缺少一项设施设备扣2分</td>
                                        <td  style="text-align: center"><span><font class="pf54" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">15</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input55" value="8"
                                                          class="in"/>（1）照料护理用房、卫生间、浴室、公用浴室、公用卫生间、公共活动区域安装呼叫装置且触摸方便，呼叫装置终端与每个楼层照护站相连</label><br>
                                            <label><input type="checkbox" name="input55" value="7"
                                                          class="in"/>（2）出入口、就餐空间、活动场所安装视频监控系统</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">15</td>
                                        <td cospan="5">（1）未设置呼叫装置扣8分；呼叫装置设置不规范或不到位扣4分；呼叫装置未与每个楼层招呼站相连扣4分；（2）未安装视频监控系统扣7分，安装不规范不到位视情况扣1-3分</td>
                                        <td  style="text-align: center"><span><font class="pf55" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">16</td>
                                        <td cospan="5">
                                            <label><input type="checkbox" name="input56" value="3"
                                                          class="in"/>（1）照料护理用房设置顶灯、床头灯、脚灯等照明设备</label><br>
                                            <label><input type="checkbox" name="input56" value="2"
                                                          class="in"/>（2）出入口内、外及平台、阳台、走廊、楼梯等公共部位设有照明设备</label><br>
                                        </td>
                                        <td class="fen" style="text-align: center">5</td>
                                        <td cospan="5">（1）项未设置照明设备或照明设备配备不到位扣3分；（2）项出入口内、外平台或阳台、走廊、楼梯等公共部位未设置照明设备或照明设备配备不到位扣2分</td>
                                        <td  style="text-align: center"><span><font class="pf56" color='red'>0</font></span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: right;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                            设施部分总评分数(总分150):<span id="all4"></span>
                                        </td>
                                    </tr>
                                </table>
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6"
                                            style="text-align: center;vertical-align: middle;font-size: 18px" class="caption-subject font-red bold uppercase">
                                            社区养老服务站星级评定标准总评评分(总分1000):<span id="all5"></span>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addGovBuy">保存</button>
                                <button onclick="getback()" type="button" class="btn btn-default">返回
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 导入模态框（Modal） -->
        <div class="modal fade" id="areaModal" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">请选择所属区域</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree"
                             class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue"
                                onclick="CommunityPensionStarsList2.getAreaName()">
                            确定
                        </button>
                        <button type="button"
                                class="btn default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
     <%--   <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/community_pension_stars_list2.js?v=2.1"></script>--%>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                AreaTree.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });
                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                })

                $("#addGovBuy .select").click(function () {
                    showModel("${zuzhiRoleId}");
                });

                $("#selectArea .add").click(function () {
                    var select = AreaTree.getSelectArea();
                    if (select != -1) {
                        $("#serviceOrgId").val(select);
                        $("#serviceOrgName").val(AreaTree.getSelectAreaName(select))

                        $("#selectArea").modal("hide");
                    }
                });
                $(".addGovBuy").click(function () {
                    addGovbuy();
                });

                //数据绑定
                $("label").click(function () {
                    var obj1 = document.getElementsByName("input1");
                    var obj1_1 = "";
                    for (var i = 0; i < obj1.length; i++) {
                        if (obj1[i].checked) {
                            obj1_1 += obj1[i].value + ",";
                        } else {
                            obj1_1 += "0,";
                        }
                    }
                    var arr1 = obj1_1.split(",");

                    $(this).parent().parent().find(".pf1").html(parseInt(arr1[0]));

                    var obj2 = document.getElementsByName("input2");
                    var obj2_1 = "";
                    for (var i = 0; i < obj2.length; i++) {
                        if (obj2[i].checked) {
                            obj2_1 += obj2[i].value + ",";
                        } else {
                            obj2_1 += "0,";
                        }
                    }
                    var arr2 = obj2_1.split(",");
                    $(this).parent().parent().find(".pf2").html(parseInt(arr2[0]) + parseInt(arr2[1]));

                    var obj3 = document.getElementsByName("input3");
                    var obj3_1 = "";
                    for (var i = 0; i < obj3.length; i++) {
                        if (obj3[i].checked) {
                            obj3_1 += obj3[i].value + ",";
                        } else {
                            obj3_1 += "0,";
                        }
                    }
                    var arr3 = obj3_1.split(",");

                    $(this).parent().parent().find(".pf3").html(parseInt(arr3[0]) + parseInt(arr3[1]) + parseInt(arr3[2]));

                    var obj4 = document.getElementsByName("input4");
                    var obj4_1 = "";
                    for (var i = 0; i < obj4.length; i++) {
                        if (obj4[i].checked) {
                            obj4_1 += obj4[i].value + ",";
                        } else {
                            obj4_1 += "0,";
                        }
                    }
                    var arr4 = obj4_1.split(",");

                    $(this).parent().parent().find(".pf4").html(parseInt(arr4[0]) + parseInt(arr4[1]) + parseInt(arr4[2]));

                    var obj5 = document.getElementsByName("input5");
                    var obj5_1 = "";
                    for (var i = 0; i < obj5.length; i++) {
                        if (obj5[i].checked) {
                            obj5_1 += obj5[i].value + ",";
                        } else {
                            obj5_1 += "0,";
                        }
                    }
                    var arr5 = obj5_1.split(",");

                    $(this).parent().parent().find(".pf5").html(parseInt(arr5[0]) + parseInt(arr5[1]));

                    var obj6 = document.getElementsByName("input6");
                    var obj6_1 = "";
                    for (var i = 0; i < obj6.length; i++) {
                        if (obj6[i].checked) {
                            obj6_1 += obj6[i].value + ",";
                        } else {
                            obj6_1 += "0,";
                        }
                    }
                    var arr6 = obj6_1.split(",");

                    $(this).parent().parent().find(".pf6").html(parseInt(arr6[0]) + parseInt(arr6[1]) + parseInt(arr6[2]));

                    var obj7 = document.getElementsByName("input7");
                    var obj7_1 = "";
                    for (var i = 0; i < obj7.length; i++) {
                        if (obj7[i].checked) {
                            obj7_1 += obj7[i].value + ",";
                        } else {
                            obj7_1 += "0,";
                        }
                    }
                    var arr7 = obj7_1.split(",");

                    $(this).parent().parent().find(".pf7").html(parseInt(arr7[0]) + parseInt(arr7[1]));


                    var obj8 = document.getElementsByName("input8");
                    var obj8_1 = "";
                    for (var i = 0; i < obj8.length; i++) {
                        if (obj8[i].checked) {
                            obj8_1 += obj8[i].value + ",";
                        } else {
                            obj8_1 += "0,";
                        }
                    }
                    var arr8 = obj8_1.split(",");

                    $(this).parent().parent().find(".pf8").html(parseInt(arr8[0]));

                    var obj9 = document.getElementsByName("input9");
                    var obj9_1 = "";
                    for (var i = 0; i < obj9.length; i++) {
                        if (obj9[i].checked) {
                            obj9_1 += obj9[i].value + ",";
                        } else {
                            obj9_1 += "0,";
                        }
                    }
                    var arr9 = obj9_1.split(",");

                    $(this).parent().parent().find(".pf9").html(parseInt(arr9[0])+parseInt(arr9[1]));

                    var obj10 = document.getElementsByName("input10");
                    var obj10_1 = "";
                    for (var i = 0; i < obj10.length; i++) {
                        if (obj10[i].checked) {
                            obj10_1 += obj10[i].value + ",";
                        } else {
                            obj10_1 += "0,";
                        }
                    }
                    var arr10 = obj10_1.split(",");

                    $(this).parent().parent().find(".pf10").html(parseInt(arr10[0]));

                    var obj11 = document.getElementsByName("input11");
                    var obj11_1 = "";
                    for (var i = 0; i < obj11.length; i++) {
                        if (obj11[i].checked) {
                            obj11_1 += obj11[i].value + ",";
                        } else {
                            obj11_1 += "0,";
                        }
                    }
                    var arr11 = obj11_1.split(",");

                    $(this).parent().parent().find(".pf11").html(parseInt(arr11[0]) + parseInt(arr11[1]) + parseInt(arr11[2]) + parseInt(arr11[3]));

                    var obj12 = document.getElementsByName("input12");
                    var obj12_1 = "";
                    for (var i = 0; i < obj12.length; i++) {
                        if (obj12[i].checked) {
                            obj12_1 += obj12[i].value + ",";
                        } else {
                            obj12_1 += "0,";
                        }
                    }
                    var arr12 = obj12_1.split(",");

                    $(this).parent().parent().find(".pf12").html(parseInt(arr12[0]) + parseInt(arr12[1])+ parseInt(arr12[2])+ parseInt(arr12[3]));

                    var obj13 = document.getElementsByName("input13");
                    var obj13_1 = "";
                    for (var i = 0; i < obj13.length; i++) {
                        if (obj13[i].checked) {
                            obj13_1 += obj13[i].value + ",";
                        } else {
                            obj13_1 += "0,";
                        }
                    }
                    var arr13 = obj13_1.split(",");

                    $(this).parent().parent().find(".pf13").html(parseInt(arr13[0]));

                    var obj14 = document.getElementsByName("input14");
                    var obj14_1 = "";
                    for (var i = 0; i < obj14.length; i++) {
                        if (obj14[i].checked) {
                            obj14_1 += obj14[i].value + ",";
                        } else {
                            obj14_1 += "0,";
                        }
                    }
                    var arr14 = obj14_1.split(",");

                    $(this).parent().parent().find(".pf14").html(parseInt(arr14[0]));

                    var obj15 = document.getElementsByName("input15");
                    var obj15_1 = "";
                    for (var i = 0; i < obj15.length; i++) {
                        if (obj15[i].checked) {
                            obj15_1 += obj15[i].value + ",";
                        } else {
                            obj15_1 += "0,";
                        }
                    }
                    var arr15 = obj15_1.split(",");

                    $(this).parent().parent().find(".pf15").html(parseInt(arr15[0]));

                    var obj16 = document.getElementsByName("input16");
                    var obj16_1 = "";
                    for (var i = 0; i < obj16.length; i++) {
                        if (obj16[i].checked) {
                            obj16_1 += obj16[i].value + ",";
                        } else {
                            obj16_1 += "0,";
                        }
                    }
                    var arr16 = obj16_1.split(",");

                    $(this).parent().parent().find(".pf16").html(parseInt(arr16[0])+parseInt(arr16[1])+parseInt(arr16[2]));

                    var obj17 = document.getElementsByName("input17");
                    var obj17_1 = "";
                    for (var i = 0; i < obj17.length; i++) {
                        if (obj17[i].checked) {
                            obj17_1 += obj17[i].value + ",";
                        } else {
                            obj17_1 += "0,";
                        }
                    }
                    var arr17 = obj17_1.split(",");

                    $(this).parent().parent().find(".pf17").html(parseInt(arr17[0])+parseInt(arr17[1]));

                    var obj18 = document.getElementsByName("input18");
                    var obj18_1 = "";
                    for (var i = 0; i < obj18.length; i++) {
                        if (obj18[i].checked) {
                            obj18_1 += obj18[i].value + ",";
                        } else {
                            obj18_1 += "0,";
                        }
                    }
                    var arr18 = obj18_1.split(",");

                    $(this).parent().parent().find(".pf18").html(parseInt(arr18[0]));

                    var obj19 = document.getElementsByName("input19");
                    var obj19_1 = "";
                    for (var i = 0; i < obj19.length; i++) {
                        if (obj19[i].checked) {
                            obj19_1 += obj19[i].value + ",";
                        } else {
                            obj19_1 += "0,";
                        }
                    }
                    var arr19 = obj19_1.split(",");

                    $(this).parent().parent().find(".pf19").html(parseInt(arr19[0])+parseInt(arr19[1]));

                    var obj20 = document.getElementsByName("input20");
                    var obj20_1 = "";
                    for (var i = 0; i < obj20.length; i++) {
                        if (obj20[i].checked) {
                            obj20_1 += obj20[i].value + ",";
                        } else {
                            obj20_1 += "0,";
                        }
                    }
                    var arr20 = obj20_1.split(",");

                    $(this).parent().parent().find(".pf20").html(parseInt(arr20[0])+parseInt(arr20[1]));

                    var obj210 = document.getElementsByName("input210");
                    var obj210_1 = "";
                    for (var i = 0; i < obj210.length; i++) {
                        if (obj210[i].checked) {
                            obj210_1 += obj210[i].value + ",";
                        } else {
                            obj210_1 += "0,";
                        }
                    }
                    var arr210 = obj210_1.split(",");

                    $(this).parent().parent().find(".pf210").html(parseInt(arr210[0])+parseInt(arr210[1]));




                    /*安全部分总评分数*/
                    $("#all").html(parseInt(arr1[0]) + parseInt(arr2[0]) + parseInt(arr2[1])+ parseInt(arr3[0]) + parseInt(arr3[1]) + parseInt(arr3[2])+parseInt(arr4[0]) + parseInt(arr4[1]) + parseInt(arr4[2])+parseInt(arr5[0]) + parseInt(arr5[1])+parseInt(arr6[0]) + parseInt(arr6[1]) + parseInt(arr6[2])+parseInt(arr7[0]) + parseInt(arr7[1])+parseInt(arr8[0])+parseInt(arr9[0])+parseInt(arr9[1])+parseInt(arr10[0])+parseInt(arr11[0]) + parseInt(arr11[1]) + parseInt(arr11[2]) + parseInt(arr11[3])+parseInt(arr12[0]) + parseInt(arr12[1])+ parseInt(arr12[2])+ parseInt(arr12[3])+parseInt(arr13[0])+parseInt(arr14[0])+parseInt(arr15[0])+parseInt(arr16[0])+parseInt(arr16[1])+parseInt(arr16[2])+parseInt(arr17[0])+parseInt(arr17[1])+parseInt(arr18[0])+parseInt(arr19[0])+parseInt(arr19[1])+parseInt(arr20[0])+parseInt(arr20[1])+parseInt(arr210[0])+parseInt(arr210[1]));



                    var obj21 = document.getElementsByName("input21");
                    var obj21_1 = "";
                    for (var i = 0; i < obj21.length; i++) {
                        if (obj21[i].checked) {
                            obj21_1 += obj21[i].value + ",";
                        } else {
                            obj21_1 += "0,";
                        }
                    }
                    var arr21 = obj21_1.split(",");

                    $(this).parent().parent().find(".pf21").html(parseInt(arr21[0]) + parseInt(arr21[1]));

                    var obj22 = document.getElementsByName("input22");
                    var obj22_1 = "";
                    for (var i = 0; i < obj22.length; i++) {
                        if (obj22[i].checked) {
                            obj22_1 += obj22[i].value + ",";
                        } else {
                            obj22_1 += "0,";
                        }
                    }
                    var arr22 = obj22_1.split(",");

                    $(this).parent().parent().find(".pf22").html(parseInt(arr22[0])+parseInt(arr22[1])+parseInt(arr22[2])+parseInt(arr22[3]));

                    var obj23 = document.getElementsByName("input23");
                    var obj23_1 = "";
                    for (var i = 0; i < obj23.length; i++) {
                        if (obj23[i].checked) {
                            obj23_1 += obj23[i].value + ",";
                        } else {
                            obj23_1 += "0,";
                        }
                    }
                    var arr23 = obj23_1.split(",");

                    $(this).parent().parent().find(".pf23").html(parseInt(arr23[0])+parseInt(arr23[1])+parseInt(arr23[2])+parseInt(arr23[3]));

                    var obj24 = document.getElementsByName("input24");
                    var obj24_1 = "";
                    for (var i = 0; i < obj24.length; i++) {
                        if (obj24[i].checked) {
                            obj24_1 += obj24[i].value + ",";
                        } else {
                            obj24_1 += "0,";
                        }
                    }
                    var arr24 = obj24_1.split(",");

                    $(this).parent().parent().find(".pf24").html(parseInt(arr24[0]) + parseInt(arr24[1]));

                    var obj25 = document.getElementsByName("input25");
                    var obj25_1 = "";
                    for (var i = 0; i < obj25.length; i++) {
                        if (obj25[i].checked) {
                            obj25_1 += obj25[i].value + ",";
                        } else {
                            obj25_1 += "0,";
                        }
                    }
                    var arr25 = obj25_1.split(",");

                    $(this).parent().parent().find(".pf25").html(parseInt(arr25[0]) + parseInt(arr25[1]));

                    var obj26 = document.getElementsByName("input26");
                    var obj26_1 = "";
                    for (var i = 0; i < obj26.length; i++) {
                        if (obj26[i].checked) {
                            obj26_1 += obj26[i].value + ",";
                        } else {
                            obj26_1 += "0,";
                        }
                    }
                    var arr26 = obj26_1.split(",");

                    $(this).parent().parent().find(".pf26").html(parseInt(arr26[0])+parseInt(arr26[1]));

                    var obj27 = document.getElementsByName("input27");
                    var obj27_1 = "";
                    for (var i = 0; i < obj27.length; i++) {
                        if (obj27[i].checked) {
                            obj27_1 += obj27[i].value + ",";
                        } else {
                            obj27_1 += "0,";
                        }
                    }
                    var arr27 = obj27_1.split(",");
                    $(this).parent().parent().find(".pf27").html(parseInt(arr27[0])+parseInt(arr27[1]));

                    var obj28 = document.getElementsByName("input28");
                    var obj28_1 = "";
                    for (var i = 0; i < obj28.length; i++) {
                        if (obj28[i].checked) {
                            obj28_1 += obj28[i].value + ",";
                        } else {
                            obj28_1 += "0,";
                        }
                    }
                    var arr28 = obj28_1.split(",");
                    $(this).parent().parent().find(".pf28").html(parseInt(arr28[0])+parseInt(arr28[1]));

                    var obj29 = document.getElementsByName("input29");
                    var obj29_1 = "";
                    for (var i = 0; i < obj29.length; i++) {
                        if (obj29[i].checked) {
                            obj29_1 += obj29[i].value + ",";
                        } else {
                            obj29_1 += "0,";
                        }
                    }
                    var arr29 = obj29_1.split(",");
                    $(this).parent().parent().find(".pf29").html(parseInt(arr29[0])+parseInt(arr29[1]));

                    var obj30 = document.getElementsByName("input30");
                    var obj30_1 = "";
                    for (var i = 0; i < obj30.length; i++) {
                        if (obj30[i].checked) {
                            obj30_1 += obj30[i].value + ",";
                        } else {
                            obj30_1 += "0,";
                        }
                    }
                    var arr30 = obj30_1.split(",");
                    $(this).parent().parent().find(".pf30").html(parseInt(arr30[0]));

                    var obj310 = document.getElementsByName("input310");
                    var obj310_1 = "";
                    for (var i = 0; i < obj310.length; i++) {
                        if (obj310[i].checked) {
                            obj310_1 += obj310[i].value + ",";
                        } else {
                            obj310_1 += "0,";
                        }
                    }
                    var arr310 = obj310_1.split(",");
                    $(this).parent().parent().find(".pf310").html(parseInt(arr310[0]));

                    /* 服务部分总评分数*/
                    $("#all2").html(parseInt(arr21[0]) + parseInt(arr21[1])+ parseInt(arr22[0])+ parseInt(arr22[1])+ parseInt(arr22[2])+ parseInt(arr22[3])+parseInt(arr23[0])+parseInt(arr23[1])+parseInt(arr23[2])+parseInt(arr23[3])+parseInt(arr24[0]) + parseInt(arr24[1])+parseInt(arr25[0]) + parseInt(arr25[1]) +parseInt(arr26[0])+parseInt(arr26[1])+parseInt(arr27[0])+parseInt(arr27[1])+parseInt(arr28[0])+parseInt(arr28[1])+parseInt(arr29[0])+parseInt(arr29[1])+parseInt(arr30[0])+parseInt(arr310[0]));

                    var obj31 = document.getElementsByName("input31");
                    var obj31_1 = "";
                    for (var i = 0; i < obj31.length; i++) {
                        if (obj31[i].checked) {
                            obj31_1 += obj31[i].value + ",";
                        } else {
                            obj31_1 += "0,";
                        }
                    }
                    var arr31 = obj31_1.split(",");
                    $(this).parent().parent().find(".pf31").html(parseInt(arr31[0]) + parseInt(arr31[1])+ parseInt(arr31[2])+ parseInt(arr31[3])+ parseInt(arr31[4]));

                    var obj32 = document.getElementsByName("input32");
                    var obj32_1 = "";
                    for (var i = 0; i < obj32.length; i++) {
                        if (obj32[i].checked) {
                            obj32_1 += obj32[i].value + ",";
                        } else {
                            obj32_1 += "0,";
                        }
                    }
                    var arr32 = obj32_1.split(",");
                    $(this).parent().parent().find(".pf32").html(parseInt(arr32[0]));

                    var obj33 = document.getElementsByName("input33");
                    var obj33_1 = "";
                    for (var i = 0; i < obj33.length; i++) {
                        if (obj33[i].checked) {
                            obj33_1 += obj33[i].value + ",";
                        } else {
                            obj33_1 += "0,";
                        }
                    }
                    var arr33 = obj33_1.split(",");
                    $(this).parent().parent().find(".pf33").html(parseInt(arr33[0]) + parseInt(arr33[1]) + parseInt(arr33[2]) + parseInt(arr33[3]) + parseInt(arr33[4]));

                    var obj34 = document.getElementsByName("input34");
                    var obj34_1 = "";
                    for (var i = 0; i < obj34.length; i++) {
                        if (obj34[i].checked) {
                            obj34_1 += obj34[i].value + ",";
                        } else {
                            obj34_1 += "0,";
                        }
                    }
                    var arr34 = obj34_1.split(",");
                    $(this).parent().parent().find(".pf34").html(parseInt(arr34[0]) + parseInt(arr34[1]));

                    var obj35 = document.getElementsByName("input35");
                    var obj35_1 = "";
                    for (var i = 0; i < obj35.length; i++) {
                        if (obj35[i].checked) {
                            obj35_1 += obj35[i].value + ",";
                        } else {
                            obj35_1 += "0,";
                        }
                    }
                    var arr35 = obj35_1.split(",");
                    $(this).parent().parent().find(".pf35").html(parseInt(arr35[0])+parseInt(arr35[1]));

                    var obj36 = document.getElementsByName("input36");
                    var obj36_1 = "";
                    for (var i = 0; i < obj36.length; i++) {
                        if (obj36[i].checked) {
                            obj36_1 += obj36[i].value + ",";
                        } else {
                            obj36_1 += "0,";
                        }
                    }
                    var arr36 = obj36_1.split(",");
                    $(this).parent().parent().find(".pf36").html(parseInt(arr36[0]));

                    var obj37 = document.getElementsByName("input37");
                    var obj37_1 = "";
                    for (var i = 0; i < obj37.length; i++) {
                        if (obj37[i].checked) {
                            obj37_1 += obj37[i].value + ",";
                        } else {
                            obj37_1 += "0,";
                        }
                    }
                    var arr37 = obj37_1.split(",");
                    $(this).parent().parent().find(".pf37").html(parseInt(arr37[0]));

                    var obj38 = document.getElementsByName("input38");
                    var obj38_1 = "";
                    for (var i = 0; i < obj38.length; i++) {
                        if (obj38[i].checked) {
                            obj38_1 += obj38[i].value + ",";
                        } else {
                            obj38_1 += "0,";
                        }
                    }
                    var arr38 = obj38_1.split(",");
                    $(this).parent().parent().find(".pf38").html(parseInt(arr38[0]) + parseInt(arr38[1]));

                    var obj39 = document.getElementsByName("input39");
                    var obj39_1 = "";
                    for (var i = 0; i < obj39.length; i++) {
                        if (obj39[i].checked) {
                            obj39_1 += obj39[i].value + ",";
                        } else {
                            obj39_1 += "0,";
                        }
                    }
                    var arr39 = obj39_1.split(",");
                    $(this).parent().parent().find(".pf39").html(parseInt(arr39[0])+parseInt(arr39[1]));

                    var obj40 = document.getElementsByName("input40");
                    var obj40_1 = "";
                    for (var i = 0; i < obj40.length; i++) {
                        if (obj40[i].checked) {
                            obj40_1 += obj40[i].value + ",";
                        } else {
                            obj40_1 += "0,";
                        }
                    }
                    var arr40 = obj40_1.split(",");
                    $(this).parent().parent().find(".pf40").html(parseInt(arr40[0])+parseInt(arr40[1]));

                    var obj410 = document.getElementsByName("input410");
                    var obj410_1 = "";
                    for (var i = 0; i < obj410.length; i++) {
                        if (obj410[i].checked) {
                            obj410_1 += obj410[i].value + ",";
                        } else {
                            obj410_1 += "0,";
                        }
                    }
                    var arr410 = obj410_1.split(",");
                    $(this).parent().parent().find(".pf410").html(parseInt(arr410[0]));

                    var obj420 = document.getElementsByName("input420");
                    var obj420_1 = "";
                    for (var i = 0; i < obj420.length; i++) {
                        if (obj420[i].checked) {
                            obj420_1 += obj420[i].value + ",";
                        } else {
                            obj420_1 += "0,";
                        }
                    }
                    var arr420 = obj420_1.split(",");
                    $(this).parent().parent().find(".pf420").html(parseInt(arr420[0]));


                    var obj41 = document.getElementsByName("input41");
                    var obj41_1 = "";
                    for (var i = 0; i < obj41.length; i++) {
                        if (obj41[i].checked) {
                            obj41_1 += obj41[i].value + ",";
                        } else {
                            obj41_1 += "0,";
                        }
                    }

                    /* 管理部分总评分数*/
                    $("#all3").html(parseInt(arr31[0]) + parseInt(arr31[1])+ parseInt(arr31[2])+ parseInt(arr31[3])+ parseInt(arr31[4])+parseInt(arr32[0])+parseInt(arr33[0]) + parseInt(arr33[1]) + parseInt(arr33[2]) + parseInt(arr33[3]) + parseInt(arr33[4])+parseInt(arr34[0]) + parseInt(arr34[1])+parseInt(arr35[0])+parseInt(arr35[1])+parseInt(arr36[0]) +parseInt(arr37[0])+parseInt(arr38[0]) + parseInt(arr38[1])+ parseInt(arr39[0])+ parseInt(arr39[1])+ parseInt(arr40[0])+ parseInt(arr40[1])+ parseInt(arr410[0])+ parseInt(arr420[0]));

                    var arr41 = obj41_1.split(",");
                    $(this).parent().parent().find(".pf41").html(parseInt(arr41[0]) + parseInt(arr41[1]) + parseInt(arr41[2]) + parseInt(arr41[3]));

                    var obj42 = document.getElementsByName("input42");
                    var obj42_1 = "";
                    for (var i = 0; i < obj42.length; i++) {
                        if (obj42[i].checked) {
                            obj42_1 += obj42[i].value + ",";
                        } else {
                            obj42_1 += "0,";
                        }
                    }
                    var arr42 = obj42_1.split(",");
                    $(this).parent().parent().find(".pf42").html(parseInt(arr42[0]));

                    var obj43 = document.getElementsByName("input43");
                    var obj43_1 = "";
                    for (var i = 0; i < obj43.length; i++) {
                        if (obj43[i].checked) {
                            obj43_1 += obj43[i].value + ",";
                        } else {
                            obj43_1 += "0,";
                        }
                    }
                    var arr43 = obj43_1.split(",");
                    $(this).parent().parent().find(".pf43").html(parseInt(arr43[0])+parseInt(arr43[1])+parseInt(arr43[2]));

                    var obj44 = document.getElementsByName("input44");
                    var obj44_1 = "";
                    for (var i = 0; i < obj44.length; i++) {
                        if (obj44[i].checked) {
                            obj44_1 += obj44[i].value + ",";
                        } else {
                            obj44_1 += "0,";
                        }
                    }
                    var arr44 = obj44_1.split(",");
                    $(this).parent().parent().find(".pf44").html(parseInt(arr44[0]) + parseInt(arr44[1]));

                    var obj45 = document.getElementsByName("input45");
                    var obj45_1 = "";
                    for (var i = 0; i < obj45.length; i++) {
                        if (obj45[i].checked) {
                            obj45_1 += obj45[i].value + ",";
                        } else {
                            obj45_1 += "0,";
                        }
                    }
                    var arr45 = obj45_1.split(",");
                    $(this).parent().parent().find(".pf45").html(parseInt(arr45[0]) + parseInt(arr45[1])+ parseInt(arr45[2]));

                    var obj46 = document.getElementsByName("input46");
                    var obj46_1 = "";
                    for (var i = 0; i < obj46.length; i++) {
                        if (obj46[i].checked) {
                            obj46_1 += obj46[i].value + ",";
                        } else {
                            obj46_1 += "0,";
                        }
                    }
                    var arr46 = obj46_1.split(",");
                    $(this).parent().parent().find(".pf46").html(parseInt(arr46[0]) + parseInt(arr46[1]));

                    var obj47 = document.getElementsByName("input47");
                    var obj47_1 = "";
                    for (var i = 0; i < obj47.length; i++) {
                        if (obj47[i].checked) {
                            obj47_1 += obj47[i].value + ",";
                        } else {
                            obj47_1 += "0,";
                        }
                    }
                    var arr47 = obj47_1.split(",");
                    $(this).parent().parent().find(".pf47").html(parseInt(arr47[0])+parseInt(arr47[1]));

                    var obj48 = document.getElementsByName("input48");
                    var obj48_1 = "";
                    for (var i = 0; i < obj48.length; i++) {
                        if (obj48[i].checked) {
                            obj48_1 += obj48[i].value + ",";
                        } else {
                            obj48_1 += "0,";
                        }
                    }
                    var arr48 = obj48_1.split(",");
                    $(this).parent().parent().find(".pf48").html(parseInt(arr48[0])+ parseInt(arr48[1]));

                    var obj49 = document.getElementsByName("input49");
                    var obj49_1 = "";
                    for (var i = 0; i < obj49.length; i++) {
                        if (obj49[i].checked) {
                            obj49_1 += obj49[i].value + ",";
                        } else {
                            obj49_1 += "0,";
                        }
                    }
                    var arr49 = obj49_1.split(",");
                    $(this).parent().parent().find(".pf49").html(parseInt(arr49[0])+ parseInt(arr49[1]));

                    var obj50 = document.getElementsByName("input50");
                    var obj50_1 = "";
                    for (var i = 0; i < obj50.length; i++) {
                        if (obj50[i].checked) {
                            obj50_1 += obj50[i].value + ",";
                        } else {
                            obj50_1 += "0,";
                        }
                    }
                    var arr50 = obj50_1.split(",");
                    $(this).parent().parent().find(".pf50").html(parseInt(arr50[0]));

                    var obj51 = document.getElementsByName("input51");
                    var obj51_1 = "";
                    for (var i = 0; i < obj51.length; i++) {
                        if (obj51[i].checked) {
                            obj51_1 += obj51[i].value + ",";
                        } else {
                            obj51_1 += "0,";
                        }
                    }
                    var arr51 = obj51_1.split(",");
                    $(this).parent().parent().find(".pf51").html(parseInt(arr51[0]));

                    var obj52 = document.getElementsByName("input52");
                    var obj52_1 = "";
                    for (var i = 0; i < obj52.length; i++) {
                        if (obj52[i].checked) {
                            obj52_1 += obj52[i].value + ",";
                        } else {
                            obj52_1 += "0,";
                        }
                    }
                    var arr52 = obj52_1.split(",");
                    $(this).parent().parent().find(".pf52").html(parseInt(arr51[0]));

                    var obj53 = document.getElementsByName("input53");
                    var obj53_1 = "";
                    for (var i = 0; i < obj53.length; i++) {
                        if (obj53[i].checked) {
                            obj53_1 += obj53[i].value + ",";
                        } else {
                            obj53_1 += "0,";
                        }
                    }
                    var arr53 = obj53_1.split(",");
                    $(this).parent().parent().find(".pf53").html(parseInt(arr53[0])+parseInt(arr53[1]));

                    var obj54 = document.getElementsByName("input54");
                    var obj54_1 = "";
                    for (var i = 0; i < obj54.length; i++) {
                        if (obj54[i].checked) {
                            obj54_1 += obj54[i].value + ",";
                        } else {
                            obj54_1 += "0,";
                        }
                    }
                    var arr54 = obj54_1.split(",");
                    $(this).parent().parent().find(".pf54").html(parseInt(arr54[0])+parseInt(arr54[1])+parseInt(arr54[2])+parseInt(arr54[3])+parseInt(arr54[4]));

                    var obj55 = document.getElementsByName("input55");
                    var obj55_1 = "";
                    for (var i = 0; i < obj55.length; i++) {
                        if (obj55[i].checked) {
                            obj55_1 += obj55[i].value + ",";
                        } else {
                            obj55_1 += "0,";
                        }
                    }
                    var arr55 = obj55_1.split(",");
                    $(this).parent().parent().find(".pf55").html(parseInt(arr55[0])+parseInt(arr55[1]));

                    var obj56 = document.getElementsByName("input56");
                    var obj56_1 = "";
                    for (var i = 0; i < obj56.length; i++) {
                        if (obj56[i].checked) {
                            obj56_1 += obj56[i].value + ",";
                        } else {
                            obj56_1 += "0,";
                        }
                    }
                    var arr56 = obj56_1.split(",");
                    $(this).parent().parent().find(".pf56").html(parseInt(arr56[0])+parseInt(arr56[1]));

                    /* 设施部分总评分数*/
                    $("#all4").html(parseInt(arr41[0]) + parseInt(arr41[1]) + parseInt(arr41[2]) + parseInt(arr41[3])+parseInt(arr42[0])+ parseInt(arr43[0])+parseInt(arr43[1])+parseInt(arr43[2])+parseInt(arr44[0]) + parseInt(arr44[1])+parseInt(arr45[0]) + parseInt(arr45[1])+ parseInt(arr45[2])+parseInt(arr46[0]) + parseInt(arr46[1])+parseInt(arr47[0])+parseInt(arr47[1])+parseInt(arr48[0]) + parseInt(arr48[1])+parseInt(arr49[0]) + parseInt(arr49[1])+parseInt(arr50[0])+parseInt(arr51[0])+parseInt(arr52[0])+parseInt(arr53[0])+parseInt(arr53[1])+parseInt(arr54[0])+parseInt(arr54[1])+parseInt(arr54[2])+parseInt(arr54[3])+parseInt(arr54[4])+parseInt(arr55[0])+parseInt(arr55[1])+parseInt(arr56[0])+parseInt(arr56[1]));

                    /*社区养老服务站星级评定标准总评分数*/
                    $("#all5").html(parseInt(arr1[0]) + parseInt(arr2[0]) + parseInt(arr2[1])+ parseInt(arr3[0]) + parseInt(arr3[1]) + parseInt(arr3[2])+parseInt(arr4[0]) + parseInt(arr4[1]) + parseInt(arr4[2])+parseInt(arr5[0]) + parseInt(arr5[1])+parseInt(arr6[0]) + parseInt(arr6[1]) + parseInt(arr6[2])+parseInt(arr7[0]) + parseInt(arr7[1])+parseInt(arr8[0])+parseInt(arr9[0])+parseInt(arr9[1])+parseInt(arr10[0])+parseInt(arr11[0]) + parseInt(arr11[1]) + parseInt(arr11[2]) + parseInt(arr11[3])+parseInt(arr12[0]) + parseInt(arr12[1])+ parseInt(arr12[2])+ parseInt(arr12[3])+parseInt(arr13[0])+parseInt(arr14[0])+parseInt(arr15[0])+parseInt(arr16[0])+parseInt(arr16[1])+parseInt(arr16[2])+parseInt(arr17[0])+parseInt(arr17[1])+parseInt(arr18[0])+parseInt(arr19[0])+parseInt(arr19[1])+parseInt(arr20[0])+parseInt(arr20[1])+parseInt(arr210[0])+parseInt(arr210[1])+parseInt(arr21[0]) + parseInt(arr21[1])+ parseInt(arr22[0])+ parseInt(arr22[1])+ parseInt(arr22[2])+ parseInt(arr22[3])+parseInt(arr23[0])+parseInt(arr23[1])+parseInt(arr23[2])+parseInt(arr23[3])+parseInt(arr24[0]) + parseInt(arr24[1])+parseInt(arr25[0]) + parseInt(arr25[1]) +parseInt(arr26[0])+parseInt(arr26[1])+parseInt(arr27[0])+parseInt(arr27[1])+parseInt(arr28[0])+parseInt(arr28[1])+parseInt(arr29[0])+parseInt(arr29[1])+parseInt(arr30[0])+parseInt(arr310[0])+parseInt(arr31[0]) + parseInt(arr31[1])+ parseInt(arr31[2])+ parseInt(arr31[3])+ parseInt(arr31[4])+parseInt(arr32[0])+parseInt(arr33[0]) + parseInt(arr33[1]) + parseInt(arr33[2]) + parseInt(arr33[3]) + parseInt(arr33[4])+parseInt(arr34[0]) + parseInt(arr34[1])+parseInt(arr35[0])+parseInt(arr35[1])+parseInt(arr36[0]) +parseInt(arr37[0])+parseInt(arr38[0]) + parseInt(arr38[1])+ parseInt(arr39[0])+ parseInt(arr39[1])+ parseInt(arr40[0])+ parseInt(arr40[1])+ parseInt(arr410[0])+ parseInt(arr420[0])+parseInt(arr41[0]) + parseInt(arr41[1]) + parseInt(arr41[2]) + parseInt(arr41[3])+parseInt(arr42[0])+ parseInt(arr43[0])+parseInt(arr43[1])+parseInt(arr43[2])+parseInt(arr44[0]) + parseInt(arr44[1])+parseInt(arr45[0]) + parseInt(arr45[1])+ parseInt(arr45[2])+parseInt(arr46[0]) + parseInt(arr46[1])+parseInt(arr47[0])+parseInt(arr47[1])+parseInt(arr48[0]) + parseInt(arr48[1])+parseInt(arr49[0]) + parseInt(arr49[1])+parseInt(arr50[0])+parseInt(arr51[0])+parseInt(arr52[0])+parseInt(arr53[0])+parseInt(arr53[1])+parseInt(arr54[0])+parseInt(arr54[1])+parseInt(arr54[2])+parseInt(arr54[3])+parseInt(arr54[4])+parseInt(arr55[0])+parseInt(arr55[1])+parseInt(arr56[0])+parseInt(arr56[1]));



                })
            });


            function showModel(roleId) {
                AreaTree.setSelectServiceOrg(true);
                if (AreaTree.isInit()) {
                    AreaTree.refresh(roleId);
                }
                else {
                    AreaTree.init(roleId);
                }
                $("#selectArea").modal("show");
            }

            function getback() {
                window.location.href = window.apppath +"/admin/institution/org/areaHomePensionStarsList";
            }


            function addGovbuy() {

                var nu = $("input[name=areaName]").val();

                var organizationNames = $("input[name=organizationNames]").val();

                var applicationTime = $("input[name=applicationTime]").val();

                var safety_score1="";
                var safety_score2="";
                var safety_score3="";
                var safety_score4="";
                var safety_score5="";
                var safety_score6="";
                var safety_score7="";
                var safety_score8="";
                var safety_score9="";
                var safety_score10="";
                var safety_score11="";
                var safety_score12="";
                var safety_score13="";
                var safety_score14="";
                var safety_score15="";
                var safety_score16="";
                var safety_score17="";
                var safety_score18="";
                var safety_score19="";
                var safety_score20="";
                var safety_score21="";

                var service_score1="";
                var service_score2="";
                var service_score3="";
                var service_score4="";
                var service_score5="";
                var service_score6="";
                var service_score7="";
                var service_score8="";
                var service_score9="";
                var service_score10="";
                var service_score11="";
                var manage_score1="";
                var manage_score2="";
                var manage_score3="";
                var manage_score4="";
                var manage_score5="";
                var manage_score6="";
                var manage_score7="";
                var manage_score8="";
                var manage_score9="";
                var manage_score10="";
                var manage_score11="";
                var manage_score12="";
                var facility_score1="";
                var facility_score2="";
                var facility_score3="";
                var facility_score4="";
                var facility_score5="";
                var facility_score6="";
                var facility_score7="";
                var facility_score8="";
                var facility_score9="";
                var facility_score10="";
                var facility_score11="";
                var facility_score12="";
                var facility_score13="";
                var facility_score14="";
                var facility_score15="";
                var facility_score16="";

               /* if (nu == "" || nu == null) {
                    alert("请填写所属区域！！！");
                    return;
                }*/

              /*  if (organizationNames == "" || organizationNames == null) {
                    alert("请填写 机构名称！！！");
                    return;
                }*/

                if (applicationTime == "" || applicationTime == null) {
                    alert("请填写申请时间！！！");
                    return;
                }

                var obj1 = document.getElementsByName("input1");
                var obj1_1 = "";
                for (var i = 0; i < obj1.length; i++) {
                    if (obj1[i].checked) {
                        obj1_1 += obj1[i].value + ",";
                        safety_score1+=(i+1+",");
                    } else {
                        obj1_1 += "0,";
                        safety_score1+="0,";
                    }
                }
                var arr1 = obj1_1.split(",");


                var obj2 = document.getElementsByName("input2");
                var obj2_1 = "";
                for (var i = 0; i < obj2.length; i++) {
                    if (obj2[i].checked) {
                        obj2_1 += obj2[i].value + ",";
                        safety_score2+=(i+1+",");
                    } else {
                        obj2_1 += "0,";
                        safety_score2+="0,";
                    }
                }
                var arr2 = obj2_1.split(",");

                var obj3 = document.getElementsByName("input3");
                var obj3_1 = "";
                for (var i = 0; i < obj3.length; i++) {
                    if (obj3[i].checked) {
                        obj3_1 += obj3[i].value + ",";
                        safety_score3+=(i+1+",");
                    } else {
                        obj3_1 += "0,";
                        safety_score3+="0,";

                    }
                }
                var arr3 = obj3_1.split(",");


                var obj4 = document.getElementsByName("input4");
                var obj4_1 = "";
                for (var i = 0; i < obj4.length; i++) {
                    if (obj4[i].checked) {
                        obj4_1 += obj4[i].value + ",";
                        safety_score4+=(i+1+",");
                    } else {
                        obj4_1 += "0,";
                        safety_score4+="0,";
                    }
                }
                var arr4 = obj4_1.split(",");


                var obj5 = document.getElementsByName("input5");
                var obj5_1 = "";
                for (var i = 0; i < obj5.length; i++) {
                    if (obj5[i].checked) {
                        obj5_1 += obj5[i].value + ",";
                        safety_score5+=(i+1+",");
                    } else {
                        obj5_1 += "0,";
                        safety_score5+="0,";
                    }
                }
                var arr5 = obj5_1.split(",");

                var obj6 = document.getElementsByName("input6");
                var obj6_1 = "";
                for (var i = 0; i < obj6.length; i++) {
                    if (obj6[i].checked) {
                        obj6_1 += obj6[i].value + ",";
                        safety_score6+=(i+1+",");
                    } else {
                        obj6_1 += "0,";
                        safety_score6+="0,";
                    }
                }
                var arr6 = obj6_1.split(",");

                var obj7 = document.getElementsByName("input7");
                var obj7_1 = "";
                for (var i = 0; i < obj7.length; i++) {
                    if (obj7[i].checked) {
                        obj7_1 += obj7[i].value + ",";
                        safety_score7+=(i+1+",");
                    } else {
                        obj7_1 += "0,";
                        safety_score7+="0,";
                    }
                }
                var arr7 = obj7_1.split(",");

                var obj8 = document.getElementsByName("input8");
                var obj8_1 = "";
                for (var i = 0; i < obj8.length; i++) {
                    if (obj8[i].checked) {
                        obj8_1 += obj8[i].value + ",";
                        safety_score8+=(i+1+",");
                    } else {
                        obj8_1 += "0,";
                        safety_score8+="0,";
                    }
                }
                var arr8 = obj8_1.split(",");


                var obj9 = document.getElementsByName("input9");
                var obj9_1 = "";
                for (var i = 0; i < obj9.length; i++) {
                    if (obj9[i].checked) {
                        obj9_1 += obj9[i].value + ",";
                        safety_score9+=(i+1+",");
                    } else {
                        obj9_1 += "0,";
                        safety_score9+="0,";
                    }
                }
                var arr9 = obj9_1.split(",");


                var obj10 = document.getElementsByName("input10");
                var obj10_1 = "";
                for (var i = 0; i < obj10.length; i++) {
                    if (obj10[i].checked) {
                        obj10_1 += obj10[i].value + ",";
                        safety_score10+=(i+1+",");
                    } else {
                        obj10_1 += "0,";
                        safety_score10+="0,";
                    }
                }
                var arr10 = obj10_1.split(",");


                var obj11 = document.getElementsByName("input11");
                var obj11_1 = "";
                for (var i = 0; i < obj11.length; i++) {
                    if (obj11[i].checked) {
                        obj11_1 += obj11[i].value + ",";
                        safety_score11+=(i+1+",");
                    } else {
                        obj11_1 += "0,";
                        safety_score11+="0,";
                    }
                }
                var arr11 = obj11_1.split(",");

                var obj12 = document.getElementsByName("input12");
                var obj12_1 = "";
                for (var i = 0; i < obj12.length; i++) {
                    if (obj12[i].checked) {
                        obj12_1 += obj12[i].value + ",";
                        safety_score12+=(i+1+",");
                    } else {
                        obj12_1 += "0,";
                        safety_score12+="0,";
                    }
                }
                var arr12 = obj12_1.split(",");

                var obj13 = document.getElementsByName("input13");
                var obj13_1 = "";
                for (var i = 0; i < obj13.length; i++) {
                    if (obj13[i].checked) {
                        obj13_1 += obj13[i].value + ",";
                        safety_score13+=(i+1+",");
                    } else {
                        obj13_1 += "0,";
                        safety_score13+="0,";
                    }
                }
                var arr13 = obj13_1.split(",");

                var obj14 = document.getElementsByName("input14");
                var obj14_1 = "";
                for (var i = 0; i < obj14.length; i++) {
                    if (obj14[i].checked) {
                        obj14_1 += obj14[i].value + ",";
                        safety_score14+=(i+1+",");
                    } else {
                        obj14_1 += "0,";
                        safety_score14+="0,";
                    }
                }
                var arr14 = obj14_1.split(",");

                var obj15 = document.getElementsByName("input15");
                var obj15_1 = "";
                for (var i = 0; i < obj15.length; i++) {
                    if (obj15[i].checked) {
                        obj15_1 += obj15[i].value + ",";
                        safety_score15+=(i+1+",");
                    } else {
                        obj15_1 += "0,";
                        safety_score15+="0,";
                    }
                }
                var arr15 = obj15_1.split(",");

                var obj16 = document.getElementsByName("input16");
                var obj16_1 = "";
                for (var i = 0; i < obj16.length; i++) {
                    if (obj16[i].checked) {
                        obj16_1 += obj16[i].value + ",";
                        safety_score16+=(i+1+",");
                    } else {
                        obj16_1 += "0,";
                        safety_score16+="0,";
                    }
                }
                var arr16 = obj16_1.split(",");

                var obj17 = document.getElementsByName("input17");
                var obj17_1 = "";
                for (var i = 0; i < obj17.length; i++) {
                    if (obj17[i].checked) {
                        obj17_1 += obj17[i].value + ",";
                        safety_score17+=(i+1+",");
                    } else {
                        obj17_1 += "0,";
                        safety_score17+="0,";
                    }
                }
                var arr17 = obj17_1.split(",");

                var obj18 = document.getElementsByName("input18");
                var obj18_1 = "";
                for (var i = 0; i < obj18.length; i++) {
                    if (obj18[i].checked) {
                        obj18_1 += obj18[i].value + ",";
                        safety_score18+=(i+1+",");
                    } else {
                        obj18_1 += "0,";
                        safety_score18+="0,";
                    }
                }
                var arr18 = obj18_1.split(",");

                var obj19 = document.getElementsByName("input19");
                var obj19_1 = "";
                for (var i = 0; i < obj19.length; i++) {
                    if (obj19[i].checked) {
                        obj19_1 += obj19[i].value + ",";
                        safety_score19+=(i+1+",");
                    } else {
                        obj19_1 += "0,";
                        safety_score19+="0,";
                    }
                }
                var arr19 = obj19_1.split(",");

                var obj20 = document.getElementsByName("input20");
                var obj20_1 = "";
                for (var i = 0; i < obj20.length; i++) {
                    if (obj20[i].checked) {
                        obj20_1 += obj20[i].value + ",";
                        safety_score20+=(i+1+",");
                    } else {
                        obj20_1 += "0,";
                        safety_score20+="0,";
                    }
                }
                var arr20 = obj20_1.split(",");

                var obj210 = document.getElementsByName("input210");
                var obj210_1 = "";
                for (var i = 0; i < obj210.length; i++) {
                    if (obj210[i].checked) {
                        obj210_1 += obj210[i].value + ",";
                        safety_score21+=(i+1+",");
                    } else {
                        obj210_1 += "0,";
                        safety_score21+="0,";
                    }
                }
                var arr210 = obj210_1.split(",");


                var obj21 = document.getElementsByName("input21");
                var obj21_1 = "";
                for (var i = 0; i < obj21.length; i++) {
                    if (obj21[i].checked) {
                        obj21_1 += obj21[i].value + ",";
                        service_score1+=(i+1+",");
                    } else {
                        obj21_1 += "0,";
                        service_score1+="0,";
                    }
                }
                var arr21 = obj21_1.split(",");

                var obj22 = document.getElementsByName("input22");
                var obj22_1 = "";
                for (var i = 0; i < obj22.length; i++) {
                    if (obj22[i].checked) {
                        obj22_1 += obj22[i].value + ",";
                        service_score2+=(i+1+",");
                    } else {
                        obj22_1 += "0,";
                        service_score2+="0,";
                    }
                }
                var arr22 = obj22_1.split(",");

                var obj23 = document.getElementsByName("input23");
                var obj23_1 = "";
                for (var i = 0; i < obj23.length; i++) {
                    if (obj23[i].checked) {
                        obj23_1 += obj23[i].value + ",";
                        service_score3+=(i+1+",");
                    } else {
                        obj23_1 += "0,";
                        service_score3+="0,";
                    }
                }
                var arr23 = obj23_1.split(",");

                var obj24 = document.getElementsByName("input24");
                var obj24_1 = "";
                for (var i = 0; i < obj24.length; i++) {
                    if (obj24[i].checked) {
                        obj24_1 += obj24[i].value + ",";
                        service_score4+=(i+1+",");
                    } else {
                        obj24_1 += "0,";
                        service_score4+="0,";
                    }
                }
                var arr24 = obj24_1.split(",");

                var obj25 = document.getElementsByName("input25");
                var obj25_1 = "";
                for (var i = 0; i < obj25.length; i++) {
                    if (obj25[i].checked) {
                        obj25_1 += obj25[i].value + ",";
                        service_score5+=(i+1+",");
                    } else {
                        obj25_1 += "0,";
                        service_score5+="0,";
                    }
                }
                var arr25 = obj25_1.split(",");

                var obj26 = document.getElementsByName("input26");
                var obj26_1 = "";
                for (var i = 0; i < obj26.length; i++) {
                    if (obj26[i].checked) {
                        obj26_1 += obj26[i].value + ",";
                        service_score6+=(i+1+",");
                    } else {
                        obj26_1 += "0,";
                        service_score6+="0,";
                    }
                }
                var arr26 = obj26_1.split(",");

                var obj27 = document.getElementsByName("input27");
                var obj27_1 = "";
                for (var i = 0; i < obj27.length; i++) {
                    if (obj27[i].checked) {
                        obj27_1 += obj27[i].value + ",";
                        service_score7+=(i+1+",");
                    } else {
                        obj27_1 += "0,";
                        service_score7+="0,";
                    }
                }
                var arr27 = obj27_1.split(",");

                var obj28 = document.getElementsByName("input28");
                var obj28_1 = "";
                for (var i = 0; i < obj28.length; i++) {
                    if (obj28[i].checked) {
                        obj28_1 += obj28[i].value + ",";
                        service_score8+=(i+1+",");
                    } else {
                        obj28_1 += "0,";
                        service_score8+="0,";
                    }
                }
                var arr28 = obj28_1.split(",");

                var obj29 = document.getElementsByName("input29");
                var obj29_1 = "";
                for (var i = 0; i < obj29.length; i++) {
                    if (obj29[i].checked) {
                        obj29_1 += obj29[i].value + ",";
                        service_score9+=(i+1+",");
                    } else {
                        obj29_1 += "0,";
                        service_score9+="0,";
                    }
                }
                var arr29 = obj29_1.split(",");

                var obj30 = document.getElementsByName("input30");
                var obj30_1 = "";
                for (var i = 0; i < obj30.length; i++) {
                    if (obj30[i].checked) {
                        obj30_1 += obj30[i].value + ",";
                        service_score10+=(i+1+",");
                    } else {
                        obj30_1 += "0,";
                        service_score10+="0,";
                    }
                }
                var arr30 = obj30_1.split(",");

                var obj310 = document.getElementsByName("input310");
                var obj310_1 = "";
                for (var i = 0; i < obj310.length; i++) {
                    if (obj310[i].checked) {
                        obj310_1 += obj310[i].value + ",";
                        service_score11+=(i+1+",");
                    } else {
                        obj310_1 += "0,";
                        service_score11+="0,";
                    }
                }
                var arr310 = obj310_1.split(",");

                var obj31 = document.getElementsByName("input31");
                var obj31_1 = "";
                for (var i = 0; i < obj31.length; i++) {
                    if (obj31[i].checked) {
                        obj31_1 += obj31[i].value + ",";
                        manage_score1+=(i+1+",");
                    } else {
                        obj31_1 += "0,";
                        manage_score1+="0,";
                    }
                }
                var arr31 = obj31_1.split(",");

                var obj32 = document.getElementsByName("input32");
                var obj32_1 = "";
                for (var i = 0; i < obj32.length; i++) {
                    if (obj32[i].checked) {
                        obj32_1 += obj32[i].value + ",";
                        manage_score2+=(i+1+",");
                    } else {
                        obj32_1 += "0,";
                        manage_score2+="0,";
                    }
                }
                var arr32 = obj32_1.split(",");

                var obj33 = document.getElementsByName("input33");
                var obj33_1 = "";
                for (var i = 0; i < obj33.length; i++) {
                    if (obj33[i].checked) {
                        obj33_1 += obj33[i].value + ",";
                        manage_score3+=(i+1+",");
                    } else {
                        obj33_1 += "0,";
                        manage_score3+="0,";
                    }
                }
                var arr33 = obj33_1.split(",");

                var obj34 = document.getElementsByName("input34");
                var obj34_1 = "";
                for (var i = 0; i < obj34.length; i++) {
                    if (obj34[i].checked) {
                        obj34_1 += obj34[i].value + ",";
                        manage_score4+=(i+1+",");
                    } else {
                        obj34_1 += "0,";
                        manage_score4+="0,";
                    }
                }
                var arr34 = obj34_1.split(",");

                var obj35 = document.getElementsByName("input35");
                var obj35_1 = "";
                for (var i = 0; i < obj35.length; i++) {
                    if (obj35[i].checked) {
                        obj35_1 += obj35[i].value + ",";
                        manage_score5+=(i+1+",");
                    } else {
                        obj35_1 += "0,";
                        manage_score5+="0,";
                    }
                }
                var arr35 = obj35_1.split(",");

                var obj36 = document.getElementsByName("input36");
                var obj36_1 = "";
                for (var i = 0; i < obj36.length; i++) {
                    if (obj36[i].checked) {
                        obj36_1 += obj36[i].value + ",";
                        manage_score6+=(i+1+",");
                    } else {
                        obj36_1 += "0,";
                        manage_score6+="0,";
                    }
                }
                var arr36 = obj36_1.split(",");

                var obj37 = document.getElementsByName("input37");
                var obj37_1 = "";
                for (var i = 0; i < obj37.length; i++) {
                    if (obj37[i].checked) {
                        obj37_1 += obj37[i].value + ",";
                        manage_score7+=(i+1+",");
                    } else {
                        obj37_1 += "0,";
                        manage_score7+="0,";
                    }
                }
                var arr37 = obj37_1.split(",");

                var obj38 = document.getElementsByName("input38");
                var obj38_1 = "";
                for (var i = 0; i < obj38.length; i++) {
                    if (obj38[i].checked) {
                        obj38_1 += obj38[i].value + ",";
                        manage_score8+=(i+1+",");
                    } else {
                        obj38_1 += "0,";
                        manage_score8+="0,";
                    }
                }
                var arr38 = obj38_1.split(",");

                var obj39 = document.getElementsByName("input39");
                var obj39_1 = "";
                for (var i = 0; i < obj39.length; i++) {
                    if (obj39[i].checked) {
                        obj39_1 += obj39[i].value + ",";
                        manage_score9+=(i+1+",");
                    } else {
                        obj39_1 += "0,";
                        manage_score9+="0,";
                    }
                }
                var arr39 = obj39_1.split(",");

                var obj40 = document.getElementsByName("input40");
                var obj40_1 = "";
                for (var i = 0; i < obj40.length; i++) {
                    if (obj40[i].checked) {
                        obj40_1 += obj40[i].value + ",";
                        manage_score10+=(i+1+",");
                    } else {
                        obj40_1 += "0,";
                        manage_score10+="0,";
                    }
                }
                var arr40 = obj40_1.split(",");

                var obj410 = document.getElementsByName("input410");
                var obj410_1 = "";
                for (var i = 0; i < obj410.length; i++) {
                    if (obj410[i].checked) {
                        obj410_1 += obj410[i].value + ",";
                        manage_score11+=(i+1+",");
                    } else {
                        obj410_1 += "0,";
                        manage_score11+="0,";
                    }
                }
                var arr410 = obj410_1.split(",");

                var obj420 = document.getElementsByName("input420");
                var obj420_1 = "";
                for (var i = 0; i < obj420.length; i++) {
                    if (obj420[i].checked) {
                        obj420_1 += obj420[i].value + ",";
                        manage_score12+=(i+1+",");
                    } else {
                        obj420_1 += "0,";
                        manage_score12+="0,";
                    }
                }
                var arr420 = obj420_1.split(",");

                var obj41 = document.getElementsByName("input41");
                var obj41_1 = "";
                for (var i = 0; i < obj41.length; i++) {
                    if (obj41[i].checked) {
                        obj41_1 += obj41[i].value + ",";
                        facility_score1+=(i+1+",");
                    } else {
                        obj41_1 += "0,";
                        facility_score1+="0,";
                    }
                }
                var arr41 = obj41_1.split(",");

                var obj42 = document.getElementsByName("input42");
                var obj42_1 = "";
                for (var i = 0; i < obj42.length; i++) {
                    if (obj42[i].checked) {
                        obj42_1 += obj42[i].value + ",";
                        facility_score2+=(i+1+",");
                    } else {
                        obj42_1 += "0,";
                        facility_score2+="0,";
                    }
                }
                var arr42 = obj42_1.split(",");

                var obj43 = document.getElementsByName("input43");
                var obj43_1 = "";
                for (var i = 0; i < obj43.length; i++) {
                    if (obj43[i].checked) {
                        obj43_1 += obj43[i].value + ",";
                        facility_score3+=(i+1+",");
                    } else {
                        obj43_1 += "0,";
                        facility_score3+="0,";
                    }
                }
                var arr43 = obj43_1.split(",");


                var obj44 = document.getElementsByName("input44");
                var obj44_1 = "";
                for (var i = 0; i < obj44.length; i++) {
                    if (obj44[i].checked) {
                        obj44_1 += obj44[i].value + ",";
                        facility_score4+=(i+1+",");
                    } else {
                        obj44_1 += "0,";
                        facility_score4+="0,";
                    }
                }
                var arr44 = obj44_1.split(",");

                var obj45 = document.getElementsByName("input45");
                var obj45_1 = "";
                for (var i = 0; i < obj45.length; i++) {
                    if (obj45[i].checked) {
                        obj45_1 += obj45[i].value + ",";
                        facility_score5+=(i+1+",");
                    } else {
                        obj45_1 += "0,";
                        facility_score5+="0,";
                    }
                }
                var arr45 = obj45_1.split(",");

                var obj46 = document.getElementsByName("input46");
                var obj46_1 = "";
                for (var i = 0; i < obj46.length; i++) {
                    if (obj46[i].checked) {
                        obj46_1 += obj46[i].value + ",";
                        facility_score6+=(i+1+",");
                    } else {
                        obj46_1 += "0,";
                        facility_score6+="0,";
                    }
                }
                var arr46 = obj46_1.split(",");

                var obj47 = document.getElementsByName("input47");
                var obj47_1 = "";
                for (var i = 0; i < obj47.length; i++) {
                    if (obj47[i].checked) {
                        obj47_1 += obj47[i].value + ",";
                        facility_score7+=(i+1+",");
                    } else {
                        obj47_1 += "0,";
                        facility_score7+="0,";
                    }
                }
                var arr47 = obj47_1.split(",");

                var obj48 = document.getElementsByName("input48");
                var obj48_1 = "";
                for (var i = 0; i < obj48.length; i++) {
                    if (obj48[i].checked) {
                        obj48_1 += obj48[i].value + ",";
                        facility_score8+=(i+1+",");
                    } else {
                        obj48_1 += "0,";
                        facility_score8+="0,";
                    }
                }
                var arr48 = obj48_1.split(",");

                var obj49 = document.getElementsByName("input49");
                var obj49_1 = "";
                for (var i = 0; i < obj49.length; i++) {
                    if (obj49[i].checked) {
                        obj49_1 += obj49[i].value + ",";
                        facility_score9+=(i+1+",");
                    } else {
                        obj49_1 += "0,";
                        facility_score9+="0,";
                    }
                }
                var arr49 = obj49_1.split(",");

                var obj50 = document.getElementsByName("input50");
                var obj50_1 = "";
                for (var i = 0; i < obj50.length; i++) {
                    if (obj50[i].checked) {
                        obj50_1 += obj50[i].value + ",";
                        facility_score10+=(i+1+",");
                    } else {
                        obj50_1 += "0,";
                        facility_score10+="0,";
                    }
                }
                var arr50 = obj50_1.split(",");

                var obj51 = document.getElementsByName("input51");
                var obj51_1 = "";
                for (var i = 0; i < obj51.length; i++) {
                    if (obj51[i].checked) {
                        obj51_1 += obj51[i].value + ",";
                        facility_score11+=(i+1+",");
                    } else {
                        obj51_1 += "0,";
                        facility_score11+="0,";
                    }
                }
                var arr51 = obj51_1.split(",");

                var obj52 = document.getElementsByName("input52");
                var obj52_1 = "";
                for (var i = 0; i < obj52.length; i++) {
                    if (obj52[i].checked) {
                        obj52_1 += obj52[i].value + ",";
                        facility_score12+=(i+1+",");
                    } else {
                        obj52_1 += "0,";
                        facility_score12+="0,";
                    }
                }
                var arr52 = obj52_1.split(",");

                var obj53 = document.getElementsByName("input53");
                var obj53_1 = "";
                for (var i = 0; i < obj53.length; i++) {
                    if (obj53[i].checked) {
                        obj53_1 += obj53[i].value + ",";
                        facility_score13+=(i+1+",");
                    } else {
                        obj53_1 += "0,";
                        facility_score13+="0,";
                    }
                }
                var arr53 = obj53_1.split(",");

                var obj54 = document.getElementsByName("input54");
                var obj54_1 = "";
                for (var i = 0; i < obj54.length; i++) {
                    if (obj54[i].checked) {
                        obj54_1 += obj54[i].value + ",";
                        facility_score14+=(i+1+",");
                    } else {
                        obj54_1 += "0,";
                        facility_score14+="0,";
                    }
                }
                var arr54 = obj54_1.split(",");

                var obj55 = document.getElementsByName("input55");
                var obj55_1 = "";
                for (var i = 0; i < obj55.length; i++) {
                    if (obj55[i].checked) {
                        obj55_1 += obj55[i].value + ",";
                        facility_score15+=(i+1+",");
                    } else {
                        obj55_1 += "0,";
                        facility_score15+="0,";
                    }
                }
                var arr55 = obj55_1.split(",");


                var obj56 = document.getElementsByName("input56");
                var obj56_1 = "";
                for (var i = 0; i < obj56.length; i++) {
                    if (obj56[i].checked) {
                        obj56_1 += obj56[i].value + ",";
                        facility_score16+=(i+1+",");
                    } else {
                        obj56_1 += "0,";
                        facility_score16+="0,";
                    }
                }
                var arr56 = obj56_1.split(",");

                /**/
                var totalfs = parseInt(arr1[0]) + parseInt(arr2[0]) + parseInt(arr2[1])+ parseInt(arr3[0]) + parseInt(arr3[1]) + parseInt(arr3[2])+parseInt(arr4[0]) + parseInt(arr4[1]) + parseInt(arr4[2])+parseInt(arr5[0]) + parseInt(arr5[1])+parseInt(arr6[0]) + parseInt(arr6[1]) + parseInt(arr6[2])+parseInt(arr7[0]) + parseInt(arr7[1])+parseInt(arr8[0])+parseInt(arr9[0])+parseInt(arr9[1])+parseInt(arr10[0])+parseInt(arr11[0]) + parseInt(arr11[1]) + parseInt(arr11[2]) + parseInt(arr11[3])+parseInt(arr12[0]) + parseInt(arr12[1])+ parseInt(arr12[2])+ parseInt(arr12[3])+parseInt(arr13[0])+parseInt(arr14[0])+parseInt(arr15[0])+parseInt(arr16[0])+parseInt(arr16[1])+parseInt(arr16[2])+parseInt(arr17[0])+parseInt(arr17[1])+parseInt(arr18[0])+parseInt(arr19[0])+parseInt(arr19[1])+parseInt(arr20[0])+parseInt(arr20[1])+parseInt(arr210[0])+parseInt(arr210[1])+parseInt(arr21[0]) + parseInt(arr21[1])+ parseInt(arr22[0])+ parseInt(arr22[1])+ parseInt(arr22[2])+ parseInt(arr22[3])+parseInt(arr23[0])+parseInt(arr23[1])+parseInt(arr23[2])+parseInt(arr23[3])+parseInt(arr24[0]) + parseInt(arr24[1])+parseInt(arr25[0]) + parseInt(arr25[1]) +parseInt(arr26[0])+parseInt(arr26[1])+parseInt(arr27[0])+parseInt(arr27[1])+parseInt(arr28[0])+parseInt(arr28[1])+parseInt(arr29[0])+parseInt(arr29[1])+parseInt(arr30[0])+parseInt(arr310[0])+parseInt(arr31[0]) + parseInt(arr31[1])+ parseInt(arr31[2])+ parseInt(arr31[3])+ parseInt(arr31[4])+parseInt(arr32[0])+parseInt(arr33[0]) + parseInt(arr33[1]) + parseInt(arr33[2]) + parseInt(arr33[3]) + parseInt(arr33[4])+parseInt(arr34[0]) + parseInt(arr34[1])+parseInt(arr35[0])+parseInt(arr35[1])+parseInt(arr36[0]) +parseInt(arr37[0])+parseInt(arr38[0]) + parseInt(arr38[1])+ parseInt(arr39[0])+ parseInt(arr39[1])+ parseInt(arr40[0])+ parseInt(arr40[1])+ parseInt(arr410[0])+ parseInt(arr420[0])+parseInt(arr41[0]) + parseInt(arr41[1]) + parseInt(arr41[2]) + parseInt(arr41[3])+parseInt(arr42[0])+ parseInt(arr43[0])+parseInt(arr43[1])+parseInt(arr43[2])+parseInt(arr44[0]) + parseInt(arr44[1])+parseInt(arr45[0]) + parseInt(arr45[1])+ parseInt(arr45[2])+parseInt(arr46[0]) + parseInt(arr46[1])+parseInt(arr47[0])+parseInt(arr47[1])+parseInt(arr48[0]) + parseInt(arr48[1])+parseInt(arr49[0]) + parseInt(arr49[1])+parseInt(arr50[0])+parseInt(arr51[0])+parseInt(arr52[0])+parseInt(arr53[0])+parseInt(arr53[1])+parseInt(arr54[0])+parseInt(arr54[1])+parseInt(arr54[2])+parseInt(arr54[3])+parseInt(arr54[4])+parseInt(arr55[0])+parseInt(arr55[1])+parseInt(arr56[0])+parseInt(arr56[1]);
                /*安全部分*/
                var aqtotal=parseInt(arr1[0]) + parseInt(arr2[0]) + parseInt(arr2[1])+ parseInt(arr3[0]) + parseInt(arr3[1]) + parseInt(arr3[2])+parseInt(arr4[0]) + parseInt(arr4[1]) + parseInt(arr4[2])+parseInt(arr5[0]) + parseInt(arr5[1])+parseInt(arr6[0]) + parseInt(arr6[1]) + parseInt(arr6[2])+parseInt(arr7[0]) + parseInt(arr7[1])+parseInt(arr8[0])+parseInt(arr9[0])+parseInt(arr9[1])+parseInt(arr10[0])+parseInt(arr11[0]) + parseInt(arr11[1]) + parseInt(arr11[2]) + parseInt(arr11[3])+parseInt(arr12[0]) + parseInt(arr12[1])+ parseInt(arr12[2])+ parseInt(arr12[3])+parseInt(arr13[0])+parseInt(arr14[0])+parseInt(arr15[0])+parseInt(arr16[0])+parseInt(arr16[1])+parseInt(arr16[2])+parseInt(arr17[0])+parseInt(arr17[1])+parseInt(arr18[0])+parseInt(arr19[0])+parseInt(arr19[1])+parseInt(arr20[0])+parseInt(arr20[1])+parseInt(arr210[0])+parseInt(arr210[1]);
                /* 服务部分*/
                var fwtotal=parseInt(arr21[0]) + parseInt(arr21[1])+ parseInt(arr22[0])+ parseInt(arr22[1])+ parseInt(arr22[2])+ parseInt(arr22[3])+parseInt(arr23[0])+parseInt(arr23[1])+parseInt(arr23[2])+parseInt(arr23[3])+parseInt(arr24[0]) + parseInt(arr24[1])+parseInt(arr25[0]) + parseInt(arr25[1]) +parseInt(arr26[0])+parseInt(arr26[1])+parseInt(arr27[0])+parseInt(arr27[1])+parseInt(arr28[0])+parseInt(arr28[1])+parseInt(arr29[0])+parseInt(arr29[1])+parseInt(arr30[0])+parseInt(arr310[0]);
                /**管理部分*/
                var gltotal=parseInt(arr31[0]) + parseInt(arr31[1])+ parseInt(arr31[2])+ parseInt(arr31[3])+ parseInt(arr31[4])+parseInt(arr32[0])+parseInt(arr33[0]) + parseInt(arr33[1]) + parseInt(arr33[2]) + parseInt(arr33[3]) + parseInt(arr33[4])+parseInt(arr34[0]) + parseInt(arr34[1])+parseInt(arr35[0])+parseInt(arr35[1])+parseInt(arr36[0]) +parseInt(arr37[0])+parseInt(arr38[0]) + parseInt(arr38[1])+ parseInt(arr39[0])+ parseInt(arr39[1])+ parseInt(arr40[0])+ parseInt(arr40[1])+ parseInt(arr410[0])+ parseInt(arr420[0]);
                /**设施部分*/
                var sstotal=parseInt(arr41[0]) + parseInt(arr41[1]) + parseInt(arr41[2]) + parseInt(arr41[3])+parseInt(arr42[0])+ parseInt(arr43[0])+parseInt(arr43[1])+parseInt(arr43[2])+parseInt(arr44[0]) + parseInt(arr44[1])+parseInt(arr45[0]) + parseInt(arr45[1])+ parseInt(arr45[2])+parseInt(arr46[0]) + parseInt(arr46[1])+parseInt(arr47[0])+parseInt(arr47[1])+parseInt(arr48[0]) + parseInt(arr48[1])+parseInt(arr49[0]) + parseInt(arr49[1])+parseInt(arr50[0])+parseInt(arr51[0])+parseInt(arr52[0])+parseInt(arr53[0])+parseInt(arr53[1])+parseInt(arr54[0])+parseInt(arr54[1])+parseInt(arr54[2])+parseInt(arr54[3])+parseInt(arr54[4])+parseInt(arr55[0])+parseInt(arr55[1])+parseInt(arr56[0])+parseInt(arr56[1]);

                /*星级评定*/
                var starRating;
                /*社区养老服务站星级评定标准*/
                if(totalfs>=450&&totalfs<550&&aqtotal>=aqtotal*0.4&&fwtotal>=fwtotal*0.4&&gltotal>=gltotal*0.4&&sstotal>=sstotal*0.4){
                    starRating=1;
                }
                if(totalfs>=550&&totalfs<650&&aqtotal>=aqtotal*0.4&&fwtotal>=fwtotal*0.4&&gltotal>=gltotal*0.4&&sstotal>=sstotal*0.4){
                    starRating=2;
                }
                if(totalfs>=650&&totalfs<750&&aqtotal>=aqtotal*0.4&&fwtotal>=fwtotal*0.4&&gltotal>=gltotal*0.4&&sstotal>=sstotal*0.4){
                    starRating=3;
                }
                if(totalfs>=750&&totalfs<850&&aqtotal>=aqtotal*0.4&&fwtotal>=fwtotal*0.4&&gltotal>=gltotal*0.4&&sstotal>=sstotal*0.4){
                    starRating=4;
                }
                if(totalfs>=850&&totalfs<=1000&&aqtotal>=aqtotal*0.4&&fwtotal>=fwtotal*0.4&&gltotal>=gltotal*0.4&&sstotal>=sstotal*0.4){
                    starRating=5;
                }

                $.post(window.apppath + "/admin/api/institution/org/areaHomePensionStars/add", {
                    area: $("input[name=areaName]").val(),
                    organizationNames: $("input[name=organizationNames]").val(),
                    applicationTime: $("input[name=applicationTime]").val(),
                    /*safetyScore1:$("input[name=safetyScore1]").val(),
                    safetyScore2:$("input[name=safetyScore2]").val()*/
                    safetyScore1: safety_score1,
                    safetyScore2: safety_score2,
                    safetyScore3: safety_score3,
                    safetyScore4: safety_score4,
                    safetyScore5: safety_score5,
                    safetyScore6: safety_score6,
                    safetyScore7: safety_score7,
                    safetyScore8: safety_score8,
                    safetyScore9: safety_score9,
                    safetyScore10: safety_score10,
                    safetyScore11: safety_score11,
                    safetyScore12: safety_score12,
                    safetyScore13: safety_score13,
                    safetyScore14: safety_score14,
                    safetyScore15: safety_score15,
                    safetyScore16: safety_score16,
                    safetyScore17: safety_score17,
                    safetyScore18: safety_score18,
                    safetyScore19: safety_score19,
                    safetyScore20: safety_score20,
                    safetyScore21: safety_score21,

                    serviceScore1: service_score1,
                    serviceScore2: service_score2,
                    serviceScore3: service_score3,
                    serviceScore4: service_score4,
                    serviceScore5: service_score5,
                    serviceScore6: service_score6,
                    serviceScore7: service_score7,
                    serviceScore8: service_score8,
                    serviceScore9: service_score9,
                    serviceScore10: service_score10,
                    serviceScore11: service_score11,

                    manageScore1: manage_score1,
                    manageScore2: manage_score2,
                    manageScore3: manage_score3,
                    manageScore4: manage_score4,
                    manageScore5: manage_score5,
                    manageScore6: manage_score6,
                    manageScore7: manage_score7,
                    manageScore8: manage_score8,
                    manageScore9: manage_score9,
                    manageScore10: manage_score10,
                    manageScore11: manage_score11,
                    manageScore12: manage_score12,
                    facilityScore1: facility_score1,
                    facilityScore2: facility_score2,
                    facilityScore3: facility_score3,
                    facilityScore4: facility_score4,
                    facilityScore5: facility_score5,
                    facilityScore6: facility_score6,
                    facilityScore7: facility_score7,
                    facilityScore8: facility_score8,
                    facilityScore9: facility_score9,
                    facilityScore10: facility_score10,
                    facilityScore11: facility_score11,
                    facilityScore12: facility_score12,
                    facilityScore13: facility_score13,
                    facilityScore14: facility_score14,
                    facilityScore15: facility_score15,
                    facilityScore16: facility_score16,
                    totalScore: totalfs ,
                    starRating:starRating,
                }, function (res) {
                    if (res.success) {
                        alert(res.message);
                        window.location.reload();
                    }
                    else {
                        alert(res.message);
                    }
                }, 'json');
              /*  CommunityPensionStarsList2.init();*/
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

