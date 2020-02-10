/**
 * Created by Administrator on 2016/9/13.
 */
var ElderMsgPoorApplyList = function () {
    var _self = "";
    var tableContainer = $("#datatable_apply_list").parents(".table-container");
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.dataTableInit();
            //导出数据
            $(".excel").click(function () {
                window.location.href = window.apppath + "/admin/api/elderly/poor/export?" +
                    "result=" + $("#result").val()+
                    "&region1=" + $("#region1").val()+
                    "&region2=" + $("#region2").val()+
                    "&region3=" + $("#region3").val()
                ;
            })

            //导出数据
            $(".downloadAvatar").click(function () {
                window.location.href = window.apppath + "/admin/api/elderly/poor/downloadAvatar?" +
                    "result=" + $("#result").val()+
                    "&region1=" + $("#region1").val()+
                    "&region2=" + $("#region2").val()+
                    "&region3=" + $("#region3").val()
                ;
            })

        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_apply_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/poor/apply/list", {
                            length: params.length,
                            start: params.start,
                            idcardno:$("#idcardno").val(),
                            number:$("#number").val(),
                            name:$("#name").val(),
                            result:$("#result").val(),
                            region1:$("#region1").val(),
                            region2:$("#region2").val(),
                            region3:$("#region3").val(),
                            orderField: 'id',
                            orderDir: "DESC"
                        }, function (res) {
                            if (res) {
                                if(res.recordsTotal>0)
                                {
                                    $(".excel").show();
                                    $(".downloadAvatar").show();
                                }
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
                        {"data": "id"}
                        ,
                        {"data": "region1"}
                        ,
                        {"data": "number"}
                        ,
                        {
                            "data": "name"
                        },
                        {
                            "data": "idcardno", render: function (data, type, row, meta) {
                            if (data.length == 15) {
                                return data.replace(data.substr(8, 6), "******");
                            } else {
                                return data.replace(data.substr(10, 6), "******");
                            }
                        }
                        },
                        {
                            "data": "sex", render: function (data, type, row, meta) {
                            return sexValue[data];
                        }
                        },
                        {
                            "data": "result", render: function (data, type, row, meta) {
                            if (data == null)
                                data = 0;
                            return poorApplyResultName[data];
                        }
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var html = '<a  href="#" data="' + window.apppath + '/admin/elderly/poor/apply/info/' + data + '" class="btn default btn-xs green-stripe applyInfo">查看</a>';
                            if (row.result == 1)
                                html = html + '<a  href="#" data="' + window.apppath + '/admin/elderly/poor/apply/certificate/' + data + '" class="btn default btn-xs green-stripe certificate">查看证书</a>';

                            return html;
                        }
                        }
                    ]
                }
            });
            /**
             * 查询
             */
            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

            /**
             * 重置
             */
            $("#reload").click(function () {
                $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("select").val("");//找到form表单下的所有select标签并清空
                $("#searchDiv").find("input:radio").parent().removeClass("checked");//找到form表单下的所有radio标签并清空
                _self.grid.getDataTable().ajax.reload();
            });
            $(".table-poor-action-add").click(function () {
                var href = $(this).attr("data");
                window.parent.addTab("tab_poor_add", "特困人员增加", href);
            });
            _self.grid.getTable().on("click", "a.applyInfo", function () {
                var href = $(this).attr("data");
                window.parent.addTab("poor-applyInfo", "特困人员供养申请详情", href);
            });
            _self.grid.getTable().on("click", "a.certificate", function () {
                var href = $(this).attr("data");
                popIframe(href, 703, 600);
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
        getDate: function (time) {
            return time.getFullYear() + "-" + _self.formatTwo(time.getMonth() + 1) + "-" + _self.formatTwo(time.getDate());
        },
        formatTwo: function (str) {
            str = str + "";
            if (str.length == 1) {
                str = "0" + str;
            }
            return str;
        }, goToPage: function () {
            var page = $("#page").val();
            var len =  _self.grid.getDataTable().page.info().pages;
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