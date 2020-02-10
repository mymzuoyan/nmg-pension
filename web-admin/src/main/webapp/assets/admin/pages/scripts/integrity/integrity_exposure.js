/**
 * Created by Administrator on 2016/9/21.
 */
var IntegrityExposure = function () {

    var _self = "";
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();
        },
        tableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_exposure_List").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_exposure_List"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/serviceOrgList", {
                            length: params.length,
                            start: params.start,
                            institutionName: $('input[name=institutionName]').val(),
                            applyName: $('input[name=applyName]').val(),
                            startScore:$('input[name=startScore]').val(),
                            endScore:$('input[name=endScore]').val(),
                            flag:'exposure',
                            orderField: "a.id",
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
                            "data": "id", render: function (data, type, row, meta) {
                                return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                            }
                        },
                        {
                            "data": "areaName", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    var areaName = "";
                                    if (data.split(",").length >= 2) {
                                        areaName = data.split(",")[1];
                                    }
                                    else
                                        areaName = data;
                                    return areaName
                                } else {
                                    return "";
                                }
                            }
                        },// 所属区域
                        {
                            "data": "institutionName", render: function (data, type, row, meta) {
                                return '<div style="text-align: left">' + data + '</div>';
                            }
                        },// 单位名称
                        {
                            "data": "instProp", render: function (data, type, row, meta) {
                                var instProps = ['', '民办民营', '公办民营I', '公办民营II', '公助民营', '公办民营', '共建民营'];
                                if (data != null && data != '') {
                                    return instProps[data];
                                } else {
                                    return "";
                                }

                            }
                        },//4-公助民营 5-公办民营 1-民办民营 6-共建民营 2-公办民营I 3-公办民营II
                        {
                            "data": "applyName"
                        },
                        {
                            "data": "mobile", render: function (data, type, row, meta) {
                                if (data != "" && data != null) {
                                    // return data.replace(data.substr(3, 4), "****");
                                    return data;
                                } else {
                                    return "";
                                }

                            }
                        },// 联系电话
                        {
                            "data": "score",render: function (data, type, row, meta) {
                                if (data !=null && data !=""){
                                    return data;
                                }else{
                                    return "";
                                }
                            }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                                var html = "";
                                html += '<a data="' + window.apppath + '/admin/serviceOrgDetail/' + data + '" class="btn default btn-xs green-stripe info" >查看</a>';
                                return html;
                            }
                        }
                    ]
                }

            });
            _self.grid.getTable().on("click", "a.info", function () {
                var href=$(this).attr("data");
                window.parent.addTab("serviceOrgInfo", "组织详情信息", href);
            });
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });
            $(".table-group-action-reload").click(function () {
                $("#exposureSystemForm").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#exposureSystemForm").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#exposureSystemForm").find("select").val("");//找到form表单下的所有select标签并清空
                $("#exposureSystemForm").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
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

        }
    }
}();