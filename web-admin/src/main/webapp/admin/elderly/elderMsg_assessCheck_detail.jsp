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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>评估检查详细</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_content">
        <!-- BEGIN CONTENT -->

        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">当前位置</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">能力评估信息</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">评估检查详细</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div align="center">
                    <form id="addCheck">
                        <input type="hidden" name="elderId" value="${elderAssessCheck.elderId}">
                        <table class="col-md-10" cellspacing="0" cellpadding="0" align=" center">
                            <tr>
                                <td style=" border:1px solid #000; border-right:0px;" height="30px">被检查单位</td>
                                <td colspan="3" style=" border:1px solid #000;">
                                    <input type="text" id="BYCHECK_UNIT" name="bycheckUnit"
                                           value="${elderAssessCheck.bycheckUnit}"
                                           maxlength="60"
                                           style=" border:none; width:99%;" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    联系人
                                </td>
                                <td style="  border-left:1px solid #000;border-bottom:1px solid #000;">
                                    <input type="text" name="linkMan" value="${elderAssessCheck.linkMan}" maxlength="30"
                                           style=" border:none; width:99%;" readonly/>
                                </td>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    联系电话
                                </td>
                                <td style=" border:1px solid #000;border-top:0px">
                                    <input type="text" name="linkPhone" value="${elderAssessCheck.linkPhone}"
                                           maxlength="30"
                                           style=" border:none; width:98%;" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    联系地址
                                </td>
                                <td colspan="3" style=" border:1px solid #000;border-top:0px">
                                    <input type="text" name="linkAddress" value="${elderAssessCheck.linkAddress}"
                                           maxlength="60"
                                           style=" border:none; width:99%;" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    检查单位
                                </td>
                                <td colspan="3" style=" border:1px solid #000;border-top:0px">
                                    <input type="text" name="checkUnit" value="${elderAssessCheck.checkUnit}"
                                           maxlength="60"
                                           style=" border:none; width:98%;" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    检查人
                                </td>
                                <td colspan="1"
                                    style="  border-left:1px solid #000;border-bottom:1px solid #000;">
                                    <input type="text" name="checkMan" value="${elderAssessCheck.checkMan}"
                                           maxlength="15"
                                           style=" border:none; width:99%;" readonly/>
                                </td>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    检查时间
                                </td>
                                <td colspan="1" style=" border:1px solid #000;border-top:0px">
                                    <input type="text" class="form-control  date-picker"
                                           style=" border:none; width:98%;"
                                           name="time" data-date-format="yyyy-mm-dd"
                                           value="<fn:formatDate value="${elderAssessCheck.checkTime}" pattern="yyyy-MM-dd"></fn:formatDate >"
                                           readonly>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    检查内容
                                </td>
                                <td colspan="3" style=" border:1px solid #000;border-top:0px" width="600px"
                                    height="100px">
                                        <textarea style=" overflow:hidden;border:none;height:100%;width:99%; "
                                                  name="checkContent" readonly
                                        >${elderAssessCheck.checkContent}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border-left:1px solid #000;border-bottom:1px solid #000;"
                                    height="30px">
                                    检查结果
                                </td>
                                <td colspan="3" style=" border:1px solid #000;border-top:0px" width="600px"
                                    height="100px">
                                        <textarea style=" overflow:hidden;border:none;height:100%;width:99%; "
                                                  id="CHECK_RESULT" name="checkResult" readonly
                                        >${elderAssessCheck.checkResult}</textarea>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>

        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

