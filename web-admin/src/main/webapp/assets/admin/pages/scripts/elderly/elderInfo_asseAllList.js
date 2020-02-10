/**
 * Created by DELL on 2016/10/10.
 */
var AssessAllInfo = function () {

    var grid = "";
    var handleList = function () {
        grid = new Datatable();
        grid.init({
            src: $("#datatable_assessAllInfo"),
            onSuccess: function (grid, res) {
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/elderly/getAssessAllList", {
                        length: params.length,
                        start: params.start,
                        id: $('input[name=elderId]').val()
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
                "sDom": "<'row'<'col-md-4 col-sm-12'<'table-group-actions'> ><'col-md-8 col-sm-12'>r><'table-scrollable't><'row'<'col-md-12 col-sm-12'pi>>", // datatable layout
                "searching": false,
                "ordering": false,
                "destroy": true,
                // deferLoading: 0,
                "columns": [
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        return '<input type="checkbox" name="article" value="' + row.id + '">';
                    }
                    },
                    {
                        "data": "region1", render: function (data, type, row, meta) {
                        if (data == null || data == "") {
                            return row.areaName;
                        } else {
                            return data;
                        }
                    }
                    },
                    {
                        "data": "tid", render: function (data, type, row, meta) {
                        return '<a href="#" data="/admin/elderly/assDetails/' + row.id + '?method=show" class="elderDetails">' + data + '</a>';
                    }
                    },
                    {
                        "data": "elderName", render: function (data, type, row, meta) {
                        return '<a href="#" data="/admin/elderly/update/' + row.id + '?method=edit" class="elderInfo">' + data + '</a>';
                    }
                    },
                    {"data": "idcardno"},
                    {"data": "familyDate"},
                    {"data": "workerName1"},
                    {"data": "workerName2"}
                ]
            }
        });

        grid.getTable().on("click", "a.elderInfo", function () {
            var href = $(this).attr("data");
            window.parent.addTab("elderInfo", "老人详情信息", href);
        });

        grid.getTable().on("click", "a.elderDetails", function () {
            var href = $(this).attr("data");
            window.parent.addTab("elder_assess_details", "老人能力评估信息", href);
        });

    }

    return {
        init: function (method) {
            handleList(method);
        }, goToPage: function () {
            var page = $("#page").val();
            var len = grid.getDataTable().page.info().pages;
            if (page != "" && page != "0") {
                page = parseInt(page) - 1;
                if (page < len)
                    grid.getDataTable().page(page).draw(false);
                else {
                    alert("您输入的页数大于总页数");
                    $("#page").val("");
                }
            }
            else {
                alert("请输入不为0的数字");
                $("#page").val("");
            }

        }
    };
}();