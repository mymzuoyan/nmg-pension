<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/12
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title></title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/view/css/completer.css"/>
        <style type="text/css">
            #hidContent table:first-child {
                margin-top: 40px;
            }

            table tr td {
                font-size: 17px;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet">
                    <div id="hidContent" contenteditable="false" style="width: 100%;">
                        <input type="hidden" name="id" value="${apply.id}">
                        <c:if test="${type==0}">
                            <table width="630" border="0" align="center" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td align="center" style="font-weight: bold;font-size:16px">受理通知书</td>
                                </tr>
                                <tr>
                                    <td align="center">（申请政府购买居家养老服务）</td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: bold;font-size:16px">编号：
                                            ${apply.number} &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table width="630" border="1" bordercolor="#CCCCCC" cellpadding="5" cellspacing="0"
                                   align="center">
                                <tr align="center">
                                    <td width="100px" class="border_left border_top">今收到</td>
                                    <td width="35px;" class="border_left border_top">姓名</td>
                                    <td class="border_left border_top">
                                            ${apply.name}
                                    </td>
                                    <td class="border_left border_top"> 身份证</td>
                                    <td colspan="3" class="border_left border_top border_right">
                                            ${apply.idcardno}
                                    </td>

                                </tr>
                                <tr>
                                    <td align="center" class="border_left border_top">申请材料</td>
                                    <td colspan="6" class="border_left border_top border_right">
                                        <input type="checkbox" name=""/>申请书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name=""/>委托授权书<br/>
                                        <input type="checkbox" name=""/>诚信承诺书&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name=""/>城镇“三无”人员证明<br/>
                                        <input type="checkbox" name=""/>农村“五保”人员证明&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name=""/>低保老人证明<br/>
                                        <input type="checkbox" name=""/>低保边缘老人证明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name=""/>经济困难老人证明<br/>
                                        <input type="checkbox" name=""/>70周岁及以上的计生扶持老人证明&nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" name=""/>百岁老人证明
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7" style="line-height:22px"
                                        class="border_left border_top border_right">
                                        <p>&nbsp;&nbsp;申请材料齐全，符合规定格式，给予受理请于
                                            <input type="text" size="5"
                                                   style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">年
                                            <input type="text" size="5"
                                                   style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">月
                                            <input type="text" size="5"
                                                   style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">
                                            日到<br/>
                                            <input type="text" size="15"
                                                   style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">
                                            领取书面初审结果。</p>
                                    </td>

                                </tr>
                                <tr align="center">
                                    <td class="border_left border_top" width="15%">受理人</td>
                                    <td colspan="2" class="border_left border_top" width="20%">
                                            ${accept_person}
                                    </td>
                                    <td class="border_left border_top " width="15%">联系电话</td>
                                    <td width="20%" class="border_left border_top ">
                                            ${accept_phone}
                                    </td>
                                    <td class="border_left border_top" width="15%">投诉电话</td>
                                    <td class="border_left border_top border_right" width="15%">12349</td>
                                </tr>
                                <tr align="center">
                                    <td class="border_left border_top border_bottom">受理时间</td>
                                    <td colspan="6" class="border_left border_top border_right border_bottom">
                                            ${accept_date}
                                    </td>
                                </tr>
                            </table>
                        </c:if>
                        <c:if test="${type==1}">

                        <table width="630" border="0" align="center" class="table1" cellpadding="6" cellspacing="0"
                               style="font-size:16px">
                            <tr>
                                <td align="center" style=" font-weight: bold">不予受理通知书</td>
                            </tr>
                            <tr>
                                <td align="center">（申请政府购买居家养老服务）</td>
                            </tr>
                            <tr>
                                <td align="right" style=" font-weight: bold">编号： ${apply.number}&nbsp;
                                </td>
                            </tr>
                        </table>
                        <table width="630" border="1" class="table2" cellpadding="5" cellspacing="0" align="center">
                            <tr align="center">
                                <td width="100px">今收到</td>
                                <td width="35px;">姓名</td>
                                <td> ${apply.name}
                                </td>
                                <td>身份证</td>
                                <td colspan="3"> ${apply.idcardno}
                                </td>
                            </tr>
                            <tr>
                                <td align="center">申请材料</td>
                                <td colspan="6">
                                    <input type="checkbox" name=""/>申请书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>委托授权书<br/>
                                    <input type="checkbox" name=""/>诚信承诺书&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>城镇“三无”人员证明<br/>
                                    <input type="checkbox" name=""/>农村“五保”人员证明&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>低保老人证明<br/>
                                    <input type="checkbox" name=""/>低保边缘老人证明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>经济困难老人证明<br/>
                                    <input type="checkbox" name=""/>70周岁及以上的计生扶持老人证明&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>百岁老人证明
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" style="line-height:23px;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;申请材料不齐全，不符合规定格式，不给予受理。
                                </td>

                            </tr>
                            <tr align="center">
                                <td width="15%">受理人</td>
                                <td colspan="2" width="20%"> ${accept_person}
                                </td>
                                <td width="15%">联系电话</td>
                                <td width="15%"> &nbsp;
                                </td>
                                <td width="15%">投诉电话</td>
                                <td width="15%">12349</td>
                            </tr>
                            <tr align="center">
                                <td>受理时间</td>
                                <td colspan="6">
                                        ${accept_date} </td>

                            </tr>
                        </table>
                    </div>
                    </c:if>
                    <c:if test="${type==2}">
                        <table width="630" border="0" align="center" class="table1" cellpadding="6" cellspacing="0"
                               style="font-size:16px">
                            <tr>
                                <td align="center" style="font-weight: bold;font-size:16px">补正通知书</td>
                            </tr>
                            <tr>
                                <td align="center">（申请政府购买居家养老服务）</td>
                            </tr>
                            <tr>
                                <td align="right" style="font-weight: bold;font-size:16px">编号：
                                        ${apply.number}&nbsp;
                                </td>
                            </tr>
                        </table>
                        <table width="630" border="1" bordercolor="#CCCCCC" cellpadding="5" cellspacing="0"
                               align="center">
                            <tr align="center">
                                <td width="100px" class="border_left border_top">今收到</td>
                                <td width="35px;" class="border_left border_top">姓名</td>
                                <td class="border_left border_top">
                                        ${apply.name}
                                </td>
                                <td class="border_left border_top"> 身份证</td>
                                <td colspan="3" class="border_left border_top border_right">
                                        ${apply.idcardno}
                                </td>

                            </tr>
                            <tr>
                                <td align="center" class="border_left border_top">申请材料</td>
                                <td colspan="6" class="border_left border_top border_right">
                                    <input type="checkbox" name=""/>申请书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>委托授权书<br/>
                                    <input type="checkbox" name=""/>诚信承诺书&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>城镇“三无”人员证明<br/>
                                    <input type="checkbox" name=""/>农村“五保”人员证明&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>低保老人证明<br/>
                                    <input type="checkbox" name=""/>低保边缘老人证明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>经济困难老人证明<br/>
                                    <input type="checkbox" name=""/>70周岁及以上的计生扶持老人证明&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>百岁老人证明
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" style="line-height:22px" class="border_left border_top border_right">
                                    <p>&nbsp;&nbsp;申请材料不齐全，不符合规定格式，请于
                                        <input type="text" size="5"
                                               style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">年
                                        <input type="text" size="5"
                                               style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">月
                                        <input type="text" size="5"
                                               style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">
                                        日前完成材料补正。</p>
                                </td>

                            </tr>
                            <tr align="center">
                                <td class="border_left border_top" width="15%">受理人</td>
                                <td colspan="2" class="border_left border_top" width="20%">
                                        ${accept_person}
                                </td>
                                <td class="border_left border_top " width="15%">联系电话</td>
                                <td width="20%" class="border_left border_top">
                                    &nbsp;
                                </td>
                                <td class="border_left border_top" width="15%">投诉电话</td>
                                <td class="border_left border_top border_right" width="15%">12349</td>

                            </tr>
                            <tr align="center">
                                <td class="border_left border_top border_bottom">受理时间</td>
                                <td colspan="6" class="border_left border_top border_right border_bottom">
                                        ${accept_date}
                                </td>
                            </tr>
                        </table>

                    </c:if>
                    <c:if test="${type==3}">
                        <table width="630" border="0" align="center" class="table1" cellpadding="5" cellspacing="0">

                            <tr>
                                <td align="center" style="font-weight: bold;font-size:16px">初审结果通知书</td>
                            </tr>
                            <tr>
                                <td align="center"><font class="font2">（申请政府购买居家养老服务）</font></td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right:5px;font-weight: bold;font-size:16px">编号：
                                        ${apply.number} &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table width="630" border="1" class="table2" cellpadding="3" cellspacing="0" align="center">
                            <tr align="center">
                                <td width="100px">今收到</td>
                                <td width="35px">姓名</td>
                                <td width="100px"> ${apply.name}</td>
                                <td>身份证</td>

                                <td colspan="3">
                                        ${apply.idcardno}
                                </td>
                            </tr>
                            <tr>
                                <td align="center">申请材料</td>
                                <td colspan="6">
                                    <input type="checkbox" name=""/>申请书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>委托授权书<br/>
                                    <input type="checkbox" name=""/>诚信承诺书&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>城镇“三无”人员证明<br/>
                                    <input type="checkbox" name=""/>农村“五保”人员证明&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>低保老人证明<br/>
                                    <input type="checkbox" name=""/>低保边缘老人证明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>经济困难老人证明<br/>
                                    <input type="checkbox" name=""/>70周岁及以上的计生扶持老人证明&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>百岁老人证明
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="7" style="line-height:30px;">
                                    经审查，<input id="radio1" type="radio" name="1"/><label for="radio1">符合</label>
                                    <input id="radio2" type="radio" name="1"/><label for="radio2">不符合</label>
                                    申请政府购买居家养老服务条件，特此告知。<br/>
                                    （符合条件的提请区民政局进行失能状况评估，不符合条件的将此通知交给申请人。）
                                </td>

                            </tr>
                            <tr align="center">
                                <td>受理人</td>
                                <td colspan="2" width="100">
                                        ${accept_person}
                                </td>
                                <td>联系电话</td>
                                <td width="100">
                                    &nbsp;
                                </td>
                                <td>投诉电话</td>
                                <td width="80">12349</td>
                            </tr>
                            <tr align="center">
                                <td>受理时间</td>
                                <td colspan="6">
                                        ${accept_date}
                                </td>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${type==4}">

                        <table align="center" width="630" border="0" cellspacing="0" cellpadding="5"
                               style="font-size:16px">
                            <tr align="center">
                                <td width="630" style="font-weight: bold; font-size:18px">
                                    评估任务通知书
                                </td>
                            </tr>
                            <tr align="center">
                                <td>
                                    （申请政府购买居家养老服务）
                                </td>
                            </tr>
                            <tr align="right">
                                <td style=" font-weight: bold; font-size:18px">
                                    编号:${apply.number}
                                </td>
                            </tr>
                        </table>
                        <table align="center" width="630px" border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="40" width="180px" colspan="2" class="border_topleft" align="center">
                                    评估机构名称
                                </td>
                                <td colspan="4" height="40" class="border_topleft border_right">
                                    <input id="assessOrgName" type="text" size="50" width="420"
                                           style="border:none; border:0px; font-size:16px"/>
                                </td>
                            </tr>
                            <tr>
                                <td height="70" colspan="6" style="line-height:26px;" class="border_lefttopright">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;今委托你单位对
                                    <input type="text" size="15" readonly="readonly"
                                           style="border:0px; border-bottom:1px solid black; font-size:16px"
                                           value="${apply.name}"/>，
                                    身份证号<input type="text" size="25" readonly="readonly"
                                               style="border:0px; border-bottom:1px solid black; font-size:16px"
                                               value="${apply.idcardno}"/>，
                                    <BR/>住址<input type="text" size="35" readonly="readonly"
                                                  style="border:0px; border-bottom:1px solid black; overflow:visible; font-size:16px"
                                                  value="${apply.address}"/>，进行上门评估，于<input type="text" size="5"
                                                                                            style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">年<input
                                        type="text" size="5"
                                        style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">月<input
                                        type="text" size="5"
                                        style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">日前将评估报告提交我局，并将评估数据输入信息系统。<br/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                                        type="text" size="15" readonly="readonly" id="${region_name}"
                                        name="${apply.region1}" style=" border:none; border:0px; border-bottom:1px solid
                                        black; font-size:16px"/>民政局。
                                </td>
                            </tr>
                            <tr align="center">
                                <td height="40" width="16%" class="border_topleft">联系人</td>
                                <td class="border_topleft" width="18%" align="left">${accept_person}</td>
                                <td width="18%" class="border_topleft">联系电话</td>
                                <td width="18%" class="border_topleft">&nbsp;</td>
                                <td width="18%" class="border_topleft">投诉电话</td>
                                <td class="border_topleft border_right ">
                                    12349
                                </td>
                            </tr>
                            <tr align="center">
                                <td height="40" class="border_topleft border_bottom">通知时间</td>
                                <td colspan="5" class="border_topleft border_right border_bottom">
                                        ${accept_date}
                                </td>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${type==5 or type==8}">

                        <table width="630" border="0" align="center" class="table1" cellpadding="5" cellspacing="0">
                            <tr>
                                <td align="center" style="font-weight: bold;font-size:16px">不予批准通知书</td>
                            </tr>
                            <tr>
                                <td align="center"><font class="font2">（申请政府购买居家养老服务）</font></td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right:5px;font-weight: bold;font-size:16px">编号：
                                        ${apply.number} &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table width="630" border="1" class="table2" cellpadding="3" cellspacing="0" align="center">
                            <tr align="center">
                                <td width="100px">今收到</td>
                                <td width="35px">姓名</td>
                                <td width="100px"> ${apply.name} </td>
                                <td>身份证</td>

                                <td colspan="3">
                                        ${apply.idcardno}
                                </td>
                            </tr>
                            <tr>
                                <td align="center">申请材料</td>
                                <td colspan="6">
                                    <input type="checkbox" name=""/>申请书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>委托授权书<br/>
                                    <input type="checkbox" name=""/>诚信承诺书&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>城镇“三无”人员证明<br/>
                                    <input type="checkbox" name=""/>农村“五保”人员证明&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>低保老人证明<br/>
                                    <input type="checkbox" name=""/>低保边缘老人证明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>经济困难老人证明<br/>
                                    <input type="checkbox" name=""/>70周岁及以上的计生扶持老人证明&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name=""/>百岁老人证明
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="7" style="line-height:30px;">
                                    经查申，不符合申请政府购买居家养老服务条件，特此告知。
                                </td>

                            </tr>
                            <tr align="center">
                                <td>受理人</td>
                                <td colspan="2" width="100">
                                        ${accept_person}
                                </td>
                                <td>联系电话</td>
                                <td width="100" style="border:1px solid #999999;">
                                </td>
                                <td>投诉电话</td>
                                <td width="80">12349</td>
                            </tr>
                            <tr align="center">
                                <td>受理时间</td>
                                <td colspan="6">
                                        ${accept_date}
                                </td>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${type==6}">
                    <table width="630" border="0" align="center" class="table1" cellpadding="6" cellspacing="0"
                           style="font-size:16px">
                        <tr>
                            <td align="center" style="font-weight: bold;font-size:16px">评估报告</td>
                        </tr>
                        <tr>
                            <td align="center">（申请政府购买居家养老服务）</td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold;font-size:16px">编号：
                                    ${apply.number}&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=630 align=center border=1>
                        <tbody>
                        <tr>
                            <td class="border_lefttopright" style="FONT-SIZE: 16px; LINE-HEIGHT: 26px" height=90
                                colSpan=6>
                                区民政局，我们于
                                <input style="" size="8"
                                       style="TEXT-ALIGN:center;border:0px;border-bottom: 1px solid black">年
                                <input style="" size="8"
                                       style="TEXT-ALIGN:center;border:0px;border-bottom: 1px solid black">月
                                <input style="" size="8"
                                       style="TEXT-ALIGN:center;border:0px;border-bottom: 1px solid black">日对
                                <input style="border-left-width: 0px; font-size: 16px; border-right-width: 0px; border-bottom: black 1px solid; text-align: center; border-top-width: 0px"
                                       readonly size=10 value="${apply.name}">，
                                ，身份证号<input
                                    style="border-left-width: 0px; font-size: 16px; border-right-width: 0px; border-bottom: black 1px solid; text-align: center; border-top-width: 0px"
                                    readonly value="${apply.idcardno}">住址
                                <input style="border-left-width: 0px; overflow: visible; font-size: 16px; border-right-width: 0px; border-bottom: black 1px solid; text-align: center; border-top-width: 0px"
                                       readonly size=50 value="${apply.address}">，进行上门评估，能力评估分值:
                                <input id=resultScores
                                       style="border-left-width: 0px; font-size: 16px; border-right-width: 0px; border-bottom: black 1px solid; text-align: center; border-top-width: 0px"
                                       readonly size="8" value="${apply.resultScore}">分，属于:
                                <input type="radio" name="resultDictId" id="pf1" value="1"
                                       disabled="disabled"
                                       <c:if test="${apply.resultDictId==1}">checked</c:if>
                                />
                                自理
                                <input type="radio" name="resultDictId" id="pf2" value="2"
                                       disabled="disabled"
                                       <c:if test="${apply.resultDictId==2}">checked</c:if>
                                />
                                半失能
                                <input type="radio" name="resultDictId" id="pf3" value="3"
                                       disabled="disabled"
                                       <c:if test="${apply.resultDictId==3}">checked</c:if>
                                />
                                失能，评估数据已输入信息系统。
                            </td>

                        </tr>
                        <tr align=center>
                            <td class=border_topleft style="font-size: 16px" height=40 width=90>&nbsp;评估员</td>
                            <td class="border_topleft border_right" width=220 colspan=2>${apply.workerName1}</td>
                            <td class="border_top " style="font-size: 16px" width=90>&nbsp;工作证号</td>
                            <td class="border_topleft border_right" width=220 colspan=2>${apply.workerCard1}</td>
                        </tr>
                        <tr align=center>
                            <td class=border_topleft style="font-size: 16px" height=40>评估员</td>
                            <td class="border_topleft border_right" colspan=2>${apply.workerName2}</td>
                            <td class=border_top style="font-size: 16px">工作证号</td>
                            <td class="border_topleft border_right" colspan=2>${apply.workerCard2}</td>
                        </tr>
                        <tr align=center>
                            <td class=border_topleft style="font-size: 16px" height=40>联系人</td>
                            <td class=border_topleft width=130>
                                    ${apply.operator}
                            </td>
                            <td class=border_topleft style="font-size: 16px" width=90>联系电话</td>
                            <td class=border_topleft>
                            </td>
                            <td class=border_topleft style="font-size: 16px; text-align: center" width=80>投诉电话</td>
                            <td class="border_topleft border_right" style="font-size: 16px" width=80>12349</td>
                        </tr>
                        <tr align=center>
                            <td class="border_topleft border_bottom" height=40>报告时间</td>
                            <td class="border_topleft border_right border_bottom" colspan=5> ${accept_date}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                </c:if>
                <c:if test="${type==7}">
                    <table width="630" border="0" cellspacing="0" cellpadding="5" align="center">


                        <tr align="center">
                            <td style="font-weight:bold; font-size:16px">公&nbsp;&nbsp;&nbsp;&nbsp;示</td>
                        </tr>
                        <tr>
                            <td height="10px">&nbsp;

                            </td>
                        </tr>
                        <tr>
                            <td>

                                <input type="text" size="10"
                                       style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible"
                                       value="${apply.region2}">
                                街道
                                <input type="text" size="10"
                                       style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible"
                                       value="${apply.region3}">
                                社区居民：
                            </td>
                        </tr>
                        <tr>
                            <td style="line-height:30px">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                根据《南京市社区居家养老服务实施办法》（宁政规字[2013]20号）文件规定，下列人员拟批准为政府购买居家养老服务对象：
                            </td>
                        </tr>
                    </table>
                    <table align="center" width="630" border="1" cellspacing="0" cellpadding="0">
                        <tr align="center">
                            <td width="10%" height="40" class="border_top border_left">姓名</td>
                            <td width="10%" class="border_top border_left">年龄</td>
                            <td class="border_top border_left border_right">标准</td>
                        </tr>
                        <tr align="center">
                            <td height="60" class="border_top border_left">
                                    ${apply.name}</td>
                            <td class="border_top border_left ">
                                <input type="text" size="1" width="20"
                                       style="border:none;width: 30px; border:0px; text-align:center"
                                       value="${apply.age}"/>
                            </td>
                            <td class="border_top border_left border_right">
                                <input id="standard1" type="radio" name="standard" value="0"/>
                                <label for="standard1">安装和使用固定信息呼叫终端，个人支付20%费用。</label> <br/>
                                <input id="standard2" type="radio" name="standard" value="1"/>
                                <label for="standard2">安装和使用移动信息呼叫终端，个人支付20%费用。</label><br/>
                                <input id="standard3" type="radio" name="standard" value="2"/>
                                <label for="standard3">安装和使用固定信息呼叫终端，300元/月的助老金。</label><br/>
                                <input id="standard4" type="radio" name="standard" value="3"/>
                                <label for="standard4">安装和使用移动信息呼叫终端，300元/月的助老金。</label><br/>
                                <input id="standard5" type="radio" name="standard" value="4"/>
                                <label for="standard5">不安装固定/移动信息呼叫终端，300元/月的助老金。</label><br/>
                                <input id="standard6" type="radio" name="standard" value="5"/>
                                <label for="standard6">安装和使用固定信息呼叫终端，400元/月的助老金。</label><br/>
                                <input id="standard7" type="radio" name="standard" value="6"/>
                                <label for="standard7">安装和使用移动信息呼叫终端，400元/月的助老金。</label><br/>
                                <input id="standard8" type="radio" name="standard" value="7"/>
                                <label for="standard8">不安装固定/移动信息呼叫终端，400元/月的助老金。</label>
                            </td>
                        </tr>
                    </table>
                    <table width="630" align="center" border="0" cellspacing="15" cellpadding="0">
                        <tr>
                            <td>
                                &nbsp;&nbsp; 现予以公示，如有异议，请于公示之日起7个自然日投诉，
                                投诉电话：12349。
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">区民政局（盖章）&nbsp;&nbsp;</td>
                        </tr>
                        <tr align="right">
                            <td>
                                    ${accept_date}
                            </td>
                        </tr>
                    </table>

                </c:if>
                <c:if test="${type==9}">
                <table width="630" border="0" cellspacing="0" cellpadding="5" align="center">

                    <tr align="center">
                        <td style="font-weight:bold; font-size:16px">公示回执</td>
                    </tr>
                    <tr>
                        <td height="10px">&nbsp;

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" size="10"
                                   style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible"
                                   value="${apply.region1}"/>
                            民政局：
                        </td>
                    </tr>
                    <tr>
                        <td style="line-height:30px">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            根据《南京市社区居家养老服务实施办法》（宁政规字[2013]20号）文件规定，已将下列人员拟批准为政府购买居家养老服务对象：
                        </td>
                    </tr>
                </table>
                <table align="center" width="630" border="1" cellspacing="0" cellpadding="0">
                    <tr align="center">
                        <td width="20%" height="40" class="border_top border_left">姓名</td>
                        <td width="20%" class="border_top border_left">年龄</td>
                        <td class="border_top border_left border_right">标准</td>
                    </tr>
                    <tr align="center">
                        <td height="40" class="border_top border_left">
                                ${apply.name}</td>
                        <td class="border_top border_left ">
                            <input type="text" size="1" width="120"
                                   style="width:30px;border:none; border:0px; text-align:center"
                                   value="${apply.age}"/>
                        </td>
                        <td class="border_top border_left border_right">
                            <input id="standardValue" name="standard" type="text"
                                   style="border:none; border:0px; text-align:center;width: 100%"/>
                        </td>
                    </tr>
                </table>
                <table width="630" align="center" border="0" cellspacing="15" cellpadding="0">
                    <tr>
                        <td>
                            &nbsp;&nbsp; 已公示，如有异议，请于公示之日起7个自然日投诉，
                            投诉电话：12349。
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">街道（盖章）&nbsp;&nbsp;</td>
                    </tr>
                    <tr align="right">
                        <td>
                                ${accept_date}
                        </td>
                    </tr>
                </table>
            </div>
            </c:if>
            <c:if test="${type==10}">

                <table width="630" border="0" align="center" class="table1" cellpadding="5" cellspacing="0">
                    <tr>
                        <td align="center" style="font-weight: bold;font-size:16px">复审通知书</td>
                    </tr>
                    <tr>
                        <td align="center"><font class="font2">（申请政府购买居家养老服务）</font></td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right:5px;font-weight: bold;font-size:16px">编号：
                                ${apply.number} &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="630" border="1" class="table2" cellpadding="3" cellspacing="0" align="center">
                    <tr align="center">
                        <td width="100px">今收到</td>
                        <td width="35px">姓名</td>
                        <td width="100px"> ${apply.name}</td>
                        <td>身份证</td>

                        <td colspan="3">
                                ${apply.idcardno}
                        </td>
                    </tr>
                    <tr>
                        <td align="center">申请材料</td>
                        <td colspan="6" >
                            <input type="checkbox"  name="" />申请书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />委托授权书<br />
                            <input type="checkbox"  name="" />诚信承诺书&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />城镇“三无”人员证明<br />
                            <input type="checkbox"  name="" />农村“五保”人员证明&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />低保老人证明<br />
                            <input type="checkbox"  name=""/>低保边缘老人证明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />经济困难老人证明<br />
                            <input type="checkbox"  name="" />70周岁及以上的计生扶持老人证明&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />百岁老人证明
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="7" style="line-height:30px;">
                            经查申，不符合申请政府购买居家养老服务条件，特此告知。
                        </td>

                    </tr>
                    <tr align="center">
                        <td>受理人</td>
                        <td colspan="2" width="100">
                                ${accept_person}
                        </td>
                        <td>联系电话</td>
                        <td width="100">
                            &nbsp;
                        </td>
                        <td >投诉电话</td>
                        <td width="80">12349</td>
                    </tr>
                    <tr align="center">
                        <td>受理时间</td>
                        <td colspan="6">
                                ${accept_date}
                        </td>
                    </tr>
                </table>
            </c:if>
            <c:if test="${type==11}">

                <table width="630" border="0" align="center" class="table1" cellpadding="5" cellspacing="0">
                    <tr>
                        <td align="center" style="font-weight: bold;font-size:16px">复审结果通知书</td>
                    </tr>
                    <tr>
                        <td align="center"><font class="font2">（申请政府购买居家养老服务）</font></td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right:5px;font-weight: bold;font-size:16px">编号：
                                ${apply.number} &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="630" border="1" class="table2" cellpadding="3" cellspacing="0" align="center">
                    <tr align="center">
                        <td width="100px">今收到</td>
                        <td width="35px">姓名</td>
                        <td width="100px"> ${apply.name}</td>
                        <td>身份证</td>

                        <td colspan="3">
                                ${apply.idcardno}
                        </td>
                    </tr>
                    <tr>
                        <td align="center">申请材料</td>
                        <td colspan="6" >
                            <input type="checkbox"  name="" />申请书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />委托授权书<br />
                            <input type="checkbox"  name="" />诚信承诺书&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />城镇“三无”人员证明<br />
                            <input type="checkbox"  name="" />农村“五保”人员证明&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />低保老人证明<br />
                            <input type="checkbox"  name=""/>低保边缘老人证明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />经济困难老人证明<br />
                            <input type="checkbox"  name="" />70周岁及以上的计生扶持老人证明&nbsp;&nbsp;&nbsp;
                            <input type="checkbox"  name="" />百岁老人证明
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="7" style="line-height:30px;">
                            经查申，<input type="radio" name="1" />符合
                            <input type="radio" name="1" />不符合
                            申请政府购买居家养老服务条件，特此告知。<br/>
                            （符合条件的提请区民政局进行失能状况评估，不符合条件的将此通知交给申请人。）
                        </td>

                    </tr>
                    <tr align="center">
                        <td>受理人</td>
                        <td colspan="2" width="100">
                                ${accept_person}
                        </td>
                        <td>联系电话</td>
                        <td width="100">
                            &nbsp;
                        </td>
                        <td >投诉电话</td>
                        <td width="80">12349</td>
                    </tr>
                    <tr align="center">
                        <td>受理时间</td>
                        <td colspan="6">
                                ${accept_date}
                        </td>
                    </tr>
                </table>
            </c:if>
            <c:if test="${type==12}">

                <table align="center" width="630" border="0" cellspacing="0" cellpadding="5" style="font-size:16px">
                    <tr align="center">
                        <td width="630" style="font-weight: bold; font-size:18px">
                            复检评估任务通知书
                        </td>
                    </tr>
                    <tr align="center">
                        <td>
                            （申请政府购买居家养老服务）
                        </td>
                    </tr>
                    <tr align="right">
                        <td style=" font-weight: bold; font-size:18px">
                            编号:${apply.number}
                        </td>
                    </tr>
                </table>
                <table align="center" width="630px" border="1" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="40" width="211px" colspan="2" class="border_topleft" align="center">
                            评估机构名称
                        </td>
                        <td colspan="4" height="40" class="border_topleft border_right">
                            <input id="assessOrgName" type="text" size="50" width="420"
                                   style="border:none; border:0px; font-size:16px"/>
                        </td>
                    </tr>
                    <tr>
                        <td height="70" colspan="6" style="line-height:26px;" class="border_lefttopright">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;今委托你单位对
                            <input type="text" size="15" readonly="readonly"  style="border:0px; border-bottom:1px solid black; font-size:16px; text-align:center" value="${apply.name}" />，
                            身份证号<input type="text" size="25" readonly="readonly" style="border:0px; border-bottom:1px solid black; font-size:16px; text-align:center" value="${apply.idcardno}" />，<BR />住址<input type="text" size="50" readonly="readonly" style="border:0px; border-bottom:1px solid black; overflow:visible; font-size:16px; text-align:center" value="${apply.address}" />，进行上门评估，于<input type="text"  size="5" style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">年<input type="text"  size="5" style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">月<input type="text"  size="5" style="border:none;border-bottom:1px solid #000000;text-align:center;overflow:visible">日前将评估报告提交我局，并将评估数据输入信息系统。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="15" readonly="readonly" id="${region_name}" name="${region_name}" style="border:none; border:0px; border-bottom:1px solid black; font-size:16px; text-align:center" />区民政局。
                        </td>
                    </tr>
                    <tr align="center">
                        <td height="40" width="22%"  class="border_topleft">联系人</td>
                        <td class="border_topleft" width="18%" align="left">${accept_person}</td>
                        <td width="18%" class="border_topleft">联系电话</td>
                        <td width="18%" class="border_topleft">&nbsp;</td>
                        <td width="18%" class="border_topleft">投诉电话</td>
                        <td class="border_topleft border_right ">
                            12349
                        </td>
                    </tr>
                    <tr align="center">
                        <td height="40" class="border_topleft border_bottom">通知时间</td>
                        <td colspan="5" class="border_topleft border_right border_bottom">
                                ${accept_date}
                        </td>
                    </tr>
                </table>
                u
            </c:if>
            <c:if test="${type==13}">
                <table width="630" border="0" align="center" class="table1" cellpadding="5" cellspacing="0">
                    <tr>
                        <td align="center" style="font-weight: bold;font-size:16px">政府购买居家养老服务通知书</td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right:5px;font-weight: bold;font-size:16px">编号：
                                ${apply.number} &nbsp;
                        </td>
                    </tr>
                </table>
                <table cellspacing=0 cellpadding=0 width=630 align=center border=1>
                    <tbody>
                    <tr>
                        <td class="border_topleft border_right" colspan=6 height=35>&nbsp;&nbsp;
                            <input style="overflow: visible; border-top-style: none; border-bottom: #000000 1px solid; border-right-style: none; border-left-style: none; text-align: center"
                                   size=40 value="" id="serviceOrgName" name=text>:
                        </td>
                    </tr>
                    <tr>
                        <td class="border_topleft border_right border_bottom;" style="line-height: 20px" colspan=6
                            height=100>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请人：
                            <input
                                    style="overflow: visible; border-top-style: none; border-bottom: #000000 1px solid; border-right-style: none; border-left-style: none; text-align: center"
                                    size=10 value=${apply.name} name=text2> ，身份证号 <input
                                    style="overflow: visible; border-top-style: none; border-bottom: #000000 1px solid; border-right-style: none; border-left-style: none; text-align: center"
                                    size=30 value=${apply.idcardno} name=text2> ，<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住址
                            <input style="overflow: visible;width: 200px; border-top-style: none; border-bottom: #000000 1px solid; border-right-style: none; border-left-style: none; text-align: center"
                                   value=${apply.address}> ，为政府购买服务对象。按照下列标准执行：
                            <input id="standardValue" name="standard" type="text"
                                   style="border:none; border:0px; text-align:center;width: 100%"/>
                            <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从
                            <input style="overflow: visible; border-top-style: none; border-bottom: #000000 1px solid; border-right-style: none; border-left-style: none; text-align: center"
                                   size=5 value=>年 <input
                                    style="overflow: visible; border-top-style: none; border-bottom: #000000 1px solid; border-right-style: none; border-left-style: none; text-align: center"
                                    size=5 value=>月起执行。 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input style="overflow: visible; border-top-style: none; border-bottom: #000000 1px solid; border-right-style: none; border-left-style: none; text-align: center"
                                   size=10 value=${apply.region1} name=text2> 民政局
                        </td>
                    </tr>
                    <tr align=center>
                        <td class=border_topleft style="font-size: 16px" height=40>联系人</td>
                        <td class=border_topleft width=130>
                                ${accept_person}
                        </td>
                        <td class=border_topleft style="font-size: 16px" width=90>联系电话</td>
                        <td class=border_topleft>
                                ${accept_date}
                        </td>
                        <td class=border_topleft style="font-size: 16px; text-align: center" width=80>投诉电话</td>
                        <td class="border_topleft border_right" style="font-size: 16px" width=80>12349</td>
                    </tr>
                    <tr align=center>
                        <td class="border_topleft border_bottom" height=40>报告时间</td>
                        <td class="border_topleft border_right border_bottom" colspan=5> ${accept_date}</td>
                    </tr>
                    </tbody>
                </table>
            </c:if>
        </div>

        <div style="margin-top: 50px">
            <div class=" col-md-6" style="text-align: center">
                <a href="javascript:void(0)" id="save" onclick="" class="btn btn-circle btn-add">
                    <i class="fa">确定</i>
                </a>
            </div>
            <div class=" col-md-6" style="text-align: center">
                <a href="javascript:void(0)" id="cancel" onclick="" class="btn btn-circle btn-black">
                    <i class="fa">关闭</i>
                </a>
            </div>
        </div>
        </div>
        </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/view/js/completer.min.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                <c:if test="${type==4 or type==12}">
                var data = [];
                assessOrgInit();
                </c:if>

                <c:if test="${type==13}">
                var data = [];
                serviceOrgInit();
                </c:if>
                <c:if test="${type==9 or type==13}">
                $("#standardValue").val(govBuyStandardValue[parseInt("${apply.standard}")]);
                </c:if>
                var tableContainer = $("#hidContent").parent();
                $("#save").click(function () {
                    <c:if test="${type==4 or type==12}">
                    var assessOrgName = $("#assessOrgName").val().trim();
                    var assessOrgId = 0;
                    if (assessOrgName != null) {
                        for (var i in data) {
                            if ((data[i].name) == assessOrgName) {
                                assessOrgId = data[i].id;
                                break;
                            }
                        }
                        if (assessOrgId == 0) {
                            alert("该评估组织不存在");
                            return false;

                        }
                    }
                    else {
                        alert("请填写评估组织");
                        return false;

                    }
                    </c:if>
                    <c:if test="${type==13}">
                    var serviceOrgName = $("#serviceOrgName").val().trim();
                    console.log(serviceOrgName);
                    var serviceOrgId = 0;
                    if (serviceOrgName != null) {
                        for (var i in data) {
                            if ((data[i].serviceOrgName) == serviceOrgName) {
                                serviceOrgId = data[i].id;
                                break;
                            }
                        }
                        if (serviceOrgId == 0) {
                            alert("该服务组织不存在");
                            return false;

                        }
                    }
                    else {
                        alert("请填写服务组织");
                        return false;

                    }
                    </c:if>
                    var status = parseInt("${nextStatus}");
                    var type = parseInt("${type}");
                    Metronic.blockUI({
                        message: '处理中...',
                        target: tableContainer,
                        overlayColor: 'none',
                        cenrerY: true,
                        boxed: true
                    });
                    $.post(window.apppath + "/admin/api/elderly/govbuy/apply/handleGovBuyApply", {
                        id: $("input[name=id]").val(),
                        status: status,
                        applyId: $("input[name=id]").val(),
                        type: type,//受理通知书
                        typeName: applyDocTypeName[type],
                        content: $('#hidContent').html()
                        <c:if test="${type==4 or type==12}">
                        , assessOrgName: assessOrgName,
                        assessOrgId: assessOrgId
                        </c:if>
                        <c:if test="${type==7}">
                        , standard: $("input[name=standard]:checked").val()
                        </c:if>
                        <c:if test="${type==13}">
                        , serviceOrgId:serviceOrgId
                        </c:if>
                    }, function (res) {
                        Metronic.unblockUI(tableContainer);
                        if (res.success) {
                            window.parent.updateTab("elder_govbuy_handle_list");
                            window.parent.closeTab("govbuy-applyInfo");
                            $("#popWinClose", window.parent.document).click();
                        }
                    }, 'json');
                });
                $("#cancel").click(function () {
                    $("#popWinClose", window.parent.document).click();
                });
                function assessOrgInit() {
                    var areaName = "${apply.region1}";
                    $.post(window.apppath + "/admin/api/assessOrg/all", {
                        areaName: areaName
                    }, function (res) {
                        data = res;
                        var source = [];
                        if (res != "") {
                            for (var i in res) {
                                source.push(" " + res[i].name);
                            }
                        }
                        if (source.length > 0) {
                            $('#assessOrgName').completer({
                                    source: source,
                                    suggest: true
                                }
                            );
                        }
                    }, "json");
                }


                function serviceOrgInit() {
                    var areaName = "${apply.region1}";
                    $.post(window.apppath + "/admin/api/serviceOrg/all", {
                        areaName: areaName
                    }, function (res) {
                        data = res;
                        var source = [];
                        if (res != "") {
                            for (var i in res) {
                                source.push(" " + res[i].serviceOrgName);
                            }
                        }
                        if (source.length > 0) {
                            $('#serviceOrgName').completer({
                                    source: source,
                                    suggest: true
                                }
                            );
                        }
                    }, "json");
                }
            });

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

