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
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>补贴申请</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
        <style>

            .remove {
                color: red;
                font-size: 17px;
                cursor: pointer;
                text-decoration: none;
            }

            .removeImg {
                z-index: 2;
                width: 10px;
                height: 10px;
                position: absolute;
                right: 0px;
                background-image: url("${pageContext.request.contextPath }/assets/global/img/delete.png");
                background-position: 50% 50%;
            }

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
        <div class="row">
            <div class="col-md-12">
                <!-- Begin: life time stats -->
                <div class="portlet " style="padding-top: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                               <c:choose>
                                   <c:when test="${object eq 1}">
                                       养老机构
                                   </c:when>
                                   <c:when test="${object eq 2}">
                                       服务组织
                                   </c:when>
                                   <c:when test="${object eq 3}">
                                       老年人日间照料中心
                                   </c:when>
                                   <c:when test="${object eq 4}">
                                       助餐点
                                   </c:when>
                                   <c:when test="${object eq 5}">
                                       助浴点
                                   </c:when>
                               </c:choose>
                                <c:choose>
                                    <c:when test="${type eq 1}">
                                        建设补贴
                                    </c:when>
                                    <c:when test="${type eq 2}">
                                        运营补贴
                                    </c:when>
                                </c:choose>
                            </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table border="1"
                               class="table table-bordered table-hover table-condensed table-responsive table-expandable"
                               align="center" style="border-collapse: collapse;">
                            <tr>
                                <td style="vertical-align:middle;text-align: center" colspan="6">
                                    <c:choose>
                                        <c:when test="${type eq 1}">
                                            <h1>建设补贴申请</h1>
                                        </c:when>
                                        <c:when test="${type eq 2}">
                                            <h1>运营补贴申请</h1>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申请组织名称
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <input type="text" class="form-control"
                                           name="institutionName" value="${sessionScope.login_user.serviceOrgName}"
                                           readonly>
                                    <input type="hidden" name="serviceOrgId" id="serviceOrgId"
                                           value="${sessionScope.login_user.serviceOrgId}">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <c:if test="${type eq 1 and object eq 1   }">
                     <%--                   <a href="${pageContext.request.contextPath}/file/excel/download/serviceOrg/内蒙古市区养老服务机构建设补贴申请表.docx"/>(1) 内蒙古市区养老服务机构建设补贴申请表</a>
                                        <p>(2) 申报的养老机构需取得《养老机构设立许可证》或经民政部门备案、《民办非企业单位（法人）登记证书》或《营业执照》</p>
                                        <p>(3) 具有合法的房产手续</p>
                                        <p>(4) 具有《食品经营许可证》或供餐单位的《食品经营许可证》和与之签订的协议</p>
                                        <p>(5) 养老机构建筑面积在300平方米以上的需具有公安消防部门出具的《建设工程消防验收意见书》或《建设工程竣工验收消防备案受理凭证》（手续名称与养老机构设立许可证一致）</p>
                                        <p>(6) 养老机构建筑面积在5000平方米以上的需具有环境保护部门的验收报告或审查意见</p>
                                        <p>(7) 单体建筑面积在300平方米以上的，床位数按养老机构消防部门验收的实际用于提供养老服务的建筑面积核定，每20平方米计算一张床位；单体建筑面积在300平方米及以下的，床位数按照房产证中实际用于提供养老服务的建筑面积核定，每20平方米计算一张床位</p>--%>
                                        <p>(1) 申请报告（报告须明确机构建筑面积和活动室、阅览室、厨房、餐厅等场所的面积，以及设置床位数）</p>
                                       <p><a href="${pageContext.request.contextPath}/file/excel/download/serviceOrg/民办养老机构建设补贴申请表.docx"/>(2) 民办养老机构建设补贴申请表</a></p>
                                        <p>(3) 养老机构设立许可证正（副）本或备案书</p>
                                        <p>(4) 民办非企业单位法人登记证书或营业执照</p>
                                        <p>(5) 食品经营许可证</p>
                                        <p>(6) 房屋所有权证</p>
                                        <p>(7) 5年内不得转向经营承诺书</p>
                                        <p>(8) 5年以上的房屋租赁合同（租赁）</p>
                                        <p>(9) 建筑布局平面图</p>
                                        <p>(10) 建设工程消防验收意见书或建设工程竣工验收消防备案受理凭证（300平方米以上养老机构需提供）</p>
                                        <p>(11) 环境评估证明（5000平方米以上养老机构需提供）</p>
                                        <p>(12) 与原养老机构分离的房产证明和改扩建部分消防审批合格手续（改扩建的养老机构需提供）</p>
                                    </c:if>
                                    <c:if test="${type eq 1 and object eq 2}">
                                    <c:if test="${institutionTypeDictId eq 1 }">
                                       <p></p> <a href="${pageContext.request.contextPath}/file/excel/download/serviceOrg/内蒙古市区域性居家养老服务中心建设补贴申请表.docx"/>(1) 内蒙古市区域性居家养老服务中心建设补贴申请表</a></p>
                                    </c:if>
                                 <%--   <c:if test="${institutionTypeDictId eq 2 }">--%>
                                        <p></p> <a href="${pageContext.request.contextPath}/file/excel/download/serviceOrg/内蒙古市社区养老服务站建设补贴申请表.docx"/>(1) 内蒙古市社区养老服务站建设补贴申请表</a></p>
                                  <%--  </c:if>--%>
                                        <p>(2)内蒙古市区居家养老服务中心统计汇总表</p>
                                        <p>(3)社会服务组织登记证书</p>
                                        <p>(4)以租赁形式举办的项目还应提供租赁合同</p>

                                        <%--   <p>(1)内蒙古市区居家养老服务中心建设补贴申请表</p>
                                     <p>(2)内蒙古市区居家养老服务中心统计汇总表</p>
                                     <p>(3)社会服务组织登记证书</p>
                                     <p>(4)以租赁形式举办的项目还应提供租赁合同</p>--%>
                                    </c:if>
                                    <c:if test="${type eq 1 and object eq 3}">
                                        <p>(1)内蒙古市区养老服务机构建设补贴申请表</p>
                                        <p>(2)社会服务组织登记证书</p>
                                        <p>(3)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${type eq 1 and object eq 4}">
                                        <p>(1)内蒙古市区老年人助餐点建设补贴申请表</p>
                                        <p>(2)社会服务组织登记证书</p>
                                        <p>(3)餐饮服务许可证</p>
                                        <p>(4)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${type eq 1 and object eq 5}">
                                        <p>(1)内蒙古市区老年人助助浴点建设补贴申请表</p>
                                        <p>(2)营业执照社会服务组织登记证书</p>
                                        <p>(3)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${type eq 2 and object eq 1}">
                                        <a href="${pageContext.request.contextPath}/file/excel/download/serviceOrg/内蒙古市区养老服务机构运营补贴申请表.docx"/>(1) 内蒙古市区养老服务机构运营补贴申请表</a>
                                        <p>(2) 养老机构设立许可证、法人登记证书复印件。养老机 构实行公建（办）民营的，还须提供5年以上公建（办）民营协 议</p>
                                        <p>(3) 按月提供连续入住6个月（含）以上市区户籍的年满 60周岁且非政府供养老人花名册</p>
                                        <p>(4) 第三方评估机构出具的老年人能力等级评估报告</p>
                                    </c:if>
                                    <c:if test="${type eq 2 and object eq 2}">
                                   <%-- <c:if test="${institutionTypeDictId eq 2 }">--%>
                                        <p></p> <a href="${pageContext.request.contextPath}/file/excel/download/serviceOrg/内蒙古市社区养老服务设施运营补贴申请表.docx"/>(1) 内蒙古市社区养老服务设施运营补贴申请表</a></p>
                                   <%-- </c:if>--%>
                                        <p>(2)内蒙古市区居家养老服务中心统计汇总表</p>
                                        <p>(3)社会服务组织登记证书复印件</p>
                                        <p>(4)年度运营报告</p>
                                 <%--       <p>(1)内蒙古市区居家养老服务中心运营补贴申请表</p>
                                        <p>(2)内蒙古市区居家养老服务中心统计汇总表</p>
                                        <p>(3)社会服务组织登记证书复印件</p>
                                        <p>(4)年度运营报告1</p>--%>
                                    </c:if>
                                    <c:if test="${type eq 2 and object eq 3}">
                                        <p>(1)内蒙古市区养老服务机构运营补贴申请表</p>
                                        <p>(2)社会服务组织登记证书复印件</p>
                                        <p>(3)入住老人花名册</p>
                                        <p>(4)连续运营6个月以上的服务记录</p>
                                    </c:if>
                                    <c:if test="${type eq 2 and object eq 4}">
                                        <p>(1)内蒙古市区老年人助餐点运营补贴申请表</p>
                                        <p>(2)社会服务组织登记证书</p>
                                        <p>(3)老人年助餐数量公示材料</p>
                                        <p>(4)第三方评估机构出具的老年人助餐评估报告</p>
                                        <p>(5)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${type eq 2 and object eq 5}">
                                        <p>(1)内蒙古市区老年人助浴点运营补贴申请表</p>
                                        <p>(2)社会服务组织登记证书</p>
                                        <p>(3)老人年助浴数量公示材料</p>
                                        <p>(4)第三方评估机构出具的老年人助浴评估报告</p>
                                        <p>(5)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>上传
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list attachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <div style="display: inline-block" class="file-box">
                                        <input type="file" name="files" id="attachInput"
                                               onchange="UploadFile('serviceOrg/subsidy/apply/attach','attachInput','attach')"
                                               style="opacity: 0;">
                                        <input type="hidden" id="attach">
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-4" style="float: left">
                                    <button data-loading-text="提交中..." id="applyBtn"
                                            type="button" class="btn btn-circle green"
                                    >
                                        提交
                                    </button>
                                    <span id="labelmsg1" class="label"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script src="${pageContext.request.contextPath }/assets/global/scripts/metronic.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/layout/scripts/layout.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/global/plugins/ajaxfileupload.js"
                type="text/javascript"></script>

        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                $("#applyBtn").click(function () {

                    if (checkSave()) {
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/apply", {
                            "serviceOrg.id": $("#serviceOrgId").val(),
                            "subsidyType": "${type}",
                            "subsidyObject": "${object}",
                            "attach": $("#attach").val()
                        }, function (res) {
                            if (res.success) {
                                alert("申请成功", function () {
                                    window.location.reload();
                                })
                            } else {
                                alert(res.message);
                            }
                        }, 'json');
                    }
                })

            });
            function checkSave() {
                var attach = $("#attach").val();
                if (attach == null || attach == "") {
                    alert("请上传附件");
                    return false;
                }
                return true;
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

