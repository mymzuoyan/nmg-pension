/**
 * Created by Administrator on 2016/9/29.
 */
var CustomerGroupInfo = function () {

    var _self = "";
    return {
        groupId: "",
        init: function (gid) {
            _self = this;
            _self.groupId = gid;
            _self.tableInit();
            $("#btnPublish").click(function () {
                _self.updateGroup();
            })
        },
        updateGroup:function () {
            if (_self.checkSave()) {
                var area="";
                var street="";
                var community="";
                if($("#county").val()=="")
                {
                    area=$("#county option:selected").html();
                }
                if($("#town").val()=="")
                {
                    street=$("#town option:selected").html();
                }
                if($("#village").val()=="")
                {
                    community=$("#village option:selected").html();
                }


                $.post(window.apppath + "/admin/call/api/customer/group/update", {
                    id: $("input[name=id]").val(),
                    name: $("input[name=name]").val(),
                    type: $("#type").val(),
                    tel: $("input[name=tel]").val(),
                    fax: $("input[name=fax ]").val(),
                    zip: $("input[name=zip]").val(),
                    addr: $("input[name=addr]").val(),
                    contactName: $("input[name=contactName]").val(),
                    contactPhone: $("input[name=contactPhone]").val(),
                    province: $("#province option:selected").html(),
                    city: $("#city option:selected").html(),
                    area:area,
                    street: street,
                    community: community,
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
        checkSave: function () {
            var name = $("input[name=name]").val();
            var type = $("#type").val();
            var province = $("#province").val();
            var city = $("#city").val();
            if (name == null || name == "") {
                $("#labelmsg").text('请输入机构名称').addClass("label-danger");
                return false;
            }
            else if (type == null || type == "") {
                $("#labelmsg").text('请选择类型').addClass("label-danger");
                return false;
            }
            else if (province == null || province == "-1") {
                $("#labelmsg").text('请选择省份').addClass("label-danger");
                return false;
            }
            else if (city == null || city == "-1") {
                $("#labelmsg").text('请选择城市').addClass("label-danger");
                return false;
            }
            $("#labelmsg").text('').removeClass("label-danger");
            return true;
        },
        tableInit: function () {
            var grid = new Datatable();
            var tableContainer = $("#datatable_group_customer").parents(".table-container");
            grid.init({
                src: $("#datatable_group_customer"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/customer/group/getListByGroupId", {
                            length: params.length,
                            start: params.start,
                            groupId: _self.groupId,
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
                    // deferLoading: 0,
                    "columns": [
                        {"data": "name"},
                        {
                            "data": "gender", render: function (data, type, row, meta) {
                            return ["保密", "男", "女"][data];
                        }
                        },
                        {
                            "data": "callNum", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": null, render: function (data, type, row, meta) {
                            if (row.callNum != ""&&row.callNum !=null)
                                return "1";
                            else
                                return "0";
                        }
                        },
                        {
                            "data": "address", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "moreAddress", render: function (data, type, row, meta) {
                            return data;
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a href= "' + window.apppath + '/admin/call/customer/update/'+data+'"  class="btn default btn-xs green-stripe info">详细</a>';
                            // columnHtml += '<button data-customerid="' + data + '" class="btn default btn-xs red-stripe del" style="">删除</button>';
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            /**
             * 删除
             */
            grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var customerId = $(this).data("customerid");
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
                    }
                }).confirmation('toggle');
            });


        }
    }
}();