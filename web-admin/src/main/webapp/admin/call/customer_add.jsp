<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>创建呼叫客户</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " id="elderInfo_add">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">呼叫客户基础信息新增</span>
                        </div>
                    </div>
                    <div class="portlet-body from">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addCustomer">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            身份证号<font color="red">*</font>
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
                                            所属区域
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="areaNameDiv"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            老人姓名
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
                                        <td>
                                            所属群组
                                        </td>
                                        <td colspan="3">
                                            <select id="groupIds"
                                                    name="groupIds" class="form-control">
                                            </select>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器类型<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="beeperType"
                                                    name="beeperType" class="form-control">
                                                <option value="0">--无--</option>
                                                <option value="1">固定</option>
                                                <option value="2">移动</option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器厂商<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="beeperName" style='width:auto' class="form-control">
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
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器设备号<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="beeperId" name="beeperId"
                                                   value=""/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器安装时间<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control date-picker" id="beeperTime"
                                                   name="beeperTime" value=""/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器号码<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="beeperNum" name="beeperNum"
                                                   value=""/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            安装状态<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="beeperStatus" class="form-control" name="beeperStatus">
                                                <option value="0">未安装</option>
                                                <option value="1">已安装</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器所在区域<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input value="0" id="province" type="hidden">
                                            <select name="city" class="form-control" id="city"
                                                    style="display: inline-block;width: 45%;margin-right: 9%"
                                                    onChange="EographicArea.changeCity();"
                                                    readonly="readonly">
                                                <option value="">直辖市，地级市</option>
                                            </select>
                                            <select name="area" class="form-control" id="county"
                                                    style="display: inline-block;width: 45%"
                                                    onChange="EographicArea.changeCounty();"
                                                    readonly="readonly">
                                                <option value="">行政区，市，县</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器所在地址<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <input type="text" class="form-control" id="beeperMoreAddress"
                                                   name="beeperMoreAddress">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue addCustomer">保存</button>
                                <button onclick="javascript:history.back()" type="button" class="btn btn-default">返回
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END CHANGE AVATAR TAB -->
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/customer_add.js?v=1.5"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1.2"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd',
                });
                EographicArea.init();
                EographicArea.changeProvince();
                CustomerAdd.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
