<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>能力评估信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN CONTENT -->
        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">能力评估信息</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important; padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">能力评估信息列表</span>
                        </div>
                        <div class="tools">
                            <div style="float: left">
                            </div>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="assess-form" name="assess-form">
                            <table class="table table-bordered table-hover table-condensed table-responsive table-expandable">
                                <tr>
                                    <td colspan="8" onclick="AssessInfo.showTbody1();" class="tr-title">
                                        <span class="caption-helper">基本信息</span>
                                    </td>
                                </tr>
                                <tbody id="tbody1" style="border-bottom:0px solid #eee;">
                                <tr>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">所属区域</td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input  class="form-control"  name="areaName" id="areaName" onclick="AssessInfo.selectArea();"
                                                <c:if test="${not empty sessionScope.login_user.areaName}">
                                                    value="${sessionScope.login_user.areaName}"
                                                </c:if>
                                                type="text"/>
                                        <input type="hidden" name="areaId" id="areaId"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        优待证编号
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input  class="form-control"  name="serialNumber"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        联系电话
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input  class="form-control"  name="homeTel"/>
                                    </td>
                                    <td width="10%" style="text-align:center;vertical-align:middle;">
                                        姓&nbsp;&nbsp;名
                                    </td>
                                    <td width="15%" style="text-align:center;vertical-align:middle;">
                                        <input  class="form-control"  name="elderName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        身份证号
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input  class="form-control"  name="idcardno"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        年&nbsp;&nbsp;龄
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <input  class="form-control"  style="width: 40%;display: inline-block" type="text" id="startAge" name="startAge" maxlength="3"
                                               size="5"/>
                                        至&nbsp;<input class="form-control"  style="width: 40%;display: inline-block" type="text" id="endAge" name="endAge" maxlength="3"
                                                      size="5"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        性&nbsp;&nbsp;别
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="sexDictId"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value=''>-全部-</option>
                                            <option value='1'>男</option>
                                            <option value='2'>女</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        居住状况
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="residenceDictId"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">--请选择--</option>
                                            <option value="1">与配偶住</option>
                                            <option value="2">独居</option>
                                            <option value="3">与子女共住</option>
                                            <option value="4">与孙子女共住</option>
                                            <option value="5">与兄弟姐妹共住</option>
                                            <option value="6">与父母或岳父母共住</option>
                                            <option value="7">住养老院</option>
                                            <option value="0">其他</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        户籍地址
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="3">
                                        <input class="form-control"  name="regPlace" style="width: 100%"/>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        居住地址
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;" colspan="3">
                                        <input class="form-control"  name="realAddress" style="width: 100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        人员类别
                                    </td>
                                    <td style="vertical-align:middle;text-align: left" colspan="7">
                                        <input type="checkbox" name="elderTypeDictIds" value="1"/>城市特困/农村特困
                                        <input type="checkbox" name="elderTypeDictIds" value="2"/>低保/低保边缘
                                        <input type="checkbox" name="elderTypeDictIds" value="3"/>经济困难的失能/半失能老人
                                        <input type="checkbox" name="elderTypeDictIds" value="4"/>70周岁及以上的计生特扶老人
                                        <input type="checkbox" name="elderTypeDictIds" value="5"/>百岁老人
                                        <input type="checkbox" name="elderTypeDictIds" value="9"/>空巢
                                        <input type="checkbox" name="elderTypeDictIds" value="10"/>独居
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        失能分
                                    </td>
                                    <td style="vertical-align:middle;" colspan="5">
                                        <input class="form-control"  style="width: 40%;display: inline-block" type="text" name="resultScore1" maxlength="5">&nbsp;至&nbsp;
                                        <input class="form-control"  style="width: 40%;display: inline-block" type="text" name="resultScore2" maxlength="5">
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        现状情况
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <div class="table-actions-wrapper">
                                            <select name="isDeath"
                                                    class="table-group-action-input form-control input-inline input-small input-sm">
                                                <option value="">-全部-</option>
                                                <option value="1" selected="selected">正常</option>
                                                <option value="0">去世</option>
                                                <option value="2">迁出</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                                <tr>
                                    <td colspan="8" onclick="AssessInfo.showTbody3();"  class="tr-title">
                                        <span class="caption-helper">生活自理能力</span>
                                    </td>
                                </tr>
                                <tbody id="tbody3" style="display: none;border-bottom:0px solid #eee;">
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        吃&nbsp;&nbsp;饭
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr1"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        穿&nbsp;&nbsp;衣
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr2"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        如&nbsp;&nbsp;厕
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr3"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        室内走动
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr4"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        洗&nbsp;&nbsp;澡
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr5"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        控制大小便
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr6"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        近期记忆：
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr7"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        程序记忆
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr8"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        定向记忆
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr9"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        判断能力
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr10"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        情&nbsp;&nbsp;绪
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr11"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        行&nbsp;&nbsp;为
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr12"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;">
                                        沟&nbsp;&nbsp;通
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr13"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        视&nbsp;&nbsp;觉
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr14"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        听&nbsp;&nbsp;觉
                                    </td>
                                    <td style="text-align:center;vertical-align:middle;">
                                        <select name="attr15"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">-全部-</option>
                                            <option value="1">正常</option>
                                            <option value="2">轻丧失</option>
                                            <option value="3">中丧失</option>
                                            <option value="4">完全丧失</option>
                                        </select>
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                        <div class="right" style="text-align: right">
                            <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                            <a class="reload table-group-action-reload btn btn-circle btn-black"><i class="fa">重置</i></a>
                        </div>
                    </div>
                </div>
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="table-container">
                        <table class="table table-striped table-bordered table-hover" id="datatable_event_list">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="1%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th width="10%" style="text-align:center;vertical-align:middle;">
                                    所在区域
                                </th>
                                <th width="8%" style="text-align:center;vertical-align:middle;">
                                    姓名
                                </th>
                                <th width="12%" style="text-align:center;vertical-align:middle;">
                                    身份证号
                                </th>
                                <th width="2%" style="text-align:center;vertical-align:middle;">
                                    年龄
                                </th>
                                <th width="14%" style="text-align:center;vertical-align:middle;">
                                    人员类别
                                </th>
                                <th width="8%" style="text-align:center;vertical-align:middle;">
                                    能力等级
                                </th>
                                <th width="4%" style="text-align:center;vertical-align:middle;">
                                    评估分值
                                </th>
                                <th width="8%" style="text-align:center;vertical-align:middle;">
                                    最近评估时间
                                </th>
                                <th width="15%" style="text-align:center;vertical-align:middle;">
                                    操&nbsp;作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <div class="table-actions-check-wrapper">
                            <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                     class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                     maxlenght="5"
                                                                     style="text-align:center; margin: 0 5px;">
                                <button
                                        href="" id="goPage" class="btn btn-sm default " onclick="AssessInfo.goToPage()"
                                        title="GO">GO
                                </button>
                            </div>
                        </div>
                        <input type="hidden" id="assess"
                               value="<shiro:hasPermission name="person-assess-manager">1</shiro:hasPermission>">
                    </div>
                </div>
                <!-- 地区模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">请选择...</h4>
                            </div>
                            <div class="modal-body">
                                <!-- BEGIN PAGE CONTENT-->
                                <div id="areaTree" class="tree-demo"></div>
                                <!-- END PAGE CONTENT-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn-primary"
                                        onclick="AssessInfo.getAreaValue(AreaTree.getAllAreaName(AreaTree.getSelectArea()),AreaTree.getSelectArea());">
                                    确定
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <!-- 导入模态框（Modal） -->
                <div class="modal fade" id="impModal" tabindex="" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="impModalLabel">请选择...</h4>
                            </div>
                            <div class="modal-body">
                                <!-- BEGIN PAGE CONTENT-->
                                <form id="form1" name="form1" method="post" action=""
                                      enctype="multipart/form-data" target="impResult">
                                    <table class="table-container">
                                        <tr>
                                            <td>
                                                导入文件：
                                            </td>
                                            <td style="text-align:center;">
                                                <input type="file" id="file" name="file" size="40"/>
                                            </td>
                                            <td>
                                                <button>上传</button>
                                            </td>
                                            <td>
                                                <a href="/upload/score/elder_imp.xls"/>&nbsp;Excel模板下载</a>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <!-- END PAGE CONTENT-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn-primary" onclick="deadInfo.impValue();">
                                    确定
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <!--  弹出框 -->
                <div id="assModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="margin-top:150px; width: 800px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title">
                                    老人能力评估列表
                                </h4>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="elderId"  />
                                <div class="portlet " style="padding-top: 0px !important;padding-left: 0px !important;">
                                    <div class="table-container">
                                        <table class="table table-striped table-bordered table-hover" id="datatable_assessAllInfo">
                                            <thead>
                                            <tr role="row" class="heading">
                                                <th width="1%">
                                                    <input type="checkbox" class="group-checkable">
                                                </th>
                                                <th width="13%">
                                                    所在区域
                                                </th>
                                                <th width="13%">
                                                    编号
                                                </th>
                                                <th width="14%">
                                                    姓名
                                                </th>
                                                <th width="19%">
                                                    身份证号
                                                </th>
                                                <th width="13%">
                                                    评估时间
                                                </th>
                                                <th width="12%">
                                                    评估人1
                                                </th>
                                                <th width="13%">
                                                    评估人2
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.弹出框 -->
                </div>

                <!--  弹出框 -->
                <div id="checkModal" class="modal" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="margin-top:150px; width: 800px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title">
                                    评估检查
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="table-container">
                                    <input type="hidden" value="" id="elderId">
                                    <div class="table-actions-wrapper">
                                        <span></span>
                                        <select name="groupId"
                                                class="table-group-action-input form-control input-inline input-small input-sm">
                                        </select>
                                        <button class="btn btn-sm green table-group-action-submit"><i
                                                class="fa fa-check"></i>查询
                                        </button>
                                    </div>
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_assesCheck_list">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="15%">
                                                所在区域
                                            </th>
                                            <th width="35%">
                                                检查内容
                                            </th>
                                            <th width="15%">
                                                检查结果
                                            </th>
                                            <th width="15%">
                                                检查时间
                                            </th>
                                            <th width="15%">
                                                查看
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addCheck">新增检查</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.弹出框 -->
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->

        <!-- END CONTENT -->
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderInfo_assessList.js?v=2.12"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderInfo_assessCheck_list.js?v=2.2"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/admin/pages/scripts/elderly/elderInfo_asseAllList.js?v=1.6"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                window.apppath = "${pageContext.request.contextPath }";
                Metronic.init();
                Layout.init();
                AreaTree.init();
                AssessInfo.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
