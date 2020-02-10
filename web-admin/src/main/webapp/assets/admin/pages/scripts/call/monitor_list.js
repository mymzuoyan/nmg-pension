/**
 * Created by Administrator on 2016/9/13.
 */
var MonitorList = function () {
    var _self = "";
    var count=0;
    return {
        groupname:"",
        grid:"",
        init: function (id) {
            _self = this;
            _self.groupInit();
            if(id!=null&&id!=""&&id!=0)
            {
            _self.groupname=id;
            }
            $("#addMonitor").click(function () {

                window.location.href = window.apppath + "/admin/call/monitor/add"
            });


            $("#search").click(function () {
                _self.grid.getDataTable().ajax.reload();
            });
            $(".table-group-action-reload").click(function () {
                $("#searchDiv").find("input:text").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("input:hidden").val("");//找到form表单下的所有input标签并清空
                $("#searchDiv").find("select").val("");//找到form表单下的所有select标签并清空
                $("#searchDiv").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
                $("#searchDiv").find("input:checkbox").attr("checked", false);
            });
        },
        groupInit:function () {
            $.post(window.apppath + "/admin/call/api/monitor/groupAllList", {
            }, function (res) {
                if(res!=null)
                {

                    var optionHtml="";
                    optionHtml+="<option value=''>所有群组</option>";
                    for(var i in res)
                    {
                        if(res[i].groupname== _self.groupname)
                        {
                            optionHtml+='<option value="'+res[i].groupname+'" selected>'+res[i].groupname+'</option>';

                        }
                        else
                        {
                            optionHtml+='<option value="'+res[i].groupname+'">'+res[i].groupname+'</option>';

                        }
                    }
                    $(' select[name=groupName]').html(optionHtml);
                }
                _self.dataTableInit();
            }, 'json');
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            var tableContainer = $("#datatable_monitor_list").parents(".table-container");
            _self.grid.init({
                src: $("#datatable_monitor_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/monitor/list", {
                            length: params.length,
                            start: params.start,
                            account:$("#account").val(),
                            groupName:$('#groupName').val(),
                            extension:$("#extension").val(),
                            name:$("#name").val(),
                            pstnnumber:$('#pstnnumber').val(),
                            isLeader:$("#searchDiv input[name=isLeader]:checked").val()
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
                        // {
                        //     "data": "id", render: function (data, type, row, meta) {
                        //   return data;
                        // }
                        // },
                        {
                            "data": "extension"
                        },
                        {"data": "name"},
                        {
                            "data": "groupName"
                        },
                        {
                            "data": "pstnnumber"
                        },
                        {
                            "data": "account"
                        },
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            var columnHtml = '';
                            columnHtml += '<a href="' + window.apppath + '/admin/call/monitor/update/' + data + '" class="btn default btn-xs green-stripe">详细</a>';
                            return columnHtml;
                        }
                        }
                    ]
                }

            });

            /**
             * 删除
             */
            _self.grid.getTable().on("click", "button.del", function (e) {
                var curRow = $(this).closest('tr');
                var monitorId = $(this).data("monitorid");
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
                        $.post(window.apppath + "/admin/call/api/monitor/delete", {uid: monitorId}, function (res) {
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


        },
        showMetroMessage: function (messageContent) {
            var content=$("#datatable_monitor_list").parents(".table-container");
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: content,
                place: 'prepend',
                closeInSeconds: 2
            });
        },
        getDate: function (time) {
            return time.getFullYear() + "-" +_self. formatTwo(time.getMonth() + 1) + "-" + _self.formatTwo(time.getDate());

        },
        formatTwo: function (str) {
            str = str + "";
            if (str.length == 1) {
                str = "0" + str;
            }
            return str;
        }
    }

}();