
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shoir" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>房间信息详情</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
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
                    <a href="#">房间信息详情更新</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject font-red-sunglo bold uppercase">房间信息详情</span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addGovBuy">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">

                                    <tr>
                                        <td width="15%">
                                            <font color="red">*</font> 房间编号:<font color="red">(必填)</font>
                                        </td>
                                        <td width="35%">
                                            <span id="show" name="show" style="float: left;line-height: 30px;margin-left: 5px"></span>
                                            <input name="roomNum" type="text" class="form-control" value="${m.roomNum}" style="line-height: 10px;width: 90%;float: left;display: inline;margin-left: 15px">
                                            <input class="form-control" id="id" name="id" value="${m.id}" type="hidden" />
                                            <input class="form-control" id="floorId" name="floorId" value="${m.floorId}" type="hidden" />
                                        </td>
                                        <td width="15%">
                                            <font color="red">*</font> 房间类型:<font color="red">(必填)</font>
                                        </td>
                                        <td width="40%">
                                            <select id="roomType" class="form-control"
                                                    name="roomType">
                                                <option value="" >--请选择--</option>
                                                <option value="1" <c:if test="${m.roomType==1}">selected</c:if>>自理老人房间</option>
                                                <option value="2" <c:if test="${m.roomType==2}">selected</c:if>>半自理完全不能自理老人房间</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="15%">
                                            <font color="red">*</font> 房间面积(㎡):<font color="red">(必填)</font>
                                        </td>
                                        <td width="30%">
                                            <input name="roomArea" type="text" class="form-control"
                                                   value="${m.roomArea}">
                                        </td>
                                        <td width="15%">
                                            <font color="red">*</font> 朝向:<font color="red">(必填)</font>
                                        </td>
                                        <td width="40%">
                                            <select id="orientation" class="form-control"
                                                    name="orientation">
                                                <option value="" >--请选择--</option>
                                                <option value="1" <c:if test="${m.orientation==1}">selected</c:if>>朝东</option>
                                                <option value="2" <c:if test="${m.orientation==2}">selected</c:if>>朝南</option>
                                                <option value="3" <c:if test="${m.orientation==3}">selected</c:if>>朝西</option>
                                                <option value="4" <c:if test="${m.orientation==4}">selected</c:if>>朝北</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="1" style="text-align:left;vertical-align:middle;">辅助用房设施</td>
                                        <td colspan="5">
                                            <div class="checkbox-list">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="auxiliaryFacilities"
                                                           value="1"/>卫生间</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="auxiliaryFacilities"
                                                           value="2"/>厨房</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="auxiliaryFacilities"
                                                           value="3"/>客厅</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="auxiliaryFacilities"
                                                           value="4"/>阳台</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1">
                                            其他辅助设施
                                        </td>
                                        <td colspan="5">
                                            <input name="elseAuxiliaryFacilities" type="text" class="form-control"
                                                   value="${m.elseAuxiliaryFacilities}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="text-align:left;vertical-align:middle;">房间设备</td>
                                        <td colspan="5">
                                            <div class="checkbox-list">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="1"/>呼叫器</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="2"/>床头灯</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="3"/>电视机</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="4"/>电风扇</label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="5"/>暖气</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="6"/>空调</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="7"/>电冰箱</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="8"/>电话</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="9"/>洗衣机</label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="10"/>电脑</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="11"/>网络</label>
                                                <label class="checkbox-inline" style="padding-left: 0px">
                                                    <input type="checkbox" name="roomEquipment"
                                                           value="12"/>其他</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1">
                                            备注
                                        </td>
                                        <td colspan="5">
                                            <input name="remark" type="text" class="form-control"
                                                   value="${m.remark}">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <shior:hasPermission name="health-records-update">
                                <button id="update"  style="" type="button" class="btn blue update">修改</button>
                                </shior:hasPermission>
                                <button type="button" class="btn blue healthRecordsAdd" disabled>保存</button>
                                <span id="labelmsg" class="label"></span>
                                <button onclick="window.parent.closeTab('tab_health_recordsAdd_detail')" class="btn btn-default">返回
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
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
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
                $("input,select").attr("disabled","true");
                var boxObj = $("input:checkbox[name='auxiliaryFacilities']");  //获取所有的复选框
                var expresslist = "${m.auxiliaryFacilities}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
                var express = expresslist.split(','); //去掉它们之间的分割符“，”
                for(i=0;i<boxObj.length;i++){
                    for(j=0;j<express.length;j++){
                        if(boxObj[i].value == express[j])  //如果值与修改前的值相等
                        {
                            boxObj[i].checked= true;
                            break;
                        }
                    }
                }
                var boxObj2 = $("input:checkbox[name='roomEquipment']");  //获取所有的复选框
                var expresslist2 = "${m.roomEquipment}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
                var express2 = expresslist2.split(','); //去掉它们之间的分割符“，”
                for(i=0;i<boxObj2.length;i++){
                    for(j=0;j<express2.length;j++){
                        if(boxObj2[i].value == express2[j])  //如果值与修改前的值相等
                        {
                            boxObj2[i].checked= true;
                            break;
                        }
                    }
                }

                Metronic.init();
                Layout.init();
                var roomNumber;



                var roomIds = $("input[name=id]").val();
                $.ajax({
                    type:'POST',
                    url:"/admin/serviceOrg/BedRoomManager/findNumByIds?roomIds = " + roomIds,
                    data:{
                        roomIds: roomIds,
                    },
                    success:function (data) {
                        $("#show").html(data);
                        roomNumber=data;
                    },
                    dataType:'json',
                });



                $("#update").click(function () {
                    $("input").removeAttr("disabled");
                    $("select").removeAttr("disabled");
                 /*   $(this).hide();*/
                    $("#update").hide();
                    $(".healthRecordsAdd").removeAttr("disabled");
                });

                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    format: 'yyyy-mm-dd',
                    autoclose: true
                });
                var auxiliaryFacilities = "";
                var roomEquipment = "";
                $(".healthRecordsAdd").click(function () {
                    var roomNum = roomNumber+$("input[name=roomNum]").val();
                    var roomType = $("select[name=roomType]").val();
                    var roomArea = $("input[name=roomArea]").val();
                    var orientation = $("select[name=orientation]").val();
                    var elseAuxiliaryFacilities = $("input[name=elseAuxiliaryFacilities]").val();
                    var remark = $("input[name=remark]").val();
                    var id = document.getElementsByName('auxiliaryFacilities');
                    var id2 = document.getElementsByName('roomEquipment');

                    for(var i = 0; i < id.length; i++){
                        if(id[i].checked)
                            auxiliaryFacilities+=id[i].value+",";
                    }
                    if(auxiliaryFacilities.length>0){
                        auxiliaryFacilities=auxiliaryFacilities.substring(0,auxiliaryFacilities.length-1);
                    }

                    for(var i = 0; i < id2.length; i++){
                        if(id2[i].checked)
                            roomEquipment+=id2[i].value+",";
                    }
                    if(roomEquipment.length>0){
                        roomEquipment=roomEquipment.substring(0,roomEquipment.length-1);
                    }


                    if(roomNum=="" || roomNum==null){
                        $("#labelmsg").text('房间编号不能空,且只能数字和字母！').addClass("label-danger");
                        return;
                    }else if(roomNum!="" || roomNum!=null){
                        if(/[^0-9a-zA-Z]/gi.test(roomNum)){
                         /*   alert("楼层编号只能为数字或字母");
                            return false;*/
                            $("#labelmsg").text('房间编号只能为数字和字母！').addClass("label-danger");
                            return;
                        }

                    }else if(roomType=="" || roomType==null){
                        $("#labelmsg").text('房间类型不能为空！').addClass("label-danger");
                        return;
                    }else if(roomArea=="" || roomArea==null){
                        $("#labelmsg").text('房间面积不能为空！').addClass("label-danger");
                        return;
                    }else if(orientation=="" || orientation==null){
                        $("#labelmsg").text('朝向不能为空！').addClass("label-danger");
                        return;
                    }
                    healthRecordsAdd();
                });

                function healthRecordsAdd() {
                    $.post(window.apppath + "/admin/serviceOrg/BedRoomManager/updateRoom", {

                         roomNum :roomNumber+ $("input[name=roomNum]").val(),
                         roomType : $("select[name=roomType]").val(),
                        roomArea : $("input[name=roomArea]").val(),
                        orientation : $("select[name=orientation]").val(),
                        elseAuxiliaryFacilities : $("input[name=elseAuxiliaryFacilities]").val(),
                        remark : $("input[name=remark]").val(),
                        id: $("input[name=id]").val(),
                        floorId: $("input[name=floorId]").val(),
                        auxiliaryFacilities:auxiliaryFacilities,
                        roomEquipment:roomEquipment,

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


        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

