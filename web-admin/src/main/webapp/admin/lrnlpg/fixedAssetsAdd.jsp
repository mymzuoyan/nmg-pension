<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>居家固定资产新增</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            .remove {
                color: red;
                font-size: 17px;
                cursor: pointer;
                text-decoration: none;
            }

            .removeImg {
                z-index: 2;
                width: 10px;
                height: 10px;
                position: absolute;
                right: 0px;
                background-image: url("${pageContext.request.contextPath }/assets/global/img/delete.png");
                background-position: 50% 50%;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">

        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">服务资源管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">居家固定资产新增</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">居家固定资产新增</span>
                        </div>
                        <div class="tools">
                            <shiro:hasPermission name="timeBank-addVolunteer-update">
                                <c:choose>
                                    <c:when test="${method=='edit'}">
                                        <div style="float: right;margin-right: 15px;margin-top: 5px;margin-bottom: 5px;">
                                            <div style="width:80px;float:left;display: block;padding-right: 10px;">
                                                <a class="btn btn-circle green"
                                                   onclick="VolunteerDetail.allowEdit()"><i
                                                        class="fa">修改</i></a>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </shiro:hasPermission>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="tab-content form">
                                    <div class="form-horizontal form-bordered">
                                        <form id="volunteerAddForm">
                                            <input type="hidden" id="province" value="0">
                                            <input type="hidden" id="city" value="1">
                                            <div class="form-body">
                                                <div class="form-group">
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属区域: </label>
                                                    <div class="col-md-4">
                                                        <select name="area" class="form-control" id="county"
                                                                onChange="EographicArea.changeCounty();"
                                                                readonly="readonly">
                                                            <option value="">行政区，市，县</option>
                                                        </select>
                                                    </div>
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属街道: </label>
                                                    <div class="col-md-4">
                                                        <select name="street" class="form-control" id="town"
                                                                onChange="EographicArea.changeTown();"
                                                                readonly="readonly">
                                                            <option value="">街道，乡，镇</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属社区: </label>
                                                    <div class="col-md-4">
                                                        <select name="community" class="form-control" id="village"
                                                                onChange="EographicArea.changeVillage();"

                                                                readonly="readonly">
                                                            <option value="0">社区，村</option>
                                                        </select>
                                                    </div>
                                                    <label class="control-label col-md-2"><span
                                                            class="required">*</span>所属组织: </label>
                                                    <div class="col-md-4">
                                                        <select name="serviceOrg" class="form-control" id="receiverId"
                                                                onChange="EographicArea.changeServiceOrg();"
                                                                readonly="readonly">
                                                            <option value="0">选择组织</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label"><span
                                                            class="required">*</span>资产分类 </label>
                                                    <div class="col-md-4">
                                                        <select style="width:100%;height: 38px" name="classification" id="classification" class="form-control">
                                                            <option value="">--请选择--</option>
                                                            <option value='文体娱乐设施'>文体娱乐设施</option>
                                                            <option value='医疗保健设施'>医疗保健设施</option>
                                                            <option value='呼叫设施'>呼叫设施</option>
                                                            <option value='监控设施'>监控设施</option>
                                                            <option value='无障碍设施'>无障碍设施</option>
                                                            <option value='餐饮设施'>餐饮设施</option>
                                                            <option value='助浴设施'>助浴设施</option>
                                                            <option value='家具家电'>家具家电</option>
                                                            <option value='消毒设施'>消毒设施</option>
                                                            <option value='电梯设施'>电梯设施</option>
                                                            <option value='水暖设施'>水暖设施</option>
                                                            <option value='供电设施'>供电设施</option>
                                                            <option value='办公设施'>办公设施</option>
                                                            <option value='消防设施'>消防设施</option>
                                                            <option value='其他'>其他</option>
                                                        </select>
                                                    </div>
                                                    <label class="col-md-2 control-label">名称 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" id="name" name="name" placeholder="请输入名称"
                                                               style="width: 100%">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">单位 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" id="unit" name="unit" placeholder="请输入单位"
                                                               style="width: 100%">
                                                    </div>
                                                    <label class="col-md-2 control-label">数量 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" id="count" name="count" placeholder="请输入数量"
                                                               style="width: 100%">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">型号 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" id="model" name="model" placeholder="请输入型号"
                                                               style="width: 100%">
                                                    </div>
                                                    <label class="col-md-2 control-label">金额 </label>
                                                    <div class="col-md-4">
                                                        <input class="form-control" id="money" name="money" placeholder="请输入金额"
                                                               style="width: 100%">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">实物图片 </label>
                                                    <div class="col-md-4">
                                                        <div class="file-box-list attachInput"
                                                             style="display: inline-block;margin: 0px"></div>
                                                        <div style="display: inline-block" class="file-box" id="toggleDiv">
                                                            <input type="file" name="files" id="attachInput"
                                                                   onchange="UploadFileService('serviceOrg/subsidy/apply/attach','attachInput','foodPicture')"
                                                                   style="height: 30px">
                                                            <input type="hidden" id="foodPicture" name="foodPicture">
                                                        </div>
                                                    </div>
                                                    <label class="col-md-2 control-label">发票图片 </label>
                                                    <div class="col-md-4">
                                                        <div class="file-box-list attachInput2"
                                                             style="display: inline-block;margin: 0px"></div>
                                                        <div style="display: inline-block" class="file-box" id="toggleDiv2">
                                                            <input type="file" name="files" id="attachInput2"
                                                                   onchange="UploadFileService('serviceOrg/subsidy/apply/attach','attachInput2','invoice')"
                                                                   style="height: 30px">
                                                            <input type="hidden" id="invoice" name="invoice">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">备注 </label>
                                                    <div class="col-md-10">
                                                        <input class="form-control" id="remarks" name="remarks" placeholder="请输入备注"
                                                               style="width: 100%">
                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <div class="row">
                                                        <div class="col-md-offset-6" >
                                                            <button data-loading-text="提交中..."
                                                                    type="button" class="btn btn-circle green"
                                                                    onclick="FixedAssetsAdd.submitAdd()">
                                                                提交
                                                            </button>
                                                            <span id="labelmsg" class="label"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.1"></script>

        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/fixedAssets_add.js?v=1.3"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                EographicArea.init();
                EographicArea.changeCity();
                FixedAssetsAdd.init();
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


