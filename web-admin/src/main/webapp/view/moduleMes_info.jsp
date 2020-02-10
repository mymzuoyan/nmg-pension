<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/7
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <title>${moduleMes.module}</title>
    <link href="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/style.css?v=2.4"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/comment.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/view/css/swiper-3.4.0.min.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/favicon.ico"/>
    <style>
        .news_list_con {
        }

        .title {
            border: 0px
        }

        .list_con {
            padding: 10px;
            width: 100%;
            overflow: hidden;
        }

        .list_con li {
            line-height: 30px;
            height: 30px;
        }

        .list_con a {
            color: #333;
            display: inline-block;
            max-width: 240px;
            vertical-align: middle;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            cursor: pointer;
        }
        sup{
            top:0
        }

        #jiathis_webchat
        {
            text-align: center;
        }
    </style>
</head>
<body>
<!--头部-->
<!--头部  begin-->
<jsp:include page="view_header.jsp"/>
<!--头部  end-->
<section id="main_con" class="content_box">
    <!--右侧内容star-->
    <div id="news_rt_con" style="width: 860px;float: left">
        <div class="news_list_con_wrap" style="margin-bottom: 10px">
            <div class="news_list_con_head">
                <span style="font-size: 18px;width: 170px">${moduleMes.module}</span>
                <ul>
                    <li><img src="${pageContext.request.contextPath }/assets/view/images/home_ico_03.png" alt=""
                             style="    margin-top: -4px;"/></li>
                    <li><a href="${pageContext.request.contextPath }/home.html">网站首页&gt;</a></li>
                    <li><a href="">${moduleMes.module}</a></li>
                </ul>
            </div>
            <!--新闻详情-->
            <div class="news_list_con news_detalis" style="padding: 0 22px">
                <h2>${moduleMes.title}</h2>
                <h4>发布时间：<fmt:formatDate value="${moduleMes.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                    作者：${moduleMes.creatorName}    </h4>
            </div>
            <div id="content"
                 style="padding: 0 22px;margin-bottom: 10px; ">${moduleMes.content}</div>
            <nav id="navigationNav" aria-label="Page navigation"
                 style="display: none;text-align: right;padding-right: 20px">
                <ul class="pagination pagination-sm" id="articlePages">
                </ul>
            </nav>
            <div style="text-align: right;height: 20px">
                <div id="ckepop" style="float: right;margin-right: 20px">
                    <span class="jiathis_txt">分享到：</span>
                    <a class="jiathis_button_weixin" onclick="javascript:bShare.share(event,'weixin',0);return false;" style="cursor:pointer;color:#2e3192;">微信</a>
                    <a class="jiathis_button_qq" onclick="javascript:bShare.share(event,'qqim',0);return false;" style="cursor:pointer;color:#2e3192;">QQ好友</a>
                    <a class="jiathis_button_tsina" onclick="javascript:bShare.share(event,'sinaminiblog',0);return false;" style="cursor:pointer;color:#2e3192;">微博</a>
                    <a class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" onclick="javascript:bShare.more(event);return false;" style="cursor:pointer;color:#2e3192;" >更多</a>
                    <a class="jiathis_counter_style"></a>
                </div>
                <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1" charset="utf-8"></script>
            </div>
            <div style="padding: 0 22px;margin-bottom: 20px;">
                <p>
                    上一篇：
                    <c:if test="${not empty topModuleMes}">
                        <a href="${pageContext.request.contextPath }/moduleMes/${topModuleMes.id}"> ${topModuleMes.title}</a>
                    </c:if>
                    <c:if test="${ empty topModuleMes}">
                        无
                    </c:if>
                </p>
                <p>
                    下一篇：
                    <c:if test="${not empty lastModuleMes}">
                        <a href="${pageContext.request.contextPath }/moduleMes/${lastModuleMes.id}"> ${lastModuleMes.title}</a>
                    </c:if>
                    <c:if test="${ empty lastModuleMes}">
                        无
                    </c:if>
                </p>
            </div>
        </div>
        <c:if test="${moduleMes.moduleId==7}">
            <div class="panel panel-default">
                <div class="box-tab">
                    <ul class="oho-comment">
                        <li class="active pull-left" style="border-bottom:3px solid #3189CF">
                            <span data-target="#num_1" data-toggle="tab">评论列表</span>
                        </li>
                    </ul>
                    <hr class="oho-line">
                    <div class="tab-content p_left">
                        <div class="tab-pane active fade in" id="comment-list">

                        </div>
                        <ul class="pagination pagination-sm pull-right" id="comments-paginator">
                        </ul>
                    </div>
                    <div class="reply">
                        <div role="form" class="form-horizontal">
                            <div class="form-group"><h5><a name="commentadd">参与讨论</a></h5></div>
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.login_user}">
                                        <textarea class="form-control" cols="20" rows="3"></textarea>
                                    </c:when>
                                    <c:otherwise>
                                        <textarea class="form-control" cols="20" rows="3" disabled></textarea>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="page-header">
                                <h3>
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.login_user}">
                                            <small>${sessionScope.login_user.nick_name}</small>
                                        </c:when>
                                        <c:otherwise>
                                            <a id="linkSignin" href='#'>登录</a>
                                            <small>后参与讨论</small>
                                        </c:otherwise>
                                    </c:choose>
                                    <button id="btnAddComment" data-loading-text="提交中..."
                                            class="pull-right btn-sm btn-primary">提交评论
                                    </button>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <shiro:hasRole name="suadmin">
                        <input type="hidden" id="canDelete" value="1">
                    </shiro:hasRole>
                </div>
            </div>
        </c:if>
    </div>
    <div id="" style=" float: right;width: 280px;">
        <div style="border: 1px solid  #E5E5E5">
            <div style="border-bottom: 1px solid  #E5E5E5; background-color: rgb(111,193,227); height: 38px;line-height: 38px;">
                <span style="color: white;margin: 0 10px">头条推荐</span>
                <%--<span style="color: #CCCCCC;float: right;font-size: 10px;margin-right: 10px">更多></span>--%>
            </div>
            <div>
                <ul class="list_con" id="topUL">
                </ul>
            </div>
        </div>


        <div style="border: 1px solid  #E5E5E5;margin-top: 20px">
            <div style="border-bottom: 1px solid  #E5E5E5; background-color: rgb(111,193,227); height: 38px;line-height: 38px;">
                <span style="color: white;margin: 0 10px">养老词条</span>
                <span style="color: white;float: right;font-size: 10px;margin-right: 10px"><a
                        href="${pageContext.request.contextPath }/moduleMes/list/4" style="color:white;">更多></a></span>
            </div>
            <div>
                <ul class="list_con" id="yanglaoUl">
                    <li>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--左侧列表end-->
</section>
<%--footer begin--%>
<jsp:include page="view_footer.jsp"></jsp:include>
<%--footer end--%>
</body>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#uuid=<你的UUID>&style=-1"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/global/scripts/jqPaginator.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/moment/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/module_mes_comment.js?=1.1"></script>
<script src="${pageContext.request.contextPath }/assets/view/js/articlePagenation.js?=1.5"></script>
<script>
    var nowPage=1;
var all=1;
    $(function () {
        window.apppath = "${pageContext.request.contextPath }";
        var user_log_state = '${not empty sessionScope.login_user}';
        var mId = '${moduleMes.id}';
        var moduleId = "${moduleMes.moduleId}";
        var uid = '${sessionScope.login_user.uid}';
        if (moduleId == "7") {
            ModuleMesComment.init(mId, user_log_state, uid);
        }
        $("#content img").each(function () {
            try {
                if( !$(this).attr("src").contain("pension"))
                    $(this).attr("src", window.apppath+$(this).attr("src"));
            }catch(e)
            {

            }

        })
        $("#content embed").each(function () {
            var $parent=$(this).parent();
            var height=$(this).attr("height");
            var width=$(this).attr("width");
            var src=$(this).attr("src");
            if(src.indexOf("youku.com")<0)
            {
                $(this).remove();
                var html=['<video width="'+width+'" height="'+width+'" controls>',
                    '  <source src="'+window.apppath+src+'" type="video/mp4">',
                    '  <object data="'+window.apppath+src+'" width="'+width+'" height="'+width+'">',
                    '  </object> ',
                    '</video>'].join("");
                $parent.append(html);
            }
        })


//        //分页
//        var obj = document.getElementById("content");
//        var pages = document.getElementById("articlePages");
//        all = Math.ceil(parseInt(obj.scrollHeight) / parseInt(obj.offsetHeight));
//        //获取总页数，主要是应用scrollHeight
//        if (all > 1) {
//            $("#navigationNav").show();
//            pages.innerHTML += '<li>' +
//                '<a href="javascript:SubPage(\''+(nowPage-1)+'\',this)" aria-label="Previous">' +
//                '<span aria-hidden="true">上一页</span>' +
//                '</a>' +
//                '</li>';
//            for (var i = 1; i <= all; i++) {
//                if (i == 1)
//                    pages.innerHTML += "<li class='active' > <a href=\javascript:showPage('" + i + "',this);> " + i + "</a></li> ";
//                else
//                    pages.innerHTML += "<li> <a href=\javascript:showPage('" + i + "',this);> " + i + "</a></li> ";
//            }
//            pages.innerHTML += '<li>' +
//                '<a href="javascript:AddPage(\'' + (nowPage+1) + '\',this)" aria-label="Previous">' +
//                '<span aria-hidden="true">下一页</span>' +
//                '</a>' +
//                '</li>';
//        }
//        $("#navigationNav ul li a").click(function () {
//        });


        //获取头条推荐
        $.post("${pageContext.request.contextPath }/moduleMes/api/selectPutTopMes", {
            count: 6
        }, function (res) {
            if (res != null) {
                var html = "";
                for (var i in res) {
                    html += createLiHtml(res[i]);
                }
                $("#topUL").html(html);
            }
        }, 'json');


        //获取养老词条
        $.post("${pageContext.request.contextPath }/moduleMes/api/selectTopNByModuleId", {
            count: 6,
            moduleId: 4,
        }, function (res) {
            if (res != null) {
                var html = "";
                for (var i in res) {
                    html += createLiHtml(res[i]);
                }
                $("#yanglaoUl").html(html);
            }
        }, 'json');
    })
    ;

    function createLiHtml(data) {
        var ImgUrl = "";
        var html =
            '<li>' +
            '<img src="' + window.apppath + '/assets/view/images/arrow.png" alt=""><a target="_blank" href="' + window.apppath + '/moduleMes/' + data.id + '">' + data.title + '</a>' + ImgUrl +
            '</li>';
        return html;
    }
    function showPage(pageIndex,self) {
        nowPage=pageIndex;
        var obj = document.getElementById("content");
        obj.scrollTop = (pageIndex - 1) * parseInt(obj.offsetHeight);
        $("#navigationNav ul li").removeClass("active");
        $("#navigationNav ul li").eq(pageIndex).addClass("active");
    }

    function AddPage(pageIndex,self) {
        nowPage++;
        if(nowPage>all)
        {
            nowPage--;
            return false;
        }
        var obj = document.getElementById("content");
        obj.scrollTop = (nowPage - 1) * parseInt(obj.offsetHeight);
        $("#navigationNav ul li").removeClass("active");
        $("#navigationNav ul li").eq(nowPage).addClass("active");
    }
    function SubPage(pageIndex,self) {
        nowPage--;
        if(nowPage<1)
        {
            nowPage++;
            return false;
        }
        var obj = document.getElementById("content");
        obj.scrollTop = (nowPage - 1) * parseInt(obj.offsetHeight);
        $("#navigationNav ul li").removeClass("active");
        $("#navigationNav ul li").eq(nowPage).addClass("active");
    }
    //    导航切换
    $("#main_nav li").click(function () {
        $(this).children("a").attr("class", "active").parent("li")
            .siblings().children("a").removeClass("active");
    });
</script>
</html>
