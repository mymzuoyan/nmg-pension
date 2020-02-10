<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>呼叫客户基础信息</title>
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
                            <span class="caption-subject font-red-sunglo bold uppercase">呼叫客户基础信息</span>
                        </div>
                    </div>
                    <div class="portlet-body from">
                        <div class="form-horizontal">
                            <!-- PERSONAL INFO TAB -->
                            <form class="form-body" id="addCustomer">
                                <table class="head_table table  table-bordered" cellpadding="0" cellspacing="0">
                                    <input type="hidden" name="id" value="${customer.id}">
                                    <tr>
                                        <td class="app_list_search_caption">
                                            老人姓名
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="elderName" name="elderName">${elderlyMsg.elderName}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            联系电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="homeTel">${elderlyMsg.homeTel}</div>
                                        </td>
                                        <td class="app_list_search_caption">
                                            移动电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <div id="mobile">${elderlyMsg.mobile}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            居住地址
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="address">${elderlyMsg.realAddress}</div>
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
                                            <c:if test="${not empty group}">
                                                <input type="hidden" id="groupId" value="${group.id}">
                                            </c:if>
                                        </td>
                                        <td colspan="3">
                                            <select id="groupIds"
                                                    name="groupIds" class="form-control" readonly="">
                                            </select>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器类型<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="beeperType"
                                                    name="beeperType" class="form-control" readonly>
                                                <option value="0"
                                                        <c:if test="${customer.beeperType==0}">selected</c:if>>--无--
                                                </option>
                                                <option value="1"
                                                        <c:if test="${customer.beeperType==1}">selected</c:if>>固定
                                                </option>
                                                <option value="2"
                                                        <c:if test="${customer.beeperType==2}">selected</c:if>>移动
                                                </option>
                                            </select>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器厂商<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="beeperName" style='width:auto' class="form-control" readonly>
                                                <option value='0'>--无--</option>
                                                <option value='1'
                                                        <c:if test="${customer.beeperName=='12349'}">selected</c:if>>
                                                    12349
                                                </option>
                                                <option value='2'
                                                        <c:if test="${customer.beeperName=='安康通'}">selected</c:if>>安康通
                                                </option>
                                                <option value='3'
                                                        <c:if test="${customer.beeperName=='康惠通'}">selected</c:if>>康惠通
                                                </option>
                                                <option value='4'
                                                        <c:if test="${customer.beeperName=='奥维'}">selected</c:if>>奥维
                                                </option>
                                                <option value='5'
                                                        <c:if test="${customer.beeperName=='96180'}">selected</c:if>>
                                                    96180
                                                </option>
                                                <option value='6'
                                                        <c:if test="${customer.beeperName=='平安保'}">selected</c:if>>平安保
                                                </option>
                                                <option value='7'
                                                        <c:if test="${customer.beeperName=='962069'}">selected</c:if>>
                                                    962069
                                                </option>
                                                <option value='8'
                                                        <c:if test="${customer.beeperName=='电信'}">selected</c:if> >电信
                                                </option>
                                                <option value='9'
                                                        <c:if test="${customer.beeperName=='移动'}">selected</c:if>>移动
                                                </option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器设备号<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="beeperId" name="beeperId"
                                                   value="${customer.beeperId}" readonly/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器安装时间<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control date-picker" id="beeperTime"
                                                   name="beeperTime"
                                                   value="<fmt:formatDate value="${customer.beeperTime}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                                                   readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器号码<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="beeperNum" name="beeperNum"
                                                   value="${customer.beeperNum}" readonly/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            安装状态<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <select id="beeperStatus" class="form-control" name="beeperStatus" readonly>
                                                <option value="0"
                                                        <c:if test="${customer.beeperStatus=='0'}">selected</c:if>>未安装
                                                </option>
                                                <option value="1"
                                                        <c:if test="${customer.beeperStatus=='1'}">selected</c:if>>已安装
                                                </option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器所在区域<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td" colspan="3">
                                            <div id="areaDiv" style="display: none;">
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
                                            </div>
                                            <input type="text" class="form-control" id="beeperAddress"
                                                   name="beeperAddress" value="${customer.beeperAddress}" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器所在地址<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="beeperMoreAddress"
                                                   name="beeperMoreAddress" value="${customer.beeperMoreAddress}"
                                                   readonly>
                                        </td>
                                        <td class="app_list_search_caption">
                                            个人安装意愿
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="installNeed" name="installNeed"
                                                   value="${customer.installNeed}" readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            呼叫器设备号<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="beeperId" name="beeperId"
                                                   value="${customer.beeperId}" readonly/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            呼叫器安装时间<font color="red">*</font>
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control date-picker" id="beeperTime"
                                                   name="beeperTime"
                                                   value="<fmt:formatDate value="${customer.beeperTime}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                                                   readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            服务人员
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="servicePer" name="servicePer"
                                                   value="${customer.servicePer}" readonly/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            联系电话
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control date-picker" id="serviceMobile"
                                                   name="serviceMobile" value="${customer.serviceMobile}" readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="app_list_search_caption">
                                            工作类型
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control" id="serviceWorkType"
                                                   name="serviceWorkType" value="${customer.serviceWorkType}" readonly/>
                                        </td>
                                        <td class="app_list_search_caption">
                                            所属单位
                                        </td>
                                        <td class="app_list_search_td">
                                            <input type="text" class="form-control date-picker" id="serviceWorkUnit"
                                                   name="serviceWorkUnit" value="${customer.serviceWorkUnit}" readonly/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn blue change" style="display: inline-block">修改</button>
                                <button type="button" class="btn blue updateCustomer" style="display: none">保存</button>
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
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/call/customer_info.js?V=1.2"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/admin/pages/scripts/eographic_area.js?v=1"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                var elderTypeDictIds = "${elderlyMsg.elderTypeDictIds}";
                var arr = {
                    "1": "城市三无/农村五保", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
                    "5": "百岁老人", "9": "空巢", "10": "独居"
                };
                var scopes = '';
                if (elderTypeDictIds != "" && elderTypeDictIds != null) {
                    var scope = elderTypeDictIds.split(",");
                    for (var i = 0; i < scope.length; i++) {
                        if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                            scopes += arr[scope[i]] + ','
                        }
                    }
                    scopes = scopes.substr(0, (scopes.length - 1));
                }
                $("#elderType").html(scopes);
                var childrenDictId = "${elderlyMsg.childrenDictId}";
                if (childrenDictId != null & childrenDictId != "") {
                    var data = childrenDictId;
                    arr = {"270": "有子女", "271": "未生育子女", "272": "失去独生子女"};
                    $("#hasChildren").html(arr[data]);
                }
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'yyyy-mm-dd',
                });
                CustomerInfo.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
