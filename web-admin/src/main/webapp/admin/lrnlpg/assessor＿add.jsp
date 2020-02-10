<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>
            新增评估人
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
                              新增评估人
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
                                                <input class="form-control" name="loginName" placeholder="请输入登录账号"
                                                       style="width: 100%"  value="${assessor.loginName}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                登录密码<span style="color: red">(请参考登录账号)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="password" placeholder="请输入登录密码" type="password"
                                                       style="width: 100%" value="${assessor.password}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                组织所属区域
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" type="text" id="areaName" name="area"
                                                       data-toggle="modal"
                                                       data-target="#areaModal" placeholder="请选择所属区域"
                                                       value="${assessor.area}"
                                                       onclick="ServiceOrgDetail.selectMethod('add');" style="width: 100%">
                                                <input type="hidden" id="areaId" name="areaId">

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                员工说明
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <textarea class="form-control" name="express" rows="3" placeholder="员工说明"
                                                          style="width: 100%">${assessor.express}</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                账号是否启用${assessor.useStatus}
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input type="radio" value="启用" name="useStatus" <c:if test="${assessor.useStatus eq '启用'}">checked</c:if> class="colored-blue">
                                                <span class="text"> 启用</span>
                                                <input name="useStatus" value="停用" <c:if test="${assessor.useStatus eq '停用'}">checked</c:if> type="radio" class="colored-blue">
                                                <span class="text"> 停用</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                账号有效期
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input style="width:40%;display: inline-block" type="text"
                                                       class="form-control date-picker" name="beginUseTime"
                                                       data-date-format="yyyy-mm-dd" value="${assessor.beginUseTime}">
                                                至
                                                <input style="width:40%;display: inline-block" type="text"
                                                       class="form-control date-picker" name="endUseTime"
                                                       data-date-format="yyyy-mm-dd" value="${assessor.endUseTime}">
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
                                                <input class="form-control" name="name" placeholder="员工姓名"
                                                       style="width: 100%" value="${assessor.name}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                性别
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input type="radio" value="保密" name="sex" <c:if test="${assessor.sex eq '保密'}">checked</c:if> class="colored-blue">
                                                <span class="text">保密</span>
                                                <input name="sex" value="男" type="radio" <c:if test="${assessor.sex eq '男'}">checked</c:if> class="colored-blue">
                                                <span class="text">男</span>
                                                <input name="sex" value="女" type="radio" <c:if test="${assessor.sex eq '女'}">checked</c:if> class="colored-blue">
                                                <span class="text">女</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                服务状态
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input type="radio" value="正常服务" name="serverStatus" <c:if test="${assessor.serverStatus eq '正常服务'}">checked</c:if> class="colored-blue">
                                                <span class="text">正常服务</span>
                                                <input name="serverStatus" value="停止服务" <c:if test="${assessor.serverStatus eq '停止服务'}">checked</c:if> type="radio" class="colored-blue">
                                                <span class="text">停止服务</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                头像
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <div >
                                                    <input id="idPhotos1" name="photoId" type="hidden"  value="${assessor.photoId}">
                                                    <div id="attachList" class="file-box-list idPhotos"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;" data="${assessor.photoId}" src=''><a style='text-decoration: none;display: none' data='${assessor.photoId}' class=' remove removeImg'></a></div>
                                                    </div>
                                                    <div style="display: inline-block" class="file-box">
                                                        <input type="file" name="files" id="idPhotos"
                                                               onchange="UploadImageSingle('lrnlpg/attach','idPhotos','idPhotos1','attachList')"
                                                               style="opacity: 0;" >
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                手机号<span style="color: red">(正确输入11位电话号码)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="phone" placeholder="请输入手机号码"
                                                       style="width: 100%" value="${assessor.phone}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                备用手机号<span style="color: red">(正确输入11位电话号码)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="secondPhone" placeholder="请输入手机号码"
                                                       style="width: 100%" value="${assessor.secondPhone}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                固定电话<span style="color: red">(正确输入固定电话号码)</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="addressPhone" placeholder="请输入固定电话"
                                                       style="width: 100%" value="${assessor.addressPhone}">
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
                                                <input class="form-control" name="address" placeholder="请输入户籍"
                                                       style="width: 100%" value="${assessor.address}">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                现居地<span style="color: red">(如：江苏省.南京市.江宁区.板桥街道）</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="lifePlace" placeholder="请输入现居地"
                                                       style="width: 100%" value="${assessor.lifePlace}">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                出生日期
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input style="width:40%;display: inline-block" type="text"
                                                       class="form-control date-picker" name="birthday"
                                                       data-date-format="yyyy-mm-dd" value="${assessor.birthday}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                员工身份证号<span style="color: red">（请正确输入18位身份证号）</span>
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input class="form-control" name="idCard" placeholder="员工身份证号"
                                                       style="width: 100%" value="${assessor.idCard}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                民族
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <select name="nation"  class="form-control" data="${assessor.nation}">
                                                    <option value="汉族">汉族</option>
                                                    <option value="回族">回族</option>
                                                    <option value="苗族">苗族</option>
                                                    <option value="土家族">土家族</option>
                                                    <option value="维吾尔族">维吾尔族</option>
                                                    <option value="朝鲜族">朝鲜族</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                政治面貌
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <select name="party" id="political" class="form-control" data="${assessor.party}">
                                                    <option value="中共党员">中共党员</option>
                                                    <option value="团员">团员</option>
                                                    <option value="群众">群众</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                文化程度
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <select name="education"  class="form-control" data="${assessor.education}">
                                                    <option value="本科">本科</option>
                                                    <option value="硕士">硕士</option>
                                                    <option value="专科">专科</option>
                                                    <option value="高中">高中</option>
                                                    <option value="小学">小学</option>
                                                    <option value="社会">社会</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                入职时间
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input style="width:40%;display: inline-block" type="text"
                                                       class="form-control date-picker" name="onDutyTime"
                                                       data-date-format="yyyy-mm-dd" value="${assessor.onDutyTime}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                离职时间
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <input style="width:40%;display: inline-block" type="text"
                                                       class="form-control date-picker" name="leaveDutyTime"
                                                       data-date-format="yyyy-mm-dd" value="${assessor.leaveDutyTime}">
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
                                                    <input id="idPhotosname2" name="certNoId" type="hidden"  value="${assessor.certNoId}">
                                                    <div id="attachList2" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg'  style="width: 90px;"  data="${assessor.certNoId}" src=''><a style='text-decoration: none;display: none' data='${assessor.certNoId}' class=' remove removeImg'></a></div>
                                                    </div>
                                                    <div style="display: inline-block" class="file-box">
                                                        <input type="file" name="files" id="idPhotos2"
                                                               onchange="UploadImageSingle('lrnlpg/attach','idPhotos2','idPhotosname2','attachList2')"
                                                               style="opacity: 0;">
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
                                                    <input id="idPhotosname3" name="certSmallId" type="hidden"  value="${assessor.certSmallId}">
                                                    <div id="attachList3" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;"  data="${assessor.certSmallId}" src=''><a style='text-decoration: none;display: none' data='${assessor.certSmallId}' class=' remove removeImg'></a></div>
                                                    </div>
                                                    <div style="display: inline-block" class="file-box">
                                                        <input type="file" name="files" id="idPhotos3"
                                                               onchange="UploadImageSingle('lrnlpg/attach','idPhotos3','idPhotosname3','attachList3')"
                                                               style="opacity: 0;">
                                                    </div>
                                                </div>
                                        </tr>
                                        <tr>
                                            <td style="width:10%;text-align:center;vertical-align:middle;">
                                                <font color="#FF0000">中级养老护理员</font>-证书照片
                                            </td>
                                            <td style="width:20%;text-align:center;vertical-align:middle;">
                                                <div >
                                                    <input id="idPhotosname4" name="certMiddleId" type="hidden"  value="${assessor.certMiddleId}">
                                                    <div id="attachList4" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;"  data="${assessor.certMiddleId}" src=''><a style='text-decoration: none;display: none' data='${assessor.certMiddleId}' class=' remove removeImg'></a></div>
                                                    </div>
                                                    <div style="display: inline-block" class="file-box">
                                                        <input type="file" name="files" id="idPhotos4"
                                                               onchange="UploadImageSingle('lrnlpg/attach','idPhotos4','idPhotosname4','attachList4')"
                                                               style="opacity: 0;">
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
                                                    <input id="idPhotosname5" name="certHighId" type="hidden"  value="${assessor.certHighId}">
                                                    <div id="attachList5" class="file-box-list"
                                                         style="display: inline-block;margin: 0px;float: left;">
                                                        <div class='file-div'><img class='uploadImg' style="width: 90px;"  data="${assessor.certHighId}" src=''><a style='text-decoration: none;display: none' data='${assessor.certHighId}' class=' remove removeImg'></a></div>
                                                    </div>
                                                    <div style="display: inline-block" class="file-box">
                                                        <input type="file" name="files" id="idPhotos5"
                                                               onchange="UploadImageSingle('lrnlpg/attach','idPhotos5','idPhotosname5','attachList5')"
                                                               style="opacity: 0;">
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
                <button data-loading-text="提交中..."
                        type="button" class="btn btn-circle green"
                        onclick="powerAssessor.addorupdate()">
                    保存
                </button>
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
                Metronic.init();
                Layout.init();
                AreaTree.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                $(".uploadImg").each(function(){
                    var data=window.apppath+$(this).attr("data");
                    $(this).attr("src",data);
                });
                $("select").each(function(){
                    $(this).val($(this).attr("data"));
                });
                $(".remove").click(function () {
                    $(this).parent().remove();
                    $("#" + name).val("");
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

