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
        <title>人员信息登记</title>
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
                    <a href="#">高龄补贴发放管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">人员信息登记</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            添加人员信息
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 所属区域
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="areaName"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 姓名
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="elderName" name="elderName"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font> 身份证号
                                        </td>
                                        <td class="app_list_search_td" colspan="2">
                                            <input type="hidden" value="" id="elderId">
                                            <input type="text" class="form-control" id="idcardno" name="idcardno" value=""
                                                   maxlength="18"/>
                                        </td>
                                        <td class="app_list_search_td">
                                            <button type="button" class="btn blue search">查询</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            性别
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="sexDictId"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            出生日期
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="birthday"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            户籍所在地
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="regPlace"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            现居住地地址
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="realAddress"></div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            联系人姓名
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="linkMan" name="linkMan" value=""
                                                   class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="linkManTel" name="linkManTel" value=""
                                                   class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            与老人关系
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="relationElderly" class="form-control"
                                                    name="relationElderly">
                                                <option value="">--全部--</option>
                                                <option value="0">本人</option>
                                                <option value="1">子女</option>
                                                <option value="2">近亲属</option>
                                                <option value="3">其他</option>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            发放渠道
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="fafangWay" class="form-control"
                                                    name="fafangWay" <%--onchange="onselcallertype()"--%>>
                                                <option value="">--全部--</option>
                                                <option value="0">市民卡</option>
                                                <option value="1">工商银行</option>
                                                <option value="2">农业银行</option>
                                                <option value="3">中国银行</option>
                                                <option value="4">建设银行</option>
                                                <option value="5">交通银行</option>
                                                <option value="6">邮储银行</option>
                                                <option value="7">农商银行</option>
                                                <option value="8">其他</option>
                                                <option value="9">南京银行</option>
                                                <option value="10">紫金农商银行</option>
                                                <option value="11">招商银行</option>
                                                <option value="12">民生银行</option>
                                                <option value="13">中信银行</option>
                                                <option value="14">兴业银行</option>
                                                <option value="15">浦发银行</option>
                                                <option value="16">江苏银行</option>
                                                <option value="17">广发银行</option>
                                                <option value="18">平安银行</option>
                                                <option value="19">华夏银行</option>
                                                <option value="20">光大银行</option>
                                                <option value="21">上海银行</option>
                                                <option value="22">苏州银行</option>
                                                <option value="23">江南农村商业银行</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            申请类别
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="applyType" class="form-control"
                                                    name="applyType" disabled="disabled">
                                                <option value="">--全部--</option>
                                                <option value="0">80-89周岁</option>
                                                <option value="1">90-94周岁</option>
                                                <option value="2">95-99周岁</option>
                                                <option value="3">100周岁以上</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            银行卡号
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="bankCardno" name="bankCardno" value=""
                                                   class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            人员类型
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="elderTypeDictIds"></div>
                                        </td>
                                            <%--<select id="elderTypeDictIds" class="form-control"
                                                    name="elderTypeDictIds" &lt;%&ndash;onchange="onselcallertype()"&ndash;%&gt;>
                                                <option value="0">--全部--</option>
                                                <option value="1">城市三无/农村五保</option>
                                                <option value="2">低保/低保边缘</option>
                                                <option value="3">经济困难的失能/半失能老人</option>
                                                <option value="4">70周岁及以上的计生特扶老人</option>
                                                <option value="5">百岁老人</option>
                                                <option value="9">空巢</option>
                                                <option value="10">独居</option>
                                            </select>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            卡主
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="bankCardOwner" name="bankCardOwner" value="" class="form-control" maxlength="20"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            备注
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="remark" name="remark" value="" class="form-control" maxlength="20"/>
                                        </td>
                                    </tr>
                                </table>
                                <div>注：市民卡号为16位卡号，如果是12位卡号，请在原卡号前加4个0，如：0000997166140026</div>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addGovBuy">保存</button>
                                <button onclick="javascript:history.back(-1)" type="button" class="btn btn-default">返回
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
                    <%--<div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">选择组织</h4>
                    </div>--%>
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
                        result = result.substr(result.lastIndexOf("\\") + 1, result.length - 1)
                    $("#file_path").html(result)
                })

                $("#addGovBuy .select").click(function () {
                    showModel("${zuzhiRoleId}");
                });

                $("#selectArea .add").click(function () {
                    var select = AreaTree.getSelectArea();
                    if (select != -1) {
                        $("#serviceOrgId").val(select);
                        $("#serviceOrgName").val(AreaTree.getSelectAreaName(select))

                        $("#selectArea").modal("hide");
                    }
                });


                $("#addGovBuy .search").click(function () {
                    var idcardno = $("#idcardno").val();
                    if (idcardno != null & idcardno != "") {
                        searchElder2(idcardno);
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

            function  searchElder2(idcardno){
                $.post(window.apppath  + "/admin/api/gold/forGoldInfo/getElderByCardNoForGold", {
                    idcardno: idcardno
                },function(res){
                    console.log(res);
                    if (res!=null){
                        alert("身份证已登记");
                    }else{
                        searchElder(idcardno);
                    }
                }, 'json');
            }
            function searchElder(idcardno) {
                $.post(window.apppath + "/admin/api/gold/forGoldInfo/getElderByCardNo", {
                    idcardno: idcardno
                }, function (res) {
                    console.log(res);
                    if (res != null) {
                        $("#elderId").val(res.id);
                        $("#areaName").html(res.areaName);
                        $("#elderName").html(res.elderName);
                        $("#birthday").html(res.birthday);
                        $("#realAddress").html(res.realAddress);
                        $("#regPlace").html(res.regPlace);
                        if (res.age != null & res.age != "") {
                            var data = res.age;
                            if (80 <= data && data <= 89){
                                $("#applyType").val(0);
                            }else if(data >= 90 && data <= 94){
                                $("#applyType").val(1);
                            }else if(data >= 95 && data <=99){
                                $("#applyType").val(2);
                            }else if(data >= 100){
                                $("#applyType").val(3);
                            }
                        }
                        if (res.sexDictId != null & res.sexDictId != "") {
                            var data = res.sexDictId;
                            var  arr = {
                                "1": "男", "2": "女"
                            };

                            $("#sexDictId").html(arr[data]);
                        }
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
                            $("#elderTypeDictIds").html(scopes);
                        }
                    }
                }, 'json');
            }
            function addGovbuy() {
                    $.post(window.apppath + "/admin/api/gold/forGoldInfo/add", {
                        idcardno: $("input[name=idcardno]").val(),
                        applyType: $("select[name=applyType]").val(),
                        linkMan: $("input[name=linkMan]").val(),
                        linkManTel: $("input[name=linkManTel]").val(),
                        bankCardno: $("input[name=bankCardno]").val(),
                        bankCardOwner: $("input[name=bankCardOwner]").val(),
                        relationElderly: $("select[name=relationElderly]").val(),
                        fafangWay: $("select[name=fafangWay]").val(),
                        remark: $("input[name=remark]").val()
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
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

