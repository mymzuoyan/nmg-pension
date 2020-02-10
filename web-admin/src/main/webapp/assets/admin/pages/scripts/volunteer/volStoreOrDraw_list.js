var VolStoreOrDrawList = function () {
    var handleList = function (method) {
        var grid = new Datatable();
        var tableContainer = $("#datatable_volStoreOrDraw_List").parents(".table-container");
        var serviceType = $('input[name=serviceType]').val();
        var storeOrDraw = '';
        if(serviceType == 1){
            storeOrDraw = "draw";
        }else if(serviceType == 0){
            storeOrDraw = "store";
        }
        grid.init({
            src: $("#datatable_volStoreOrDraw_List"),
            onSuccess: function (grid, res) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    console.log(storeOrDraw);
                    if(storeOrDraw=='store'){
                        $.post(window.apppath + "/admin/api/volStoreOrDrawList?type=0",
                            {
                                length: params.length,
                                start: params.start,
                                serviceType: $('input[name=serviceType]').val(),
                                volunteerId:$('input[name=volunteerId]').val(),
                                startTimeString:$('input[name=startTimeString]').val(),
                                endTimeString:$('input[name=endTimeString]').val(),
                                organizationName:$('input[name=organizationName]').val()


                           }, function (res) {
                                if (res) {
                                    callback(res);
                                } else {
                                    callback({
                                        data: null,
                                        recordFiltered: 0
                                    });
                                }
                            }, 'json');
                    }else{
                        $.post(window.apppath + "/admin/api/volStoreOrDrawList?type=1",
                            {
                                length: params.length,
                                start: params.start,
                                serviceType: $('input[name=serviceType]').val(),
                                volunteerId:$('input[name=volunteerId]').val(),
                                startTimeString:$('input[name=startTimeString]').val(),
                                endTimeString:$('input[name=endTimeString]').val(),
                                organizationName:$('input[name=organizationName]').val()
                            }, function (res) {
                                if (res) {
                                    callback(res);
                                } else {
                                    callback({
                                        data: null,
                                        recordFiltered: 0
                                    });
                                }
                            }, 'json');
                    }

                },
                "searching": false,
                "ordering": false,
                // deferLoading: 0,
                "columns": [
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        return '<input type="checkbox"  value="' + row.id + '">';
                    }
                    },
                    {"data": "organizationName"},//组织名称
                    {"data": "targetName"},//服务对象
                    {"data": "score"},//积分
                   /* {"data": "serviceTime"},//时间*/
                    {
                        "data": "serviceTime", render: function (data, type, row, meta) {
                            if (data != null && data != "")
                                return data.substring(0,10);
                            else
                                return "";
                        }
                    },
                    {"data": "serviceInfo"},//服务内容
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        return '' /*+ '<a href="' + window.apppath + '/admin/volStoreOrDrawDetail/' + data + '?method=show&storeOrDraw='+storeOrDraw+'' + '" class="btn default btn-xs green-stripe">查看</a>'*/
                            + '<button data-eventid="' + data + '" class="btn btn-xs red-stripe del">删除</button>';
                    }
                    }
                ]
            }
        });

        $(".table-group-action-submit").click(function () {
            grid.getDataTable().ajax.reload();
        });

        $("#reset").click(function(){
            $('input[name=startTimeString]').val('');
            $('input[name=endTimeString]').val('');
            }
        );

        function showMetroMessage(messageContent) {
            Metronic.alert({
                type: 'danger',
                icon: 'warning',
                message: messageContent,
                container: tableContainer,
                place: 'prepend'
            });
        }

        grid.getTable().on("click", "button.del", function () {
            var curRow = $(this).closest('tr');
            var eventId = $(this).data("eventid");
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
                    $.post(window.apppath + "/admin/api/volStoreOrDrawDelete", {eventId: eventId}, function (res) {
                        Metronic.unblockUI(tableContainer);
                        if (res.success) {
                            grid.getDataTable().row(curRow).remove().draw(false);
                        } else {
                            showMetroMessage(res.message);
                        }
                    }, "json");
                }
            }).confirmation('toggle');
        });
    };

    return {

        //main function to initiate the module
        init: function (method) {
            handleList(method);
        }
    };
}();