/**
 * Created by Administrator on 2016/9/19.
 */
var UserAdd = function () {

    var _self = "";
    return {
        "grid": "",
        init: function () {
            _self = this;

            $("#role").change(function () {
                $(".form input[name=areaId]").val("");
                $(".form input[name=areaName]").val("");
                _self.changeLabel();
            })

            $("#selectArea .add").click(function () {
                var result = "";
                var select = AreaTree.getSelectArea();
                if (select != -1) {
                    $(".form input[name=areaId]").val(select);
                    if (select.indexOf(",") < 0) {
                        result = AreaTree.getSelectAreaName(select);
                    }
                    else {
                        var strs = select.split(",");
                        for (var i in strs) {
                            if (strs[i].indexOf("serviceOrg") >= 0) {
                                result += AreaTree.getSelectAreaName(strs[i]) + ",";
                            }
                        }
                        result = result.substr(0, result.lastIndexOf(","));
                    }
                    $(".form input[name=areaName]").val(result)
                    $("#selectArea").modal("hide");
                }
            });

            $("#btnPublish").click(function () {
                _self.submitForm();
            })

        },
        changeLabel: function () {
            var id = $("#role option:selected").text();
            var phoneShow = document.getElementById("phoneShow");
            if (id == '超级管理员' || id == '市级管理员' || id == '区级管理员' || id == '街道管理员' || id == '社区管理员') {
                $("#area-zuzhi-label").html('所在区域 <span class="required">	* </span>');
                phoneShow.style.display = 'block';
                $('.caller').hide();
            } else if (id == '服务人员') {
                $("#area-zuzhi-label").html('服务人员 <span class="required">	* </span>');
                phoneShow.style.display = 'none';
                $('.caller').hide();
            }else if (id == '评估人员') {
                $("#area-zuzhi-label").html('所在区域 <span class="required">	* </span>');
                phoneShow.style.display = 'block';
                $('.caller').hide();
            }else {
                $("#area-zuzhi-label").html('所在组织 <span class="required">	* </span>');
                phoneShow.style.display = 'block';
            }
        },
        showModel: function () {
            AreaTree.setCheckBox(false);
            var sysRole = $('#role').val();
            if (sysRole == -1) {
                $("#labelmsg").text("请选择角色").addClass("label-danger");
                return false;
            }
            else if (sysRole == 9) {
                _self.showSelectUserFuwuModel();
            } else {
                $("#labelmsg").text("");
                if (AreaTree.isInit()) {
                    AreaTree.refresh(sysRole);
                }
                else {
                    AreaTree.init(sysRole);
                }
                $("#selectArea").modal("show");
            }
        },
        checkSave: function () {
            $("#labelmsg").text("").removeClass("label-danger");
            var sysRole = $('#role').val();
            var areaId = $("input[name=areaId]").val();
            var login_name = $("input[name=login_name]").val();
            var nick_name = $('#nick_name').val();
            if (sysRole == null || login_name == "-1") {
                $("#labelmsg").text("请选择角色").addClass("label-danger");
                return false;
            }
            else if (areaId == null || areaId == "") {
                $("#labelmsg").text("请选择区域或组织").addClass("label-danger");
                return false;
            }
            else if (login_name == null || login_name == "") {
                $("#labelmsg").text("请输入登陆账号").addClass("label-danger");
                return false;
            } else if (nick_name == "" || $("#same").html() == "重复") {
                $("#labelmsg").text('请输入昵称且不可重复！').addClass("label-danger");
                return false;
            }
            var reg = /^[a-z][a-zA-Z0-9\_]{4,12}$/;
            if (!reg.test(login_name)) {
                $("#labelmsg").text("用户名只能输入字母数字下划线,5到12位！且第一个为小写字母").addClass("label-danger");
                return false;
            }


            $("#labelmsg").text("").removeClass("label-danger");
            return true;

        },
        checkMobile: function (sMobile) {
            var pattern = /(^1(3[0-9]|4[5,7]|5[0-35-9]|8[0-9]|7[06-8])\d{8}$)/;
            if (pattern.test(sMobile)) {
                return true;
            }
            return false;
        },
        submitForm: function () {
            if (_self.checkSave()) {
                var areaId = $("input[name=areaId]").val();
                var sysRoleId = $('#role').val();
                $.post(window.apppath + "/admin/api/user/add", {
                    login_name: $.trim($("input[name=login_name]").val()),
                    phone: $.trim($("input[name=phone]").val()),
                    gender: $.trim($("input[name=gender]:checked").val()),
                    nick_name: $.trim($("input[name=nick_name]").val()),
                    areaOrServiceId: areaId,
                    areaOrServiceName: $("input[name=areaName]").val(),
                    status:1,
                    sysRoleId: sysRoleId,
                    fuwuId: $("#fuwuId").val(),
                    queue: $("#queue").val(),
                    disphone:$("#disphone").val(),
                    agent:$("#agent").val(),
                    pwd:$("#pwd").val()
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }
        },
        allowEdit: function () {
            $("#nick_name").attr("readonly", false);
            $("#phone").attr("readonly", false);
            $("#btnPublish").attr("disabled", false);
            $("#updateUser").find("input:radio").attr("disabled", false);
        },
        judgeNickName: function () {
            var nick_name = $('#nick_name').val();
            if($("#nick").length==1){
                if($("#nick").val()==nick_name){
                    return
                }
            }
            if (nick_name != "" && nick_name != null) {
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/user/judgeNickName",
                    data: {nick_name: nick_name},
                    dataType: "json",
                    success: function (res) {
                        $("#same").text(res.message);
                    }
                });
            } else {
                $("#same").text("");
            }

        },
        resetPwd: function () {
            var uid = $("#uid").val();
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/user/update?flag=reset",
                data: {uid: uid},
                dataType: "json",
                success: function (res) {
                    if (res.success) {
                        Metronic.alert({type: 'success', message: res.message, closeInSeconds: 2, icon: 'check'});
                    } else {
                        Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 2, icon: 'warning'});
                    }
                }
            });
        },
        updateUser: function () {
            var $btn = $(this);
            var nick_name = $('#nick_name').val();
            if (nick_name == "" || $("#same").html() == "重复") {
                $("#labelmsg").text('请输入昵称且不可重复！').addClass("label-danger");
            } else {
                $("#labelmsg").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/user/update",
                    data: $("#updateUser").serialize(),
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            Metronic.alert({type: 'success', message: res.message, closeInSeconds: 2, icon: 'check'});
                        } else {
                            Metronic.alert({type: 'danger', message: res.message, closeInSeconds: 2, icon: 'warning'});
                        }
                    }
                });
            }
        },
        showSelectUserFuwuModel: function () {
            $("#selectUserFuwu").modal("show");
            if (_self.grid == "") {
                _self.userFuwuinit();
            }
            else {
                //重置
                $("#areaId").val("");//找到form表单下的所有input标签并清空
                $("#areaName").val("");
                _self.grid.getDataTable().ajax.reload();
            }
        },
        userFuwuinit: function () {
            var serviceOrgId = $("input[name=serviceOrgId]").val();
            var serviceOrgIds = $("input[name=serviceOrgId]").val();
            if (serviceOrgId != null && serviceOrgId != "") {
                if (serviceOrgIds.indexOf(",") > 0) {
                    serviceOrgId = null;
                }
                if (serviceOrgId.indexOf(",") < 0) {
                    serviceOrgIds = null;
                }
            }
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_userfuwu_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/user/fuwu/list", {
                                length: params.length,
                                start: params.start,
                                name: $("input[name=name]").val(),
                                idcardno: $("input[name=idcardno]").val(),
                                serviceOrgId: serviceOrgId,
                                serviceOrgIds: serviceOrgIds,
                                areaName: $("input[name=areaName]").val(),
                                userId: 0
                            },
                            function (res) {
                                if (res) {
                                    callback(res);
                                } else {
                                    callback({
                                        data: null,
                                        recordsFiltered: 0
                                    });
                                }
                            }

                            ,
                            'json'
                        )
                        ;
                    },
                    "searching": false,
                    "ordering": false,
                    deferLoading: 0,
                    "columns": [
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="radio" name="fuwuId" data-name="' + row.name + '" data-orgname="' + row.serviceOrgName + '" data-orgid="' + row.serviceOrgId + '" data-mobile="' + row.mobile + '" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "serviceOrgName", render: function (data, type, row, meta) {
                            return '<div style="text-align: left">' + data + '</div>';
                        }
                        },
                        {
                            "data": "name"
                        },
                        {
                            "data": "mobile", render: function (data, type, row, meta) {
                            return data.replace(data.substr(5, 4), "****");
                        }
                        }
                    ]
                }

            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });
        },
        selectUserFuwu: function () {
            _self.fuwuId = $("#datatable_userfuwu_list input[name=fuwuId]:checked").val();
            _self.areaId = $("#datatable_userfuwu_list input[name=fuwuId]:checked").attr("data-orgid");
            var name = $("#datatable_userfuwu_list input[name=fuwuId]:checked").attr("data-name");
            _self.areaName = $("#datatable_userfuwu_list input[name=fuwuId]:checked").attr("data-orgname");
            _self.phone = $("#datatable_userfuwu_list input[name=fuwuId]:checked").attr("data-mobile");
            $("input[name=fuwuId]").val(_self.fuwuId);
            $("input[name=areaId]").val(_self.areaId);
            $("input[name=areaName]").val(_self.areaName);
            $("input[name=phone]").val(_self.phone);
            $("#selectUserFuwu").modal("hide");
            $("body").animate({scrollTop: '0px'}, 200);
        },
        approved1: function () {
            var status = $("#status").val();
            if(status != 0){
                alert("已经审核");
                return
            }
            var uid = $("#uid").val();
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/user/approved?status=1",
                data: {uid: uid},
                dataType: "json",
                success: function (res) {
                    console.log(res)
                    if (res.success) {
                        alert("同意该用户申请", function () {
                            window.parent.updateTab('user_list');
                            window.location.reload();
                        });
                    } else {
                        alert(res.message);
                    }
                }
            });
        },
        approved2: function () {
            var status = $("#status").val();
            if(status != 0){
                alert("已经审核");
                return
            }
            var uid = $("#uid").val();
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/user/update?status=3",
                data: {uid: uid},
                dataType: "json",
                success: function (res) {
                    if (res.success) {
                        alert("同意该用户申请", function () {
                            window.parent.updateTab('user_list');
                            window.location.reload();
                        });
                    } else {
                        alert(res.message);
                    }
                }
            });
        }

    }
}();