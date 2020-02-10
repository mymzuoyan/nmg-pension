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
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>突发事件新增</title>
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
                    <a href="#">居家养老信息管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">突发事件信息新增</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                             <span class="caption-subject font-red-sunglo bold uppercase">
                            添加突发事件
                             </span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 组织名称
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="serviceOrgName" name="serviceOrgName" value="${sessionScope.login_user.serviceOrgName}"
                                                   maxlength="18" disabled/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:left;vertical-align:middle;"><font color="red">*</font>事件类型</td>
                                        <td colspan="2" style="text-align:center;vertical-align:middle;">
                                            <select style="width:100%;height: 38px" name="eventType" id="eventType" class="form-control">
                                                <option value="">--请选择--</option>
                                                <option value="1">自然灾害</option>
                                                <option value="2">事故灾难</option>
                                                <option value="3">公共卫生事件</option>
                                                <option value="4">社会安全事件</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 发生时间
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class=" date-picker form-control" data-date-format="yyyy-mm-dd" id="occurrenceTime" name="occurrenceTime" value="" placeholder="请输入发生时间"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 事件描述
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="eventDescription" name="eventDescription" value="" placeholder="请输入事件描述"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align: left;vertical-align: middle;width: 9%">
                                            <span style="color:red"> *</span> 事件照片
                                        </td>
                                        <td colspan="3" style="text-align: left;vertical-align: middle;width: 24%">
                                            <div class="file-box-list attachInput"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box" id="toggleDiv">
                                                <input type="file" name="files" id="attachInput"
                                                       onchange="UploadFileService('serviceOrg/subsidy/apply/attach','attachInput','eventPhoto')"
                                                       style="height: 30px">
                                                <input type="hidden" id="eventPhoto" name="eventPhoto">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 处理人
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="dealPeople" name="dealPeople" value="" placeholder="请输入处理人"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 处理时间
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class=" date-picker form-control" data-date-format="yyyy-mm-dd" id="dealTime" name="dealTime" value="" placeholder="请输入发生时间"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 处理结果
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="dealResult" name="dealResult" value="" placeholder="请输入处理结果"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align: left;vertical-align: middle;width: 9%">
                                            <span style="color:red"> *</span> 处理照片
                                        </td>
                                        <td colspan="3" style="text-align: left;vertical-align: middle;width: 24%">
                                            <div class="file-box-list attachInput2"
                                                 style="display: inline-block;margin: 0px"></div>
                                            <div style="display: inline-block" class="file-box" id="toggleDiv2">
                                                <input type="file" name="files" id="attachInput2"
                                                       onchange="UploadFileService('serviceOrg/subsidy/apply/attach','attachInput2','dealPhoto')"
                                                       style="height: 30px">
                                                <input type="hidden" id="dealPhoto" name="dealPhoto">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addHappy">保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_community_donation_add')" class="btn btn-default">返回
                                </button>
                            </div>
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
                src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/jstree.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });
                var eventPhoto = $.trim($("input[name=eventPhoto]").val());
                $(".addHappy").click(function () {
                    var eventPhoto = $("input[name=eventPhoto]").val();
                    var serviceOrgName = $("input[name=serviceOrgName]").val();
                    var eventType = $("select[name=eventType]").val();
                    var occurrenceTime = $("input[name=occurrenceTime]").val();
                    var eventDescription = $("input[name=eventDescription]").val();
                    var dealPeople = $("input[name=dealPeople]").val();
                    var dealTime = $("input[name=dealTime]").val();
                    var dealResult = $("input[name=dealResult]").val();
                    var dealPhoto = $("input[name=dealPhoto]").val();

                    if(dealResult=="" || dealResult==null){
                        $("#labelmsg").text('处理结果不能为空！').addClass("label-danger");
                        return;
                    }else if(dealTime=="" || dealTime==null){
                        $("#labelmsg").text('处理时间不能为空！').addClass("label-danger");
                        return;
                    }else if(dealPeople=="" || dealPeople==null){
                        $("#labelmsg").text('处理人不能为空！').addClass("label-danger");
                        return;
                    }else if(eventDescription=="" || eventDescription==null){
                        $("#labelmsg").text('事件描述不能为空！').addClass("label-danger");
                        return;
                    }else if(occurrenceTime=="" || occurrenceTime==null){
                        $("#labelmsg").text('发生时间不能为空！').addClass("label-danger");
                        return;
                    }else if(eventType=="" || eventType==null){
                        $("#labelmsg").text('事件类型不能为空！').addClass("label-danger");
                        return;
                    }else if(eventPhoto=="" || eventPhoto==null){
                        $("#labelmsg").text('请上传事件照片！').addClass("label-danger");
                        return;
                    }else if(dealPhoto=="" || dealPhoto==null){
                        $("#labelmsg").text('请上传处理照片！').addClass("label-danger");
                        return;
                    }else if(serviceOrgName=="" || serviceOrgName==null){
                        $("#labelmsg").text('组织名称不能为空！').addClass("label-danger");
                        return;
                    }
                    addHappy();

                });

                function addHappy() {
                    var eventPhoto = $.trim($("input[name=eventPhoto]").val());
                    $.post(window.apppath + "/admin/api/org/emergencyManagement/addEmergency", {
                        eventPhoto: $("input[name=eventPhoto]").val(),
                        serviceOrgName: $("input[name=serviceOrgName]").val(),
                        eventType: $("select[name=eventType]").val(),
                        occurrenceTime: $("#occurrenceTime").val(),
                        eventDescription: $("input[name=eventDescription]").val(),
                        dealPeople: $("input[name=dealPeople]").val(),
                        dealTime: $("input[name=dealTime]").val(),
                        dealResult: $("input[name=dealResult]").val(),
                        dealPhoto: $("input[name=dealPhoto]").val(),

                    }, function (res) {
                        if (res.success) {
                            alert(res.message);
                            window.location.reload();
                        }
                        else {
                            alert(res.message);
                        }
                    },'json');
                }
            });
            function UploadFileService(path, id, name) {
                var fileName = $("#" + id).val();
                if (fileName == null || fileName == "") {
                    return false;
                }
                $.ajaxFileUpload({
                    url: window.apppath + "/file/uploadFiles?path=" + path + "&createThumbnail=true&thumbnailWidth=60&thumbnailHeight=60",
                    secureuri: false,
                    fileElementId: id,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        if (data.error == 0) {
                            $("#toggleDiv").hide();
                            fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                            var html = "";
                            if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                                html = "<label class='uploadFile' style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none,display: none' data='" + data.url + "' class='remove removeFile'>&times;</a></label>"
                            }
                            else {
                                var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_60_60" + data.url.substr(data.url.lastIndexOf("."))
                                html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                            }
                            $("." + id + "").html(html);
                            $(".remove").click(function () {
                                var url = $(this).attr("data");
                                $(this).parent().remove();
                                var urls = $("#" + name).val();
                                urls = urls.replace(url + ",", "")
                                $("#" + name).val(urls);
                                $("#toggleDiv").show();
                            });
                            $(".uploadImg").hover(function () {
                                $(this).parent().find(".remove").css("display", "inherit");
                            })
                            $(".uploadFile").hover(function () {
                                $(this).parent().find(".remove").css("display", "inherit");
                            })
                            $(".remove").hover(function () {
                            }, function () {
                                $(this).hide();
                            })
                            $("#" + id).val("");
                            $("#" + name).val(path);
                        }
                    }
                });
            }

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

