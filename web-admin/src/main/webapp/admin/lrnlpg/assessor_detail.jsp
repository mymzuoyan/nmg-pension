<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            评估人详情
        </title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>

            .file-box {
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }
            .file-box input {
                position: absolute;
                z-index: 1;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                              评估人详情
                            </span>
                        </div>
                    </div>

                    <div class="portlet-body" style="padding-top: 0px !important;display: block">
                        <ul class="nav nav-tabs tabs-flat">
                            <!--ONE TAB START-->
                            <li class="active">
                                <a data-toggle="tab" href="#tab1"> 账号信息</a>
                            </li>
                            <!--ONE TAB END-->
                            <!--TWO TAB START-->
                            <li class="">
                                <a data-toggle="tab" href="#tab2">基本信息</a>
                            </li>
                            <!--TWO TAB END-->
                            <li class="">
                                <a data-toggle="tab" href="#tab3">详细信息</a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" href="#tab4">证书信息</a>
                            </li>
                        </ul>
                        <form id="serviceOrg-form" name="serviceOrg-form">
                            <div class="tab-content">
                                <!--ONE TAB BODY START-->
                                <div id="tab1" class="tab-pane in active">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                登录账号<span style="color: red">(字母数字和下划线组合，如：zhangsan007,lisi008,wangwu110)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.loginName}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                登录密码<span style="color: red">(请参考登录账号)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.password}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                组织所属区域
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                               ${assessor.area}

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                员工说明
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <textarea class="form-control" name="express" rows="3" placeholder="员工说明"
                                                       style="width: 100%" readonly>${assessor.express}</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                账号是否启用
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                    ${assessor.useStatus}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                账号有效期
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.beginUseTime}
                                                至
                                                ${assessor.endUseTime}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!--ONE TAB BODY END-->

                                <!--TWO TAB BODY START-->
                                <div id="tab2" class="tab-pane">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <input class="form-control" name="id"
                                               style="display: none" value="${assessor.id}">
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                员工姓名
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                性别
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                    ${assessor.sex}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                服务状态
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                    ${assessor.serverStatus}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                头像
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <div >
                                                    <div id="attachList" class="file-box-list idPhotos"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;" data="${assessor.photoId}" src=''></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                手机号<span style="color: red">(正确输入11位电话号码)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.phone}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                备用手机号<span style="color: red">(正确输入11位电话号码)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.secondPhone}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                固定电话<span style="color: red">(正确输入固定电话号码)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.addressPhone}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="tab3" class="tab-pane">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                户籍<span style="color: red">(如：江苏.南京)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.address}
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                现居地<span style="color: red">(如：江苏省.南京市.江宁区.板桥街道）</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.lifePlace}
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                出生日期
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.birthday}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                员工身份证号<span style="color: red">（请正确输入18位身份证号）</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.idCard}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                民族
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                    ${assessor.nation}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                政治面貌
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.party}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                文化程度
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.education}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                入职时间
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.onDutyTime}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                离职时间
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                ${assessor.leaveDutyTime}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!--THREE TAB END -->

                                <div id="tab4" class="tab-pane">
                                    <table class="table table-bordered table-hover table-condensed table-responsive">
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                <font color="#FF0000">无证</font>-证书照片
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <div >
                                                    <div id="attachList2" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg'  style="width: 90px;"  data="${assessor.certNoId}" src=''></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                <font color="#FF0000">初级养老护理员</font>-证书照片
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <div >
                                                    <div id="attachList3" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;"  data="${assessor.certSmallId}" src=''></div>
                                                    </div>
                                                </div>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                <font color="#FF0000">中级养老护理员</font>-证书照片
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <div >
                                                    <div id="attachList4" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;"  data="${assessor.certMiddleId}" src=''></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                <font color="#FF0000">高级养老护理员</font>-证书照片
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <div >
                                                    <div id="attachList5" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;"  data="${assessor.certHighId}" src=''></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </form>

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
                                onclick="ServiceOrgDetail.getAreaName()">
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

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/datatable.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_detail.js?v=1.5"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/old_man_power_assessor.js?v=1.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                $(".uploadImg").each(function(){
                    var data=window.apppath+$(this).attr("data");
                    $(this).attr("src",data);
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

