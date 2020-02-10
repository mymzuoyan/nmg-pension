/**
 * Created by Administrator on 2016/11/7.
 */
var Home = function () {

    var _self = "";
    return {
        nameV: "",
        init: function () {
            _self = this;
            _self.moduleMesInit();
            _self.goodsInit();
            $("#search").click(function () {
                var typeId = $("#typeId").val();
                if (typeId == 0) {
                    ServiceOrgMap.searchArea();
                }
                if (typeId == 9) {
                    InstitutionMap.searchArea();
                }


            });
            //        //获取区级以上的区域
            $.post(window.apppath + "/admin/api/area/getAreaLessLevel", {
                    level: 2
                },
                function (res) {
                    if (res != null) {
                        var area1Html = "";
                        var area2Html = "<option value='-1'>所有区</option>";
                        for (var i in res) {
                            if (res[i].level == 1) {
                                area1Html += '<option value="' + res[i].value + '">' + res[i].name + '</option>';
                            }
                            else {
                                area2Html += '<option value="' + res[i].value + '">' + res[i].name + '</option>';
                            }
                        }
                        $("#area2").html(area2Html);
                    }
                }, 'json');
            $("#loginBtn").on("click",function () {
                if (_self.checkForm()) {
                    $("#hoem_forms").submit();
                }
            })
        },
        moduleMesInit: function () {
            var mesCount = [0, 0, 0, 0, 0, 0];
            $.post(window.apppath + "/moduleMes/api/selectIndexInfo", {}, function (data) {
                if (data != "" && data != null) {
                    for (var i in data) {
                        switch (data[i].module) {
                            case "养老行业动态":
                                if (mesCount[0] == 0) {
                                    $("#xc_news").html(data[i].title);
                                    $("#xc_news_content").html(data[i].startText + '<a id="xc_news_content_a" target="_blank" href="' + window.apppath + '/moduleMes/' + data[i].id + '" style="    width: 60px;">【详细】</a>');
                                    $("#xc_news").click(function () {
                                        window.open($("#xc_news_content_a").attr("href"))
                                    });
                                    mesCount[0]++;
                                    //    服务组织宣传新闻轮播效果
                                    if ($(".js-Carousel").text().length > 18) {
                                        $(".js-Carousel").html(
                                            '<marquee direction="left"  scrollamount="5" scrolldelay="0" loop="-1"  width="440"  height="30">'
                                            + $(".js-Carousel").text()
                                            + '</marquee>');
                                    }
                                }
                                else {
                                    var html = _self.createLiHtml(data[i]);
                                    if(mesCount[0]<=3){
                                        $("#moduleMesUl1").append(html);
                                    }
                                    mesCount[0]++;
                                }
                                break;
                            case "养老聚焦":
                                var html = _self.createLiHtml3(data[i]);
                                $("#moduleMesUl2").append(html);
                                mesCount[1]++;
                                break;
                            case "通知公告":
                                var html = _self.createLiHtml2(data[i]);
                                $("#notice .js-notive").append(html);
                                // $("#carousel-notice .carousel-inner").append(html);
                                break;
                            case "12349动态":
                                var html = _self.createLiHtml4(data[i]);
                                html = html.replace("news_arrow_11.png", "video_icon.jpg");
                                $("#moduleMesUl3").append(html);

                                if (mesCount[2] == 0) {
                                    // var source=
                                }
                                mesCount[2]++;
                                $('.mmul').roundabout({
                                    minScale: 0.9,
                                    autoplay: true,
                                    autoplayDuration: 4000,
                                    autoplayPauseOnHover: true
                                });
                                break;
                            case "老年生活百科":
                                if (mesCount[3] == 0) {
                                    $("#moduleMesUl4_h").html(data[i].title);
                                    $("#moduleMesUl4_content").html('<p style="height: 20px;overflow: hidden">' + data[i].startText + '</p><a target="_blank" href="' + window.apppath + '/moduleMes/' + data[i].id + '" style="    width: 60px;">【详细】</a>');
                                    mesCount[3]++;
                                }
                                else {
                                    var html = _self.createLiHtml(data[i]);
                                    $("#moduleMesUl4").append(html);
                                    mesCount[3]++;
                                }
                                break;
                            case "老年文化知识":
                                if (mesCount[4] == 0) {
                                    $("#moduleMesUl5_h").html(data[i].title);
                                    $("#moduleMesUl5_content").html('<p style="height: 20px;overflow: hidden">' + data[i].startText + '</p><a target="_blank" href="' + window.apppath + '/moduleMes/' + data[i].id + '" style="    width: 60px;">【详细】</a>');
                                    mesCount[4]++;
                                }
                                else {
                                    var html = _self.createLiHtml(data[i]);
                                    $("#moduleMesUl5").append(html);
                                    mesCount[4]++;
                                }
                                break;
                            case "首页轮播":
                                var html = "";
                                if (mesCount[5] == 0) {
                                    html=
                                        '<div class="item active">' +
                                        '<a target="_blank" href="' + window.apppath + '/moduleMes/' + data[i].id + '"><img src="' + window.apppath + data[i].image + '" height="342" width="513" alt="..."/></a>' +
                                        '   <div class="carousel-caption">' +
                                        '       <a target="_blank" href="' + window.apppath + '/moduleMes/' + data[i].id + '"><h4>' + data[i].title + '</h4></a>' +
                                        '    </div>' +
                                        ' </div>';
                                }
                                else {
                                    html=
                                        '<div class="item">' +
                                        '<a target="_blank" href="' + window.apppath + '/moduleMes/' + data[i].id + '"><img src="' + window.apppath + data[i].image + '" height="342" width="513" alt="..."/></a>' +
                                        '   <div class="carousel-caption">' +
                                        '       <a target="_blank" href="' + window.apppath + '/moduleMes/' + data[i].id + '"><h4>' + data[i].title + '</h4></a>' +
                                        '    </div>' +
                                        ' </div>';
                                }
                                mesCount[5]++;
                                $("#home_rota").append(html);
                                break;
                            case "养老服务组织风采":
                                var html = _self.createLiHtml3(data[i]);
                                $("#moduleMesUl7").append(html);
                                mesCount[1]++;
                                break;
                            case "政策类型":
                                var html = _self.createLiHtml3(data[i]);
                                $("#moduleMesUl8").append(html);
                                mesCount[1]++;
                                break;
                        }
                    }
                    _self.initBanner("home_rota", "ps_list");
                    //公告
                    var starNotive = 0;
                    var notiveLen = $('.notice_info').length;
                    var notiveWidth = parseInt($('.notice_info').css('width'));
                    $(".js-notive").css('width', notiveLen * notiveWidth);
//左
                    $('.js-notive-lf').click(function () {
                        var marginLeft = $('.js-notive').css('margin-left');
                        if (marginLeft <= 0 || notiveLen > 1) {
                            if (notiveLen + starNotive > 1) {
                                starNotive--;
                            }
                            $(".js-notive").animate({marginLeft: starNotive * notiveWidth + 'px'});
                        }
                    });
//右
                    $('.js-notice-rt').click(function () {
                        var marginLeft = $('.js-notive').css('margin-left');
                        if (marginLeft < 0 || notiveLen > 1) {
                            if (starNotive < 0) {
                                starNotive++;
                            }
                            $(".js-notive").animate({marginLeft: notiveWidth * starNotive + 'px'});
                        }
                    });

                }
            }, "json");

        },
        goodsInit: function () {
            //老年人产品
            $.post(window.apppath + "/goods/api/selectTopNByClassId", {
                classId: "7",
                count: 4
            }, function (data) {
                var html = "";
                for (var i in data) {
                    html += _self.createGoodsHtml(data[i]);
                }
                $("#goodsUl3").html(html)

            }, 'json');
        },
        ols_hover: function (id, obj) {
            obj.attr("class", "active").siblings().removeClass("active");
            var this_index = obj.index();
            _self.rotahove(id, this_index);
        },
        rotahove: function (id, i) {
            $("#" + id + " li").eq(i).attr("class", "active").siblings().removeClass("active");
        }, initBanner: function (id, listId) {
            //    banenr切换
            var IS_hover = true;
            $("#" + listId + " li").hover(function () {
                _self.ols_hover(id, $(this));
                IS_hover = false;
            }, function () {
                IS_hover = true;
            });
            var home_rota_lenght = $('#' + id + ' li').length - 1;
            setInterval(function () {
                var this_index = $('#' + id + ' li.active').index();
                if (IS_hover) {
                    if (this_index >= home_rota_lenght) {
                        this_index = 0;
                    } else {
                        this_index++;
                    }
                }
                _self.ols_hover(id, $("#" + listId + " li").eq(this_index));
            }, 3000);
        },
        checkForm: function () {
            var login_name = $("#hoem_forms input[name=login_name]").val().trim();
            var pass_word = $("#hoem_forms input[name=pass_word]").val().trim();
            var agree = $("#hoem_forms input[name=agree]:checked").val().trim();
            if (login_name == null || login_name == "") {
                alert("请输入登录名");
                return false;
            }
            if (pass_word == null || pass_word == "") {
                alert("请输入密码");
                return false;
            }
            return true;

        },
        createLiHtml: function (data) {

                var ImgUrl = "";
                if (new Date(data.createTime).toDateString() === new Date().toDateString()) {
                    //今天
                    ImgUrl = '<img src="' + window.apppath + '/assets/view/images/news_ioc_07.png" alt="">';
                }
                var html ='<li><div class="time"><div class="date">'+data.createTime.substr(8, 2)+'</div><div class="month">'+data.createTime.substr(5, 2)+'月</div></div>'+
                    '<div class="cont">' +
                    '<a target="_blank" href="' + window.apppath + '/moduleMes/' + data.id + '">' + data.title + '</a>'   +
                    '</div></li>';
                return html;


        },
        createLiHtml3: function (data) {
            var ImgUrl = "";
            if (new Date(data.createTime).toDateString() === new Date().toDateString()) {
                //今天
                ImgUrl = '<img src="' + window.apppath + '/assets/view/images/news_ioc_07.png" alt="">';
            }
            var html ='<li><div class="time"><div class="month">'+data.createTime.substr(5, 5)+'</div></div>'+
                '<div class="cont">' +
                '<a target="_blank" href="' + window.apppath + '/moduleMes/' + data.id + '">' + data.title + '</a>'   +
                '</div></li>';
            return html;
        },
        createLiHtml4: function (data) {
            var ImgUrl = "";
            if (new Date(data.createTime).toDateString() === new Date().toDateString()) {
                //今天
                ImgUrl = '<img src="' + window.apppath + '/assets/view/images/news_ioc_07.png" alt="">';
            }
            var html ='<li>'+
                '<img src="' + window.apppath + '/assets/home/img/home/roundabout.png" alt="">' +
                '<div class="caption">'+'<a target="_blank" href="' + window.apppath + '/moduleMes/' + data.id + '">' + data.title + '</a></div></li>';
            return html;
        },
        createLiHtml2: function (data) {
            var html =
                // '<div class="item active"> <a target="_blank" href="' + window.apppath + '/moduleMes/' + data.id + '"><img src="' + window.apppath + '/assets/home/img/home/dot.png" style="width: 5px;margin: 0 5px;" alt="" class="dot"/>' + data.title + '</a></div>';
            // return html;
                '<div class="item active">'+
                '    <img src="'+ window.apppath+'/assets/home/img/home/dot.png" alt="" class="dot">'+
                '    <a target="_blank" href="' + window.apppath + '/moduleMes/' + data.id + '">' + data.title + '</a>' +
                '</div>';
            return html;
        },
        createGoodsHtml: function (data) {
            var html = "" +
                '<li>' +
                '<a href="' + window.apppath + '/goods/' + data.id + '"><img style="width:150px;height: 150px;display: inherit" src="' + window.apppath + data.pic + '"' +
                'alt=""/></a>' +
                '<h5>' + data.name + '</h5>' +
                '<span>￥' + data.price + '</span>' +
                '</li>';
            return html
        },
        selectTypeId: function () {
            var typeId = $("#typeId").val();
            $("#nameDiv").html('<input id="name" class="input-sm">');
            if (typeId == 0) {
                ServiceOrgMap.init();
                $("#area2").val("");
                $("#institutionTypeDictId").val("");
                $("#institutionTypeDictId").show();
                _self.searchInit("/admin/api/serviceOrg/all");
                ServiceOrgMap.setIsClick(true);
                ServiceOrgMap.addMarker("");
            }
            if (typeId == 9) {
                InstitutionMap.init();
                $("#area2").val("");
                $("#institutionTypeDictId").append("<option value='9' selected>养老机构</option>");
                $("#institutionTypeDictId").hide();
                _self.searchInit("/admin/api/institution/all");
                InstitutionMap.setIsClick(true);
                InstitutionMap.addMarker("");

            }

        },
        searchInit: function (url) {
            if (url == null || url == "") {
                url = "/admin/api/serviceOrg/all";
            }
            var areaName = "";
            var area2 = $("#area2").val();
            if (area2 == "-1") {
                areaName = $("#area1 option:selected").html();
            }
            else {
                areaName = $("#area2 option:selected").html();
            }
            var institutionTypeDictId = $("#institutionTypeDictId").val();
            if (institutionTypeDictId == null || institutionTypeDictId == "")
                institutionTypeDictId = null;
            $.post(window.apppath + url, {
                areaName: areaName,
                serviceOrgName: "",
                institutionTypeDictId: institutionTypeDictId
            }, function (res) {
                var source = [];
                if (res != "") {
                    for (var i in res) {
                        if (res[i].lat != null && res[i].lng != null && res[i].lat != "" && res[i].lng != "")
                            source.push(res[i].serviceOrgName);
                    }
                }
                if (source.length > 0) {
                    _self.nameV = $('#name').completer({
                            source: source,
                            suggest: true
                        }
                    );
                }
            }, "json");

        },


    }
}();