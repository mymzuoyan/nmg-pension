/**
 * Created by gengqiang on 2018/4/25.
 */
var CardDataList = function () {

    var _self = null;
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.dataTableInit();
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_card_data_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/org/card/list", {
                            length: params.length,
                            start: params.start,
                            accBookNo: $("#searchDiv input[name =accBookNo]").val(),
                            'cardNo': $("#searchDiv input[name =cardNo]").val(),
                            'bizName': $("#searchDiv input[name =serviceOrgName]").val(),
                            'personName': $("#searchDiv input[name =elderlyName]").val(),
                            'certNo': $("#searchDiv input[name =idcardno]").val(),
                            consumeId: $("#consumeSelect option:selected").val(),
                            orderField: 'a.write_date',
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
                    // deferLoading: 0,
                    "columns": [
                        {
                            "data": "accBookNo"
                        },
                        {
                            "data": "cardNo"
                        },
                        {
                            "data": "bizName"
                        },
                        {
                            "data": "personName"
                        },
                        {
                            "data": "consumeId"
                        },
                        {
                            "data": "payinAmount", render: function (data, type, row, meta) {
                            if (data == null || data == '')
                                data = "";
                            return data/100 + "元";
                        }
                        },
                        {
                            "data": "discountFee", render: function (data, type, row, meta) {
                            if (data == null || data == '')
                                data = "";
                            return data/100 + "元";
                        }
                        },
                        {
                            "data": "writeDate"
                        }
                    ]
                }

            });


            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
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
    }

}();