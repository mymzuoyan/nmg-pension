/**
 * Created by MaiBenBen on 2017/1/12.
 */
var MonitorStatus = function () {

    var _self = "";
    return {
        grid:"",
        isShow:0,
        init: function () {
            _self = this;
            _self.dataTableInit();

            setInterval( function () {
                _self.grid.getDataTable().ajax.reload();
            },15000);
        },
        dataTableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_monitor_status"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/call/api/monitor/status", {
                            length: params.length,
                            start: params.start,
                            isShow:_self.isShow
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
                            "data": "extension"
                        },
                        {
                            "data": "account"
                        },
                        {
                            "data": "name"
                        },
                        {
                            "data": "groupName"
                        },
                        {
                            "data": "status", render: function (data, type, row, meta) {
                            var names = [
                                '<span style="color: blue">就绪</span>',
                                '振铃',
                                '<span style="color: red">通话中</span>',
                                '保持',
                                '后处理',
                                '被占用',
                                '忙碌',
                                '离开',
                                '仅呼出']
                            if(data==-1)
                                return "未登录";
                            else
                                return names[data];
                        }
                        },
                        {
                            "data": "callNumber"
                        }
                    ]
                }
            });

            /*
            * 监听
            */
            _self.grid.getTable().on("click", "button.monitorcall", function (e) {

                var monitor = window.parent.getExtension();
                var extension = $(this).data("extension");
                $.post(window.apppath + "/admin/call/api/callInfo/monitorCall", {
                    monitor: monitor,
                    extension:extension
                }, function (res) {
                    if(res.success)
                    {
                        Metronic.alert({type: 'success', message: "正在监听", closeInSeconds: 2, icon: 'check'});
                    }
                }, "json");

            });

            $("#isShow").change(function () {
                var checked= $(this).attr("checked");
                if(checked=="checked")
                {
                    _self.isShow=1;
                }
                else
                {
                    _self.isShow=0;
                }
                _self.grid.getDataTable().ajax.reload();

            })

        }
    }
}();