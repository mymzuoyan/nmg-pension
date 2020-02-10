/**
 * Created by Administrator on 2018/1/16.
 */
var GoldReissueList = function () {

    var _self = "";
    var tableContainer = $("#table").parent();
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();
            //导出数据
            $(".excel").click(function () {
                window.location.href = window.apppath + "/admin/api/gold/goldSend/exportExcel2?" +
                    "areaName=" + $("#areaName").val() +
                    "&idcardno=" + $("#idcardno").val() +
                    "&elderName=" + $("#elderName").val()
            })
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#table"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/gold/goldSend/goldReissueList", {
                            length: params.length,
                            start: params.start,
                            areaName: $("#areaName").val(),
                            idcardno: $("#idcardno").val(),
                            elderName: $("#elderName").val(),
                            orderField: 'id',
                            orderDir: "DESC"
                        }, function (res) {
                            console.log(res);
                            if (res) {
                                $("#excel").show();
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
                            return '<input type="checkbox" name="deleteId" value="' + row.id + '">';
                        }
                        },
                        {
                            "data": "goldElderly.elderlyMsg.elderName"
                        },
                        {
                            "data": "goldElderly.elderlyMsg.idcardno"
                        },
                        {
                            "data": "goldElderly.elderlyMsg.areaName", render: function (data, type, row, meta) {
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
                        },
                        {
                            "data": "startTime" , render: function (data, type, row, meta) {
                            if(data!= null){
                                data =data.replace(/(\d{4}).(\d{1,2}).(\d{1,2}).+/mg, '$1-$2');
                                return data;
                            }else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "endTime" , render: function (data, type, row, meta) {
                            if(data!= null ){
                                data =data.replace(/(\d{4}).(\d{1,2}).(\d{1,2}).+/mg, '$1-$2');
                                return data;
                            }else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "goldElderly.applyType", render: function (data, type, row, meta) {
                            if (data != null) {
                                return ["80-89周岁", "90-94周岁", "95-99周岁","100周岁以上"][data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "goldSendStandard.moneyStandard"
                        },
                        {
                            "data": "monthCount"
                        },
                        {
                            "data": "totalMoney"
                        },
                        {
                            "data": "goldElderly.fafangWay" , render: function (data, type, row, meta) {
                            if (data != null) {
                                return ["市民卡", "工商银行", "农业银行", "中国银行", "建设银行", "交通银行", "邮储银行"
                                    , "农商银行", "其他", "南京银行", "紫金农商银行", "招商银行", "民生银行"
                                    , "中信银行", "兴业银行", "浦发银行", "江苏银行", "广发银行", "平安银行"
                                    , "华夏银行", "光大银行", "上海银行", "苏州银行", "江南农村商业银行"][data];
                            } else {
                                return "";
                            }
                        }
                        },
                        {
                            "data": "goldElderly.bankCardno"
                        }
                        /*{
                         "data": "id", render: function (data, type, row, meta) {
                         var columnHtml = '';
                         /!*columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs blue-stripe info">详细</button>';*!/
                         columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs green-stripe update">修改</button>';
                         /!*columnHtml += '<button data-id="' + data + '"  class="btn default btn-xs red-stripe del">删除</button>';*!/
                         return columnHtml;
                         }
                         },*/

                    ]
                }
            });

            $(".table-group-action-import").click(function () {
                $('#impModal').modal({
                    keyboard: true
                });
            });

            /*Date.prototype.Format = function (fmt) {
                var o = {
                    "M+": this.getMonth() + 1, //月份
                    "d+": this.getDate(), //日
                    "h+": this.getHours(), //小时
                    "m+": this.getMinutes(), //分
                    "s+": this.getSeconds(), //秒
                    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                    "S": this.getMilliseconds() //毫秒
                };
                if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                for (var k in o)
                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                return fmt;
            }*/


            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var Id = $(this).data("id");
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
                        $.post(window.apppath + "/admin/api/gold/forGoldInfo/delete", {id: Id}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                _self.grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }, onCancel: function () {

                    }
                }).confirmation('toggle');
            });


            /**
             * 更新
             */
            _self.grid.getTable().on("click", "button.update", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("gold_elderly_edit", "人员登记信息更新", window.apppath + "/admin/gold/forGold/edit/" + id);
            });

            /**
             * 详情
             */
            _self.grid.getTable().on("click", "button.info", function (e) {
                var id = $(this).data("id");
                window.parent.addTab("ps_money_type_info", "人员登记信息详情", window.apppath + "/admin/gold/forGold/info/" + id);
            });

            /**
             * 刷新
             */
            $("#refresh").click(function () {
                _self.grid.getDataTable().ajax.reload();
            })

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

        },
        goToPage: function () {
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
        showTbody1: function () {
            if (flag1) {
                $('#tbody1').css("display", "");
                flag1 = false;
            } else {
                $('#tbody1').css("display", "none");
                flag1 = true;
            }
        },
        showTbody2: function () {
            if (flag2) {
                $('#tbody2').css("display", "");
                flag2 = false;
            } else {
                $('#tbody2').css("display", "none");
                flag2 = true;
            }
        }
    }
}();