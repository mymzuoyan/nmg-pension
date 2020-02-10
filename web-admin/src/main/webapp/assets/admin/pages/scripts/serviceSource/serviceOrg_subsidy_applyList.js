/**
 * Created by miaoyueming on 2019/9/29.
 */
var ServiceOrgSubsidyMechanismList = function () {
    var _self = "";

        return {
        grid: "",
        flag:true,
        init: function () {
            _self = this;
            var isJg = $("#isJg").val();
            if(isJg==1){
                _self.flag=false;
            }
            _self.tableInit();

        },
        tableInit: function () {
            var tableContainer = $("#datatable_list").parents(".table-container");
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/mechanismList", {
                            length: params.length,
                            start: params.start,
                            serviceOrgName: $("input[name=serviceOrgName]").val(),
                            applyYear: $("input[name=applyYear]").val(),
                            object: $("select[name=applyObject]").val(),
                            status: $("select[name=status]").val(),
                            legalRepresentative: $("input[name=legalRepresentative]").val(),
                            mobile: $("input[name=mobile]").val(),
                            starClass: $("input[name=starClass]").val(),
                            orderField: 'a.id',
                            orderDir: "DESC"
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
                        {
                            "data": "applyYear", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "serviceOrgName", render: function (data, type, row, meta) {
                            if (data != null && data != "") {
                                return '<div style="text-align: left">' + data + '</div>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "address", render: function (data, type, row, meta) {
                            if (data != null && data != "")
                                return data;
                            else
                                return "";
                        }
                        },
                        {
                            "data": "legalRepresentative", render: function (data, type, row, meta) {
                                if (data != null && data != "")
                                    return data;
                                else
                                    return "";
                            }
                        },
                        {
                            "data": "mobile", render: function (data, type, row, meta) {
                                if (data != null && data != "")
                                    return data;
                                else
                                    return "";
                            }
                        },
                        {
                            "data": "starClass", render: function (data, type, row, meta) {
                                if (data != null && data != ""){
                                    if(data==1){
                                        return "一星级";
                                    }
                                    if(data==2){
                                        return "二星级";
                                    }
                                    if(data==3){
                                        return "三星级";
                                    }
                                    if(data==4){
                                        return "四星级";
                                    }
                                    if(data==5){
                                        return "五星级";
                                    }
                                }
                                else
                                    return "未评定星级";
                            }
                        },
                        {
                            "data": "bedNum", render: function (data, type, row, meta) {
                                if (data != null && data != "")
                                    return data;
                                else
                                    return "";
                            }
                        },
                        {
                            "data": "areaStaus", "visible": _self.flag,render: function (data, type, row, meta) {
                                var areaNum = $("#areaNum").val();
                                var cityNum = $("#cityNum").val();
                                //alert(cityNum )
                                var cityStatus = row.cityStatus;
                                //alert(cityStatus)
                                var areaStaus = row.areaStaus;
                                if(areaNum!=null && areaNum!=""){
                                    if(areaStaus == "" || areaStaus == 0 || areaStaus == null){
                                        return "<span style='color:blue'>区级未审核</span>";
                                    }else if(areaStaus == 1){
                                        return "<span style='color:green'>区级审核通过</span>";
                                    }else if(areaStaus == 2){
                                        return "<span style='color:red'>区级审核不通过</span>";

                                    }
                                }else if(cityNum!=null){
                                    if(cityStatus == "" || cityStatus == 0 || cityStatus == null){
                                        return "<span style='color:blue'>市级未审核</span>";
                                    }else if(cityStatus == 1){
                                        return "<span style='color:green'>市级审核通过</span>";
                                    }else if(cityStatus == 2){
                                        return "<span style='color:red'>市级审核不通过</span>";

                                    }
                                }




                            },
                        },

                        {
                            "data": "submitStatus", render: function (data, type, row, meta) {
                                if (data != null && data != "")
                                    return "已提交";
                                else
                                    return "";
                            }
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                                if(data == "" || data == 0 || data == null){
                                    return "<span style='color:blue'>市级，区级未审核</span>";
                                }else if(data == 1){
                                    return "<span style='color:green'>区级审核通过，市级未审核</span>";
                                }else if(data == 2){
                                    return "<span style='color:red'>市级，区级审核不通过</span>";
                                }else if(data == 3){
                                    return "<span style='color:green'>市级，区级审核通过</span>";
                                }else if(data == 4){
                                    return "<span style='color:red'>区级审核通过，市级审核不通过</span>";
                                }

                            }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                return getPermission(data, type, row, meta);
                            }
                        }//操作
                    ]
                }

            });



            function showMetroMessage(messageContent) {
                Metronic.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: messageContent,
                    container: tableContainer,
                    place: 'prepend'
                });
            }

            function update(id,statusNum) {
                $.post(window.apppath + "/admin/api/serviceOrg/subsidy/examine", {
                    id: id,
                    statusNum: statusNum
                }, function (res) {
                    if (res.success) {
                        //alertSuccess("提示信息", res, function () {
                            alert(res.message);
                            window.location.reload();
                        //});
                    }
                    else {
                        alert("审核失败");
                    }

                }, "json");
            }

            $(".table-group-action-add").click(function () {
                var href = $(this).attr("data");
                window.parent.addTab("tab_mechanism_add", "新增运营补贴", href);
            });

            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            /**
             * 审核
             */
            _self.grid.getTable().on("click", "button.invalid", function () {
                var eventId = $(this).data("eventid");
                var statusNum = 0;
                window.parent.confirm3("是否通过审核", "通过", "不通过", function () {
                    statusNum = 1;
                    update(eventId,statusNum);
                }, function () {
                    statusNum = 2;
                    update(eventId,statusNum);
                });
            });


            _self.grid.getTable().on("click", ".info", function () {
                var data = $(this).attr("data");
                window.parent.addTab("tab-serviceOrg-subsidy-apply-info", "运营补贴申请详情", window.apppath + "/admin/serviceOrg/subsidy/mechanismInfo/" + data);
            });

            _self.grid.getTable().on("click", ".elderlyInfo", function () {

                var data = $(this).attr("data");
                window.parent.addTab("tab-serviceOrg-subsidy-apply-elderlyInfo", "老人补贴详情", window.apppath + "/admin/serviceOrg/subsidy/operatingSubsidiesInfo/" + data);

               // window.location = window.apppath +"/admin/institution/elderly/list";

            });
            //导出数据
            $(".excel").click(function () {
                window.location.href = window.apppath + "/admin/api/serviceOrg/subsidy/export?"
                    + "serviceOrgName=" + $("input[name=serviceOrgName]").val() + "&"
                    + "applyYear=" + $("input[name=applyYear]").val() + "&"
                    + "legalRepresentative=" + $('input[name=legalRepresentative]').val() + "&"
                    + "status=" + $('select[status=gradeDictId]').val();

            });



            $(".reload").click(function () {
                $.ajax({
                    type:'POST',
                    url:"/admin/api/serviceOrg/subsidy/showServiceOrgId2",
                    dataType:'json',
                    success:function (data) {
                        if(data !== null){
                            $(".faDing").val("");
                        }else {
                            $("#serviceOrgAssessForm").find("input:text").val("");
                        }
                    },
                });


                //$("#serviceOrgAssessForm").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrgAssessForm").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#serviceOrgAssessForm").find("select").val("");//找到form表单下的所有select标签并清空
                $("#serviceOrgAssessForm").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
            });

            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function () {
                var curRow = $(this).closest('tr');
                var id = $(this).data("id");
                $(this).confirmation({
                    'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        Metronic.blockUI({
                            message: '处理中...',
                            target: tableContainer,
                            overlayColor: 'none',
                            cenrerY: true,
                            boxed: true
                        });
                        $.post(window.apppath + "/admin/api/serviceOrg/subsidy/delMechanismInfo", {id: id}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                showMetroMessage(res.message);
                            }
                        }, "json");
                    }
                }).confirmation('toggle');
            });


        },
        getAreaName: function () {
            $("#areaId").val(AreaTree.getSelectArea());
            $("#areaName").val(AreaTree.getAllAreaName(AreaTree.getSelectArea()));
            $("#areaModal").modal('hide');
        },

    }

}();