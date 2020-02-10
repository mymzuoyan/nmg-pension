<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shior" uri="http://shiro.apache.org/tags" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="page_title">
        <title>政府购买信息</title>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
        <style>
            .t {
                border-collapse: collapse;
            }

            .t td {
                border: 1px solid #000;
            }

            .t input {
                width: 98%;
                border: 0px;
            }

            .t textarea {
                width: 98%;
                border: 0px;
                overflow: auto;
            }

            .table1 {
                border-top: 1px solid #000;
                border-left: 1px solid #000;
            }

            .table1 td {
                padding: 5px;
                border-bottom: 1px solid #000;
                border-right: 1px solid #000;
            }

            .table3 {
                border-top: 1px solid #000;
                border-left: 1px solid #000;
            }

            .table3 td {
                padding: 5px;
                border-bottom: 1px solid #000;
                border-right: 1px solid #000;
            }

            .table4 {
                border-top: 1px solid #000;
                border-left: 1px solid #000;
            }

            .table4 td {
                padding: 5px;
                border-bottom: 1px solid #000;
                border-right: 1px solid #000;
            }

            #biaot {
                font-weight: bold;
                font-size: 25px;
            }

            input {
                border: 0px;
                background-color: white;
            }

            .number {
                border: 0px;
                border-bottom: 1px solid #000;
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
                    <a href="#">老人信息管理系统</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    <a href="#">政府买居家养老服务申请</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet " style="padding-top: 0px !important;padding-bottom: 0px !important;">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-equalizer font-purple-plum hide"></i>
                            <span class="caption-subject font-red-sunglo bold uppercase">
                                <c:if test="${apply.status==0}">街道已登记，街道受理</c:if>
                                <c:if test="${apply.status==1}">街道已受理，街道审核</c:if>
                                <c:if test="${apply.status==2}">街道不予受理</c:if>
                                <c:if test="${apply.status==3}">初审(街道)通过,区审核</c:if>
                                <c:if test="${apply.status==4}">初审(街道)不通过,街道补正</c:if>
                                <c:if test="${apply.status==5}">审核(区)通过,评估组织评估</c:if>
                                <c:if test="${apply.status==6}">区不予批准</c:if>
                                <c:if test="${apply.status==7}">评估组织已评估,区再审核</c:if>
                                <c:if test="${apply.status==8}">区审核通过，街道公示</c:if>
                                <c:if test="${apply.status==9}">区不予批准</c:if>
                                <c:if test="${apply.status==10}">街道已公示，区审核</c:if>
                                <c:if test="${apply.status==11}">已通过</c:if>
                                <c:if test="${apply.status==12}">区未审核通过，需街道复审</c:if>
                                <c:if test="${apply.status==13}">区未审核通过，需评估组织复评</c:if>
                                <c:if test="${apply.status==14}">街道复审通过，区审核</c:if>
                                <%--<c:if test="${apply.status==10}">街道公示，区审核</c:if>--%>
                            </span>
                        </div>
                        <div class="tools">
                            <div style="float: left">
                                <c:if test="${apply.status>0}">
                                    <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.showDoc()"
                                       class="btn btn-circle btn-add" style="background-color: #00a0e9">
                                        <i class="fa">文书</i>
                                    </a>
                                </c:if>
                                <c:if test="${apply.result!=1 and apply.result!=2  }">
                                    <shior:hasRole name="stadmin">
                                        <c:if test="${apply.status==0 or apply.status==1 or apply.status==2
                                        or apply.status==4or apply.status==8 or apply.status==12}">
                                        <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.saveApply()"
                                           class="btn btn-circle btn-add">
                                            <i class="fa">保存</i>
                                        </a>
                                        <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.nextStep()"
                                           class="table-group-action-import btn btn-circle btn-import"><i
                                                class="fa">下一步</i>
                                        </a>
                                        </c:if>
                                    </shior:hasRole>
                                    <shior:hasRole name="readmin">
                                        <c:if test="${apply.status==3 or apply.status==7 or apply.status==10 or apply.status==14 }">
                                            <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.saveApply()"
                                               class="btn btn-circle btn-add">
                                                <i class="fa">保存</i>
                                            </a>
                                            <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.nextStep()"
                                               class="table-group-action-import btn btn-circle btn-import"><i
                                                    class="fa">下一步</i></a>
                                            <c:if test="${apply.status==10}">
                                                <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.nextStep2()"
                                                   class="table-group-action-import btn btn-circle btn-import"><i
                                                        class="fa">复审／复评</i></a>
                                            </c:if>
                                        </c:if>
                                    </shior:hasRole>
                                    <shior:hasRole name="assadmin">
                                        <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.saveApply()"
                                           class="btn btn-circle btn-add">
                                            <i class="fa">保存</i>
                                        </a>
                                        <c:if test="${apply.status==5 or apply.status==13}">
                                            <a href="javascript:void(0)" onclick="ElderMsgGovBuyInfo.saveApply(1)"
                                               class="table-group-action-import btn btn-circle btn-import"><i
                                                    class="fa">下一步</i></a>
                                        </c:if>
                                    </shior:hasRole>
                                </c:if>

                            </div>
                        </div>
                    </div>
                    <div class="portlet-body" style="padding-top: 0px !important;">
                        <form id="govbuyApplyForm">
                            <div id="elderInfoDiv">
                                <table width="100%" cellpadding="5" cellspacing="0" style="margin-bottom: 10px">
                                    <tr>
                                        <td colspan="6" id="biaot" align="center">
                                            南京市养老服务对象评估表
                                            <input type="hidden" name="id"
                                                   value="${apply.id}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="right">
                                            编号：
                                            <input type="text" name="number" value="${apply.number}" class="number"
                                                   readonly="readonly"/>
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table1">
                                    <tr>
                                        <td colspan="7" align="center">
                                            <font>一、基本情况（街道审核确认）</font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7" align="left">
                                            <input type="text" name="region1" value="${apply.region1}" size="10"
                                                   class="input"
                                                   readonly="readonly"/>
                                            区
                                            <input type="text" name="region2" value="${apply.region2}" size="10"
                                                   class="input"
                                                   readonly="readonly"/>
                                            街道（镇）
                                            <input type="text" name="region3" value="${apply.region3}" size="10"
                                                   class="input"
                                                   readonly="readonly"/>
                                            社区（村）
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="90" align="center" rowspan="2">
                                            <font style="color:red">*</font>
                                            姓名
                                        </td>
                                        <td width="208" align="center" rowspan="2">
                                            <input type="text" name="name" value="${apply.name}" size="20"
                                                   class="form-control"
                                                   style="width: 100%;"/>
                                        </td>
                                        <td align="center" width="156" rowspan="2">
                                            <font style="color:red">*</font>
                                            身份证号
                                        </td>
                                        <td width="246" rowspan="2">
                                            <input type="text" name="idcardno" class="form-control"
                                                   value="${apply.idcardno}"
                                                   style="width: 180px;display: inline-block"
                                            />
                                            <input type="button" value="查询" onClick="ElderMsgGovBuyApply.queryElder()"/>
                                            <input type="hidden" name="elderId" value="${apply.elderId}"/>
                                            <input type="hidden" name="age" value="${apply.age}"/>
                                            <input type="hidden" name="birthday" value="${apply.birthday}"/>
                                            <input type="hidden" name="sex" value="${apply.sex}"/>
                                        </td>
                                        <td width="90" align="center" rowspan="2">
                                            <font style="color:red">*</font>
                                            联系方式
                                        </td>
                                        <td width="90" height="30" align="center">固话</td>
                                        <td width="190">
                                            <input type="text" name="homeTel" value="${apply.homeTel}" size="11"
                                                   border="0"
                                                   style="width: 100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" align="center">手机</td>
                                        <td>
                                            <input type="text" name="mobile" value="${apply.mobile}" size="11"
                                                   border="0"
                                                   style="width: 100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            文化
                                            <br/>
                                            程度
                                        </td>
                                        <td align="left">
                                            <select name="educationDictId" class="form-control">
                                                <option value="">--请选择--</option>
                                                <option value="1"
                                                        <c:if test="${apply.educationDictId==1}">selected</c:if> >文盲
                                                </option>
                                                <option value="2"
                                                        <c:if test="${apply.educationDictId==2}">selected</c:if>>
                                                    小学
                                                </option>
                                                <option value="3"
                                                        <c:if test="${apply.educationDictId==3}">selected</c:if>>
                                                    初中
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.educationDictId==4}">selected</c:if>>
                                                    高中和中专
                                                </option>
                                                <option value="5"
                                                        <c:if test="${apply.educationDictId==5}">selected</c:if>>
                                                    大专
                                                </option>
                                                <option value="6"
                                                        <c:if test="${apply.educationDictId==6}">selected</c:if>>
                                                    本科及以上
                                                </option>
                                                <option value="0"
                                                        <c:if test="${apply.educationDictId==7}">selected</c:if>>
                                                    其他
                                                </option>
                                            </select>
                                        </td>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            户籍地址
                                        </td>
                                        <td>
                                            <input type="text" name="regPlace" id="regPlace" value="${apply.regPlace}"
                                                   class="form-control"
                                                   size="25" style="width: 100%;"/>
                                        </td>
                                        <td align="center" colspan="2">
                                            <font style="color:red">*</font>
                                            常住
                                        </td>
                                        <td align="left">
                                            <input id="liveYearDictId1" type="radio"
                                                   <c:if test="${apply.liveYearDictId==1}">checked</c:if>
                                                   name="liveYearDictId" value="1"/>
                                            <label for="liveYearDictId1">半年以下</label>
                                            <br/>
                                            <input id="liveYearDictId2" type="radio"
                                                   <c:if test="${apply.liveYearDictId==2}">checked</c:if>
                                                   name="liveYearDictId" value="2"/>
                                            <label for="liveYearDictId2">常住</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            住址
                                        </td>
                                        <td colspan="4">
                                            <input type="text" name="address" id="address" style="width: 100%"
                                                   class="form-control"
                                                   value="${apply.address}"/>
                                        </td>
                                        <td>市民卡号</td>
                                        <td>
                                            <input type="text" name="cardno" value="${apply.cardno}" style="width: 100%"
                                                   class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center">
                                            <font style="color:red">*</font>
                                            人员类别
                                        </td>
                                        <td rowspan="2" colspan="6" align="left">
                                            <input type="checkbox" name="elderTypeDictIds" value="1"/>
                                            城市三无/农村五保
                                            <input type="checkbox" name="elderTypeDictIds" value="2"/>
                                            低保/低保边缘
                                            <input type="checkbox" name="elderTypeDictIds" value="3"/>
                                            经济困难的失能/半失能老人
                                            <input type="checkbox" name="elderTypeDictIds" value="4"/>
                                            70周岁及以上的计生特扶老人
                                            <input type="checkbox" name="elderTypeDictIds" value="5"/>
                                            百岁老人。
                                            <br/>
                                            <input type="checkbox" name="elderTypeDictIds" value="9"/>
                                            空巢
                                            <input type="checkbox" name="elderTypeDictIds" value="10"/>
                                            独居
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <table width="100%" border="0" class="table3" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="8" align="center">二、社会生活环境参数（申请人填写）</td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" align="center">联系人</td>
                                    </tr>
                                    <tr>
                                        <td align="center" width="120px">
                                            <font style="color:red">*</font>
                                            对象
                                        </td>
                                        <td align="center" width="140px">姓名</td>
                                        <td colspan="2" align="center">与老人关系</td>
                                        <td colspan="2" align="center">联系方式</td>
                                        <td colspan="2" align="center">是否有老人钥匙</td>
                                    </tr>
                                    <tr>
                                        <td align="center" width="120px">
                                            联系人1
                                            <br/>
                                            （直系亲属）
                                        </td>
                                        <td align="center">
                                            <input type="text" class="form-control" name="linkManName1"
                                                   value="${apply.linkManName1}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input type="text" class="form-control" name="linkManRelat1"
                                                   value="${apply.linkManRelat1}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input type="text" class="form-control" name="linkManLink1"
                                                   value="${apply.linkManLink1}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input id="linkManKey11" type="radio" name="linkManKey1" value="1"
                                                   <c:if test="${apply.linkManKey1==1}">checked</c:if>
                                            />
                                            <label for="linkManKey11">有</label>
                                            <input id="linkManKey12" type="radio" name="linkManKey1" value="2"
                                                   <c:if test="${apply.linkManKey1==2}">checked</c:if>
                                            />
                                            <label for="linkManKey12">无</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">联系人2</td>
                                        <td align="center">
                                            <input type="text" class="form-control" name="linkManName2"
                                                   value="${apply.linkManName2}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input type="text" class="form-control" name="linkManRelat2"
                                                   value="${apply.linkManRelat2}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input type="text" class="form-control" name="linkManLink2"
                                                   value="${apply.linkManLink2}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input id="linkManKey21" type="radio" name="linkManKey2" value="1"
                                                   <c:if test="${apply.linkManKey2==1}">checked</c:if>
                                            />
                                            <label for="linkManKey21">有</label>
                                            <input id="linkManKey22" type="radio" name="linkManKey2" value="2"
                                                   <c:if test="${apply.linkManKey2==2}">checked</c:if>
                                            />
                                            <label for="linkManKey22">无</label>
                                        </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">联系人3</td>
                                        <td align="center">
                                            <input type="text" class="form-control" name="linkManName3"
                                                   value="${apply.linkManName3}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input type="text" class="form-control" name="linkManRelat3"
                                                   value="${apply.linkManRelat3}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input type="text" class="form-control" name="linkManLink3"
                                                   value="${apply.linkManLink3}"
                                                   style="width: 100%"/>
                                        </td>
                                        <td colspan="2" align="center">
                                            <input id="linkManKey31" type="radio" name="linkManKey3" value="1"
                                                   <c:if test="${apply.linkManKey3==1}">checked</c:if>
                                            />
                                            <label for="linkManKey31">有</label>
                                            <input id="linkManKey32" type="radio" name="linkManKey3" value="2"
                                                   <c:if test="${apply.linkManKey3==2}">checked</c:if>
                                            />
                                            <label for="linkManKey32">无</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">原职业</td>
                                        <td colspan="7" align="left">
                                            <input id="jobDictId1" type="radio" name="jobDictId" value="1"
                                                   <c:if test="${apply.jobDictId==1}">checked</c:if>
                                            />
                                            <label for="jobDictId1">公务员</label>
                                            <input id="jobDictId2" type="radio" name="jobDictId" value="2"
                                                   <c:if test="${apply.jobDictId==2}">checked</c:if>
                                            />
                                            <label for="jobDictId2">教师</label>
                                            <input id="jobDictId3" type="radio" name="jobDictId" value="3"
                                                   <c:if test="${apply.jobDictId==3}">checked</c:if>
                                            />
                                            <label for="jobDictId3">军人</label>
                                            <input id="jobDictId4" type="radio" name="jobDictId" value="4"
                                                   <c:if test="${apply.jobDictId==4}">checked</c:if>
                                            />
                                            <label for="jobDictId4">事业职工</label>
                                            <input id="jobDictId5" type="radio" name="jobDictId" value="5"
                                                   <c:if test="${apply.jobDictId==5}">checked</c:if>
                                            />
                                            <label for="jobDictId5">企业职工</label>
                                            <input id="jobDictId6" type="radio" name="jobDictId" value="6"
                                                   <c:if test="${apply.jobDictId==6}">checked</c:if>
                                            />
                                            <label for="jobDictId6">农民</label>
                                            <input id="jobDictId7" type="radio" name="jobDictId" value="7"
                                                   <c:if test="${apply.jobDictId==7}">checked</c:if>
                                            />
                                            <label for="jobDictId7">商人</label>
                                            <input id="jobDictId8" type="radio" name="jobDictId" value="8"
                                                   <c:if test="${apply.jobDictId==8}">checked</c:if>
                                            />
                                            <label for="jobDictId8">无固定职业</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">收入来源</td>
                                        <td colspan="7" align="left">
                                            <input type="checkbox" name="incomeSource" value="1"/>
                                            机关事业单位离休金
                                            <input type="checkbox" name="incomeSource" value="2"/>
                                            机关事业单位退休金
                                            <input type="checkbox" name="incomeSource" value="3"/>
                                            养老金
                                            <input type="checkbox" name="incomeSource" value="4"/>
                                            三无下放人员补贴
                                            <input type="checkbox" name="incomeSource" value="5"/>
                                            三线老军工补贴
                                            <br/>
                                            <input type="checkbox" name="incomeSource" value="6"/>
                                            城乡居民养老保险
                                            <input type="checkbox" name="incomeSource" value="7"/>
                                            供养人员补贴
                                            <input type="checkbox" name="incomeSource" value="8"/>
                                            低保金
                                            <input type="checkbox" name="incomeSource" value="9"/>
                                            拆迁补助（ 元/月）
                                            <br/>
                                            <input type="checkbox" name="incomeSource" value="10"/>
                                            失地农民补助
                                            <input type="checkbox" name="incomeSource" value="11"/>
                                            其他
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            子女状况
                                        </td>
                                        <td colspan="2" align="center" width="350px">
                                            <input id="childrenDictId1" type="radio" name="childrenDictId" value="1"
                                                   <c:if test="${apply.childrenDictId==1}">checked</c:if>
                                            />
                                            <label for="childrenDictId1">有子女</label>
                                            <input id="childrenDictId2" type="radio" name="childrenDictId" value="2"
                                                   <c:if test="${apply.childrenDictId==2}">checked</c:if>
                                            />
                                            <label for="childrenDictId2">未生育子女</label>
                                            <input id="childrenDictId3" type="radio" name="childrenDictId" value="3"
                                                   <c:if test="${apply.childrenDictId==3}">checked</c:if>
                                            />
                                            <label for="childrenDictId3">失去独生子女</label>
                                        </td>
                                        <td colspan="2" align="center">
                                            <font style="color:red">*</font>
                                            医疗类别
                                        </td>
                                        <td colspan="3" align="center">
                                            <input type="checkbox" name="medicalType" value="1"/>
                                            公费
                                            <input type="checkbox" name="medicalType" value="2"/>
                                            职工医保
                                            <input type="checkbox" name="medicalType" value="3"/>
                                            居民医保
                                            <input type="checkbox" name="medicalType" value="4"/>
                                            新农合
                                            <input type="checkbox" name="medicalType" value="5"/>
                                            自费
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            居住状况
                                        </td>
                                        <td align="center">
                                            <input id="residenceDictId1" type="radio" name="residenceDictId" value="1"
                                                   <c:if test="${apply.residenceDictId==1}">checked</c:if>
                                            />
                                            <label for="residenceDictId1">合居</label>
                                            <br/>
                                            <input id="residenceDictId2" type="radio" name="residenceDictId" value="2"
                                                   <c:if test="${apply.residenceDictId==2}">checked</c:if>
                                            />
                                            <label for="residenceDictId2">独居</label>
                                            <br/>
                                            <input id="residenceDictId3" type="radio" name="residenceDictId" value="3"
                                                   <c:if test="${apply.residenceDictId==3}">checked</c:if>
                                            />
                                            <label for="residenceDictId3">空巢</label>
                                        </td>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            住房性质
                                        </td>
                                        <td align="center" colspan="2">
                                            <input id="houseTypeDictId1" type="radio" name="houseTypeDictId" value="1"
                                                   <c:if test="${apply.houseTypeDictId==1}">checked</c:if>
                                            />
                                            <label for="houseTypeDictId1">有产权</label>
                                            <br/>
                                            <input id="houseTypeDictId2" type="radio" name="houseTypeDictId" value="2"
                                                   <c:if test="${apply.houseTypeDictId==2}">checked</c:if>
                                            />
                                            <label for="houseTypeDictId2">无产权</label>
                                        </td>
                                        <td align="center">居室</td>
                                        <td colspan="2" align="center">
                                            <input id="roomTypeDictId1" type="radio" name="roomTypeDictId" value="1"
                                                   <c:if test="${apply.roomTypeDictId==1}">checked</c:if>
                                            />
                                            <label for="roomTypeDictId1">一居</label>
                                            <input id="roomTypeDictId2" type="radio" name="roomTypeDictId" value="2"
                                                   <c:if test="${apply.roomTypeDictId==2}">checked</c:if>
                                            />
                                            <label for="roomTypeDictId2">二居</label>
                                            <br/>
                                            <input id="roomTypeDictId3" type="radio" name="roomTypeDictId" value="3"
                                                   <c:if test="${apply.roomTypeDictId==3}">checked</c:if>
                                            />
                                            <label for="roomTypeDictId3">三居</label>
                                            <input id="roomTypeDictId4" type="radio" name="roomTypeDictId" value="4"
                                                   <c:if test="${apply.roomTypeDictId==4}">checked</c:if>
                                            />
                                            <label for="roomTypeDictId4">其他</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            居住条件
                                        </td>
                                        <td align="center" width="175px">
                                            楼层电梯：
                                            <br/>
                                            <input id="hasElevator1" type="radio" name="hasElevator" value="1"
                                                   <c:if test="${apply.hasElevator==1}">checked</c:if>
                                            />
                                            <label for="hasElevator1">有</label>
                                            <input id="hasElevator2" type="radio" name="hasElevator" value="2"
                                                   <c:if test="${apply.hasElevator==2}">checked</c:if>
                                            />
                                            <label for="hasElevator2">无</label>
                                        </td>
                                        <td colspan="3" align="center">
                                            <font style="color:red">*</font>
                                            居住楼层（楼层无电梯的）：
                                            <br/>
                                            <input id="floor1" type="radio" name="floor" value="1"
                                                   <c:if test="${apply.floor==1}">checked</c:if>
                                            />
                                            <label for="floor1">一层</label>
                                            <input id="floor2" type="radio" name="floor" value="2"
                                                   <c:if test="${apply.floor==2}">checked</c:if>
                                            />
                                            <label for="floor2">二层</label>
                                            <input id="floor3" type="radio" name="floor" value="3"
                                                   <c:if test="${apply.floor==3}">checked</c:if>
                                            />
                                            <label for="floor3">三层以上</label>
                                        </td>
                                        <td colspan="2" align="center">
                                            室内厕所
                                            <br/>
                                            <input id="hasToilet1" type="radio" name="hasToilet" value="1"
                                                   <c:if test="${apply.hasToilet==1}">checked</c:if>
                                            />

                                            <label for="hasToilet1">有</label>
                                            <input id="hasToilet2" type="radio" name="hasToilet" value="2"
                                                   <c:if test="${apply.hasToilet==2}">checked</c:if>
                                            />
                                            <label for="hasToilet2">无</label>
                                        </td>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            室内洗浴设备
                                            <br/>
                                            <input id="hasBath1" type="radio" name="hasBath" value="1"
                                                   <c:if test="${apply.hasBath==1}">checked</c:if>
                                            />
                                            <label for="hasBath1">有</label>
                                            <input id="hasBath2" type="radio" name="hasBath" value="2"
                                                   <c:if test="${apply.hasBath==2}">checked</c:if>
                                            />
                                            <label for="hasBath2">无</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">原照料情况</td>
                                        <td colspan="7" align="left">
                                            <input type="checkbox" name="careCondition" value="1"/>
                                            自我照料
                                            <input type="checkbox" name="careCondition" value="2"/>
                                            配偶照顾&nbsp;
                                            <input type="checkbox" name="careCondition" value="3"/>
                                            子女照顾
                                            <input type="checkbox" name="careCondition" value="4"/>
                                            自购家政服务
                                            <input type="checkbox" name="careCondition" value="5"/>
                                            送餐服务
                                            <input type="checkbox" name="careCondition" value="6"/>
                                            互助门铃
                                            <br/>
                                            政府购买居家养老服务： &nbsp;
                                            <input type="checkbox" name="careCondition" value="7"/>
                                            居家照料
                                            <input type="checkbox" name="careCondition" value="8"/>
                                            紧急呼叫终端
                                            <input type="checkbox" name="careCondition" value="9"/>
                                            老年人意外伤害保险
                                            <input type="checkbox" name="careCondition" value="10"/>
                                            其他
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            服务需求
                                        </td>
                                        <td colspan="7" align="left">
                                            <input type="checkbox" name="serviceNeed" value="1"/>
                                            家务料理 &nbsp;
                                            <input type="checkbox" name="serviceNeed" value="2"/>
                                            代购物品
                                            <input type="checkbox" name="serviceNeed" value="3"/>
                                            康复保健&nbsp;
                                            <input type="checkbox" name="serviceNeed" value="4"/>
                                            紧急呼叫
                                            <input type="checkbox" name="serviceNeed" value="5"/>
                                            心理关爱
                                            <input type="checkbox" name="serviceNeed" value="6"/>
                                            法律援助
                                            <input type="checkbox" name="serviceNeed" value="7"/>
                                            文化娱乐
                                            <br/>
                                            <input type="checkbox" name="serviceNeed" value="8"/>
                                            助餐
                                            <input type="checkbox" name="serviceNeed" value="9"/>
                                            送餐 &nbsp;
                                            <input type="checkbox" name="serviceNeed" value="10"/>
                                            陪聊
                                            <input type="checkbox" name="serviceNeed" value="11"/>
                                            陪住
                                            <input type="checkbox" name="serviceNeed" value="12"/>
                                            陪外出 &nbsp;
                                            <input type="checkbox" name="serviceNeed" value="13"/>
                                            陪旅游
                                            <input type="checkbox" name="serviceNeed" value="14"/>
                                            日托
                                            <input type="checkbox" name="serviceNeed" value="15"/>
                                            入住老年人福利机构
                                            <input type="checkbox" name="serviceNeed" value="15"/>
                                            其他
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">患病情况</td>
                                        <td colspan="7" align="left">
                                            重 病:
                                            <input type="checkbox" name="sickenDictId" value="1"/>
                                            恶性肿瘤
                                            <input type="checkbox" name="sickenDictId" value="2"/>
                                            尿毒症透析&nbsp;&nbsp;
                                            <input type="checkbox" name="sickenDictId" value="3"/>
                                            器官移植（含手术后的抗排异治疗）&nbsp;&nbsp;
                                            <input type="checkbox" name="sickenDictId" value="4"/>
                                            白血病
                                            <br/>
                                            <input type="checkbox" name="sickenDictId" value="5"/>
                                            急性心肌梗塞
                                            <input type="checkbox" name="sickenDictId" value="6"/>
                                            脑中风
                                            <input type="checkbox" name="sickenDictId" value="7"/>
                                            急性坏死性胰腺炎&nbsp;
                                            <input type="checkbox" name="sickenDictId" value="8"/>
                                            脑外伤 &nbsp;
                                            <input type="checkbox" name="sickenDictId" value="9"/>
                                            主动脉手术
                                            <input type="checkbox" name="sickenDictId" value="10"/>
                                            冠状动脉旁路手术
                                            <br/>
                                            <input type="checkbox" name="sickenDictId" value="11"/>
                                            慢性肾功能性衰竭
                                            <input type="checkbox" name="sickenDictId" value="12"/>
                                            急慢性重症肝炎
                                            <input type="checkbox" name="sickenDictId" value="13"/>
                                            危及生命的良性脑瘤 &nbsp;
                                            <input type="checkbox" name="sickenDictId" value="14"/>
                                            重症糖尿病&nbsp;
                                            <input type="checkbox" name="sickenDictId" value="15"/>
                                            消化道出血
                                            <br/>
                                            <input type="checkbox" name="sickenDictId" value="16"/>
                                            系统性红斑狼疮
                                            <input type="checkbox" name="sickenDictId" value="17"/>
                                            慢性再生障碍性贫血&nbsp; &nbsp; &nbsp;&nbsp;
                                            <input type="checkbox" name="sickenDictId" value="18"/>
                                            血友病 &nbsp;&nbsp;
                                            <input type="checkbox" name="sickenDictId" value="19"/>
                                            重症精神病。
                                            <br/>
                                            慢性病：
                                            <input type="checkbox" name="sickenDictId" value="20"/>
                                            高血压&nbsp;
                                            <input type="checkbox" name="sickenDictId" value="21"/>
                                            冠心病
                                            <input type="checkbox" name="sickenDictId" value="22"/>
                                            前列腺增生 &nbsp;
                                            <input type="checkbox" name="sickenDictId" value="23"/>
                                            糖尿病
                                            <input type="checkbox" name="sickenDictId" value="23"/>
                                            其他
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            心理状况
                                        </td>
                                        <td colspan="7">
                                            <input id="psychologicDictId1" type="radio" name="psychologicDictId"
                                                   value="1"
                                                   <c:if test="${apply.psychologicDictId==1}">checked</c:if>
                                            />
                                            <label for="psychologicDictId1">正常</label>
                                            <input id="psychologicDictId2" type="radio" name="psychologicDictId"
                                                   value="2"
                                                   <c:if test="${apply.psychologicDictId==2}">checked</c:if>
                                            />
                                            <label for="psychologicDictId2">偶尔有孤独感</label>
                                            <input id="psychologicDictId3" type="radio" name="psychologicDictId"
                                                   value="3"
                                                   <c:if test="${apply.psychologicDictId==3}">checked</c:if>
                                            />
                                            <label for="psychologicDictId3">经常觉得孤独</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font style="color:red">*</font>
                                            社会活动情况
                                        </td>
                                        <td align="center" colspan="2">
                                            <input id="socialActiDictId1" type="radio" name="socialActiDictId" value="1"
                                                   <c:if test="${apply.socialActiDictId==1}">checked</c:if>
                                            />
                                            <label for="socialActiDictId1">经常</label>
                                            <input id="socialActiDictId2" type="radio" name="socialActiDictId" value="2"
                                                   <c:if test="${apply.socialActiDictId==2}">checked</c:if>
                                            />
                                            <label for="socialActiDictId2">偶尔</label>
                                            <input id="socialActiDictId3" type="radio" name="socialActiDictId" value="3"
                                                   <c:if test="${apply.socialActiDictId==3}">checked</c:if>
                                            />
                                            <label for="socialActiDictId3">从不</label>
                                        </td>
                                        <td colspan="5">
                                            社会活动类型：
                                            <input type="checkbox" name="saTypeDictId" value="1"/>
                                            文艺类
                                            <input type="checkbox" name="saTypeDictId" value="2"/>
                                            教育类
                                            <input type="checkbox" name="saTypeDictId" value="3"/>
                                            健身类
                                            <input type="checkbox" name="saTypeDictId" value="4"/>
                                            慈善类
                                            <input type="checkbox" name="saTypeDictId" value="5"/>
                                            经济类
                                            <input type="checkbox" name="saTypeDictId" value="6"/>
                                            宗教类
                                            <input type="checkbox" name="saTypeDictId" value="7"/>
                                            其他
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table2">
                                    <tr>
                                        <td align="left">
                                            <font style="color:red">*</font>
                                            街道审定人：
                                            <input type="text" name="operator" id="operator" value="${apply.operator}"
                                                   size="15"
                                                   class="input"/>
                                            日期：
                                            <input type="text" name="estimateDate" value="${apply.estimateDate}"
                                                   size="15"
                                                   class="input date-picker" data-date-format="yyyy-mm-dd"
                                                   readonly="readonly"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br/>
                            <div id="elderAssessInfo">
                                <table width="100%" border="0" class="table4" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="6" align="center" rowspan="2">一、生活自理能力参数</td>
                                    </tr>
                                    <tr/>
                                    <tr>
                                        <td width="190" align="center">项目</td>
                                        <td width="500" colspan="3" align="center">描述</td>
                                        <td width="120">&nbsp;</td>
                                        <td width="135">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">吃饭</td>
                                        <td colspan="3" align="center">能完成入口、咀嚼、吞咽等步骤</td>
                                        <td align="center">
                                            <select id="attr1" name="attr1" onChange="getScore1()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr1==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr1==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr1==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr1==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score01" name="score01" value="${apply.score01}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">穿衣</td>
                                        <td colspan="3" align="center">完成取衣、穿衣、系带、扣扣子等</td>
                                        <td align="center">
                                            <select id="attr2" name="attr2" onChange="getScore2()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr2==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr2==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr2==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr2==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score02" name="score02" value="${apply.score02}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">如厕</td>
                                        <td colspan="3" align="center">如厕、便后能自理及整理衣裤</td>
                                        <td align="center">
                                            <select id="attr3" name="attr3" onChange="getScore3()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr3==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr3==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr3==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr3==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score03" name="score03" value="${apply.score03}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">室内走动</td>
                                        <td colspan="3" align="center">外出、上下楼正常</td>
                                        <td align="center">
                                            <select id="attr4" name="attr4" onChange="getScore4()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr4==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr4==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr4==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr4==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score04" name="score04" value="${apply.score04}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">洗澡</td>
                                        <td colspan="3" align="center">能完成洗澡的全部过程</td>
                                        <td align="center">
                                            <select id="attr5" name="attr5" onChange="getScore5()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr5==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr5==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr5==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr5==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score05" name="score05" value="${apply.score05}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">控制大小便</td>
                                        <td colspan="3" align="center">能控制大小便</td>
                                        <td align="center">
                                            <select id="attr6" name="attr6" onChange="getScore6()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr6==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr6==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr6==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr6==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score06" name="score06" value="${apply.score06}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="center">二、认知能力参数</td>
                                    </tr>
                                    <tr>
                                        <td align="center">项目</td>
                                        <td colspan="3" align="center">描述</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">近期记忆</td>
                                        <td colspan="3" align="center">能回想近期发生的事情</td>
                                        <td align="center">
                                            <select id="attr7" name="attr7" onChange="getScore7()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr7==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr7==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr7==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr7==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score07" name="score07" value="${apply.score07}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">程序记忆</td>
                                        <td colspan="3" align="center">完成洗衣、做饭、做菜等</td>
                                        <td align="center">
                                            <select id="attr8" name="attr8" onChange="getScore8()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr8==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr8==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr8==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr8==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score08" name="score08" value="${apply.score08}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">定向记忆</td>
                                        <td colspan="3" align="center">外出、回家不迷路</td>
                                        <td align="center">
                                            <select id="attr9" name="attr9" onChange="getScore9()" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr9==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr9==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr9==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr9==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score09" name="score09" value="${apply.score09}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">判断能力</td>
                                        <td colspan="3" align="center">对日常事物的判断不违背常理</td>
                                        <td align="center">
                                            <select id="attr10" name="attr10" onChange="getScore10()"
                                                    disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr10==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr10==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr10==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr10==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score10" name="score10" value="${apply.score10}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="center">三、情绪行为参数</td>
                                    </tr>
                                    <tr>
                                        <td align="center">项目</td>
                                        <td colspan="3" align="center">描述</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">情绪</td>
                                        <td colspan="3" align="center">与人和睦相处，不偏激</td>
                                        <td align="center">
                                            <select id="attr11" name="attr11" onChange="getScore11()"
                                                    disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr11==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr11==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr11==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr11==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score11" name="score11" value="${apply.score11}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">行为</td>
                                        <td colspan="3" align="center">动作行为表现是否异常</td>
                                        <td align="center">
                                            <select id="attr12" name="attr12" onChange="getScore12()"
                                                    disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr12==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr12==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr12==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr12==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score12" name="score12" value="${apply.score12}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">沟通</td>
                                        <td colspan="3" align="center">在交流中能否互相理解</td>
                                        <td align="center">
                                            <select id="attr13" name="attr13" onChange="getScore13()"
                                                    disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr13==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr13==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr13==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr13==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                            <input type="hidden" name="attr13" value=""/>
                                        </td>
                                        <td>
                                            <input id="score13" name="score13" value="${apply.score13}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="center">四、视、听觉</td>
                                    </tr>
                                    <tr>
                                        <td align="center">项目</td>
                                        <td colspan="3" align="center">描述</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">视觉</td>
                                        <td colspan="3" align="center">能正常看电视、读报等</td>
                                        <td align="center">
                                            <select id="attr14" name="attr14" onChange="getScore14()"
                                                    disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr14==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr14==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr14==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr14==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score14" name="score14" value="${apply.score14}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">听觉</td>
                                        <td colspan="3" align="center">能正常接听电话、交谈</td>
                                        <td align="center">
                                            <select id="attr15" name="attr15" onChange="getScore15()"
                                                    disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="b_text" value="">请选择</option>
                                                <option status="b_text" value="1"
                                                        <c:if test="${apply.attr15==1}">selected</c:if>
                                                >正常
                                                </option>
                                                <option status="b_text" value="2"
                                                        <c:if test="${apply.attr15==2}">selected</c:if>
                                                >轻丧失
                                                </option>
                                                <option status="b_text" value="3"
                                                        <c:if test="${apply.attr15==3}">selected</c:if>
                                                >中丧失
                                                </option>
                                                <option value="4"
                                                        <c:if test="${apply.attr15==4}">selected</c:if>
                                                >完全丧失
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="score15" name="score15" value="${apply.score15}"
                                                   readonly="readonly"
                                                   style=";background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table2">
                                    <tr>
                                        <td align="left">
                                            能力评估分值:
                                            <input type="text" name="resultScore" id="resultScore" size="15"
                                                   class="input"
                                                   value="${apply.resultScore}" readonly="readonly"/>
                                            分， 属于：
                                            <input type="radio" name="resultDictId" id="pf1" value="1"
                                                   disabled="disabled"
                                                   <c:if test="${apply.resultDictId==1}">checked</c:if>
                                            />
                                            自理
                                            <input type="radio" name="resultDictId" id="pf2" value="2"
                                                   disabled="disabled"
                                                   <c:if test="${apply.resultDictId==2}">checked</c:if>
                                            />
                                            半失能
                                            <input type="radio" name="resultDictId" id="pf3" value="3"
                                                   disabled="disabled"
                                                   <c:if test="${apply.resultDictId==3}">checked</c:if>
                                            />
                                            失能
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table2">
                                    <tr>
                                        <td align="left">
                                            <font style="color:red">*</font>
                                            本人（或代理人）：
                                            <input type="text" id="familyName" name="familyName" size="15" class="input"
                                                   value="${apply.familyName}" />
                                            日期：
                                            <input type="text" name="familyDate" value="${apply.familyDate}" value="" size="15" class="input date-picker" data-date-format="yyyy-mm-dd" readonly="readonly"/>
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table2">
                                    <tr>
                                        <td align="left">
                                            <font style="color:red">*</font>
                                            评估员1：
                                            <input type="text" name="workerName1" id="workerName1"
                                                   value="${apply.workerName1}" size="15"
                                                   class="input" readonly="readonly" style=""/>
                                            <font style="color:red;background-color: #f7f7f7;">*</font>
                                            工作证号
                                            <input type="text" name="workerCard1" id="workerCard1"
                                                   value="${apply.workerCard1}" size="15"
                                                   class="input" readonly="readonly" style=""/>
                                            <font style="color:red;background-color: #f7f7f7;">*</font>
                                            日期
                                            <input type="text" name="workerDate1" id="workerDate1"
                                                   value="${apply.workerDate1}" size="8"
                                                   class="input date-picker" data-date-format="yyyy-mm-dd"
                                                   readonly="readonly"
                                                   style="width: 100px;background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table2">
                                    <tr>
                                        <td align="left">
                                            <font style="color:red">*</font>
                                            评估员2：
                                            <input type="text" name="workerName2" id="workerName2"
                                                   value="${apply.workerName2}" size="15"
                                                   class="input" readonly="readonly"/>
                                            <font style="color:red;background-color: #f7f7f7;">*</font>
                                            工作证号
                                            <input type="text" name="workerCard2" id="workerCard2"
                                                   value="${apply.workerCard2}" size="15"
                                                   class="input" readonly="readonly"/>
                                            <font style="color:red;background-color: #f7f7f7;">*</font>
                                            日期
                                            <input type="text" name="workerDate2" id="workerDate2"
                                                   value="${apply.workerDate2}" size="8"
                                                   class="input date-picker" data-date-format="yyyy-mm-dd"
                                                   readonly="readonly"
                                                   style="width: 100px;background-color: #f7f7f7;"/>
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <table width="100%" border="0" class="table4" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">区民政局制定信息呼叫终端</td>
                                        <td colspan="5" align="center">
                                            <input type="radio" name="callerType" value="1" class="input"
                                                   style="border:none;background-color: #f7f7f7;" disabled="disabled"
                                                   <c:if test="${apply.callerType==1}">checked</c:if>
                                            />
                                            固定终端
                                            <input type="radio" name="callerType" value="2" class="input"
                                                   style="border:none;background-color: #f7f7f7;" disabled="disabled"
                                                   <c:if test="${apply.callerType==2}">checked</c:if>
                                            />
                                            移动终端
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            服务商
                                            <select name="callerLabel" disabled="disabled"
                                                    style=";background-color: #f7f7f7;">
                                                <option status="c_text" value="">--请选择--</option>
                                                <option status="c_text" value="1"
                                                        <c:if test="${apply.callerLabel==1}">selected</c:if>
                                                >12349
                                                </option>
                                                <option status="c_text" value="2"
                                                        <c:if test="${apply.callerLabel==2}">selected</c:if>
                                                >安康通
                                                </option>
                                                <option status="c_text" value="3"
                                                        <c:if test="${apply.callerLabel==3}">selected</c:if>
                                                >康惠通
                                                </option>
                                                <option status="c_text" value="4"
                                                        <c:if test="${apply.callerLabel==4}">selected</c:if>
                                                >奥维
                                                </option>
                                                <option status="c_text" value="5"
                                                        <c:if test="${apply.callerLabel==5}">selected</c:if>
                                                >96180
                                                </option>
                                                <option status="c_text" value="6"
                                                        <c:if test="${apply.callerLabel==6}">selected</c:if>
                                                >平安保
                                                </option>
                                                <option status="c_text" value="7"
                                                        <c:if test="${apply.callerLabel==7}">selected</c:if>
                                                >962069
                                                </option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                        <div class="tab-content" style="margin-top: 20px">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1"
                                           style="text-decoration: none"
                                           href="#accordion1_1">
                                            处理过程 </a>
                                    </h4>
                                </div>
                                <div id="accordion1_1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tbody id="apply_handle_list">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <div class="modal fade" id="docModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title"
                            id="myModalLabel">文书列表</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-bordered table-hover"
                        >
                            <thead>
                            <tr role="row" class="heading">
                                <th width="10%">
                                    序号
                                </th>
                                <th width="60%">
                                    文书名称
                                </th>
                                <th width="30%">
                                    文书时间
                                </th>
                            </tr>
                            </thead>
                            <tbody id="apply_doc_list">
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn default" data-dismiss="modal">关闭
                        </button>
                    </div>
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
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/elderly/elderly_govbuy_info.js?v=2.7"
                type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                //checkbox初始化
                setCheckbocCheck("${apply.elderTypeDictIds}", document.getElementsByName("elderTypeDictIds"));
                setCheckbocCheck("${apply.saTypeDictId}", document.getElementsByName("saTypeDictId"));
                setCheckbocCheck("${apply.sickenDictId}", document.getElementsByName("sickenDictId"));
                setCheckbocCheck("${apply.incomeSource}", document.getElementsByName("incomeSource"));
                setCheckbocCheck("${apply.medicalType}", document.getElementsByName("medicalType"));
                setCheckbocCheck("${apply.careCondition}", document.getElementsByName("careCondition"));
                setCheckbocCheck("${apply.serviceNeed}", document.getElementsByName("serviceNeed"));
                <c:if test="${apply.status>=5}">
                $("input").attr("readonly", "readonly");
                $("select").attr("readonly", "readonly");
                </c:if>

                <c:if test="${apply.status==5}">
                $("#elderAssessInfo select").removeAttr("disabled");
                $("#elderAssessInfo input").removeAttr("disabled");
                $("#elderAssessInfo input").removeAttr("readonly");
                </c:if>

                Metronic.init();
                Layout.init();
                $('.date-picker').datepicker({
                    rtl: Metronic.isRTL(),
                    orientation: "left",
                    autoclose: true
                });
                ElderMsgGovBuyInfo.init("${apply.status}");
            });
            function setCheckbocCheck(scopes, obj2) {
                var scope = scopes.split(",");
                if (scopes.length > 0) {
                    for (var i = 0; i < obj2.length; i++) {
                        for (var j = 0; j < scopes.length; j++) {
                            if (obj2[i].value == scope[j]) {
                                obj2[i].checked = true;
                            }
                        }
                    }
                }
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
