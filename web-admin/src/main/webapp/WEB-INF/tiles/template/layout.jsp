<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="zh" style="height: 100%;">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${pageContext.request.contextPath }/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/uniform/css/uniform.default.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <tiles:insertAttribute name="page_css" ignore="true"/>
    <link href="${pageContext.request.contextPath }/assets/global/css/components.css" id="style_components"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/admin/layout/css/layout.css" rel="stylesheet"
          type="text/css"/>
    <link id="style_color" href="${pageContext.request.contextPath }/assets/admin/layout/css/themes/default.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/assets/admin/layout/css/custom.css" rel="stylesheet"
          type="text/css"/>
    <style>
        body {
            font-family: "微软雅黑", sans-serif;
        }

        a, a:hover {
            text-decoration: none;
        }

        .row {
            margin: 0px;
            margin-left: -15px;
            overflow: hidden;
        }

        .dashboard-stat {
            cursor: pointer;
        }

        .page-bar {
            display: none;
        }

        .dataTables_info {
            width: 250px;
            vertical-align: text-bottom;
            text-align: center;
            height: 30px;
        }

        .portlet > .portlet-title > .tools {
            padding: 0px;
        }

        .btn-add {
            background-color: #FF9A13;
            color: white
        }

        .btn-add:hover, .btn-import:hover, .table-group-action-submit:hover, #search:hover, #btnPublish:hover, .btn-black:hover, .table-group-action-reload:hover {
            color: white;
        }

        .btn-import, .table-group-action-submit, #search, #btnPublish {
            background-color: #20ABFF;
            color: white
        }

        .btn-black, .table-group-action-reload {
            background-color: #636363;
            color: white
        }

        .tr-title {
            font-size: 18px;
        }

        #goPage {
            background-color: #20ABFF;
            color: white
        }

        .portlet .table-container .table .heading th {
            text-align: center;
            font-size: 13px;
        }

        .row .col-md-12 .portlet .portlet-title .tools .collapse {
            width: 88px;
            height: 35px
        }

        .row .col-md-12 .portlet .portlet-title .tools .expand {
            width: 88px;
            height: 35px
        }

        .dashboard-stat .details .number {
            padding-top: 17px;
        }

        .dataTable > thead > tr > th, .dataTable > tbody > tr > th, .dataTable > tfoot > tr > th, .dataTable > thead > tr > td, .dataTable > tbody > tr > td, .dataTable > tfoot > tr > td {
            text-align: center;
        }

        .js-alt {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            text-align: center;
            display: none;
            z-index: 999999;
        }

        .js-alt div {
            text-align: center;
            position: absolute;
            top: 25%;
            left: 38%;
            width: 26%;
            overflow: hidden;
            vertical-align: middle;
            background: #fff;
            padding: 15px;
        }

        .js-alt p {
            font-size: 18px;
            text-align: center;
            margin: 20px 0;
        }

        .js-alt a {
            display: inline-block;
            color: #ffffff;
            background: #20ABFF;
            width: 40%;
            margin: 0 auto;
            padding: 10px 0;
            text-decoration: none;
        }

        .js-alt a:hover {
            color: #ffffff;
        }

        .js-alt .cancel {
            background: #b2afb0;
        }

    </style>
</head>
<body style="background-color:#f5f8fb;width:100%;height: 100%">
<input type="hidden" value="${sessionScope.login_user.login_name}" id="login_name">
<tiles:insertAttribute name="page_content"/>
<div id="alertModal" class="js-alt">
    <div>
        <img src="${pageContext.request.contextPath }/assets/admin/pages/img/info.png" alt=""/>
        <p class="alertModalMes">
        </p>
        <a class="btn cancel" style="width: 80%; background: #20ABFF;">确定</a>
    </div>
</div>
<div id="confirmModal" class="js-alt">
    <div>
        <img src="${pageContext.request.contextPath }/assets/admin/pages/img/info.png" alt=""/>
        <p class="confirmModal">
        </p>
        <a class="btn sureBtn sure">确定</a>
        <a class="btn cancel ">取消</a>
    </div>
</div>
</body>
<%--<![endif]-->--%>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-ui/jquery-ui.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.cokie.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>

<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/Global.js?v=1.1"
        type="text/javascript"></script>

<!-- END CORE PLUGINS -->
<script type="text/javascript">
    window.apppath = '${pageContext.request.contextPath }';

    $("body").animate({scrollTop: '0px'}, 200);
    if (!placeholderSupport()) {   // 判断浏览器是否支持 placeholder
        $("input").removeAttr("placeholder");
    }
    ;

    function placeholderSupport() {
        return 'placeholder' in document.createElement('input');
    }

    //一级菜单
    function setSideMenu(activeSide) {
    }
    function setMenu(activeSide) {
    }
    //二级菜单
    function setSideSideMenu(activeSide) {
    }

    function alert(res, callback) {
        window.parent.alert2(res, callback);

    }

    function alert2(res, callback) {
        window.parent.alert2(res, callback)
    }

    function confirm2(res, callback) {
        window.parent.confirm2(res, callback);
    }

    function alertSuccess(title, res, callback) {
        window.parent.alertSuccess(title, res, callback);
    }
    function popIframe(url, width, height, callback) {
        window.parent.popIframe(url, width, height, callback);
    }
    function closePopIframe() {
        window.parent.closePopIframe();
    }

    function confirm(res, callback) {
        $("#confirmModal .confirmModal").html(res);
        $("#confirmModal").fadeIn();
        $("#confirmModal .sureBtn").unbind('click').click(function () {
            $("#confirmModal").fadeOut();
            if (callback != null)
                callback();
        })

        $("#confirmModal .cancel").unbind('click').click(function () {
            $("#confirmModal").fadeOut();
        })
    }
    function UploadFile(path, id, name) {
        var fileName = $("#" + id).val();
        if (fileName == null || fileName == "") {
            return false;
        }
        $.ajaxFileUpload({
            url: window.apppath + "/file/uploadFiles?path=" + path + "&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
            secureuri: false,
            fileElementId: id,//file控件id
            dataType: 'json',
            success: function (data, status) {
                if (data.error == 0) {

                    fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                    var html = "";
                    if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                        html = "<label class='uploadFile' style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none,display: none' data='" + data.url + "' class='remove removeFile'>&times;</a></label>"
                    }
                    else {
                        var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."))
                        html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                    }
                    $("." + id + "").append(html);
                    $(".remove").click(function () {
                        var url = $(this).attr("data");
                        $(this).parent().remove();
                        var urls = $("#" + name).val();
                        urls = urls.replace(url + ",", "")
                        $("#" + name).val(urls);
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
                    $("#" + name).val($("#" + name).val() + data.url + ",");
                }
            }
        });
    }
    function UploadImage(path, id, name) {
        var fileName = $("#" + id).val();
        if (fileName == null || fileName == "") {
            return false;
        }
        if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
            alert("请上传图片");
            $("#" + id).val("");
            return false;
        }
        $.ajaxFileUpload({
            url: window.apppath + "/file/uploadFiles?path=" + path + "&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
            secureuri: false,
            fileElementId: id,//file控件id
            dataType: 'json',
            success: function (data, status) {
                if (data.error == 0) {

                    fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                    var html = "";
                    if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                        html = "<label class='uploadFile' style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none,display: none' data='" + data.url + "' class='remove removeFile'>&times;</a></label>"
                    }
                    else {
                        var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."))
                        html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                    }
                    $("." + id + "").append(html);
                    $(".remove").click(function () {
                        var url = $(this).attr("data");
                        $(this).parent().remove();
                        var urls = $("#" + name).val();
                        urls = urls.replace(url + ",", "")
                        $("#" + name).val(urls);
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
                    $("#" + name).val($("#" + name).val() + data.url + ",");
                }
            }
        });
    }

    function UploadImageSingle(path, id, name,divid) {
        var fileName = $("#" + id).val();
        if (fileName == null || fileName == "") {
            return false;
        }
        if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
            alert("请上传图片");
            $("#" + id).val("");
            return false;
        }
        $.ajaxFileUpload({
            url: window.apppath + "/file/uploadFiles?path=" + path + "&createThumbnail=true&thumbnailWidth=80&thumbnailHeight=80",
            secureuri: false,
            fileElementId: id,//file控件id
            dataType: 'json',
            success: function (data, status) {
                if (data.error == 0) {
                    fileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length - 1);
                    var html = "";
                    if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                        html = "<label class='uploadFile' style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none,display: none' data='" + data.url + "' class='remove removeFile'>&times;</a></label>"
                    }
                    else {
                        var path = data.url.substr(0, data.url.lastIndexOf(".")) + "_80_80" + data.url.substr(data.url.lastIndexOf("."))
                        html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + data.url + "' class=' remove removeImg'></a></div>"
                    }
                    $("#" + divid + "").html(html);
                    $(".remove").click(function () {
                        $(this).parent().remove();
                        $("#" + name).val("");
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
                    $("#" + name).val(data.url);
                }
            }
        });
    }
    function setAttachValue(id) {
        var str = $("input[name=" + id + "]").val();
        if (str != null && str != "") {
            var strs = str.split(",");
            for (var i in strs) {
                var fileName = strs[i];
                if (fileName == null || fileName == "")
                    break;
                var html = "";
                if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                    /*html = "<label style='margin: 0px;    vertical-align: top'><a target='_blank' href='"+window.apppath + fileName+"' >" + fileName + "</a></label>"*/
                    html = "<label style='margin: 0px;    vertical-align: top'><a target='_blank' href='"+window.apppath + fileName+"' >" + ' <img  height="70" width="70" src="${pageContext.request.contextPath }/assets/view/images/timg.png"/>' + "</a></label>"
                }
                else {
                    var path = fileName.substr(0, fileName.lastIndexOf(".")) + "_80_80" + fileName.substr(fileName.lastIndexOf("."))
                    html = "<div class='file-div'><a target='_blank' href='" + window.apppath + fileName + "'><img src='" + window.apppath + path + "'></a></div>"

                }
                $("." + id + "Input").append(html);
            }
        }
    }

    function setAttachValueWithRemove(id) {
        $("." + id + "Input").html("");
        var str = $("input[name=" + id + "]").val();
        if (str != null && str != "") {
            var strs = str.split(",");
            for (var i in strs) {
                var fileName = strs[i];
                if (fileName == null || fileName == "")
                    break;
                var html = "";
                if (!(/\.(jpe?g|gif|png|ico)$/i).test(fileName)) {
                    html = "<label style='margin: 0px;    vertical-align: top'>" + fileName + "<a style='text-decoration: none' data='" + fileName + "' class='remove'>&times;</a></label>"
                }
                else {
                    var path = fileName.substr(0, fileName.lastIndexOf(".")) + "_80_80" + fileName.substr(fileName.lastIndexOf("."))
                    html = "<div class='file-div''><img class='uploadImg' src='" + window.apppath + path + "'><a style='text-decoration: none;display: none' data='" + fileName + "' class=' remove removeImg'></a></div>"
                }
                $("." + id + "Input").append(html);
                $(".remove").click(function () {
                    var url = $(this).attr("data");
                    $(this).parent().remove();
                    var urls = $("input[name=" + id + "]").val();
                    urls = urls.replace(url + ",", "")
                    $("input[name=" + id + "]").val(urls);
                });
                $(".uploadImg").hover(function () {
                    $(this).parent().find(".remove").css("display", "inherit");
                })
                $(".remove").hover(function () {
                }, function () {
                    $(this).hide();
                })
//                $("#" + id).val("");
//                $("input[name=" + id + "]").val($("input[name=" + id + "]").val() + fileName + ",");
            }
        }
    }
    function importExcel(file, url) {
        $("#msg").text("导入中...").addClass("label-danger");
        var excelFile = $("#" + file).val().trim();
        if (excelFile != null && excelFile != "") {
            $.ajaxFileUpload({
                url: window.apppath + url,
                secureuri: false,
                fileElementId: file,//file控件id
                dataType: 'json',
                success: function (data, status) {
                    if (data.data != null && data.data != "") {
                        alert(data.data, function () {
                            window.location.reload();
                        });
                    }
                    else {
                        alert(data.message, function () {
                            window.location.reload();
                        });
                    }
                }
            });
        } else {
            $("#msg").text("请上传文件！").addClass("label-danger");
        }
    }

    function importImageZip(attach, path) {
        $("#msg2").text("导入中...").addClass("label-danger");
        var excelFile = $("#" + attach).val().trim();
        var suffix = excelFile.substr(excelFile.lastIndexOf("."), excelFile.length);
        if (excelFile != null && excelFile != "" && suffix == ".zip") {
            $.ajaxFileUpload({
                url: window.apppath + "/file/importZipImage?path=" + path,
                secureuri: false,
                fileElementId: attach,//file控件id
                dataType: 'json',
                success: function (data, status) {
                    $("#msg2").text(data.message).addClass("label-danger");
                    if (data.success) {
                        alert(data.message, function () {
                            window.location.reload();
                        });
                    }
                }
            });
        } else {
            $("#msg2").text("请上传zip格式的压缩文件！").addClass("label-danger");
        }
    }

    /**
     * 批量删除js
     * @param taleName
     * @returns {boolean}
     */
    function deleteSomeMsg(e, url) {
        var deleteIds = jqchk("deleteId");
        if (deleteIds == "") {
            alert("请选择需要删除的数据");
            return false;
        }
        $(e).confirmation({
            'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
            'onConfirm': function () {
                $(e).button("loading");
                updateArticles(deleteIds, url);
            }
        }).confirmation('toggle');

    }


    function jqchk(name) { //jquery获取复选框值
        var chk_value = "";
        $('input[name="' + name + '"]').each(function () {
            var parentParent = $(this).parent();
            if (parentParent.hasClass("checked"))
                chk_value += ($(this).val()) + ",";
        });
        return chk_value;
    }

    function updateArticles(deleteIds, url) {
        $.post(window.apppath + url, {
            deleteIds: deleteIds
        }, function (res) {
            if (res.success) {
                alert("删除成功", function () {
                    location.reload();
                })
            }
            else {
                alert("删除失败");
            }
        }, 'json');
    }
</script>
<tiles:insertAttribute name="page_script" ignore="true"/>
<tiles:insertAttribute name="page_script_jq" ignore="true"/>
</body>
</html>