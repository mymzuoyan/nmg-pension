/**
 * Created by Administrator on 2016/11/7.
 */
var GoodsTypeList=function () {

    var _self="";
    return {
        init: function () {
            _self = this;
            _self.dataTableInit();

            /**
             * 添加
             */
            $("#btnPublish").click(function () {
                _self.addModule();
            });

            /**
             * 新增属性
             */
            $("#addProperty").click(function () {
                var html="<span class='attr-tab'>" +
                    "<span class='attr-span'>" + $("#attr").val() +
                    "</span>" +
                    "<a onclick='GoodsTypeList.closeTab(this)' " + "style='font-size:15px;color: red;margin-left: 10px;text-decoration:none'>×" +
                    "</a>" +
                    "</span>";
                html = $("#propertyDiv").html() + html;
                $("#propertyDiv").html(html);
            });

            /**
             * 修改属性
             */
            $("#modal-addProperty").click(function () {
                var html="<span class='attr-tab'>" +
                    "<span class='attr-span'>" + $("#modal-attr").val() +
                    "</span>" +
                    "<a onclick='GoodsTypeList.closeTab(this)' style='font-size:15px;color: red;margin-left: 10px;text-decoration:none'>×" +
                    "</a>" +
                    "</span>";
                html = $("#modal-propertyDiv").html() + html;
                $("#modal-propertyDiv").html(html);
            });
        },

        dataTableInit: function () {
            var grid = new Datatable();
            var tableContainer = $("#datatable_goods_type").parents(".table-container");
            grid.init({
                src: $("#datatable_goods_type"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/goods/type/list", {
                            length: params.length,
                            start: params.start,
                            orderField: ' a.id',
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
                            return data;
                        }
                        },
                        {"data": "name"},
                        {"data": "attrs", render: function (data, type, row, meta) {
                            var html="";
                            for(var i in data)
                            {
                                html+=data[i].attr+","
                            }
                            if(html!="")
                            {
                                html=html.substr(0,html.length-1);
                            }
                            return html;
                        }},
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            var html="";
                            for(var i in row.attrs)
                            {
                                html+=row.attrs[i].attr+","
                            }
                            if(html!="")
                            {
                                html=html.substr(0,html.length-1);
                            }
                            // if($("#elderServiceStoreManagerUpdate").val()=="1"){
                            //     columnHtml += '<a class="btn default btn-xs blue-stripe info" data-typeid="' + data + '" data-attr="' + html+ '" data-name="' + row.name + '">更新</a>';
                            // }
                            // if($("#elderServiceStoreManagerDel").val()=="1"){
                            //     columnHtml += '<button data-typeid="' + data + '" class="btn default btn-xs red-stripe del" style="">删除</button>';
                            // }

                            columnHtml += '<a class="btn default btn-xs blue-stripe info" data-typeid="' + data + '" data-attr="' + html+ '" data-name="' + row.name + '">更新</a>';
                            columnHtml += '<button data-typeid="' + data + '" class="btn default btn-xs red-stripe del" style="">删除</button>';
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
                var typeId = $(this).data("typeid");
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
                        $.post(window.apppath + "/admin/api/goods/type/delete", {goodsTypeId: typeId}, function (res) {
                            Metronic.unblockUI(tableContainer);
                            if (res.success) {
                                grid.getDataTable().row(curRow).remove().draw(false);
                            } else {
                                _self.showMetroMessage(res.message);
                            }
                        }, "json");
                    }
                }).confirmation('toggle');
            });

            /**
             * 更新
             */
            grid.getTable().on("click", "a.info", function (e) {
                var typeId = $(this).data("typeid");
                var name = $(this).data("name");
                var attr = $(this).data("attr");
                $("#updateClass input[name=typeId]").val(typeId);
                $("#updateClass input[name=name]").val(name);
                var attrStrs = attr.split(",");
                var html = '';
                for(var i in attrStrs) {
                    html += "<span class='attr-tab'>" +
                        "<span class='attr-span'>" + attrStrs[i] + "" +
                        "</span>" +
                        "<a onclick='GoodsTypeList.closeTab(this)' style='font-size:15px;color: red;margin-left: 10px;text-decoration:none'>×" +
                        "</a>" +
                        "</span>";
                }
                $("#modal-attr").val("");
                $("#modal-propertyDiv").html(html);
                $("#updateClass").modal("show");
            });

            $("#updateClass .btnUpdate").click(function () {

                if($("#updateClass input[name=name]").val()==null||$("#updateClass input[name=name]").val()=="")
                {
                    alert("请输入商品类型名称");
                    return false;
                }
                var attr="";
                $("#modal-propertyDiv .attr-span").each(function () {
                    attr+=$(this).html()+",";
                });
                $.post(window.apppath + "/admin/api/goods/type/update", {
                    id: $("#updateClass input[name=typeId]").val(),
                    name:$("#updateClass input[name=name]").val(),
                    attr:attr
                }, function (res) {
                    if (res.success) {
                        alert("更新成功");
                        window.location.reload();
                    }
                    else {
                        alert("更新失败");
                    }
                },"json");
            })

        },
        showMetroMessage: function (messageContent) {
            var tableContainer = $("#datatable_module").parents(".table-container");
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
        },
        addModule: function () {
            var name = $("#tab_add input[name=name]").val();
            if (name == null || name == "") {
                $("#labelmsg").text('请输入商品类型名称').addClass("label-danger");
                return false;
            }
            else {
                var attr="";
                $("#propertyDiv .attr-span").each(function () {
                    attr+=$(this).html()+",";
                });
                $.post(window.apppath + "/admin/api/goods/type/add", {
                    name:name,
                    attr:attr
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        },1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }
        },
        closeTab:function (e) {
            console.log("asd");
            $(e).parent().remove();
        }
    }

}();