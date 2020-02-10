var AssessInfo = function () {
    var flag1 = false;
    var flag2 = true;
    var flag3 = true;
    var grid = "";
    var handleList = function () {
        var arr;
        var elderTypeDictIds;
        var serviceNeed;
        var elderTypeDictIdsCheckbox;
        var serviceNeedCheckbox;
        grid = new Datatable();
        grid.init({
            src: $("#datatable_event_list"),
            onSuccess: function (grid, res) {
            },
            onError: function (grid) {
                // execute some code on network or other general error
            },
            loadingMessage: '加载中...',
            dataTable: {
                "ajax": function (params, callback, obj) {
                    $.post(window.apppath + "/admin/api/elderly/getAssessList", {
                        length: params.length,
                        start: params.start,
                        areaName: $('input[name=areaName]').val(),
                        serialNumber: $('input[name=serialNumber]').val(),
                        homeTel: $('input[name=homeTel]').val(),
                        startAge: $('input[name=startAge]').val(),
                        endAge: $('input[name=endAge]').val(),
                        isDeath: $('select[name=isDeath]').val(),
                        regPlace: $('input[name=regPlace]').val(),
                        realAddress: $('input[name=realAddress]').val(),
                        sexDictId: $('select[name=sexDictId]').val(),
                        liveTypeDictId: $('select[name=liveTypeDictId]').val(),
                        elderTypeDictIdsCheckbox: elderTypeDictIdsCheckbox,
                        childrenDictId: $('select[name=childrenDictId]').val(),
                        residenceDictId: $('select[name=residenceDictId]').val(),
                        serviceNeedCheckbox: serviceNeedCheckbox,
                        elderName: $('input[name=elderName]').val(),
                        idcardno: $('input[name=idcardno]').val(),
                        resultScore1: $('input[name=resultScore1]').val(),
                        resultScore2: $('input[name=resultScore2]').val()
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
                    {"data": "elderName"},
                    {
                        "data": "idcardno", render: function (data, type, row, meta) {
                        if (data != "" && data != null) {
                            if (data.length == 15) {
                                return data.replace(data.substr(8, 6), "******");
                            } else {
                                return data.replace(data.substr(10, 6), "******");
                            }
                        } else {
                            return "";
                        }
                    }
                    },
                    {"data": "age"},
                    {
                        "data": "elderTypeDictIds", render: function (data, type, row, meta) {
                        arr = {
                            "1": "城市三无/农村五保", "2": "低保/低保边缘", "3": "经济困难的失能/半失能老人", "4": "70周岁及以上的计生特扶老人",
                            "5": "百岁老人","9": "空巢", "10": "独居"
                        };
                        var scopes = '';
                        if (data != "" && data != null) {
                            var scope = data.split(",");
                            for (var i = 0; i < scope.length; i++) {
                                if (arr[scope[i]] != "" && arr[scope[i]] != null) {
                                    scopes += arr[scope[i]] + ','
                                }
                            }
                            scopes = scopes.substr(0, (scopes.length - 1));
                        }
                        /*           return '<div title="' + scopes + '" style="text-align: center;vertical-align: middle;text-overflow: ellipsis;width: 100px;overflow: hidden;white-space: nowrap">' + scopes + '</div>';
                         */
                        return scopes;
                    }
                    },
                    {
                        "data": "resultDictId", render: function (data, type, row, meta) {
                        if (data == 1) {
                            return '<div style="text-align: center;vertical-align: middle">自理</div>'
                        } else if (data == 3) {
                            return '<div style="text-align: center;vertical-align: middle">半失能</div>';
                        } else if (data == 2) {
                            return '<div style="text-align: center;vertical-align: middle">失能</div>';
                        } else {
                            return '<div style="text-align: center;vertical-align: middle">未知</div>';
                        }
                    }
                    },
                    {
                        "data": "resultScore", render: function (data, type, row, meta) {
                        if (data != "" && data != null) {
                            return '<div style="text-align: center;vertical-align: middle">' + data + '</div>';
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "familyDate", render: function (data, type, row, meta) {
                        if (data != "" && data != null) {
                            return '<div style="white-space: nowrap">' + data + '</div>';
                        } else {
                            return "";
                        }
                    }
                    },
                    {
                        "data": "id", render: function (data, type, row, meta) {
                        var html = "";
                        if (row.resultScore != "" && row.resultScore != null) {
                            html += '<button data-elderid="' + data + '" class="btn btn-xs red-stripe Optagelse">记录</button>';
                            html += '<a href="#" data="' + window.apppath + '/admin/elderly/assDetails/' + data + '?method=show" class="btn default btn-xs green-stripe info">详细</a>';
                        }
                        //判断权限
                        var assess = $("#assess").val();
                        if (assess == "1")
                            html += '<a href="#" data="' + window.apppath + '/admin/elderly/assDetails/' + data + '?method=edit" class="btn default btn-xs yellow-stripe assess">评估</a>';
                        // html+= '<button data-topicid="' + data + '"  data-area="' + row.region1 + '"  class="btn btn-xs blue-stripe Scrutineering">检查</button>';
                        return html;
                    }
                    }
                ]
            }

        });

        grid.getTable().on("click", "a.info", function () {
            var href = $(this).attr("data");
            window.parent.addTab("elder_assess_details", "老人能力评估信息", href);
        });

        grid.getTable().on("click", "a.assess", function () {
            var href = $(this).attr("data");
            window.parent.addTab("elder_assess_details", "老人能力评估信息", href);
        });

        $(".table-group-action-submit").click(function () {
            elderTypeDictIdsCheckbox = '';
            serviceNeedCheckbox = '';
            elderTypeDictIds = document.getElementsByName('elderTypeDictIds');
            for (var a = 0; a < elderTypeDictIds.length; a++) {
                if (elderTypeDictIds[a].checked) {
                    elderTypeDictIdsCheckbox = elderTypeDictIdsCheckbox + elderTypeDictIds[a].value + ",";
                }
            }

            serviceNeed = document.getElementsByName('serviceNeed');
            for (var j = 0; j < serviceNeed.length; j++) {
                if (serviceNeed[j].checked) {
                    serviceNeedCheckbox = serviceNeedCheckbox + serviceNeed[j].value + ",";
                }
            }
            elderTypeDictIdsCheckbox = elderTypeDictIdsCheckbox.substr(0, (elderTypeDictIdsCheckbox.length - 1));
            serviceNeedCheckbox = serviceNeedCheckbox.substr(0, (serviceNeedCheckbox.length - 1));
            grid.getDataTable().ajax.reload();
        });

        $(".table-group-action-reload").click(function () {
            $("#assess-form").find("input:text").val("");//找到form表单下的所有input标签并清空
            $("#assess-form").find("input:hidden").val("");//找到form表单下的所有input标签并清空
            $("#assess-form").find("select").val("");//找到form表单下的所有input标签并清空
            $("#assess-form").find("input:checkbox").parent().removeClass("checked");//找到form表单下的所有checkbox标签并清空
            $("#assess-form").find("input:checkbox").attr("checked", false);
        });

        $(".table-group-action-import").click(function () {
            $('#impModal').modal({
                keyboard: true
            });
        });
        <!--记录-->
        grid.getTable().on("click", "button.Optagelse", function () {
            var elderid = $(this).data("elderid");
            $('#assModal').modal('toggle');
            $('#assModal input[name=elderId]').val(elderid)
            AssessAllInfo.init();
            // document.getElementById("iframe").src = window.apppath + "/admin/elderMsg/elder_getAssList?id=" + topicId;
        });
        <!--检查 -->
        grid.getTable().on("click", "button.Scrutineering", function () {
            var topicId = $(this).data("topicid");
            var area = $(this).data("area");
            $('#checkModal').modal('toggle');
            $("#elderId").val(topicId);
            //初始化列表
            ElderInfoAssessCheckList.init(topicId, area);
        });

    }

    return {
        init: function (method) {
            handleList(method);
        }
        , goToPage: function () {
            var page = $("#page").val();
            var len =grid.getDataTable().page.info().pages;
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
        },
        showTbody3: function () {
            if (flag3) {
                $('#tbody3').css("display", "");
                flag3 = false;
            } else {
                $('#tbody3').css("display", "none");
                flag3 = true;
            }
        }
    };
}();