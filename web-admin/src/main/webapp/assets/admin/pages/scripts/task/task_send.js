/**
 * Created by Administrator on 2016/9/21.
 */
var TaskSend = function () {

    var _self = "";
    var data="";
    return {
        "top_selected": "",
        "selected": "",
        "selectName":"",
        "elderTypeDictIdsCheckbox": "",
        "grid": "",
        "elderName": "",
        "elderId":"",
        "lat":0,
        "lng":0,
        "serviceAddress":"",
        "mobile":"",
        "plugins":["types", "wholerow"],
        init: function () {
            _self = this;
            _self.serviceNameInit();
            //确定
            $("#receiverId").change(function () {
                //获取管理人员


            });
            $("#city").change(function () {
                $("#receiverId").html("");
                $("#receiverId").val("");
                if($("#city option:selected").val()==2000)
                {
                    $.post(window.apppath + "/admin/api/serviceOrg/getServiceOrgByFilter", {
                        areaName:$("#city option:selected").text(),
                        serviceProjectName: $("#serviceType option:selected").text()
                    },function(data){
                        var html="";
                        if(data!=null)
                        {
                            html+="<option value=''>--请选择--</option>";
                            for(var i in data)
                            {
                                html+="<option value='"+data[i].serviceOrgId+"'>"+data[i].serviceOrgName+"</option>";
                            }
                        }
                        $("#receiverId").html(html);
                    },"json");
                }
            });

            var areaName0=$("#areaName0").val();
            if(areaName0!=""&&areaName0!=null)
            {
                $.post(window.apppath + "/admin/api/serviceOrg/getServiceOrgByFilter", {
                    areaName:areaName0.substr(areaName0.indexOf(",")+1,areaName0.length)
                },function(data){
                    var html="";
                    if(data!=null)
                    {
                        html+="<option value=''>--请选择--</option>";
                        for(var i in data)
                        {
                            html+="<option value='"+data[i].serviceOrgId+"'>"+data[i].serviceOrgName+"</option>";
                        }
                    }
                    $("#receiverId").html(html);
                },"json");
            }

            $("#btnPublish").click(function () {
                _self.checkSave();
            });
        },
        sendTask:function () {
            $.post(window.apppath + "/admin/api/task/sendTask", {
                id: $("input[name=id]").val(),
                title: $("input[name=title]").val(),
                content: $("textarea[name=content]").val(),
                receiverId: _self.selected,
                receiverName: _self.selectName,
                elderId:  _self.elderId,
                timeStr: $("input[name=date]").val() + " " + $("input[name=time]").val(),
                serviceName: $("#serviceName option:selected").text(),
                serviceType:$("#serviceType option:selected").val(),
                serviceAddress:_self.serviceAddress,
                priceInfo:$("#priceInfo").val(),
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
        },
        changeCounty:function () {
            $("#receiverId").html("");
            $("#receiverId").val("");
            //获取该区下面的组织
            $.post(window.apppath + "/admin/api/serviceOrg/getServiceOrgByFilter", {
                areaName:"内蒙古市," + $("#county option:selected").text(),
                serviceProjectName: $("#serviceType option:selected").text()
            },function(data){
                console.log(data);
                var html="";
                if(data!=null)
                {
                    html+="<option value=''>--请选择--</option>";
                    for(var i in data)
                    {
                        html+="<option value='"+data[i].serviceOrgId+"'>"+data[i].serviceOrgName+"</option>";
                    }
                }
                $("#receiverId").html(html);
            },"json");
        },
        changeServiceOrg:function () {
           var serviceOrgId=$("#receiverId").val();
            //获取该组织的价格说明
            $.post(window.apppath + "/admin/api/serviceOrg/price/getByNameAndServiceOrgId", {
                serviceOrgId:serviceOrgId,
                name: $("#serviceName option:selected").text()
            },function(data){
                if(data!=null)
                {
                    var html=data[0].price+data[0].serviceUnit;
                    if(data[0].moreInfo!=""&&data[0].moreInfo!="null")
                    {
                        html+="(备注："+data[0].moreInfo+")"
                    }
                    $("#priceInfoInput").val(html);
                    $("#priceInfo").val(data[0].price);
                    $("#priceInfoDiv").show();
                }

            },"json");
        },
        showModel: function () {
            _self.plugins=["types", "wholerow"];
            $("#receiverTree").jstree("destroy");
            if($("input[name=type]:checked").val()==0)
            {
                //单选
                _self.plugins.push("checkbox");
            }
            _self.TreeInit();
            $("#selectReceiver").modal("show");
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
            _self.elderId = $("#datatable_event_list input[name=elderId]:checked").val();
            if (address == null || address == "") {
                alert2("该老人没有详细的地址");
                return false;
            }
            /*if ( _self.mobile == null ||  _self.mobile == "") {
                alert2("该老人没有联系方式");
                return false;
            }*/
            else
            {
                _self.serviceAddress=address;
                var areaName=area.substr(0,area.indexOf(","))
                var myGeo = new BMap.Geocoder();
                // 将地址解析结果显示在地图上,并调整地图视野
                myGeo.getPoint(address, function(point){
                    if (point) {
                        _self.lat=point.lat;
                        _self.lng=point.lng;
                        $("input[name=elderName]").val(_self.elderName);
                        $("input[name=elderId]").val(_self.elderId)
                        $("#selectElder").modal("hide");
                        $("body").animate({scrollTop: '0px'}, 200);
                    }else{
                        alert2("该老人地址没法展现在地图上!");
                    }
                }, areaName);
            }
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
            var receiverId = $.trim($("#receiverId option:selected").val());
            var serviceOrgName=$.trim($("#receiverId option:selected").text());
            var serviceName = $.trim($("#serviceName").text());
            var timeStr=$("input[name=date]").val() ;
            if (_self.elderName == null || _self.elderName  == "") {
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
            //获取管理人员
            $.post(window.apppath + "/admin/api/user/getZuAdmin", {
                serviceOrgId:receiverId
            },function(data){
                if(data!=null)
                {
                    _self.selected="";
                    _self.selectName=serviceOrgName;
                    for(var i in data)
                    {
                        _self.selected+=data[i].uid+",";
                    }
                    _self.selected= _self.selected.substr(0, _self.selected.length-1)
                    $("#labelmsg").text("").removeClass("label-danger");
                    _self.sendTask();
                }
                else
                {
                    $("#labelmsg").text("该组织没有管理员").addClass("label-danger");
                    return false;
                }
            },"json");


            //
        },
        serviceNameInit: function () {
            if( $("#serviceType").html().indexOf("option")<0)
            {
                $.post(window.apppath + "/admin/api/ServiceProject/list", {},
                    function (res) {
                        if (res != "") {
                            data=res;
                            var html = "<option value=''>--请选择--</option>";
                            for (var i in res) {
                                html += '<option value="' + i + '">'+i+'</option>';
                            }
                            $("#serviceType").html(html);
                        }
                    }
                    , 'json');
            }
            $("#serviceType").change(function () {
                var type=$(this).val();
                if(type!="")
                {
                    $("#serviceNameDiv").show();
                }
                else
                {
                    $("#serviceNameDiv").hide();
                }
                var  html="";
                for (var i in data) {
                    if(type==i)
                    {
                        for(var j in data[i])
                        {
                            html += '<option value="' + data[i][j].serviceName + '">' + data[i][j].serviceName + '</option>';

                        }
                    }
                }
                $("#serviceName").html(html);
            })
        },
        setElderName:function (str) {
            _self.elderName=str;
        }

    }

}();