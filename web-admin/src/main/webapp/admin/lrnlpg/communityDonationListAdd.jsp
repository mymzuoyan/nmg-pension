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
        <title>社会捐赠信息新增</title>
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
                    <a href="#">社会捐赠信息新增</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                             <span class="caption-subject font-red-sunglo bold uppercase">
                            添加社会捐赠信息
                             </span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                   <%-- <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动名称
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="donorPic" name="donorPic" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动描述
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="organizationName" name="organizationName" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动负责人
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="activityLeader" name="activityLeader" value=""
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动开始时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="beginTime" name="beginTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 活动结束时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="endTime" name="endTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                    </tr>--%>
                                       <tr>
                                           <td class="app_list_search_caption">
                                               <font color="red">*</font> 组织名称
                                           </td>
                                           <td class="app_list_search_td" colspan="3">
                                               <input type="text" class="form-control" id="organizationName" name="organizationName" value="${sessionScope.login_user.serviceOrgName}"
                                                      maxlength="18" disabled/>
                                           </td>
                                       </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 捐赠金额（或物品折合价值）
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="money" name="money" value="" placeholder="请输入捐赠金额"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 捐赠对象
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="remarks" name="remarks" value="" placeholder="请输入捐赠对象"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 捐赠人
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="donorName" name="donorName" value="" placeholder="请输入捐赠人"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 地址
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="address" name="address" value="" placeholder="请输入地址"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 城市
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="city" name="city" value="" placeholder="请输入城市"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 省/自治区
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="provinceBurg" name="provinceBurg" value="" placeholder="请输入省/自治区"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 捐赠人联系方式
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="请输入捐赠人联系方式"
                                                   maxlength="18"/>
                                        </td>
                                    </tr>
                                       <tr>
                                           <td colspan="1" style="text-align:left;vertical-align:middle;"><font color="red">*</font>捐赠类型（资金、物品）</td>
                                           <td colspan="2" style="text-align:center;vertical-align:middle;">
                                               <select style="width:100%;height: 38px" name="donorType" id="donorType" class="form-control">
                                                   <option value="">--请选择--</option>
                                                   <option value="1">资金</option>
                                                   <option value="2">物品</option>
                                               </select>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td colspan="1" style="text-align: left;vertical-align: middle;width: 9%">
                                               <span style="color:red"> *</span> 捐赠人照片
                                           </td>
                                           <td colspan="3" style="text-align: left;vertical-align: middle;width: 24%">
                                               <div class="file-box-list attachInput"
                                                    style="display: inline-block;margin: 0px"></div>
                                               <div style="display: inline-block" class="file-box" id="toggleDiv">
                                                   <input type="file" name="files" id="attachInput"
                                                          onchange="UploadFileService('serviceOrg/subsidy/apply/attach','attachInput','donorPic')"
                                                          style="height: 30px">
                                                   <input type="hidden" id="donorPic" name="donorPic">
                                               </div>
                                           </td>
                                       </tr>

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
                var donorPic = $.trim($("input[name=donorPic]").val());
                $(".addHappy").click(function () {
                    var donorPic = $("input[name=donorPic]").val();
                    var organizationName = $("input[name=organizationName]").val();
                    var activityLeader = $("input[name=activityLeader]").val();
                    var beginTime = $("input[name=beginTime]").val();
                    var endTime = $("input[name=endTime]").val();
                    var money = $("input[name=money]").val();
                    var remarks = $("input[name=remarks]").val();
                    var donorName = $("input[name=donorName]").val();
                    var address = $("input[name=address]").val();
                    var city = $("input[name=city]").val();
                    var provinceBurg = $("input[name=provinceBurg]").val();
                    var phone = $("input[name=phone]").val();
                    var donorType = $("select[name=donorType]").val();
                   /* alert(donorType);*/



                   /* if(donorPic=="" || donorPic==null){
                        $("#labelmsg").text('活动名称不能为空！').addClass("label-danger");
                        return;
                    }else if(organizationName=="" || organizationName==null){
                        $("#labelmsg").text('活动描述不能为空！').addClass("label-danger");
                        return;
                    }else if(activityLeader=="" || activityLeader==null){
                        $("#labelmsg").text('活动负责人不能为空！').addClass("label-danger");
                        return;
                    }else if(beginTime=="" || beginTime==null){
                        $("#labelmsg").text('活动开始时间不能为空！').addClass("label-danger");
                        return;
                    }else if(endTime=="" || endTime==null){
                        $("#labelmsg").text('活动结束时间不能为空！').addClass("label-danger");
                        return;
                    }else */

                    if(organizationName=="" || organizationName==null){
                        $("#labelmsg").text('组织名称不能为空！').addClass("label-danger");
                        return;
                    }else if(money=="" || money==null){
                        $("#labelmsg").text('捐赠金额（或物品折合价值）不能为空！').addClass("label-danger");
                        return;
                    }else if(remarks=="" || remarks==null){
                        $("#labelmsg").text('捐赠对象不能为空！').addClass("label-danger");
                        return;
                    }else if(donorName=="" || donorName==null){
                        $("#labelmsg").text('捐赠人姓名不能为空！').addClass("label-danger");
                        return;
                    }else if(address=="" || address==null){
                        $("#labelmsg").text('地址不能为空！').addClass("label-danger");
                        return;
                    }else if(city=="" || city==null){
                        $("#labelmsg").text('城市不能为空！').addClass("label-danger");
                        return;
                    }else if(provinceBurg=="" || provinceBurg==null){
                        $("#labelmsg").text('省/自治区不能为空！').addClass("label-danger");
                        return;
                    }else if(phone=="" || phone==null){
                        $("#labelmsg").text('捐赠人联系方式不能为空！').addClass("label-danger");
                        return;
                    }else if(donorType=="" || donorType==null){
                        $("#labelmsg").text('捐赠类型（资金、物品）不能为空！').addClass("label-danger");
                        return;
                    }else if(donorPic=="" || donorPic==null){
                        $("#labelmsg").text('请上传捐款人照片！').addClass("label-danger");
                        return;
                    }
                    addHappy();

                });

                function addHappy() {
                    var donorPic = $.trim($("input[name=donorPic]").val());
                    $.post(window.apppath + "/admin/api/elderly/govbuy/addCommunityDonation", {
                        donorPic: $("input[name=donorPic]").val(),
                        organizationName: $("input[name=organizationName]").val(),
                        activityLeader: $("input[name=activityLeader]").val(),
                        beginTime: $("#beginTime").val(),
                        endTime: $("#endTime").val(),
                        money: $("input[name=money]").val(),
                        remarks: $("input[name=remarks]").val(),
                        donorName: $("input[name=donorName]").val(),
                        address: $("input[name=address]").val(),
                        city: $("input[name=city]").val(),
                        provinceBurg: $("input[name=provinceBurg]").val(),
                        phone: $("input[name=phone]").val(),
                        donorType: $("select[name=donorType]").val(),

                        donorPic: donorPic,


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

