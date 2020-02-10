<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>房间床位信息管理</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            #selectIcon img {
                width: 30px;
                height: 30px;
                margin: 2.5px;
                padding: 2.5px;
            }

            #selectIcon img:hover {
                background-color: #ccc;
                cursor: pointer;
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
                    <a href="#">居家养老信息管理</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">房间床位信息管理</a>
                </li>
            </ul>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">房间床位信息管理</span>
                        </div>
                    </div>
                    <div class="tabbable-line">
                        <ul class="nav nav-tabs ">
                            <li  id="active1">
                                <a id="tab_info1" href="#tab_info" data-toggle="tab">
                                    楼院信息 </a>
                            </li>
                            <li id="active2">
                                <a id="tab_kuozhan1" href="#tab_kuozhan" data-toggle="tab">
                                    楼层信息 </a>
                            </li>
                            <li id="active3">
                                <a id="tab_health1" href="#tab_health" data-toggle="tab">
                                    房间信息 </a>
                            </li>
                            <li id="active4">
                                <a id="tab_assess1" href="#tab_assess" data-toggle="tab">
                                    床位信息 </a>
                            </li>
                        </ul>
                    </div>
                    <div class="portlet-title" id="tab_1_1">
                        <div class="tools">
                            <%--<shior:hasPermission name="health-records-add">--%>
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add" onclick="BedRoomList.showAddModal()"><i
                                            class="fa">楼院信息登记</i></a>
                                </div>
                            <%--</shior:hasPermission>--%>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-title" id="tab_1_2">
                        <div class="tools">
                            <%--<shior:hasPermission name="health-records-add">--%>
                                    <div style="float: left">
                                        <a class="btn btn-circle btn-add" onclick="FloorList.showAddModal()"><i
                                                class="fa">楼层信息登记</i></a>
                                    </div>
                            <%--</shior:hasPermission>--%>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-title" id="tab_1_3">
                        <div class="tools">
                            <%--<shior:hasPermission name="health-records-add">--%>
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add" onclick="RoomList.showAddModal()"><i
                                            class="fa">房间信息登记</i></a>
                                </div>
                            <%--</shior:hasPermission>--%>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-title" id="tab_1_4">
                        <div class="tools">
                            <%--<shior:hasPermission name="health-records-add">--%>
                                <div style="float: left">
                                    <a class="btn btn-circle btn-add" onclick="BedsList.showAddModal()"><i
                                            class="fa">床位信息登记</i></a>
                                </div>
                            <%--</shior:hasPermission>--%>
                            <a href="" class="collapse"></a>
                        </div>
                    </div>
                    <div id="tab_1">
                        <div class="portlet-body" style="padding-top: 0px !important;display: block">
                            <form id="serviceOrg-form" name="serviceOrg-form">
                                <table class="table table-bordered table-hover table-condensed table-responsive">
                                    <tr>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            楼院编号
                                        </td>
                                        <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="towerCourtyardNum" placeholder="请输入楼院编号"
                                                   style="width: 100%">
                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="right" style="text-align: right">
                                <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                                <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                        class="fa">重置</i></a>
                            </div>
                        </div>
                        <div class="portlet">
                            <div class="portlet-body">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_bill_List">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="6%">
                                                选择
                                            </th>
                                            <th width="6%">
                                                楼院编号
                                            </th>
                                            <th width="3%">
                                                楼层数
                                            </th>
                                            <th width="3%">
                                                房间数
                                            </th>
                                            <th width="3%">
                                                床位数
                                            </th>
                                            <th width="20%">
                                                备注
                                            </th>
                                            <th width="5%">
                                                操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="table-actions-check-wrapper">
                                        <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                                 class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                                 maxlenght="5"
                                                                                 style="text-align:center; margin: 0 5px;">
                                            <button
                                                    href="" id="goPage" class="btn btn-sm default "
                                                    onclick="BedRoomList.goToPage()" title="GO">GO
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab_2">
                        <div class="portlet-body" style="padding-top: 0px !important;display: block">
                            <form id="serviceOrg-form2" name="serviceOrg-form2">
                                <table class="table table-bordered table-hover table-condensed table-responsive">
                                    <tr>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            楼层编号
                                        </td>
                                        <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="floorNumber" placeholder="请输入楼层编号"
                                                   style="width: 100%">
                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="right" style="text-align: right">
                                <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                                <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                        class="fa">重置</i></a>
                            </div>
                        </div>
                        <div class="portlet">
                            <div class="portlet-body">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_bill_List2">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="6%">
                                                选择
                                            </th>
                                            <th width="6%">
                                                楼层编号
                                            </th>
                                            <th width="3%">
                                                房间数
                                            </th>
                                            <th width="3%">
                                                床位数
                                            </th>
                                            <th width="20%">
                                                备注
                                            </th>
                                            <th width="5%">
                                                操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="table-actions-check-wrapper">
                                        <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                                 class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                                 maxlenght="5"
                                                                                 style="text-align:center; margin: 0 5px;">
                                            <button
                                                    href="" id="goPage" class="btn btn-sm default "
                                                    onclick="FloorList.goToPage()" title="GO">GO
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab_3">
                        <div class="portlet-body" style="padding-top: 0px !important;display: block">
                            <form id="serviceOrg-form3" name="serviceOrg-form3">
                                <table class="table table-bordered table-hover table-condensed table-responsive">
                                    <tr>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            房间号
                                        </td>
                                        <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="roomNum" placeholder="请输入房间号"
                                                   style="width: 100%">
                                        </td>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            朝&nbsp;&nbsp;向
                                        </td>
                                        <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <select   name="orientation"
                                                      class="form-control">
                                                <option value=''>-全部-</option>
                                                <option value='1'>朝东</option>
                                                <option value='2'>朝南</option>
                                                <option value='3'>朝西</option>
                                                <option value='4'>朝北</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            房间类型
                                        </td>
                                        <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <select   name="roomType"
                                                      class="form-control">
                                                <option value=''>-全部-</option>
                                                <option value='1'>自理老人房间</option>
                                                <option value='2'>半自理完全不能自理老人房间</option>
                                            </select>
                                        </td>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            房间状态
                                        </td>
                                        <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <select   name="roomStatus"
                                                      class="form-control">
                                                <option value=''>-全部-</option>
                                                <option value='1'>已使用</option>
                                                <option value='2'>空闲</option>
                                                <option value='3'>包房</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="right" style="text-align: right">
                                <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                                <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                        class="fa">重置</i></a>
                            </div>
                        </div>
                        <div class="portlet">
                            <div class="portlet-body">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_bill_List3">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="4%">
                                                选择
                                            </th>
                                            <th width="4%">
                                                房间号
                                            </th>
                                            <th width="3%">
                                                朝向
                                            </th>
                                            <th width="3%">
                                                房间类型
                                            </th>
                                            <th width="3%">
                                                房间状态
                                            </th>
                                            <th width="3%">
                                                床位数
                                            </th>
                                            <th width="3%">
                                                房间面积
                                            </th>
                                            <th width="5%">
                                                操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="table-actions-check-wrapper">
                                        <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                                 class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                                 maxlenght="5"
                                                                                 style="text-align:center; margin: 0 5px;">
                                            <button
                                                    href="" id="goPage" class="btn btn-sm default "
                                                    onclick="RoomList.goToPage()" title="GO">GO
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab_4">
                        <div class="portlet-body" style="padding-top: 0px !important;display: block">
                            <form id="serviceOrg-form4" name="serviceOrg-form4">
                                <table class="table table-bordered table-hover table-condensed table-responsive">
                                    <tr>
                                        <td style="width:10%;text-align:center;vertical-align:middle;">
                                            床位编号
                                        </td>
                                        <td style="width:20%;text-align:center;vertical-align:middle;">
                                            <input class="form-control" name="bedNumber" placeholder="请输入床位编号"
                                                   style="width: 100%">
                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="right" style="text-align: right">
                                <a class="table-group-action-submit btn btn-circle btn-import"><i class="fa">查询</i></a>
                                <a class="reload table-group-action-reload btn btn-circle btn-black"><i
                                        class="fa">重置</i></a>
                            </div>
                        </div>
                        <div class="portlet">
                            <div class="portlet-body">
                                <div class="table-container">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="datatable_bill_List4">
                                        <thead>
                                        <tr role="row" class="heading">
                                            <th width="6%">
                                                选择
                                            </th>
                                            <th width="6%">
                                                床位编号
                                            </th>
                                            <th width="6%">
                                                床位状态
                                            </th>
                                            <th width="20%">
                                                备注
                                            </th>
                                            <th width="5%">
                                                操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="table-actions-check-wrapper">
                                        <div class="pagination-panel"> 页数 <input type="text" id="page"
                                                                                 class="pagination-panel-input form-control input-mini input-inline input-sm"
                                                                                 maxlenght="5"
                                                                                 style="text-align:center; margin: 0 5px;">
                                            <button
                                                    href="" id="goPage" class="btn btn-sm default "
                                                    onclick="BedsList.goToPage()" title="GO">GO
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 导入模态框（Modal）楼院信息新增登记 -->
        <div class="modal fade" id="addModal1" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="addModalLabel">楼院信息登记</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addForm1">
                            <table class="table table-striped table-bordered table-cover" id="addPriceTable1">
                                <tr>
                                    <td width="15%">
                                        <font color="red">*</font> 楼院编号:<font color="red">(必填)</font>
                                    </td>
                                    <td width="35%">
                                        <input name="towerCourtyardNum" type="text" class="form-control"
                                               value="" style="width: 100%;float: left"><span style="float: left;margin-top: 10px"></span>
                                        <input type="hidden" value="${serviceOrgId}" id="serviceOrgId" name="serviceOrgId">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        备注:
                                    </td>
                                    <td width="35%">
                                        <input name="remark" type="text" class="form-control"
                                               value="">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="BedRoomList.save()">
                            保存
                        </button>
                        <span id="labelmsg1" class="label"></span>

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
        <!-- 导入模态框（Modal）楼层信息新增登记 -->
        <div class="modal fade" id="addModal2" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="addModalLabel">楼层信息登记</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addForm2">
                            <table class="table table-striped table-bordered table-cover" id="addPriceTable2">
                                <tr>
                                    <td width="15%">
                                         <font color="red">*</font> 楼层编号:<font color="red">(必填)</font>
                                    </td>
                                    <td width="35%">
                                        <input name="floorNumber" type="text" class="form-control"
                                               value="" style="width: 100%;float: left"><span style="float: left;margin-top: 10px"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        备注:
                                    </td>
                                    <td width="35%">
                                        <input name="remark" type="text" class="form-control"
                                               value="">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="FloorList.save()">
                            保存
                        </button>
                        <span id="labelmsg2" class="label"></span>

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


        <!-- 导入模态框（Modal）房间信息新增登记 -->
        <div class="modal fade" id="addModal3" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="addModalLabel">房间信息登记</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addForm3">
                            <table class="table table-striped table-bordered table-cover" id="addPriceTable3">
                                <tr>
                                    <td width="15%">
                                        <font color="red">*</font> 房间编号:<font color="red">(必填)</font>
                                    </td>
                                    <td width="35%">
                                        <span id="show" style="float: left;line-height: 30px;margin-left: 5px"></span>
                                        <input name="roomNum" type="text" class="form-control" value="" style="line-height: 10px;width: 70%;float: left;display: inline;margin-left: 15px">
                                    </td>
                                    <td width="15%">
                                        <font color="red">*</font> 房间类型:<font color="red">(必填)</font>
                                    </td>
                                    <td width="40%">
                                        <select id="roomType" class="form-control"
                                                name="roomType">
                                            <option value="" >--请选择--</option>
                                            <option value="1">自理老人房间</option>
                                            <option value="2">半自理完全不能自理老人房间</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        <font color="red">*</font> 房间面积(㎡):<font color="red">(必填)</font>
                                    </td>
                                    <td width="30%">
                                        <input name="roomArea" type="text" class="form-control"
                                               value="">
                                    </td>
                                    <td width="15%">
                                        <font color="red">*</font> 朝向:<font color="red">(必填)</font>
                                    </td>
                                    <td width="40%">
                                        <select id="orientation" class="form-control"
                                                name="orientation">
                                            <option value="" >--请选择--</option>
                                            <option value="1">朝东</option>
                                            <option value="2">朝南</option>
                                            <option value="3">朝西</option>
                                            <option value="4">朝北</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" style="text-align:center;vertical-align:middle;">辅助用房设施</td>
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
                                               value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="text-align:center;vertical-align:middle;">房间设备</td>
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
                                               value="">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="RoomList.save()">
                            保存
                        </button>
                        <span id="labelmsg3" class="label"></span>

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


        <!-- 导入模态框（Modal）床位信息新增登记 -->
        <div class="modal fade" id="addModal4" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="addModalLabel">床位信息登记</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addForm4">
                            <table class="table table-striped table-bordered table-cover" id="addPriceTable4">
                                <tr>
                                    <td width="15%">
                                        <font color="red">*</font> 床位编号:<font color="red">(必填)</font>
                                    </td>
                                   <%-- <td width="35%">
                                        <input name="bedNumber" type="text" class="form-control"
                                               value="" style="width: 100%;float: left"><span style="float: left;margin-top: 10px"></span>
                                    </td>--%>
                                    <td width="35%">
                                        <span id="show2" style="float: left;line-height: 30px;margin-left: 5px"></span>
                                        <input name="bedNumber" type="text" class="form-control" value="" style="line-height: 10px;width: 70%;float: left;display: inline;margin-left: 15px">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        备注:
                                    </td>
                                    <td width="35%">
                                        <input name="remark" type="text" class="form-control"
                                               value="">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue" data-loading-text="保存中..."
                                onclick="BedsList.save()">
                            保存
                        </button>
                        <span id="labelmsg4" class="label"></span>

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
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/bed_room_list.js?v=2.8"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/common.js?v=1.2"></script>
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

                AreaTree.init();
                BedRoomList.init();



                $(".collapse").click(function () {
                    $("#serviceOrg-form").toggle();
                })
                $(".collapse").click(function () {
                    $("#serviceOrg-form2").toggle();
                })
                $(".collapse").click(function () {
                    $("#serviceOrg-form3").toggle();
                })
                $(".collapse").click(function () {
                    $("#serviceOrg-form4").toggle();
                })
                $("#tab_1,#tab_1_1").show();
                $("#tab_2,#tab_3,#tab_4,#tab_1_2,#tab_1_3,#tab_1_4").hide();
                $("#active1").addClass("active");
                $("#tab_info1").click(function () {
                    $("#tab_1,#tab_1_1").show();
                    $("#tab_2,#tab_3,#tab_4,#tab_1_2,#tab_1_3,#tab_1_4").hide();
                    window.location.href=window.apppath +"/admin/serviceOrg/BedRoomManager/List";
                });
                $("#tab_kuozhan1").click(function (e) {
                    var towerCourtyardId = $('input:radio[name="deleteId1"]:checked').val();
                    if(towerCourtyardId === undefined){
                     /*   $("#active2").removeClass("active");
                        $("#active1").addClass("active");*/
                        window.location.href=window.apppath +"/admin/serviceOrg/BedRoomManager/List";
                        alert("未选择楼院信息，请重新选择");
                    }else {
                        FloorList.init();
                        $("#tab_2,#tab_1_2").show();
                        $("#tab_1,#tab_3,#tab_4,#tab_1_1,#tab_1_3,#tab_1_4").hide();

                    }
                });
                $("#tab_health1").click(function () {
                    var floorId = $('input:radio[name="deleteId2"]:checked').val();
                    if(floorId ===undefined){
                        window.location.href=window.apppath +"/admin/serviceOrg/BedRoomManager/List";
                     /*   $("#active3").removeClass("active");
                        $("#active2").addClass("active");*/
                        alert("未选择楼层信息，请重新选择");
                    }else{
                        RoomList.init();
                        $("#tab_3,#tab_1_3").show();
                        $("#tab_2,#tab_1,#tab_4,#tab_1_1,#tab_1_2,#tab_1_4").hide();
                    }

                });
                $("#tab_assess1").click(function () {
                    var roomId = $('input:radio[name="deleteId3"]:checked').val();
                    if(roomId===undefined){
                    /*    $("#active4").removeClass("active");
                        $("#active3").addClass("active");*/
                        window.location.href=window.apppath +"/admin/serviceOrg/BedRoomManager/List";
                        alert("未选择房间信息，请重新选择");
                    }else {
                        BedsList.init();
                        $("#tab_4,#tab_1_4").show();
                        $("#tab_2,#tab_3,#tab_1,#tab_1_1,#tab_1_2,#tab_1_3").hide();
                    }
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

