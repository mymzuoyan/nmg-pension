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
        <title>补贴申请详情</title>
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
                                   <c:when test="${apply.subsidyObject eq 1}">
                                       养老机构
                                   </c:when>
                                   <c:when test="${apply.subsidyObject eq 2}">
                                       服务组织
                                   </c:when>
                                   <c:when test="${apply.subsidyObject eq 3}">
                                       助餐点
                                   </c:when>
                                   <c:when test="${apply.subsidyObject eq 4}">
                                       助浴点
                                   </c:when>
                               </c:choose>
                                <c:choose>
                                    <c:when test="${apply.subsidyType eq 1}">
                                        建设补贴
                                    </c:when>
                                    <c:when test="${apply.subsidyType eq 2}">
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
                                    <input type="hidden" id="applyId" value="${apply.id}">
                                    <c:choose>
                                        <c:when test="${apply.subsidyType eq 1}">
                                            <h1>建设补贴申请</h1>
                                        </c:when>
                                        <c:when test="${apply.subsidyType eq 2}">
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
                                           name="institutionName" value="${apply.serviceOrg.institutionName}"
                                           readonly>
                                    <input type="hidden" name="serviceOrgId" id="serviceOrgId"
                                           value="${apply.serviceOrg.id}">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; vertical-align:middle;"><font
                                        color="red">*</font>申报材料
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <c:if test="${apply.subsidyType eq 1 and apply.subsidyObject eq 1   }">
                                   <%--     <p>(1) 内蒙古市区养老服务机构建设补贴申请表</p>
                                        <p>(2) 法人登记证书</p>
                                        <p>(3) 养老机构设立许可证书</p>
                                        <p>(4) 合法有效的土地、房屋使用手续：
                                            <br>
                                            ① 以自有产权用房举办的项目，提供当地发改委立项批复、 规划建设用地许可证或房屋产权、土地产权等其他证明材料复印 件
                                            <br>
                                            ② 以租赁房屋举办的项目，提供房屋租赁协议及房屋产权、 土地产权证明材料复印件
                                            <br>
                                            ③ 以租赁土地建设的项目，提供土地租赁协议和土地证明材 料复印件。</p>
                                        <p> (5) 申请护理型床位建设补贴的，还须提供：
                                            <br>
                                            ① 卫生部门颁发的《医疗机构执业许可证》或与医疗机构合 作协议
                                            <br>
                                            ② 医护人员花名册
                                            <br>
                                            ③ 第三方实地查验评估报告。</p>--%>

                                        <p>(1) 申请报告（报告须明确机构建筑面积和活动室、阅览室、厨房、餐厅等场所的面积，以及设置床位数）</p>
                                        <p>(2) 民办养老机构建设补贴申请表</p>
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
                                    <c:if test="${apply.subsidyType eq 1 and apply.subsidyObject eq 2}">
                                        <p>(1)内蒙古市区居家养老服务中心建设补贴申请表</p>
                                        <p>(2)内蒙古市区居家养老服务中心统计汇总表</p>
                                        <p>(3)社会服务组织登记证书</p>
                                        <p>(4)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 1 and apply.subsidyObject eq 3}">
                                        <p>(1)内蒙古市区养老服务机构建设补贴申请表</p>
                                        <p>(2)社会服务组织登记证书</p>
                                        <p>(3)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 1 and apply.subsidyObject eq 4}">
                                        <p>(1)内蒙古市区老年人助餐点建设补贴申请表</p>
                                        <p>(2)社会服务组织登记证书</p>
                                        <p>(3)餐饮服务许可证</p>
                                        <p>(4)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 1 and apply.subsidyObject eq 5}">
                                        <p>(1)内蒙古市区老年人助助浴点建设补贴申请表</p>
                                        <p>(2)营业执照社会服务组织登记证书</p>
                                        <p>(3)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 2 and apply.subsidyObject eq 1}">
                                        <p>(1 )内蒙古市区养老服务机构运营补贴申请表</p>
                                        <p>(2) 养老机构设立许可证、法人登记证书复印件。养老机 构实行公建（办）民营的，还须提供5年以上公建（办）民营协 议</p>
                                        <p>(3) 按月提供连续入住6个月（含）以上市区户籍的年满 60周岁且非政府供养老人花名册</p>
                                        <p>(4) 第三方评估机构出具的老年人能力等级评估报告</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 2 and apply.subsidyObject eq 2}">
                                        <p>(1)内蒙古市区居家养老服务中心运营补贴申请表</p>
                                        <p>(2)内蒙古市区居家养老服务中心统计汇总表</p>
                                        <p>(3)社会服务组织登记证书复印件</p>
                                        <p>(4)年度运营报告</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 2 and apply.subsidyObject eq 3}">
                                        <p>(1)内蒙古市区养老服务机构运营补贴申请表</p>
                                        <p>(2)社会服务组织登记证书复印件</p>
                                        <p>(3)入住老人花名册</p>
                                        <p>(4)连续运营6个月以上的服务记录</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 2 and apply.subsidyObject eq 4}">
                                        <p>(1)内蒙古市区老年人助餐点运营补贴申请表</p>
                                        <p>(2)社会服务组织登记证书</p>
                                        <p>(3)老人年助餐数量公示材料</p>
                                        <p>(4)第三方评估机构出具的老年人助餐评估报告</p>
                                        <p>(5)以租赁形式举办的项目还应提供租赁合同</p>
                                    </c:if>
                                    <c:if test="${apply.subsidyType eq 2 and apply.subsidyObject eq 5}">
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
                                        color="red">*</font>上传文件
                                </td>
                                <td style="width: 90%; vertical-align:middle;" colspan="5">
                                    <div class="file-box-list attachInput"
                                         style="display: inline-block;margin: 0px"></div>
                                    <input type="hidden" id="attach" name="attach" value="${apply.attach}">

                                </td>
                            </tr>
                            <c:if test="${apply.status==0}">
                                <tr>
                                    <td style="width: 10%; vertical-align:middle;"><font
                                            color="red">*</font>审核结果
                                    </td>
                                    <td style="width: 90%; vertical-align:middle;" colspan="5">
                                        <select class="form-control" id="status">
                                            <option value="">
                                                -- 请选择 --
                                            </option>
                                            <option value="1">
                                                审核通过
                                            </option>
                                            <option value="2">
                                                审核不通过
                                            </option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; vertical-align:middle;"><font
                                            color="red">*</font>备注
                                    </td>
                                    <td style="width: 90%; vertical-align:middle;" colspan="5">
                                        <input type="text" id="node" class="form-control">
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${apply.status!=0}">
                                <tr>
                                    <td style="width: 10%; vertical-align:middle;"><font
                                            color="red">*</font>审核结果
                                    </td>
                                    <td style="width: 90%; vertical-align:middle;" colspan="5">
                                        <c:if test="${apply.status==1}">
                                            <input type="text" value="审核通过"
                                            class="form-control" readonly>
                                        </c:if>
                                        <c:if test="${apply.status==2}">
                                            <input type="text" value="审核不通过"
                                                   class="form-control" readonly>
                                        </c:if>
                                        <%--<input type="text" value="['待审核','审核通过','审核不通过'][${apply.status}]" class="form-control" readonly />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; vertical-align:middle;"><font
                                            color="red">*</font>备注
                                    </td>
                                    <td style="width: 90%; vertical-align:middle;" colspan="5">
                                        <input type="text" value="${apply.node}" class="form-control" readonly>
                                    </td>
                                </tr>
                            </c:if>
                        </table>
                        <div class="form-actions">
                            <div class="row">
                                <c:if test="${apply.status==0}">

                                    <div class="col-md-offset-4" style="float: left">
                                        <button data-loading-text="提交中..." id="applyBtn"
                                                type="button" class="btn btn-circle green"
                                        >
                                            审核
                                        </button>
                                    </div>
                                </c:if>
                                <div class="col-md-offset-11">
                                    <button onclick="window.parent.closeTab('tab-serviceOrg-subsidy-apply-info');
                                                    window.parent.updateTab('side-serviceOrg-subsidy-list')"
                                            class="btn btn-circle green"><i
                                            class="fa">返回</i>
                                    </button>
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
                setAttachValue("attach");
                <c:if test="${apply.status==0}">

                $("#applyBtn").click(function () {
                    if (checkSave()) {
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/verify", {
                            "id": $("#applyId").val(),
                            "status": $("#status").val(),
                            "node": $("#node").val()
                        }, function (res) {
                            if (res.success) {
                                alert("审核成功", function () {
                                    window.parent.closeTab('tab-serviceOrg-subsidy-apply-info');
                                })
                                window.parent.updateTab('side-serviceOrg-subsidy-list');
                            } else {
                                alert(res.message);
                            }
                        }, 'json');
                    }
                })
                </c:if>

            });
            function checkSave() {
                var status = $("#status").val();
                if (status == null || status == "") {
                    alert("请选择审核结果");
                    return false;
                }
                return true;
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

