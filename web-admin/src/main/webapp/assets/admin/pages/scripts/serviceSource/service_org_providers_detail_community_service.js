var ServiceOrgDetail = function () {
    var _method;
    var serviceProject = "";

    // 反显组织类型选中的复选框
    var obj1 = document.getElementsByName("institutionTypeDictId");
    var types = $("#institutionTypeDictId").val();
    if (types != "" && types != null) {
        var type = types.split(",");
        if (types.length > 0) {
            for (var i = 0; i < obj1.length; i++) {
                for (var j = 0; j < types.length; j++) {
                    if (obj1[i].value == type[j]) {
                        obj1[i].checked = true;
                    }
                }
            }
        }
    }

    $(".table-group-action-reload").click(function () {
        $("#serviceOrgAddForm").find("input:text").val("");//找到form表单下的所有input标签并清空
        $("#serviceOrgAddForm").find("select").val("");//找到form表单下的所有select标签并清空
        $("#serviceOrgAddForm").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
    });


    $(".delete").click(function () {
        $.post(window.apppath + "/admin/api/certificateDelete", {eventId: $("#certificateId").val()}, function (res) {
            alert(res.message);
            window.location.reload();
        }, "json");
    });

    return {
        //main function to initiate the module
        init: function () {
            $("#serviceOrgEditForm").find("input:text").prop("disabled", true);//找到form表单下的所有input标签并置为不可编辑
            $("#serviceOrgEditForm").find("select").prop("disabled", true);//找到form表单下的所有select标签并置为不可编辑
            $("#serviceOrgEditForm").find("input:checkbox").prop("disabled", true);//找到form表单下的所有checkbox标签并置为不可编辑
            $("#serviceOrgEditForm").find("input:radio").prop("disabled", true);//找到form表单下的所有radio标签并置为不可编辑
            $("#serviceOrgEditForm").find("input:file").prop("disabled", true);//找到form表单下的所有file标签并置为不可编辑
            $("#serviceOrgEditForm").find("button[name=certificateDelete]").prop("disabled", true);//找到form表单下的所有file标签并置为不可编辑
            $("#serviceOrgEditForm").find("input[name=verifyContent]").prop("disabled", false);//找到form表单下的所有file标签并置为不可编辑

            this.serviceProjectInit();
            this.serviceRangeInit();
        },
        serviceRangeInit: function () {// 服务范围jstree
            $('#rangeTree').jstree({
                'plugins': ["checkbox", "wholerow"],
                "core": {
                    "multiple": true,
                    "animation": 0,
                    "check_callback": true,
                    "themes": {"stripes": true},
                    'data': {
                        "type": "POST",
                        'url': function (node) {
                            return window.apppath + '/admin/api/area/getAreaTree?areaId=1';
                        },
                        'data': function (node) {
                            return {'id': node.id};
                        },
                        'dataType': 'json'
                    }
                },
                "checkbox": {
                    "keep_selected_style": false
                },
                "types": {
                    "root": {
                        "icon": "https://www.jstree.com/static/3.3.1/assets/images/tree_icon.png",
                        "valid_children": ["default"]
                    },
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg",
                        draggable: false  //设置节点不可拖拽
                    },
                    "file": {
                        "icon": "fa fa-file icon-state-warning icon-lg"
                    }
                }
            }).on('loaded.jstree', function (serviceRange) {
                //只展示叶节点,父节点自动半选或全选
                serviceRange = $("#inServiceRangeName").val();
                var node_leafs = new Array();
                for (var k = 0; k < serviceRange.split(",").length; k++) {
                    if (serviceRange.split(",")[k] != "#") {
                        var n = $('#rangeTree').jstree('get_node', parseInt(serviceRange.split(",")[k]));
                        var is_leaf = $('#rangeTree').jstree('is_leaf', n);
                        if (is_leaf) {
                            node_leafs.push(n);
                        }
                    }
                }
                $('#rangeTree').jstree('uncheck_all');
                $('#rangeTree').jstree('check_node', node_leafs);

            });
        },
        allowEdit: function () {
            $("#serviceOrgEditForm").find("input:text").prop("disabled", false);//找到form表单下的所有input标签并置为可编辑
            $("#serviceOrgEditForm").find("select").prop("disabled", false);//找到form表单下的所有select标签并置为可编辑
            // $("#serviceOrgEditForm").find("select[name=gradeDictId]").prop("disabled", true);//找到form表单下的所有select标签并置为可编辑
            $("#serviceOrgEditForm").find("input:checkbox").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
            $("#serviceOrgEditForm").find("input:radio").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
            $("#serviceOrgEditForm").find("input:file").prop("disabled", false);//找到form表单下的所有checkbox标签并置为可编辑
            $("#serviceOrgEditForm").find("button[name=editServiceOrg]").prop("disabled", false);
            $("#serviceOrgEditForm").find("button[name=certificateDelete]").prop("disabled", false);//找到form表单下的所有file标签并置为不可编辑
            $("#serviceOrgEditForm").find("input[id=infoIntegrity]").prop("disabled", "true");
            //服务项目可以选择
            $("#serviceProject").prop("disabled", false);
            $('.ms-elem-selectable').removeClass("disabled");
            $('.ms-elem-selection').removeClass("disabled");
            $("#addAttachDiv").show();
            $(".remove").show();
            /*if ($("#roleId").val() == 4) {
             $("#serviceOrgEditForm").find("select[name=gradeDictId]").prop("disabled", true);
             }*/
        },
        setServiceProject: function (strs) {
            serviceProject = strs;
        },
        serviceProjectInit: function () {
            //初始化服务项目
            $.post(window.apppath + "/admin/api/ServiceProject/serviceType/list", {},
                function (res) {
                    if (res.data != "") {
                        var html = "";
                        var strs = "";
                        if (serviceProject != "")
                            strs = serviceProject.split(",");
                        for (var i = 0; i < res.data.length; i++) {
                            html += '  <optgroup label="服务项目">';
                            if (serviceProject != "" && strs.indexOf(res.data[i].id + "") >= 0) {
                                html += '<option value="' + res.data[i].id + '" selected>' + res.data[i].name + '</option>';
                            }
                            else
                                html += '<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>';
                            html += '  </optgroup>';
                        }
                        $("#serviceProject").html(html);
                        if (serviceProject != "")
                            $("#serviceProject").prop("disabled", true);
                        $('#serviceProject').multiSelect({
                            selectableOptgroup: true
                        });
                    }
                }, 'json');
        },
        selectMethod: function (method) {
            _method = method;
        },
        getAreaName: function () {
            if (_method == "edit") {
                $("#areaId1").val(AreaTree.getSelectArea());
                $("#areaName1").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
                $("#areaModal").modal('hide');
            } else if (_method == "add") {
                $("#areaId").val(AreaTree.getSelectArea());
                $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
                $("#areaModal").modal('hide');
            } else if (_method == "update") {
                $("#inServiceRangeId").val(AreaTree.getSelectRange());
                $("#inServiceRangeName").val(AreaTree.getAllRangeName(AreaTree.getSelectRange()));
                $("#rangeModal").modal('hide');
            }

        },
        judgeInstitutionName: function (name, span) {
            var institutionName = $("#" + name).val();
            if (institutionName != null && institutionName != '') {
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/judgeInstitutionName",
                    data: {institutionName: institutionName},
                    dataType: "json",
                    success: function (res) {
                        if (res.success) {
                            $("#" + span).text(res.message);
                        } else {
                            $("#" + span).text(res.message);
                        }
                    }
                });
            } else {
                $("#" + span).text("");
            }
        },
        submitAdd: function () {
            var $btn = $(this);
            var areaName = EographicArea.getPosition2();
            var institutionName = $("#institutionName").val();
            var socialForce = $("#socialForce").val();
            var file = $("#attach").val();
            var attach = file;
            if (areaName == "") {
                $("#labelmsg").text('请选择所属区域！').addClass("label-danger");
            } else if (institutionName == "" || $("#same").html() == "重复") {
                $("#labelmsg").text('请输入单位名称且不可重复！').addClass("label-danger");
            } else {
                $("#labelmsg").text('');
                $btn.button('loading');
                addServiceOrg(getAreaOrder(areaName));
            }
            function addServiceOrg(areaOrder) {
                var obj1 = document.getElementsByName("institutionTypeDictId");
                var institutionTypeDictId = '';
                for (var i = 0; i < obj1.length; i++) {
                    if (obj1[i].checked) {
                        institutionTypeDictId += obj1[i].value + ',';
                    }
                }
                if (institutionTypeDictId != "") {
                    institutionTypeDictId = institutionTypeDictId.substr(0, institutionTypeDictId.length - 1);
                }
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/serviceOrgAdd",
                    data: {
                        areaId: EographicArea.getSelectId(),
                        areaName: EographicArea.getPosition2(),
                        type: $("#type").val(),
                        zipcode: EographicArea.getAreaCode(),
                        institutionName: institutionName,
                        attach: attach,
                        status: 1,
                        socialForce: $("#socialForce").val(),
                        institutionTypeDictId: institutionTypeDictId,
                        cityOrTown: $("input[name=cityOrTown]:checked").val(),
                        areaOrder: areaOrder
                    },
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            var message = "<div style='text-align:left;font-size: 18px;padding-left: 35px'>该组织的账号：" + res.data.login_name + "</div>" +
                                "<div  style='text-align:left;font-size: 18px;padding-left: 35px'>初始密码：" + "123456" + "</div>";
                            alert2(message, function () {
                                if ($("#type").val() == 3) {
                                    window.parent.closeTab('tab_institution_add');
                                } else if ($("#type").val() == 2) {
                                    window.parent.closeTab('tab_institution_add');
                                    window.parent.updateTab('side-institution-list');
                                }
                                else {
                                    window.parent.closeTab('tab_service_org_add');
                                    window.parent.updateTab('side-serviceOrg-list');
                                }
                            });
                            $("#serviceOrgAddForm")[0].reset();
                        } else {
                            alert2("<div style='text-align:left;font-size: 18px;padding-left: 35px'>保存失败</div>");
                        }
                    }
                });
            }
        },

        submitEdit: function () {
            var $btn = $(this);
            var serviceProjectName = "";
            $("#serviceProject option:selected").each(function () {
                serviceProjectName += $(this).text() + ",";
            });
            if (serviceProjectName.length > 1)
                serviceProjectName = serviceProjectName.substr(0, serviceProjectName.length - 1);
            var areaName = $('#areaName1').val();
            var institutionName = $("#institutionName1").val();
            var obj1 = document.getElementsByName("institutionTypeDictId");
            var institutionTypeDictId = '';
            var flag1 = false;
            for (var i = 0; i < obj1.length; i++) {
                if (obj1[i].checked) {
                    institutionTypeDictId += obj1[i].value + ',';
                    flag1 = true;
                }
            }
            if ($("#type").val() == 2) {
                flag1 = true;
            }
            var phone1 = $("#phone1").val();
            var moblie1 = $("#moblie1").val();
            var applyName = $("#applyName").val();
            var postcode = $("#postcode").val();
            if (AreaTree.getCheckBoxSelect() != null && AreaTree.getCheckBoxSelect() != '') {
                $("#inServiceRangeName").val(AreaTree.getCheckBoxSelect().join(","));
            }
            //邮箱
            var obj2 = document.getElementsByName("regTypeDictId");
            var regTypeDictId = null;
            var flag2 = false;
            for (var i = 0; i < obj2.length; i++) {
                if (obj2[i].checked) {
                    regTypeDictId = obj2[i].value;
                    flag2 = true;
                }
            }
            var attach = "";
            $(".remove").each(function () {
                attach += $(this).attr("data") + ",";
            })
            if (attach.length > 1)
                attach = attach.substr(0, attach.length - 1);
            var orgCode = $("#orgCode").val();
            var bedCount = $("#bedCount1").val();
            var bedNurseCount = $("#bedNurseCount1").val();
            var bedCareCount = $("#bedCareCount").val();
            var bedEmptyCount = $("#bedEmptyCount1").val();
            var bedNurseEmptyCount = $("#bedNurseEmptyCount1").val();
            var bedCareEmptyCount = $("#bedCareEmptyCount1").val();
            var bedMoney = $("#bedMoney1").val();
            var bedNurseMoney = $("#bedNurseMoney1").val();
            var bedCareMoney = $("#bedCareMoney1").val();
            var landArea = $("#landArea").val();
            var address = $("#address1").val();
            var roomProp = $("#roomProp").val();
            var instProp = $("#instProp").val();
            var businessLicenseNo = $("#businessLicenseNo").val();
            var sOfRealEstate = $("#sOfRealEstate").val();
            var elderNum = $("#elderNum").val();
            var workNum = $("#workNum").val();
            var nursingNum = $("#nursingNum").val();
            var beginTime = $("#beginTime").val();
            var serviceProject = $("#serviceProject").val();
            var homeNurseBedCount = $("#homeNurseBedCount").val();
            if (areaName == "") {
                $("#labelmsg").text('请选择所属区域！').addClass("label-danger");
            } else if (institutionName == "" || $("#same1").html() == "重复") {
                $("#labelmsg").text('请输入单位名称！').addClass("label-danger");
            } else if (!flag1) {
                $("#labelmsg").text('请选择组织类型！').addClass("label-danger");
            } else if (address == "") {
                $("#labelmsg").text('请输入单位地址！').addClass("label-danger");
            }/*else if (businessLicenseNo==null||businessLicenseNo == "") {
                $("#labelmsg").text('请输入《民办非企业单位登记证 书》 或《营业执照》编号！').addClass("label-danger");
            } */else if (!flag2) {
                $("#labelmsg").text('请选择注册类型！').addClass("label-danger");
            } else if (applyName == null || applyName == '') {
                $("#labelmsg").text('请输入联系人！').addClass("label-danger");
            } else if (moblie1 == null || moblie1 == '') {
                $("#labelmsg").text('请输入手机号码！').addClass("label-danger");
            } else if (moblie1 != null && moblie1 != "" && !ServiceOrgDetail.isMoblie(moblie1)) {
                $("#labelmsg").text('请输入正确的手机号码！').addClass("label-danger");
            } else if (postcode != null && postcode != "" && !ServiceOrgDetail.isPostcode(postcode)) {
                $("#labelmsg").text('请输入正确的邮编！').addClass("label-danger");
            } else if (typeof (bedCount) != "undefined") {
                if (bedCount != null && bedCount != "" && !ServiceOrgDetail.isBedRoom(bedCount)) {
                    $("#labelmsg").text('请输入正确的普通住宿床位！').addClass("label-danger");
                } else if (bedEmptyCount != null && bedEmptyCount != "" && !ServiceOrgDetail.isRegCapital(bedEmptyCount)) {
                    $("#labelmsg").text('请输入正确的空闲普通住宿床位！').addClass("label-danger");
                } else if (bedMoney != null && bedMoney != "" && !ServiceOrgDetail.isRegCapital(bedMoney)) {
                    $("#labelmsg").text('请输入正确的普通住宿床位价格！').addClass("label-danger");
                } else if (bedNurseCount != null && bedNurseCount != "" && !ServiceOrgDetail.isBedRoom(bedNurseCount)) {
                    $("#labelmsg").text('请输入正确的护理床位！').addClass("label-danger");
                } else if (bedNurseEmptyCount != null && bedNurseEmptyCount != "" && !ServiceOrgDetail.isBedRoom(bedNurseEmptyCount)) {
                    $("#labelmsg").text('请输入正确的空闲护理床位！').addClass("label-danger");
                } else if (bedNurseMoney != null && bedNurseMoney != "" && !ServiceOrgDetail.isRegCapital(bedNurseMoney)) {
                    $("#labelmsg").text('请输入正确的护理床位价格！').addClass("label-danger");
                } else if (bedCareCount != null && bedCareCount != "" && !ServiceOrgDetail.isBedRoom(bedCareCount)) {
                    $("#labelmsg").text('请输入正确的日间照料床位！').addClass("label-danger");
                } else if (bedCareEmptyCount != null && bedCareEmptyCount != "" && !ServiceOrgDetail.isBedRoom(bedCareEmptyCount)) {
                    $("#labelmsg").text('请输入正确的空闲日间照料床位！').addClass("label-danger");
                } else if (bedCareMoney != null && bedCareMoney != "" && !ServiceOrgDetail.isRegCapital(bedCareMoney)) {
                    $("#labelmsg").text('请输入正确的日间照料床位价格！').addClass("label-danger");
                } else if (instProp == null && instProp == "") {
                    $("#labelmsg").text('请输入单位性质！').addClass("label-danger");
                } else if (roomProp == null && roomProp == "") {
                    $("#labelmsg").text('请输入用房属性！').addClass("label-danger");
                } else if (landArea != null && landArea != "" && !ServiceOrgDetail.isRegCapital(landArea)) {
                    $("#labelmsg").text('请输入正确的使用面积！').addClass("label-danger");
                } else if (serviceProject == null || serviceProject == "") {
                    $("#labelmsg").text('请选择服务项目！').addClass("label-danger");
                } else if (homeNurseBedCount != null && homeNurseBedCount != "" && !ServiceOrgDetail.isBedRoom(homeNurseBedCount)) {
                    $("#labelmsg").text('请输入正确的居家护理床位！').addClass("label-danger");
                } else {
                    $("#labelmsg").text('');
                    $btn.button('loading');
                    $.ajax({
                        type: "POST",
                        url: window.apppath + "/admin/api/serviceOrgEdit",
                        data: $("#serviceOrgEditForm").serialize() + "&serviceProjectName=" + serviceProjectName + "&areaOrder=" + getAreaOrder(areaName) + "&attach=" + attach,
                        dataType: "json",
                        success: function (res) {
                            $btn.button('reset');
                            if (res.success) {
                                alertSuccess("保存信息", "保存成功", function () {
                                    if ($("#type").val() == 2) {
                                        window.location.href = window.apppath + '/admin/institution/map/' + $("#id").val();
                                    }
                                    else
                                        window.location.href = window.apppath + '/admin/serviceOrgDetailMap/' + $("#id").val();
                                });
                            } else {
                                alert2("<div style='text-align:left;font-size: 18px;padding-left: 35px'>" + res.message + "</div>");
                            }
                        }
                    });
                }
            } else {
                $("#labelmsg").text('');
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/serviceOrgEdit",
                    data: $("#serviceOrgEditForm").serialize() + "&serviceProjectName=" + serviceProjectName + "&attach=" + attach,
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            alertSuccess("保存信息", "保存成功", function () {
                                if (institutionTypeDictId.indexOf('9') >= 0) {
                                    window.location.href = window.apppath + '/admin/institution/map/' + $("#id").val();

                                }
                                else if (institutionTypeDictId.indexOf('7') >= 0) {
                                    window.location.href = window.apppath + '/admin/providersDetailMap/' + $("#id").val();

                                }
                                else
                                    window.location.href = window.apppath + '/admin/serviceOrgDetailMap/' + $("#id").val();
                            });
                        } else {
                            alert2("<div style='text-align:left;font-size: 18px;padding-left: 35px'>" + res.message + "</div>");
                        }
                    }
                });
            }
        },
        verify: function (status, type) {
            var id = $("#serviceOrgId").val();
            var $btn = $(this);
            $btn.button('loading');
            $("#verify" + status).prop("disabled", true);
            $("#verify" + status).html("审核中");
            Metronic.blockUI({
                target: $("#verify" + status).parent().parent().parent().parent(),
                boxed: true,
                message: '审核中。。'
            });
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/serviceOrgVerify",
                data: {
                    id: id,
                    status: status,
                    content: $("input[name=verifyContent]").val()
                },
                dataType: "json",
                success: function (res) {
                    Metronic.unblockUI($("#verify" + status).parent().parent().parent().parent());
                    $btn.hide();
                    if (res.success) {
                        if (status == 1) {
                            var message = "<div style='text-align:left;font-size: 18px;padding-left: 35px'>平台账号：" + res.data.login_name + "</div>" +
                                "<div  style='text-align:left;font-size: 18px;padding-left: 35px'>初始密码：123456</div>";
                            alert2(message, function () {
                                if (type == 0) {
                                    window.parent.updateTab("side-serviceOrg-list");
                                    window.parent.closeTab('serviceOrgInfo');
                                }
                                else {
                                    window.parent.updateTab("side-institution-list");
                                    window.parent.closeTab('tab_institution_info');
                                    /*window.parent.updateTab("side-providersShow");
                                     window.parent.closeTab('providerInfo');*/
                                }
                            });
                        }
                        if (status == 3) {
                            alert2("<div style='text-align:left;font-size: 18px;padding-left: 35px'>" + res.message + "</div>", function () {
                                if (type == 0) {
                                    window.parent.updateTab("side-serviceOrg-list");
                                    window.parent.closeTab('serviceOrgInfo');
                                }
                                else {
                                    window.parent.updateTab("side-providersShow");
                                    window.parent.closeTab('providerInfo');
                                }
                            });
                        }
                    } else {
                        alert2("<div style='text-align:left;font-size: 18px;padding-left: 35px'>" + res.message + "</div>", function () {
                        });
                    }
                }
            });
        },
        upload: function (avatar) {
            var avatarFile = $("#" + avatar).val();
            var id = $("#id").val();
            if (avatarFile != null && avatarFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/fileUpload?id=" + id,
                    secureuri: false,
                    fileElementId: avatar,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        Metronic.alert({type: 'success', message: data.message, closeInSeconds: 2, icon: 'check'});
                    },
                    error: function (data, status, e) {
                        console.log(e);
                    }
                });
            } else {
                /*Metronic.alert({type: 'danger', message: '请上传证件.', closeInSeconds: 2, icon: 'warning'});*/
                Metronic.alert({type: 'success', message: "保存成功", closeInSeconds: 2, icon: 'check'});
            }
        }
        ,
        logoUpload: function (file, msg) {
            var typeFile = $("#" + file).val().trim();
            if (typeFile != null && typeFile != "") {
                $.ajaxFileUpload({
                    url: window.apppath + "/admin/api/serviceOrg/importLogoUrl",
                    secureuri: false,
                    fileElementId: file,//file控件id
                    dataType: 'json',
                    success: function (data, status) {
                        $("#" + msg).text(data.message).addClass("label-danger");
                        $("#photoImg").attr("src", window.apppath + data.data);
                        $("#photoImg").css("width", "168px");
                        $("#photoImg").css("height", "164px");
                        $("#logoUrl").val(data.data);
                    },
                    error: function (data, status, e) {
                        console.log(e);
                    }
                });
            } else {
                $("#" + msg).text("请选择文件！").addClass("label-danger");
            }
        }
        ,//区号+号码，区号以0开头，3位或4位
        //号码由7位或8位数字组成
        //区号与号码之间可以无连接符，也可以“-”连接
        isPhone: function (str) {
            /*var reg = /^0\d{2,3}-?\d{7,8}$/;*/
            var reg = /^\d{7,8}$/;
            return reg.test(str);
        },
        isEmail: function (str) {
            /*var reg = /^0\d{2,3}-?\d{7,8}$/;*/
            var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            return reg.test(str);
        }
        ,
        //11位数字，以1开头
        isMoblie: function (str) {
            var reg = /^1\d{10}$/;
            return reg.test(str);
        }
        ,
        isPostcode: function (str) {
            var reg = /^\d{6}$/;
            return reg.test(str);
        }
        ,
        isBedRoom: function (str) {
            var reg = /^\d*\d$/;
            return reg.test(str);
        }
        ,
        isRegCapital: function (str) {
            var reg = /^\d*\d$|^\d*.\d*\d$/;
            return reg.test(str);
        },
        showInType: function (inClassic, inType) {
            var inClassic = $("#" + inClassic).val();
            var type = $("#" + inType);
            if (inClassic != "") {
                type.prop("disabled", false);
                $.post(window.apppath + "/admin/api/getIntypeByInclassic", {
                    inClassic: inClassic
                }, function (res) {
                    $("#" + inType).html('<option value="">请选择...</option>');

                    $.each(res.data, function (index, ele) {
                        var option = document.createElement("option");
                        document.getElementById(inType).appendChild(option);
                        option.text = ele.inType;
                        option.value = ele.inType;

                    })
                }, 'json');

            } else {
                $("#" + inType).html('<option value="">请选择...</option>');
                type.prop("disabled", true);
            }
        },

    };
}
();