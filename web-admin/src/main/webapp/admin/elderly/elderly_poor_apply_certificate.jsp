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
        <title>特困人员供养证书</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/view/css/style.css?v=1.4"/>
        <style>
            .g-card .page3 .right table
            .num3
            {
                font-size: 12px;
            }
        </style>
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
                    <a href="#">城乡特困人员</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">特困人员救助供养证</a>
                </li>
            </ul>
        </div>
        <div class="row" style="padding-top: 20px;margin: 0px;height: 2430px;overflow: hidden">
            <div style="text-align: right">
                <a id="print" class="btn btn-circle  green">
                    打印 </i>
                </a>
            </div>
            <div class="g-card">
                <div class="page1">
                    <div class="left">
                        <div class="card">
                            <div class="photo"><img
                                    src="${pageContext.request.contextPath}/assets/admin/pages/img/cover.png" alt="">
                            </div>
                            <div class="name">特困人员救助供养证</div>
                            <div class="footer">中华人民共和国民政部</div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="intro">根据特困人员救助供养制度有关规定，经本人自愿申请，乡镇人民政府（街道办事处）审核，县级人民政府民政部门批准，认定为特困人员，特发此证。</div>
                        <div class="company"><span>发证单位（盖章）</span></div>
                        <div class="date"><span>年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</span></div>
                    </div>
                </div>
                <div class="page2">
                    <div class="left">
                        <table>
                            <tr>
                                <td class="num1">姓 名</td>
                                <td class="num2">${apply.name}</td>
                                <td class="num3" rowspan="3" style="height: 166px;padding: 2px">
                                    <img style="width: 100%;height: 100%;"
                                         src="${pageContext.request.contextPath}${apply.avatar}">
                                </td>
                            </tr>
                            <tr>
                                <td class="num1">性 别</td>
                                <td class="num2">${["","男","女"][apply.sex]}</td>
                            </tr>
                            <tr>
                                <td class="num1">民 族</td>
                                <td class="num2">${apply.nation}</td>
                            </tr>
                            <tr>
                                <td class="num1">出生年月</td>
                                <td colspan="2">${apply.birthday}</td>
                            </tr>
                            <tr>
                                <td class="num1">身份证号</td>
                                <td colspan="2">${apply.idcardno}</td>
                            </tr>
                            <tr>
                                <td class="num1">户籍所在地</td>
                                <td colspan="2">${apply.regPlace}</td>
                            </tr>
                            <tr>
                                <td class="num1">现居住地</td>
                                <td colspan="2">${apply.address}</td>
                            </tr>
                            <tr>
                                <td class="num1">发证时间</td>
                                <td colspan="2"><fmt:formatDate pattern="yyyy"
                                                                value="${apply.updateTime}"></fmt:formatDate>年&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
                                        pattern="MM" value="${apply.updateTime}"></fmt:formatDate>月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
                                        pattern="dd" value="${apply.updateTime}"></fmt:formatDate>日
                                </td>
                            </tr>
                            <tr>
                                <td class="num1">编 号</td>
                                <td colspan="2">${apply.number}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="right">
                        <table>
                            <tr class="line1">
                                <td colspan="2">生活自理能力评估结果及变更</td>
                            </tr>
                            <tr class="line2">
                                <td class="num1">生活自理能力评估结果</td>
                                <td class="num2">评估时间</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="page3">
                    <div class="left">
                        <form action="">
                            <table>
                                <tr class="line1">
                                    <td colspan="3">供养形式及变更</td>
                                </tr>
                                <tr class="line2">
                                    <td class="num1 type">
                                        供养形式<br/><br/>（单选）
                                    </td>
                                    <td class="num2 type">
                                        供养服务机构或委托照料人
                                    </td>
                                    <td class="num3">时间</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="right">
                        <table>
                            <tr class="line1">
                                <td colspan="3">年审情况</td>
                            </tr>
                            <tr class="line2">
                                <td class="num1">救助供养年份</td>
                                <td class="num2">经办人</td>
                                <td class="num3">年审时间</td>
                            </tr>
                            <tr class="line2 tr1">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr2">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr3">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr4">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr5">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr6">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr7">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr8">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr9">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr10">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="page4">
                    <div class="left">
                        <div class="notice">持证须知</div>
                        <p>1．此证为特困人员享受救助供养待遇的凭证，仅限特困人员本人使用，不得私自涂改、转借或转让他人。</p>
                        <p>2．此证应妥善保管，如有遗失，须报告村（居）民委员会或特困人员供养服务机构，声明作废，并向发证机关申请补发。</p>
                        <p>3．特困人员不再符合救助供养条件时，此证由发证机关予以收回并核销。</p>
                        <div class="explain">填写说明</div>
                        <p>1．此证经县级人民政府民政部门盖章有效。</p>
                    </div>
                    <div class="right">
                        <p>2．生活自理能力按照《特困人员认定办法》第二十一条、二十二条规定，分为具备生活自理能力、部分丧失生活自理能力和完全丧失生活自理能力三类。</p>
                        <p>3．供养形式指特困人员在家分散供养或入住供养服务机构集中供养。</p>
                        <p>4．县级人民政府民政部门应每年组织审核，审核情况在年审栏中予以记录，由经办人签名，并加盖年审专用章。</p>
                    </div>
                </div>
                <div class="page5">
                    <div class="wrap" style="margin: 0px">
                        <div class="backCover"><span>封底</span></div>
                    </div>
                </div>
            </div>
            <div class="g-card" id="printPage" style="">
                <div class="page1" style="page-break-after:always; ">
                    <div class="left" style=" width:68mm;height:125mm;border: 1px solid #000;">
                    </div>
                    <div class="right">
                        <div class="intro">根据特困人员救助供养制度有关规定，经本人自愿申请，乡镇人民政府（街道办事处）审核，县级人民政府民政部门批准，认定为特困人员，特发此证。</div>
                        <div class="company"><span>发证单位（盖章）</span></div>
                        <div class="date"><span>年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</span></div>
                    </div>
                </div>
                <div class="page2 page4" style="page-break-after:always;">
                    <div class="left">
                        <table>
                            <tr>
                                <td class="num1">姓 名</td>
                                <td class="num2">${apply.name}</td>
                                <td class="num3" rowspan="3" style="height: 166px;padding: 2px">
                                    <img style="width: 100%;height: 100%;"
                                         src="${pageContext.request.contextPath}${apply.avatar}">
                                </td>
                            </tr>
                            <tr>
                                <td class="num1">性 别</td>
                                <td class="num2">${["","男","女"][apply.sex]}</td>
                            </tr>
                            <tr>
                                <td class="num1">民 族</td>
                                <td class="num2">${apply.nation}</td>
                            </tr>
                            <tr>
                                <td class="num1">出生年月</td>
                                <td colspan="2">${apply.birthday}</td>
                            </tr>
                            <tr>
                                <td class="num1">身份证号</td>
                                <td colspan="2">${apply.idcardno}</td>
                            </tr>
                            <tr>
                                <td class="num1">户籍所在地</td>
                                <td colspan="2">${apply.regPlace}</td>
                            </tr>
                            <tr>
                                <td class="num1">现居住地</td>
                                <td colspan="2">${apply.address}</td>
                            </tr>
                            <tr>
                                <td class="num1">发证时间</td>
                                <td colspan="2"><fmt:formatDate pattern="yyyy"
                                                                value="${apply.updateTime}"></fmt:formatDate>年&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
                                        pattern="MM" value="${apply.updateTime}"></fmt:formatDate>月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
                                        pattern="dd" value="${apply.updateTime}"></fmt:formatDate>日
                                </td>
                            </tr>
                            <tr>
                                <td class="num1">编 号</td>
                                <td colspan="2">${apply.number}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="right">
                        <p>2．生活自理能力按照《特困人员认定办法》第二十一条、二十二条规定，分为具备生活自理能力、部分丧失生活自理能力和完全丧失生活自理能力三类。</p>
                        <p>3．供养形式指特困人员在家分散供养或入住供养服务机构集中供养。</p>
                        <p>4．县级人民政府民政部门应每年组织审核，审核情况在年审栏中予以记录，由经办人签名，并加盖年审专用章。</p>

                    </div>
                </div>
                <div class="page2 page4" style="page-break-after:always;">
                    <div class="left">
                        <div class="notice">持证须知</div>
                        <p>1．此证为特困人员享受救助供养待遇的凭证，仅限特困人员本人使用，不得私自涂改、转借或转让他人。</p>
                        <p>2．此证应妥善保管，如有遗失，须报告村（居）民委员会或特困人员供养服务机构，声明作废，并向发证机关申请补发。</p>
                        <p>3．特困人员不再符合救助供养条件时，此证由发证机关予以收回并核销。</p>
                        <div class="explain">填写说明</div>
                        <p>1．此证经县级人民政府民政部门盖章有效。</p>
                    </div>
                    <div class="right">
                        <table>
                            <tr class="line1">
                                <td colspan="2">生活自理能力评估结果及变更</td>
                            </tr>
                            <tr class="line2">
                                <td class="num1">生活自理能力评估结果</td>
                                <td class="num2">评估时间</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                            <tr class="line3">
                                <td class="num1"></td>
                                <td class="num2">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="page3" style="page-break-after:always;">
                    <div class="left">
                        <form action="">
                            <table>
                                <tr class="line1">
                                    <td colspan="3">供养形式及变更</td>
                                </tr>
                                <tr class="line2">
                                    <td class="num1 type">
                                        供养形式<br/><br/>（单选）
                                    </td>
                                    <td class="num2 type">
                                        供养服务机构或委托照料人
                                    </td>
                                    <td class="num3">时间</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">集中供养</td>
                                    <td class="num2"></td>
                                    <td rowspan="2">年&nbsp;月&nbsp;日</td>
                                </tr>
                                <tr class="line3">
                                    <td class="num1"><input type="radio" class="radio">分散供养</td>
                                    <td class="num2"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="right">
                        <table>
                            <tr class="line1">
                                <td colspan="3">年审情况</td>
                            </tr>
                            <tr class="line2">
                                <td class="num1">救助供养年份</td>
                                <td class="num2">经办人</td>
                                <td class="num3">年审时间</td>
                            </tr>
                            <tr class="line2 tr1">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr2">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr3">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr4">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr5">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr6">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr7">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr8">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr9">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                            <tr class="line2 tr10">
                                <td class="num1"></td>
                                <td class="num2"></td>
                                <td class="num3">年&nbsp;月&nbsp;日</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/arrayValue.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/jquery.jqprint-0.3.js?v=1.0"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                var applyId = "${apply.id}";
                //获取年审记录
                $.post(window.apppath + "/admin/api/elderly/poor/verification/list", {
                    length: 10,
                    start: 0,
                    applyId: applyId,
                    result: 1,
                    orderField: 'id',
                    orderDir: "DESC"
                }, function (res) {
                    if (res.data) {
                        var data = res.data;
                        var flag = 1;
                        for (var i in data) {
                            var time=data[i].createTime;
                            var year=new Date(time).getFullYear();
                            var month=new Date(time).getMonth()+1;
                            var day=new Date(time).getDate();
                            var html = '<td class="num1">'+data[i].year+'</td>' +
                                '<td class="num2">'+data[i].creator+'</td>' +
                                '<td class="num3">'+year+'年'+month+'月'+day+'日</td>';
                            $(".tr"+flag).html(html);
                            flag++;
                        }
                    }
                }, 'json');

                $("#print").click(function () {
                    //打印
                    $("#printPage").jqprint();
                });


            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

