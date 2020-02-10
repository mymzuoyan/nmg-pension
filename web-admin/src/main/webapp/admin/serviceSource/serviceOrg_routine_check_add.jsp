<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>日常检查数据新增</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/css/fileinput.min.css"/>
        <style>

            .file-box {
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #D9D9D9;
                background-image: url("${pageContext.request.contextPath }/assets/admin/pages/img/add.png");
            }

            .file-div {
                width: 80px;
                height: 80px;
                margin-right: 10px;
                display: inline-block;
                position: relative;
                vertical-align: text-bottom;
            }

            .file-div img {
                width: 100%;
                height: 100%;
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

            .file-box-list {
                vertical-align: top;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">


        <!-- /.modal -->
        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <!-- BEGIN PAGE HEADER-->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">机构养老信息管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">日常检查</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">日常检查新增</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
        <div class="col-md-12">
            <!-- Begin: life time stats -->
            <div class="portlet " style="padding-top: 0px !important;">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-equalizer font-purple-plum hide"></i>
                        <span class="caption-subject font-red-sunglo bold uppercase">日常检查信息新增</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <tr class="tabbable-line">
                        <form id="volunteerEditForm" enctype="multipart/form-data" action="" method="post">
                            <table border="1"
                                   class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                                   align="center" style="border-collapse: collapse;">
                                <input type="hidden" id="province" value="0">
                                <input type="hidden" id="city" value="1">
                                <tr>
                                    <td  style="text-align:center;vertical-align: middle" class="col-md-3">
                                        所属区域：<span style="color: red" class="required"> *</span></td>
                                    <td  style="text-align:center;vertical-align: middle">
                                        <select name="area" class="form-control" id="county"
                                                onChange="EographicArea.changeCounty();"
                                        readonly="readonly">
                                            <option value="">行政区，市，县</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="text-align:center;vertical-align: middle" class="col-md-3">
                                        所属街道：<span style="color: red"> *</span></td>
                                    <td  style="text-align:center;vertical-align: middle">
                                        <select name="street" class="form-control" id="town"
                                                onChange="EographicArea.changeTown();"
                                                readonly="readonly">
                                            <option value="">街道，乡，镇</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td  style="text-align:center;vertical-align: middle" class="col-md-3">
                                        所属社区：<span style="color: red"> *</span></td>
                                    <td  style="text-align:center;vertical-align: middle">
                                        <select name="community" class="form-control" id="village"
                                                onChange="EographicArea.changeVillage();"
                                                readonly="readonly">
                                            <option value="0">社区，村</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="text-align:center;vertical-align: middle" class="col-md-3">
                                        所属组织：<span style="color: red"> *</span></td>
                                    <td  style="text-align:center;vertical-align: middle">
                                        <select name="serviceOrg" class="form-control" id="receiverId" name="serviceOrgId"
                                                onChange="EographicArea.changeServiceOrg();"
                                                readonly="readonly">
                                            <option value="0">选择组织</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        检查点位：<span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: center;vertical-align: middle">
                                        <input type="text" class="form-control"
                                               name="unit" id="unit"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        检查时间：<span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: center;vertical-align: middle">
                                        <input type="date" class="form-control"
                                               name="checkTime" id="checkTime"
                                        />
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align: middle" class="col-md-3">
                                        检查人员：<span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: left;vertical-align: middle">
                                        <input type="text" class="form-control"
                                               name="person" id="person"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        检查内容：<span style="color:red"> *</span>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <textarea name="content" id="content" cols="100" rows="4" class="form-control"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        主要问题：<span style="color:red"> *</span>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <textarea name="problem" id="problem" cols="100" rows="4" class="form-control"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        整改意见：<span style="color:red"> *</span>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <textarea name="reformOpinion" id="reformOpinion" cols="100" rows="4" class="form-control"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        整改时间：<span style="color:red"> *</span>
                                    </td>
                                    <td style="text-align: center;vertical-align: middle">
                                        <input type="date" class="form-control" name="reformTime" id="reformTime"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        检查照片:
                                    </td>
                                    <td>
                                        <div class="file-box-list attachInput"
                                             style="display: inline-block;margin: 0px"></div>
                                        <div style="display: inline-block" class="file-box" id="toggleDiv">
                                            <input type="file" name="files" id="attachInput"
                                                   onchange="UploadFileService('serviceOrg/subsidy/apply/attach','attachInput','attach')"
                                                   style="height: 30px">
                                            <input type="hidden" id="attach" name="attach">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;vertical-align: middle" class="col-md-3">
                                        备注：
                                    </td>
                                    <td style="vertical-align: middle">
                                        <textarea name="remark" id="remark" cols="100" rows="4" class="form-control"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <div class="col-md-12">
                                    <div class="col-md-offset-4" style="float:left;">
                                        <button data-loading-text="提交中..."
                                                type="button" class="btn btn-circle green RoutineCheckAdd"
                                                >
                                            保存
                                        </button>
                                        <span id="labelmsg" class="label"></span>
                                    </div>
                                    <div class="col-md-offset-6">
                                        <button onclick="window.parent.closeTab('tab_routine_check_add')"
                                                class="btn btn-circle green"><i
                                                class="fa">返回</i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <!--fileUpload-->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <!--upload-->
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/global/scripts/uploadPreview.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/service_org_detail.js?v=1.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.1"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/lrnlpg/routine_check.js?v=1.0"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                EographicArea.init();
                EographicArea.changeCity();
                //main function to initiate the module

                $(".RoutineCheckAdd").click(function () {
                    var serviceOrgId = $("#receiverId").val();
                    var checkTime = $("input[name=checkTime]").val();
                    var person = $("input[name=person]").val();
                    var unit = $("input[name=unit]").val();
                    var content = $("textarea[name=content]").val();
                    var problem = $("textarea[name=problem]").val();
                    var reformOpinion = $("textarea[name=reformOpinion]").val();
                    var reformTime = $("input[name=reformTime]").val();
                    var attach = $("#attach").val();

                    //校验时间，整改时间不能大于检查时间
                    var check_time = checkTime.split("-");
                    var reform_time = reformTime.split("-");
                    var v1= new Date(check_time[0],check_time[1],check_time[2]);
                    var v2=new Date(reform_time[0],reform_time[1],reform_time[2]);
                    if(v2 <= v1){
                        $("#labelmsg").text('整改时间不能早于检查时间').addClass("label-danger");
                        return;
                    }
                    if(serviceOrgId == null || serviceOrgId == ""){
                        $("#labelmsg").text('请选择所属组织！').addClass('label-danger');
                        return;
                    }
                    if(checkTime=="" || checkTime==null){
                        $("#labelmsg").text('请选择检查时间！').addClass("label-danger");
                        return;
                    }
                    if(person == "" || person == null){
                        $("#labelmsg").text('检查人员不能为空').addClass("label-danger");
                        return;
                    }
                    if(unit == "" || unit == null){
                        $("#labelmsg").text('检查点位不能为空').addClass("label-danger");
                        return;
                    }
                    if(content == "" || content == null){
                        $("#labelmsg").text('检查内容不能为空').addClass("label-danger");
                        return;
                    }
                    if(problem == "" || problem == null){
                        $("#labelmsg").text('检查问题不能为空').addClass("label-danger");
                        return;
                    }
                    if(reformOpinion == "" || reformOpinion == null){
                        $("#labelmsg").text('整改意见不能为空').addClass("label-danger");
                        return;
                    }
                    if(reformTime == "" || reformTime == null){
                        $("#labelmsg").text('整改时间不能为空').addClass("label-danger");
                        return;
                    }
                   /* if(attach == "" || attach == null){
                        $("#labelmsg").text('检查照片不能为空').addClass("label-danger");
                        return;
                    }*/

                    RoutineCheckAdd();
                });


                function RoutineCheckAdd() {
                    $.post(window.apppath + "/admin/serviceOrgRoutineCheck/addRoutineCheck", {
                        checkTime: $("input[name=checkTime]").val(),
                        person: $("input[name=person]").val(),
                        unit: $("input[name=unit]").val() ,
                        content: $("textarea[name=content]").val(),
                        problem: $("textarea[name=problem]").val(),
                        reformOpinion: $("textarea[name=reformOpinion]").val(),
                        reformTime: $("input[name=reformTime]").val(),
                        attach: $("#attach").val(),
                        remark: $("textarea[name=remark]").val(),
                        'serviceOrg.id':$("#receiverId").val()
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