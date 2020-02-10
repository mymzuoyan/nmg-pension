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
        <title>添加政府购买老人</title>
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
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">添加政府购买老人</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            添加政府购买老人
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 养老组织
                                        </td>
                                        <c:if test="${ empty sessionScope.login_name.serviceId}">
                                            <td class="app_list_search_td" colspan="2">
                                                <input type="hidden" value="" id="serviceOrgId">
                                                <input type="text" class="form-control" id="serviceOrgName"
                                                       name="serviceOrgName" value=""
                                                />
                                            </td>
                                            <td class="app_list_search_td">
                                                <button type="button" class="btn blue select">选择组织</button>
                                            </td>
                                        </c:if>
                                        <c:if test="${ not empty sessionScope.login_name.serviceId}">
                                            <td class="app_list_search_td" colspan="2">
                                                <input type="hidden" value="${sessionScope.login_name.serviceId}"
                                                       id="serviceOrgId">
                                                <input type="text" class="form-control" id="serviceOrgName"
                                                       name="serviceOrgName"
                                                       value="${sessionScope.login_name.serviceOrgName}"
                                                />
                                            </td>
                                            <td class="app_list_search_td">
                                                <button type="button" class="btn blue select">选择组织</button>
                                            </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 身份证号
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="hidden" value="" id="elderId">
                                            <input type="text" class="form-control" id="elderNo" name="elderNo" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_td">
                                            <button type="button" class="btn blue search">查询</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 所属区域
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="areaNameDiv"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 老人姓名
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="elderName" name="elderName"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="homeTel"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            移动电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="mobile"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            居住地址
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="address"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            人员类别
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="elderType"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            子女状况
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="hasChildren"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            居住状况
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="residence"></div>

                                        </td>
                                        <td class="app_list_search_caption">
                                            补贴金额
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="subsidy" name="subsidy" value=""  class="form-control" maxlength="6"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器类型
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="callertype" class="form-control"
                                                    name="callertype" <%--onchange="onselcallertype()"--%>>
                                                <option value="0">--无--</option>
                                                <option value="1">固定</option>
                                                <option value="2">移动</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器厂商
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="callerlabel"  class="form-control"style='width:auto'>
                                                <option value='0'>--无--</option>
                                                <option value='1'>12349</option>
                                                <option value='2'>安康通</option>
                                                <option value='3'>康惠通</option>
                                                <option value='4'>奥维</option>
                                                <option value='5'>96180</option>
                                                <option value='6'>平安保</option>
                                                <option value='7'>962069</option>
                                                <option value='8'>电信</option>
                                                <option value='9'>移动</option>
                                                <option value='10'>品牌不详</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器安装费
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerinitfee" name="callerinitfee" value=""
                                                   class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器月租费
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callermonthfee" name="callermonthfee" value=""
                                                   class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器号码
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerno" name="callerno" value="" class="form-control" maxlength="20"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            安装状态
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="callerstatus" name="callerstatus" class="form-control">
                                                <option value="0">未安装</option>
                                                <option value="1">已安装</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器服务人员
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerstaff" name="callerstaff" value="" class="form-control"
                                                   maxlength="20"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            服务人员电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="callerstafftel" name="callerstafftel" value="" class="form-control"
                                                   maxlength="20"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            市民卡号
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="cardno" name="cardno" value="" maxlength="16" class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            附件
                                        </td>
                                        <td class="app_list_search_td">
                                            <div class="fileinput fileinput-new"
                                                 data-provides="fileinput">
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new">选择图片 </span>
                                                <input type="file" name="attach" id="attach">
                                            </span>
                                                <span id="file_path"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div>注：市民卡号为16位卡号，如果是12位卡号，请在原卡号前加4个0，如：0000997166140026</div>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addGovBuy">保存</button>
                                <button onclick="history.back(-1)" type="button" class="btn btn-default">返回
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="selectArea" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择组织</h4>
                    </div>
                    <div class="modal-body">
                        <div id="areaTree" class="tree-demo"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn blue add">添加</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
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
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $("input[type=file]").change(function () {
                    var result = $(this).val();
                    if (result != null && result != "")
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1);
                    $("#file_path").html(result)
                });

                $("#addGovBuy .select").click(function () {
                    showModel("${zuzhiRoleId}");
                });

                $("#selectArea .add").click(function () {
                    var select = AreaTree.getSelectArea();
                    if (select != -1) {
                        $("#serviceOrgId").val(select);
                        $("#serviceOrgName").val(AreaTree.getSelectAreaName(select));

                        $("#selectArea").modal("hide");
                    }
                });


                $("#addGovBuy .search").click(function () {
                    var cardNo = $("#elderNo").val();
                    if (cardNo != null & cardNo != "") {
                        searchElder(cardNo);
                    }
                    else
                        alert("请输入身份证号码");
                });
                $(".addGovBuy").click(function () {
                    addGovbuy();
                });
            });

            function showModel(roleId) {
                AreaTree.setSelectServiceOrg(true);
                if (AreaTree.isInit()) {
                    AreaTree.refresh(roleId);
                }
                else {
                    AreaTree.init(roleId);
                }
                $("#selectArea").modal("show");
            }

            function searchElder(cardNo) {
                $.post(window.apppath + "/admin/api/elderly/getElderByCardNo", {
                    cardNo: cardNo
                }, function (res) {
                    console.log(res);
                    if (res != null) {
                        $("#elderId").val(res.id);
                        $("#areaNameDiv").html(res.areaName);
                        $("#elderName").html(res.elderName);
                        $("#homeTel").html(res.homeTel);
                        $("#mobile").html(res.mobile);
                        $("#address").html(res.realAddress);
                        if (res.elderTypeDictIds != null & res.elderTypeDictIds != "") {
                            var data = res.elderTypeDictIds;
                            var  arr = {
                                "1": "城市三无/农村五保", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
                                "5": "百岁老人", "9": "空巢", "10": "独居"
                            };
                            var scopes = '';
                            if (data != "" && data != null) {
                                var scope = data.split(",");
                                for (var i = 0; i < scope.length; i++) {
                                    if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                                        scopes += arr[scope[i]] + ','
                                    }
                                }
                                scopes = scopes.substr(0, (scopes.length - 1));
                            }
                            $("#elderType").html(scopes);
                        }
                        if (res.childrenDictId != null & res.childrenDictId != "") {
                            var data = res.childrenDictId;
                            arr = {"270": "有子女", "271": "未生育子女", "272": "失去独生子女"};
                            $("#hasChildren").html(arr[data]);
                        }
                        if (res.residenceDictId != null & res.residenceDictId != "") {
                            var result = "";
                            if (res.residenceDictId == 280) {
                                result = "独居";
                            } else if (res.residenceDictId == 511) {
                                result = "空巢";
                            } else if (res.residenceDictId == 284) {
                                result = "合居";
                            } else {
                                result = "";
                            }
                            $("#residence").html(result);
                        }
                    }
                }, 'json');
            }
            function addGovbuy() {
                var cardNo = $("#elderNo").val();
                var serviceOrgId=$("#serviceOrgId").val();
                if (serviceOrgId== null || serviceOrgId == "") {
                    alert("请先选择组织");
                    return false;
                }
                if (cardNo != null & cardNo != "") {
                    if ($("#elderId").val() == null || $("#elderId").val() == "") {
                        alert("请先通过身份证号码查询老人");
                        return false;
                    }
                    var file = $("#attach").val();
                    if (file == null || file == "") {
                        addGovInfo("");
                    }
                    else {
                        $.ajaxFileUpload({
                            url: window.apppath + "/file/upload?path=elderGovBuy",
                            secureuri: false,
                            fileElementId: "attach",//file控件id
                            dataType: 'json',
                            success: function (data, status) {
                                console.log(data);
                                if (data.error == 0) {
                                    addGovInfo(data.url)
                                }
                            },
                            error: function (data, status, e) {
                                console.log(e);
                            }
                        });
                    }
                }
                else
                    alert("请输入身份证号码");

                function addGovInfo(attach) {
                    var serviceOrgId=$("#serviceOrgId").val();
                    serviceOrgId=serviceOrgId.replace("serviceOrg","");
                    $.post(window.apppath + "/admin/api/elderly/govbuy/add", {
                        elderId: $("#elderId").val(),
                        serviceOrgId:serviceOrgId,
                        subsidy: $("input[name=subsidy]").val(),
                        callertype: $("#callertype").val(),
                        callerlabel: $("#callerlabel").val(),
                        callerinitfee: $("input[name=callerinitfee]").val(),
                        callermonthfee: $("input[name=callermonthfee]").val(),
                        callerno: $("input[name=callerno]").val(),
                        callerstatus: $("#callerstatus").val(),
                        callerstaff: $("input[name=callerstaff]").val(),
                        callerstafftel: $("input[name=callerstafftel]").val(),
                        cardno: $("input[name=cardno]").val(),
                        attach: attach,
                        status:1
                    }, function (res) {
                        if (res.success) {
                            alert(res.message);
                            window.location.reload();
                        }
                        else {
                            alert(res.message);
                        }
                    }, 'json');
                }
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

