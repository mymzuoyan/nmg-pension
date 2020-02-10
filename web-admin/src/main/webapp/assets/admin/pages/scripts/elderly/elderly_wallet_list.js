/**
 * Created by Administrator on 2016/10/11.
 */
var ElderMsgWalletList = function () {

    var _self = "";
    var tableContainer = $("#dataTable_elderMsg_wallet").parents(".table-container");


    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();

        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#dataTable_elderMsg_wallet"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/wallet/list", {
                            length: params.length,
                            start: params.start,
                            areaName: $("#areaName").val(),
                            elderName: $("input[name=elderName]").val(),
                            idcardno: $("input[name=idcardno]").val()
                        }, function (res) {
                            console.log(res);
                            if (res) {
                                $(".deleteDiv").css("display", "black");
                                $("#excel").css("display", "block");
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
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="checkbox" name="govbuyId" value="' + data + '">';
                        }
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
                            if (data != null && data != "") {
                                var strs = data.split(",");
                                if (strs.length >= 2)
                                    return '<div title="' + strs[1] + '" style="text-align: center;vertical-align: middle;/*text-overflow: ellipsis;width: 40px;overflow: hidden;white-space: nowrap*/">' + strs[1] + '</div>';
                                else
                                    return '<div title="' + strs[0] + '" style="text-align: center;vertical-align: middle;/*text-overflow: ellipsis;width: 40px;overflow: hidden;white-space: nowrap*/">' + strs[0] + '</div>';
                            }
                            return "";
                        }
                        },
                        {
                            "data": "elderName", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return '<div title="' + data + '" style="text-align: center;vertical-align: middle;text-overflow: ellipsis;width: 40px;overflow: hidden;white-space: nowrap">' + data + '</div>';
                            } else {
                                return "";
                            }
                        }
                        },
                        {"data": "age"},
                        {
                            "data": "sexDictId", render: function (data, type, row, meta) {
                            if (data != "" && data != null) {
                                return ["保密", "男", "女"][data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                         "data": "realAddress", render: function (data, type, row, meta) {
                         if (data != "" && data != null) {
                         return data;
                         } else {
                         return "";
                         }
                         }
                         },
                        {
                            "data": "balance", render: function (data, type, row, meta) {
                            if (data == null) {
                                data = 0;
                            }
                            return "<span style='color: red'>"+data+"</span>";
                        }
                        },
                         {
                             "data": "id", render: function (data, type, row, meta) {
                             var html = "";
                                 /*html += '<div style="text-overflow: ellipsis;width: 140px;overflow: hidden;">' + '<a href="' + window.apppath + '/admin/elderly/wallet/infoList/' + data + '" class="btn default btn-xs blue-stripe">查看</a>';*/
                             html += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe info">查看</button>';
                             /*if (row.status == 0)
                                 html += '<button data="' + data + '"  class="btn default btn-xs red-stripe verify">审核</button>';
                                 html += '</div>';*/
                             return html;
                        }
                        }
                    ]
                }

            });

            /**
             * 详情
             */
            _self.grid.getTable().on("click", "button.info", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("elderly_wallet_infoList", "历史服务记录", window.apppath + "/admin/elderly/wallet/infoList/" + id);
            });

            $(".table-group-action-submit").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });

            $(".table-group-action-reload").click(function () {
                $("#gove-form").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#gove-form").find("select").val("");//找到form表单下的所有select标签并清空
                $("#gove-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
            });

        },
        showMetroMessage: function (messageContent) {
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: tableContainer,
                place: 'prepend',
                closeInSeconds: 2
            });
        },
        goToPage: function () {
            var page = $("#page").val();
            var len = _self.grid.getDataTable().page.info().pages;
            if (page != "" && page != "0") {
                page = parseInt(page) - 1;
                if (page < len)
                    _self.grid.getDataTable().page(page).draw(false);
                else {
                    alert("您输入的页数大于总页数");
                    $("#page").val("");
                }
            }
            else {
                alert("请输入不为0的数字");
                $("#page").val("");
            }

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
        jqchk: function (name) { //jquery获取复选框值
            var chk_value = "";
            $('input[name="' + name + '"]').each(function () {
                var parentParent = $(this).parent();
                if (parentParent.hasClass("checked"))
                    chk_value += ($(this).val()) + ",";
            });
            return chk_value;
        }
    }
}();