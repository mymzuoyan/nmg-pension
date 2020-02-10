/**
 * Created by gengqiang on 2017/6/2.
 */
var ElderMsgAddAndUpNotify = function () {
    var _self = "";
    return {
        areaName: "",
        age: 0,
        init: function (str, i) {
            _self = this;
            _self.age = i;
            _self.areaName = str;
            _self.tableInit();
        },
        tableInit: function () {
            var dt = $("#datatable_event_list").DataTable({
                "lengthChange": false,
                "pageLength": 10, // default records per page
                "ajax": function (data, callback, settings) {
                    $.post(window.apppath + "/admin/api/elderly/getAddAndUpElder", {
                        areaName: _self.areaName,
                        age: _self.age
                    }, function (res) {
                        $("#elderCount").html(res.recordsTotal);
                        $("#scanMore").show();
                        callback(
                            res
                        )
                    }, "json")
                },
                "ordering": false,
                "columns": [
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        return '<input type="checkbox" class="group-checkable"  name="noticeId" value="' + row.id + '">';
                    }
                    },
                    {
                        "data": "region1", render: function (data, type, row, meta) {
                        var value = data;
                        if (data == null || data == "") {
                            value = row.areaName;
                        }
                        if (value.split(",").length > 1) {
                            return value.split(",")[1];
                        }
                        else
                            return value;

                    }
                    },
                    {
                        "data": "elderName", render: function (data, type, row, meta) {
                        return data;
                    }
                    },
                    {
                        "data": "idcardno", render: function (data, type, row, meta) {
                        return data;
                    }
                    },
                    {"data": "age"},
                    {
                        "data": "sexDictId", render: function (data, type, row, meta) {
                        if (data == 1) {
                            return "男";
                        }
                        if (data == 2) {
                            return "女";
                        }
                        return "";
                    }
                    },
                    {
                        "data": "elderTypeDictIds", render: function (data, type, row, meta) {
                        var arr = {
                            "1": "城市三无/农村五保", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
                            "5": "百岁老人", "9": "空巢", "10": "独居"
                        };
                        var scopes = '';
                        if (data != "" && data != null) {
                            var scope = data.split(",");
                            for (var i = 0; i < scope.length; i++) {
                                if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                                    scopes += arr[scope[i]] + ','
                                }
                            }
                            scopes = scopes.substr(0, (scopes.length - 1));
                        }
                        return scopes;
                    }
                    },
                    {
                        "data": "mobile", render: function (data, type, row, meta) {
                        if (data != null && data != "") {
                            return data;
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "age", render: function (data, type, row, meta) {
                        if (data == 79) {
                            return 400;
                        }
                        else if (data == 89) {
                            return 700;
                        }
                        else if (data == 99) {
                            return 900;
                        }
                    }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        return '<a  href="#" data="' + window.apppath + '/admin/elderly/update/' + data + '?method=edit" class="btn default btn-xs green-stripe elderInfo">查看</a>';

                    }
                    }
                ],
                "language": { // language settings
                    // metronic spesific
                    "metronicGroupActions": "_TOTAL_ 条记录被选中",
                    "metronicAjaxRequestGeneralError": "请求服务器失败，请检查网络连接",
                    "sProcessing": "正在加载数据...",
                    // data tables spesific
                    "lengthMenu": "<span class='seperator'>|</span>每页显示 _MENU_ 条记录",
                    "info": "共 _TOTAL_ 条记录",
                    "infoEmpty": "暂无数据",
                    "infoFiltered": "",
                    "emptyTable": "没有数据",
                    "zeroRecords": "",
                    "paginate": {
                        "previous": "上一页",
                        "next": "下一页",
                        "last": "末页",
                        "first": "首页",
                    },

                },
                "searching": true,
                "processing": true,
            });
            $("input[type=search]").parent().parent().parent().parent().remove();
            $("#datatable_event_list").on("click", "a.elderInfo", function () {
                var href = $(this).attr("data");
                window.parent.addTab("elderInfo", "老人详情信息", href);
            });
            //导出
            $("#excel").click(function () {
                window.location.href = window.apppath + "/admin/api/elderly/exportNeedNoticeElder?areaName=" + _self.areaName + "&age=" + _self.age;
            });

            $("#search").click(function () {
                var areaName = $("input[name=areaName]").val();
                if (areaName.split(",").length > 1) {
                    areaName = areaName.split(",")[1];
                }
                var homeTel = $("input[name=homeTel]").val();
                var elderName = $("input[name=elderName]").val();
                var idcardno = $("input[name=idcardno]").val();
                var sexDictId = $("#sexDictId :selected").val();
                dt.columns("1").search(areaName).columns("2").search(elderName)
                    .columns("3").search(idcardno).columns("5").search(sexDictId)
                    .columns("8").search(homeTel).draw();
            })


        },
        sendMessage: function (ids) {
            $.post(window.apppath + "/admin/api/elderly/sendElderTipByMobile", {
                ids: ids
            }, function (res) {
                if (res.success) {
                    alertSuccess("短信提醒", res.message, function () {
                        window.location.reload();
                    })
                }
                else {
                    alert2(res.message);
                }

            }, 'json');
        },
        selectArea: function () {
            $('#myModal').modal({
                keyboard: true
            });
        },
        getAreaValue: function (areaName, areaId) {
            document.getElementById("areaName").value = areaName;
            document.getElementById("areaId").value = areaId;
            $('#myModal').modal('hide');
        },
    }
}();