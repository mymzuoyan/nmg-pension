/**
 * Created by Administrator on 2016/9/21.
 */
var TaskSend = function () {

    var _self = "";
    return {
        "top_selected": "",
        "selected": "",
        "selectName":"",
        "grid": "",
        "elderName": "",
        "lat":0,
        "lng":0,
        "serviceAddress":"",
        "mobile":"",
        "selectId":"receiverId1",
        init: function () {
            _self = this;
            _self.serviceNameInit();

            $("input[name=type]").change(function () {
                if(parseInt($("input[name=type]:checked").val())==0)
                {
                   $("#receiverId2Div").show();
                   $("#s2id_receiverId2").show();
                   $("#receiverId1Div").hide();
                   $("#s2id_receiverId1").hide();
                   _self.selectId="receiverId2";
                }
                else
                {
                    $("#receiverId1Div").show();
                    $("#s2id_receiverId1").show();
                    $("#receiverId2Div").hide();
                    $("#s2id_receiverId2").hide();
                    _self.selectId="receiverId1";
                }
            });



            $("#btnPublish").click(function () {
                if (_self.checkSave()) {
                    $.post(window.apppath + "/admin/api/task/sendTask", {
                        id:$("input[name=id]").val(),
                        title: $("input[name=title]").val(),
                        content: $("textarea[name=content]").val(),
                        receiverId: _self.selected,
                        receiverName: _self.selectName,
                        elderName: _self.elderName,
                        timeStr: $("input[name=date]").val() + " " + $("input[name=time]").val(),
                        serviceName: $("#serviceName option:selected").text(),
                        serviceType:$("#serviceName option:selected").val(),
                        serviceAddress:_self.serviceAddress,
                        mobile: _self.mobile,
                        lat:_self.lat,
                        lng:_self.lng,
                        type:$("input[name=type]:checked").val()
                    }, function (res) {
                        $("#btnPublish").button('reset');
                        if (res.success) {
                            $("#labelmsg").text(res.message).addClass("label-success");
                            //推送给用户
                            window.parent.sendTask2User(_self.selected, JSON.stringify(res.data));
                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        } else {
                            $("#labelmsg").text(res.message).addClass("label-danger");
                        }
                    }, "json");
                }
            });
        },
        showSelectElderModel: function () {
            _self=this;
            $("#selectElder").modal("show");
            if (_self.grid == "") {
                _self.tableInit();
            }
        },
        selectElder: function () {
            _self.elderName = $("#datatable_event_list input[name=elderId]:checked").attr("data");
            var address = $("#datatable_event_list input[name=elderId]:checked").data("address");
            var area = $("#datatable_event_list input[name=elderId]:checked").data("area");
            _self.mobile = $("#datatable_event_list input[name=elderId]:checked").data("mobile");
            if (address == null || address == "") {
                alert2("该老人没有详细的地址");
                return false;
            }
            /*if ( _self.mobile == null ||  _self.mobile == "") {
                alert2("该老人没有联系方式");
                return false;
            }*/
            // else
            // {
                 _self.serviceAddress=address;
                 var areaName=area.substr(0,area.indexOf(","))
            //     var myGeo = new BMap.Geocoder();
            //     // 将地址解析结果显示在地图上,并调整地图视野
            //     myGeo.getPoint(address, function(point){
            //         if (point) {
            //             _self.lat=point.lat;
            //             _self.lng=point.lng;
                        $("input[name=elderName]").val(_self.elderName);
                         $("input[name=elderId]").val(_self.elderId)
                         $("#selectElder").modal("hide");
            //             $("body").animate({scrollTop: '0px'}, 200);
            //         }else{
            //             alert2("该老人地址没法展现在地图上!");
            //         }
            //     }, areaName);
            // }
        },
        getAreaValue: function (areaName, areaId) {
            document.getElementById("areaName").value = areaName;
            document.getElementById("areaId").value = areaId;
            $('#myModal').modal('hide');
        },
        TreeInit: function () {

        },
        tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#datatable_event_list"),
                onSuccess: function (grid, res) {
                },
                onError: function (grid) {
                    // execute some code on network or other general error
                },
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/elderly/getElderlyInfo", {
                            length: params.length,
                            start: params.start,
                            areaName: $('#selectElder input[name=areaName]').val(),
                            startAge: $('#selectElder input[name=startAge]').val(),
                            endAge: $('#selectElder input[name=endAge]').val(),
                            elderName: $('#selectElder input[name=elderName]').val(),
                            isDeath: 1,
                            flag:false
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
                    "pageLength": 4,
                    "deferLoading": "0",
                    "columns": [
                        {
                            "data": "id", render: function (data, type, row, meta) {
                            return '<input type="radio" name="elderId" data-mobile="'+row.mobile+'" data-area="'+row.areaName+'" data-address="'+row.realAddress+'" data="' + row.elderName + '" value="' + row.id + '">';
                        }
                        },
                        {"data": "elderName"},
                        {"data": "age"},
                        {"data": "realAddress"},
                    ]
                }
            });
            $(".table-group-action-submit").click(function () {
                var elderName= $('#selectElder input[name=elderName]').val();
                if(elderName==null||elderName=="")
                {
                    alert("请输入查询的姓名！");
                    return false;
                }
                _self.grid.getDataTable().ajax.reload();
            });
            $(".table-group-action-reload").click(function () {
                $("#elder-form")[0].reset();//找到form表单下的所有input标签并清空
                $("#elder-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空

            });
        },
        selectArea: function () {
            $('#myModal').modal({
                keyboard: true
            });
        },
        checkSave: function () {
            $("#"+_self.selectId+" :selected").each(function () {
                _self.selectName+=$(this).text()+",";
                _self.selected+=$(this).val()+",";
            })
            _self.selected= _self.selected.substr(0, _self.selected.length-1);
            _self.selectName= _self.selectName.substr(0, _self.selectName.length-1);
            var receiverId =_self.selected;
            var serviceName = $.trim($("#serviceName").text());
            var timeStr=$("input[name=date]").val() ;
            if ( _self.elderName == null ||  _self.elderName == "") {
                $("#labelmsg").text("请选择服务老人").addClass("label-danger");
                return false;
            }
            else if (receiverId == null || receiverId == "") {
                $("#labelmsg").text("请选择接收人").addClass("label-danger");
                return false;
            }
            else if ($.trim(timeStr) == null || $.trim(timeStr) == "") {
                $("#labelmsg").text("请选择服务时间").addClass("label-danger");
                return false;
            }
            else if (serviceName == null || serviceName == "") {
                $("#labelmsg").text("请选择服务项目").addClass("label-danger");
                return false;
            }
            $("#labelmsg").text("").removeClass("label-danger");
            return true;
        },
        serviceNameInit: function () {
            if( $("#serviceName").html().indexOf("option")<0)
            {
                $.post(window.apppath + "/admin/api/ServiceProject/list", {},
                    function (res) {
                        if (res != "") {
                            var html = "<option value=''>--请选择--</option>";
                            for (var i in res) {
                                html+='<optgroup label="'+i+'">'
                                for(var j in res[i])
                                    html += '<option value="' +i + '">' + res[i][j].serviceName + '</option>';
                                html+='<optgroup>';
                            }
                            $("#serviceName").html(html);
                        }
                    }, 'json');
            }
        },
        setElderName:function (str) {
            _self.elderName=str;
        }

    }

}();