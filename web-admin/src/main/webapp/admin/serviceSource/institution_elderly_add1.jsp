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
        <title>新增入院人员</title>
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
                    <a href="#">机构养老信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">新增入院人员</a>
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
                                            <font color="red">*</font> 身份证号
                                        </td>
                                        <td class="app_list_search_td" colspan="1">
                                            <input type="hidden" value="" id="elderId">
                                            <input type="hidden" value="${orgCode}" id="orgCode1" name="orgCode">
                                            <input type="text" class="form-control" id="idcardno" name="idcardno" value=""
                                                   maxlength="18" style="width: 85%;float: left"/>
                                            <button type="button" class="btn blue search" style="float: right">查询</button>
                                        </td>
                                     <%--   <td class="app_list_search_td">
                                            <button type="button" class="btn blue search">查询</button>
                                        </td>--%>

                                        <td class="app_list_search_caption">
                                            <font color="red">*</font>是否加入运营补贴
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="operatingSubsidies" class="form-control"
                                                    name="operatingSubsidies">
                                                <%--<option value="">--全部--</option>--%>
                                                    <option value="1">是</option>
                                                <option value="0">否</option>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red"></font> 入院编号
                                        </td>
                                        <td class="app_list_search_td" >
                                            <input type="hidden" value="" id="id" name="id">
                                            <input type="text" id="number" name="number" value="" disabled
                                                   class="form-control"/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red"></font> 姓名
                                        </td>
                                        <td class="app_list_search_td" >
                                            <div id="elderName" name="elderName"></div>
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
                                            年龄
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="age"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font>入院时间
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="checkInTime" name="checkInTime" value=""
                                                   class="form-control date-picker" />
                                        </td>
                                        <td class="app_list_search_caption">
                                            <font color="red">*</font>是否包房
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="roomStatus" class="form-control"
                                                    name="roomStatus">
                                             <%--   <option value="">--全部--</option>--%>
                                                <option value="0">否</option>
                                                <option value="1">是</option>
                                            </select>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            失能状况
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="disableStutiation" class="form-control"
                                                    name="disableStutiation">
                                                <option value="">--全部--</option>
                                                <option value="0">失能</option>
                                                <option value="1">半失能</option>

                                            </select>
                                        </td>

                                        <td class="app_list_search_caption">
                                            床位类型
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="bedType" class="form-control"
                                                    name="bedType">
                                                <option value="">--全部--</option>
                                                <option value="0">机构床位</option>
                                                <option value="1">家庭床位</option>
                                                <option value="2">健全</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            入院状态
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="status" class="form-control"
                                                    name="status">
                                                <option value="">--全部--</option>
                                                <%--<option value="0">删除</option>--%>
                                                <option value="1">登记中</option>
                                                <option value="2">待缴费</option>
                                                <option value="3">已住院</option>
                                                <option value="4">外出</option>
                                                <option value="4">待结算</option>
                                                <option value="6">已退住</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            床位信息
                                        </td>
                                        <td class="app_list_search_td">
                                            <input disabled type="text" id="bedInfo" name="bedInfo" value="" placeholder="请选择房间编号查询"
                                                   class="form-control"/>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td class="app_list_search_caption">
                                            房间编号
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" id="roomNum" name="roomNum" placeholder="请输入房间编号按回车键确认选择或按回车键查询所有" value=""
                                                   class="form-control"/>
                                            <table id="fangjianType">
                                                <tr>
                                                    <td>房间编号</td>
                                                    <td>床位编号</td>
                                                    <td>房间状态</td>
                                                </tr>
                                            </table>
                                            <ul id="newInput" style="padding: 0"></ul>
                                        </td>
                                        <td class="app_list_search_caption">
                                            床位编号
                                        </td>
                                        <td class="app_list_search_td">
                                            <input disabled type="text" id="bedNumber" name="bedNumber" value="" placeholder="请选择房间编号查询"
                                                   class="form-control"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addGovBuy baoCun">保存</button>
                                <button onclick="javascript:window.parent.closeTab('institution_elderly_add1')" type="button" class="btn btn-default back">返回
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
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/area_tree.js"></script>
        <script>
            jQuery(document).ready(function () {
                $("#fangjianType").hide();
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format:'yyyy-mm-dd',
                    autoclose: true
                });
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
                    var idCardZ = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/;
                    if (!idCardZ.test(idcardno)) {return alert("请输入合法的身份证号")};
                    var thisDate = new Date();
                    var thisYear=thisDate.getFullYear();
                    if ((thisYear - Number(idcardno.substring(6,10)))<60) {return alert("该身份证不到60周岁，请联系管理员！")}
                    if (idcardno != null & idcardno != "") {
                        searchElder(idcardno);
                    }
                    else
                        alert("请输入身份证号码");
                });
                $(".addGovBuy").click(function () {
                    addGovbuy();
                });
            });
            $('#roomNum').keydown(function(event){
                var roomNum = $("#roomNum").val();
                if(event.keyCode==13){
                    $(".fangJian").remove();
                    $("#fangjianType").show();
                    $.ajax({
                        type:'POST',
                        url:"/admin/serviceOrg/BedRoomManager/findBedNumberByRoomNum",
                        data:{
                            roomNum:roomNum
                        },
                        success:function(data){
                            //$("#message").val(data);
                            console.log(data);
                            if(data==""){
                                alert("没有查询到该房间信息,请重新输入或回车查询所有");
                                $("#bedInfo").val("");
                                $("#bedNumber").val("");
                            }
                            for(var i=0;i<data.length;i=i+3){
                                var newInput = "<tr class='fangJian'><td>"+data[i]+"</td><td>"+data[i+1]+"</td><td>"+data[i+2]+"</td></tr>"
                                $("#fangjianType").append(newInput);
                            }
                            $(document).on('click','.fangJian',function () {
                                $("#roomNum").val($(this).find('td:first-of-type').text());
                                $("#bedNumber").val($(this).find('td:nth-of-type(2)').text());
                                $("#bedInfo").val($(this).find('td:nth-of-type(3)').text());
                                $("#fangjianType").hide();
                            })

                        },
                        dataType:'json',
                    });
                }
            });
            $("#roomNum").change(function () {
                $("#bedInfo").val("");
                $("#bedNumber").val("");
            })
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

            /*function  searchElder2(idcardno){
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
            }*/
            function searchElder(idcardno) {
                $.post(window.apppath + "/admin/api/institution/getElderByCardNo", {
                    idcardno: idcardno
                }, function (res) {
                    console.log(res);
                    if (res != null) {
                        $("#elderId").val(res.id);
                        $("#elderName").html(res.elderName);
                        $("#age").html(res.age);
                        if (res.sexDictId != null & res.sexDictId != "") {
                            var data = res.sexDictId;
                            var  arr = {
                                "1": "男", "2": "女"
                            };

                            $("#sexDictId").html(arr[data]);
                        };
                    }else{
                        $("#elderName").html(null);
                        $("#age").html(null);
                        $("#sexDictId").html(null);
                        alert("该老人非鞍山户籍，请联系管理员！");
                    }
                }, 'json');
            }
            function addGovbuy() {
                        var nu = $("input[name=number]").val();
                        var ckiouttime = $("input[name=checkInTime]").val();
                        var roomStatus = $("select[name=roomStatus]").val();
                        var bedInfo = $("input[name=bedInfo]").val();
                        var operatingSubsidies = $("select[name=operatingSubsidies]").val();
                        var idcardno = $("#idcardno").val();

                         $("#addGovBuy .search").click();

                        if(idcardno=="" || idcardno==null){
                            alert("请输入身份证号查询！！！");
                            return;
                        }
                        if(operatingSubsidies=="" || operatingSubsidies==null){
                            alert("请选择运营补贴！！！");
                            return;
                        }
                        if(nu=="" || nu==null){
                            alert("请填写入院编号！！！");
                            return;
                        }
                        if(ckiouttime=="" || ckiouttime==null){
                            alert("请填写入院时间！！！");
                            return;
                        }
                        if(bedInfo=="" || bedInfo==null ){
                            alert("床位信息不能为空,请选择房间编号查询！！！");
                            return;
                        }
                        if(bedInfo=="使用中"){
                            alert("该床位已使用,请重新选择未使用床位！！");
                            return;
                        }
                        if(roomStatus=="" || roomStatus==null){
                            alert("请选择是否包房！！！");
                            return;
                        }



                    $.post(window.apppath + "/admin/api/institution/elderly/add1", {
                        idcardno:$("input[name=idcardno]").val(),
                        id:$("input[name=id]").val(),
                        number: $("input[name=number]").val(),
                        checkInTime: $("input[name=checkInTime]").val(),
                        bedInfo: $("input[name=bedInfo]").val(),
                        status: $("select[name=status]").val(),
                        disableStutiation: $("select[name=disableStutiation]").val(),
                        bedType: $("select[name=bedType]").val(),
                        bedNumber: $("input[name=bedNumber]").val(),
                        roomStatus: $("select[name=roomStatus]").val(),
                        operatingSubsidies: $("select[name=operatingSubsidies]").val(),
                        roomNum: $("input[name=roomNum]").val(),
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
            var orgCode = $("input[name=orgCode]").val();
            var now = new Date();
            var year = now.getFullYear(); //得到年份
            var month = now.getMonth()+1;//得到月份
            var date = now.getDate();//得到日期
            var hour = now.getHours();//得到小时
            var minu = now.getMinutes();//得到分钟
            var sec = now.getSeconds();//得到秒
            if (month < 10) month = "0" + month;
            if (date < 10) date = "0" + date;
            if (hour < 10) hour = "0" + hour;
            if (minu < 10) minu = "0" + minu;
            if (sec < 10) sec = "0" + sec;
            timeNow = year + "" + month + "" + date + "" + hour + "" + minu + "" + sec;
            $("#number").val(orgCode+timeNow);

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

