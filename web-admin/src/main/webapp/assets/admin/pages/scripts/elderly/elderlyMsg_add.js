/**
 * Created by MaiBenBen on 2017/1/9.
 */
var ElderlyMsgAdd = function () {

    var _self = "";
    return {
        //main function to initiate the module

        form: "",
        error: "",
        success: "",
        "grid": "",
        init: function () {
            _self = this;
            _self.form = $('#addElderForm');
            _self.error = $('.alert-danger', _self.form);
            _self.success = $('.alert-success', _self.form);
            _self.wizardInit();
            if ($("#elderId").val() != null && $("#elderId").val() != "") {
                _self.relationshipInit();
            }

            $('#elderInfo_add').find('.button-previous').hide();
            $('#elderInfo_add .button-submit').click(function () {
                /*alert("添加成功");*/
            }).hide();

            $("#btnAddRelate").click(function () {
                $("#addRelateModal input").removeAttr("disabled");
                $("#addRelateModal select").removeAttr("disabled");
                $("#addRelateModal").modal("show");
                $("#addForm")[0].reset();
                if ($("id").val() != null && $("id").val() != "") {
                    $("#updateForm")[0].reset();
                }
                $(".modal-footer").html('<button type="button" class="btn blue addRelate" onclick="ElderlyMsgAdd.addRelate();">添加</button>' +
                    '<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>');
            });

        },
        wizardInit: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }
            // default form wizard
            $('#elderInfo_add').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    return false;
                    /*
                     success.hide();
                     error.hide();
                     if (form.valid() == false) {
                     return false;
                     }
                     handleTitle(tab, navigation, clickedIndex);
                     */
                },
                onNext: function (tab, navigation, index) {
                    _self.success.hide();
                    _self.error.hide();
                    if (index == 1) {
                        var areaName = $("#addElderForm input[name=areaName]").val();
                        //提交老人基本信息
                        if (areaName == null || areaName == "") {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请选择所属区域');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }
                        else if ($("#addElderForm input[name=elderName]").val() == null || $("#addElderForm input[name=elderName]").val() == "") {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请输入老人姓名');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        } else if ($("#addElderForm input[name=idcardno]").val() == null || $("#addElderForm input[name=idcardno]").val() == "") {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请输入身份证号');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        } else if ($("#errorIdCard").html() != "身份证正确") {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请输入正确的身份证号');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }
                        else if ($("#age").val() < 60) {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>老人年龄必须在60岁以上');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        } else if ($("#homeTel").val() != null && $("#homeTel").val() != "" && !ElderlyMsgAdd.isPhone($("#homeTel").val())) {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请输入正确住宅电话');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        } else if ($("#mobile").val() != null && $("#mobile").val() != "" && !ElderlyMsgAdd.isMoblie($("#mobile").val())) {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请输入正确移动电话');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }
                        else {
                            var submitForm = $('#addElderForm');
                            //同步提交
                            $.ajax({
                                type: "post",
                                url: window.apppath + "/admin/api/elderly/add",
                                dataType: "json",   //返回格式为json
                                data: submitForm.serialize() + "&areaOrder=" + getAreaOrder(areaName),
                                async: false,
                                success: function (res) {
                                    if (res.success) {
                                        $("#elderId").val(res.data);
                                        $("#id").val(res.data);
                                        $('#elderInfo_add').bootstrapWizard('show', 1);
                                    } else {
                                        $("#elderId").val("");
                                        $("#id").val("");
                                        _self.error.html('<button class="close" data-dismiss="alert"></button>' + res.message);
                                        _self.error.show();
                                        Metronic.scrollTo(_self.error, -200);
                                        return false;
                                    }
                                }
                            });
                            return false;
                        }
                    }

                    if (index == 2) {
                        var zipcode = $("#addElderForm input[name=zipcode]").val();
                        var socialCardCode = $("#addElderForm input[name=socialCardCode]").val();
                        if (zipcode != null && zipcode != "" && !_self.isZipcode(zipcode)) {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请输入正确的邮编');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }
                        if (socialCardCode != null && socialCardCode != "" && !_self.isSocialCardCode(socialCardCode)) {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请输入正确的社保卡号');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }

                        var submitForm = $('#addElderForm');
                        $.post(window.apppath + "/admin/api/elderly/update", submitForm.serialize(), function (res) {
                            if (res.success) {

                            } else {

                            }
                        }, 'json');
                    }
                    if (index == 3) {
                        var submitForm = $('#addElderForm');
                        $.post(window.apppath + "/admin/api/elderly/update", submitForm.serialize(), function (res) {
                            if (res.success) {
                            } else {

                            }
                        }, 'json');
                    }
                    if (index == 4) {
                        var submitForm = $('#addElderForm');
                        $.post(window.apppath + "/admin/api/elderly/update", submitForm.serialize(), function (res) {
                            if (res.success) {
                                $(".button-submit").show();
                                $(".button-submit").click(function () {
                                    window.location.href=window.apppath +"/admin/elderly/list";
                                })
                            } else {

                            }
                        }, 'json');

                    }
                    _self.handleTitle(tab, navigation, index);
                },
                onPrevious: function (tab, navigation, index) {
                    _self.success.hide();
                    _self.error.hide();

                    _self.handleTitle(tab, navigation, index);
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#elderInfo_add').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });
        },
        handleTitle: function (tab, navigation, index) {
            var total = navigation.find('li').length;
            var current = index + 1;
            $('.step-title', $('#elderInfo_add')).text('Step ' + (index + 1) + ' of ' + total);
            jQuery('li', $('#elderInfo_add')).removeClass("done");
            var li_list = navigation.find('li');
            for (var i = 0; i < index; i++) {
                jQuery(li_list[i]).addClass("done");
            }

            if (current == 1) {
                $('#elderInfo_add').find('.button-previous').hide();
            } else {
                $('#elderInfo_add').find('.button-previous').show();
            }
            if (current >= total) {
                $('#elderInfo_add').find('.button-next').hide();
                $('#elderInfo_add').find('.button-submit').hide();
            } else {
                $('#elderInfo_add').find('.button-next').show();
                $('#elderInfo_add').find('.button-submit').hide();
            }
            Metronic.scrollTo($('.page-title'));
        },
        format: function (state) {
            if (!state.id) return state.text; // optgroup
            return "<img class='flag' src='../../assets/global/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
        },
        importFile: function (file, msg) {
            var typeFile = $("#" + file).val().trim();
            if (typeFile != null && typeFile != "") {
                var suffix = typeFile.substr(typeFile.lastIndexOf("."), typeFile.length);
                if (suffix == ".jpg") {
                    $.ajaxFileUpload({
                        url: window.apppath + "/admin/api/elderly/uploadPhoto",
                        secureuri: false,
                        fileElementId: file,//file控件id
                        dataType: 'json',
                        success: function (data, status) {
                            $("#" + msg).text(data.message).addClass("label-danger");
                            $("#photoImg").attr("src", window.apppath + data.data);
                            $("#photoImg").css("width", "168px");
                            $("#photoImg").css("height", "164px");
                            $("#photo").val(data.data);
                        },
                        error: function (data, status, e) {
                            console.log(e);
                        }
                    });
                } else {
                    window.parent.alert("请选择格式为jpg的图片");
                }

            } else {
                $("#" + msg).text("请选择文件！").addClass("label-danger");
            }
        },
        addRelate: function () {
            var value = $("#addForm").serialize();
            var linkName = $("#addForm input[name=linkName]").val();
            var linkTel = $("#addForm input[name=linkTel]").val();
            var relationship = $("#addForm select[name=relationship]").val();
            var haveKey = $('#addForm select[name=haveKey]').val();
            if ($("#elderId").val() == "" || $("#elderId").val() == null) {
                window.parent.alert("添加失败");
                return false;
            } else if (linkName == null || linkName == "") {
                window.parent.alert("请输入联系人姓名");
                return false;
            } else if (linkTel == null || linkTel == "" || !_self.isMoblie(linkTel)) {
                window.parent.alert("请输入正确的联系方式");
                return false;
            } else if (relationship == null || relationship == "") {
                window.parent.alert("请选择与老人关系");
                return false;
            } else if (haveKey == null || haveKey == "") {
                window.parent.alert("请选择是否有老人钥匙");
                return false;
            } else {
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderLinkMan/addElderLinkMan",
                    data: value,
                    dataType: "json",
                    success: function (res) {
                        if (res.success) {
                            $("#addForm")[0].reset();
                            $("#addRelateModal").modal("hide");
                            if (_self.grid == "") {
                                _self.relationshipInit();
                            }
                            else {
                                _self.grid.getDataTable().ajax.reload();
                            }
                        } else {
                            window.parent.alert(res.message);
                        }

                    }
                });
            }
        },
        updateRelate: function () {
            var value = $("#updateForm").serialize();
            var linkName = $("#updateForm input[name=linkName]").val();
            var linkTel = $("#updateForm input[name=linkTel]").val();
            var relationship = $("#updateForm select[name=relationship]").val();
            var haveKey = $("#updateForm select[name=haveKey]").val();
            if ($("#elderId").val() == "" || $("#elderId").val() == null) {
                window.parent.alert("添加失败");
                return false;
            } else if (linkName == null || linkName == "") {
                window.parent.alert("请输入联系人姓名");
                return false;
            } else if (linkTel == null || linkTel == "" || !_self.isMoblie(linkTel)) {
                window.parent.alert("请输入正确的联系方式");
                return false;
            } else if (relationship == null || relationship == "") {
                window.parent.alert("请选择与老人关系");
                return false;
            } else if (haveKey == null || haveKey == "") {
                window.parent.alert("请选择是否有老人钥匙");
                return false;
            } else {
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/elderLinkMan/updateElderLinkMan",
                    data: value,
                    dataType: "json",
                    success: function (res) {
                        if (res.success) {
                            $("#updateForm")[0].reset();
                            $("#updateRelateModal").modal("hide");
                            if (_self.grid == "") {
                                _self.relationshipInit();
                            }
                            else {
                                _self.grid.getDataTable().ajax.reload();
                            }
                        } else {
                            window.parent.alert(res.message);
                        }

                    }
                });
            }
        },
        g_alert: function (type, cont, url) {
            //html
            var html = '<div id="g_all"></div><div id="g_box" style="z-index:1; position:fixed"><div id="g_title">提示信息</div><div id="g_cont"><img width="100px" height="100px"><span id="g_msg">' + cont + '</span></div><div id="g_buttom"><div id="g_button"><a class="butt" id="ok">确定</a> <a class="butt" id="false">取消</a></div></div></div>';
            $('body').append(html);

            //css
            var css = "<style id='g_css'>#g_title{height:40px; background:#0095d9;border-radius:5px 5px 0 0; border-bottom:1px solid #eef0f1;line-height:40px;padding-left:25px; font-size:16px; font-weight:700; color:#fff}";
            css += "#g_cont{height:130px; background:#fff;padding-top:15px; text-align:center;}";
            css += "#g_all{width:100%; height:100%; z-index:1; position:fixed;filter:Alpha(opacity=50); background:#666666;top:0;left:0;opacity: 0.6}";
            css += "#g_msg{position:relative; top:-50px; font-size:25px;margin-left:40px;}";
            css += "#g_buttom{height:40px; border-top:1px solid #eef0f1; border-radius:0px 0px 5px 5px; background:#fff; line-height:60px;}";
            css += "#g_button{width:200px; height:100%; margin-right:10px; float:right;}";
            css += ".butt{display:block; margin-top:5px;cursor:pointer; float:left;width:80px;height:30px;line-height:30px;text-align:center;color:#FFFFFF;border-radius:5px;}"
            css += "#ok{background:#0095d9; color:#FFFFFF; float:right;}";
            css += "#false{background:#546a79; color:#FFFFFF; float:left;}";
            css += "#g_box{width:400px;}</style>";
            $('head').append(css);

            //类型为alert
            if (type == 'success') {
                $('#g_cont img').attr('src', '../assets/view/images/ok.png');
                $('#false').hide();
            }

            if (type == 'error') {
                $('#g_cont img').attr('src', '../assets/view/images/fail.png');
                $('#false').hide();
            }

            //类型为confirm
            if (type == 'warn') {
                $('#g_cont img').attr('src', '../assets/view/images/warn.jpg');
                $('#false').hide();
            }

            //类型为confirm
            if (type == 'confirm') {
                $('#g_cont img').attr('src', '../assets/view/images/confirm.jpg');
            }

            //点击OK
            $('#ok').click(function () {
                $('#g_all').remove();
                $('#g_box').remove();
                $('#g_css').remove();
                if (url) {
                    window.location = url;
                }
                return true;
            });

            //点击false
            $('#false').click(function () {
                $('#g_all').remove();
                $('#g_box').remove();
                $('#g_css').remove();
                if (type != 'confirm') {
                    if (url) {
                        window.location = url;
                    }
                }
                return false;
            });


            //居中
            var _widht = document.documentElement.clientWidth; //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高

            var boxWidth = $("#g_box").width();
            var boxHeight = $("#g_box").height();

            $("#g_box").css({top: (_height - boxHeight) / 4 + "px", left: (_widht - boxWidth) / 2 + "px"});

        },
        isDeath: function () {
            var isDeath = $("#isDeath").val();
            if (isDeath == 1 || isDeath == 2) {
                $("#addElderForm").find("input[name=deathTimeString]").prop("disabled", true);
                $("#addElderForm").find("input[name=cremationTimeString]").prop("disabled", true);
                $("#addElderForm").find("input[name=deathTimeString]").val("");
                $("#addElderForm").find("input[name=cremationTimeString]").val("");
            } else {
                $("#addElderForm").find("input[name=deathTimeString]").prop("disabled", false);
                $("#addElderForm").find("input[name=cremationTimeString]").prop("disabled", false);
            }
        },
        isSocialCardCode: function (str) {
            var reg = /^\d*$/;
            return reg.test(str);
        },
        isZipcode: function (str) {
            var reg = /^\d{6}$/;
            return reg.test(str);
        },
        isMoblie: function (str) {
            var reg = /^1\d{10}$/;
            return reg.test(str);
        },
        isPhone: function (str) {
            /*var reg = /^0\d{2,3}-?\d{7,8}$/;*/
            var reg = /^\d{7,8}$/;
            return reg.test(str);
        },
        validateIdCard: function () {
            var idCard = $("#idcardno").val();
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/validate/idCard",
                data: {idStr: idCard, flag: "elder"},
                dataType: "json",
                async: false,
                success: function (res) {
                    if (res.success) {
                        $("#errorIdCard").html(res.message);
                        $("#age").val(res.data.age);
                        $("#sexDictId").val(res.data.sexDictId);
                        $("#birthday").val(res.data.birthday);
                    } else {
                        $("#errorIdCard").html(res.message);
                    }

                }
            });
        },
        relationshipInit: function () {
            _self.grid = new Datatable();
            /*var tableContainer = $("#retionship_list").parents(".table-container");*/
            _self.grid.init({
                src: $("#datatable_retionship_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderLinkMan/selectLinkManList", {
                            length: params.length,
                            start: params.start,
                            elderId: $("#elderId").val()
                        }, function (res) {
                            if (res) {
                                callback(res);
                            } else {
                                callback({
                                    data: null,
                                    recordsFiltered: 0
                                });
                            }
                        }, 'json');
                    },
                    "searching": false,
                    "ordering": false,
                    "columns": [
                        // {
                        //     "data": "id", render: function (data, type, row, meta) {
                        //     return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        // }
                        // },
                        {
                            "data": "linkName", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "linkTel", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "relationship", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {"data": "haveKey"},
                        {
                            "data": "remark", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return '<div title="' + data + '" style="text-align: center;vertical-align: middle;text-overflow: ellipsis;overflow: hidden;white-space: nowrap">' + data + '</div>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            if ($("#type").val() == "edit") {
                                return '' /*+ '<a href="' + window.apppath + '/admin/elderly/update/' + data + '?method=show" class="btn default btn-xs green-stripe">详细</a>' */ +
                                    '<button type="button" data="' + data + '" class="btn btn-xs green-stripe edit">更新</button>';

                            } else {
                                return "";
                            }
                        }
                        }
                    ]
                }
            });

            _self.grid.getTable().on("click", "button.edit", function () {
                if ($("#updateForm")[0]) {

                }
                $("#updateForm")[0].reset();
                var id = $(this).attr("data");
                $.post(window.apppath + "/admin/api/elderLinkMan/getLinkManById", {
                    id: id
                }, function (res) {
                    if (res != "") {
                        $("#updateForm input[name=id]").val(res.id);
                        $("#updateForm input[name=linkName]").val(res.linkName);
                        $("#updateForm input[name=linkTel]").val(res.linkTel);
                        $("#updateForm select[name=relationship]").val(res.relationship);
                        $("#updateForm select[name=haveKey]").val(res.haveKey);
                        $("#updateForm input[name=remark]").val(res.remark);
                    }
                    $("#updateRelateModal").modal("show");

                    $(".modal-footer").html('<button type="button" class="btn blue updateRelate" onclick="ElderlyMsgAdd.updateRelate();">更新</button>' +
                        '<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>');
                }, "json");
            });

        }

    };

}();