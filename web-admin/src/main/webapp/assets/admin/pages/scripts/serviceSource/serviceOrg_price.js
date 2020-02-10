/**
 * Created by CoderQiang on 2017/5/22.
 */
var ServiceOrgPrice = function () {
    var _self = "";
    return {
        serviceOrgId: 0,
        serviceTypeId: 0,
        serviceType: "",
        serviceProjectId: 0,
        init: function (id) {
            _self = this;
            _self.serviceOrgId = id;
            _self.serviceTypeInit();
        },
        allowEdit: function () {
            $("#priceFrom input").removeAttr("disabled");
            $("#priceFrom a").removeAttr("disabled");
            $("#actionDiv").show();
            $(this).hide();
        },
        serviceTypeInit: function () {
            $('#tree-service-type').jstree({
                'plugins': ["wholerow", "types"],
                "core": {
                    'data': {
                        'url': function (node) {
                            return window.apppath + '/admin/api/serviceOrg/price/getServiceTypeByOrg?serviceOrgId=' + _self.serviceOrgId;
                        },
                        'data': function (node) {
                            return {'id': node.id};
                        },
                        'dataType': 'json'
                    }
                },
                "types": {
                    "root": {
                        "icon": "https://www.jstree.com/static/3.3.1/assets/images/tree_icon.png",
                        "valid_children": ["default"]
                    },
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg"
                    },
                    "file": {
                        "icon": "fa fa-file icon-state-warning icon-lg"
                    }
                }
            }).bind('select_node.jstree', function (event, data) {
                var _sel_node_id = data.node.id;
                _self.serviceTypeId = _sel_node_id;
                _self.serviceType = data.node.text;
                $("#serviceProjectDiv").show();
                $('#tree-service-project').jstree("destroy");
                _self.gerServiceProject(_sel_node_id);
            });
        },
        gerServiceProject: function (id) {
            $('#tree-service-project').jstree({
                'plugins': ["wholerow", "types"],
                "core": {
                    'data': {
                        'url': function (node) {
                            return window.apppath + '/admin/api/ServiceProject/getTreeByServiceTypeId?serviceTypeId=' + id;
                        },
                        'data': function (node) {
                            return {'id': node.id};
                        },
                        'dataType': 'json'
                    }
                },
                "types": {
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg"
                    },
                    "file": {
                        "icon": "fa fa-file icon-state-warning icon-lg"
                    }
                }
            }).bind('select_node.jstree', function (event, data) {
                var _sel_node_id = data.node.id;
                _self.serviceProjectPriceInit(_self.serviceOrgId, _sel_node_id);
            });
        },
        serviceProjectPriceInit: function (serviceOrgId, serviceProjectId) {
            _self.serviceProjectId = serviceProjectId;
            $.post("/admin/api/serviceOrg/price/getByProjectIdAndServiceOrgId", {
                serviceOrgId: serviceOrgId,
                serviceProjectId: serviceProjectId
            }, function (res) {
                var data = res;
                var html = "";
                if (data) {
                    for (var j in data) {
                        html += '<tr>' +
                            '<td>' +
                            data[j].price +
                            '</td>' +
                            '<td>' +
                            data[j].moreInfo +
                            '</td>' +
                            '<td>' +
                            '<a class="btn default btn-xs green-stripe update" data-title="' + data[j].serviceProjectName + '" data-id="' + data[j].serviceProjectId + '" data-priceid="' + data[j].id + '" data-price="' + data[j].price + '" data-moreinfo="' + data[j].moreInfo + '"onclick="ServiceOrgPrice.showUpdateModal(this);" >更新</a>' +
                            '<a class="btn default btn-xs green-stripe delete" data-priceId="' + data[j].id + '" onclick="ServiceOrgPrice.deletePrice(this);" >删除</a>' +
                            '</td>' +
                            '</tr>';
                    }
                }
                $("#listTableBody").html(html);
                $("#addPriceDiv").show();
            }, 'json')
        },
        updatePrice: function () {

            var $btn = $(this);
            $("#labelmsg").text('');
            $btn.button('loading');
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/serviceOrg/price/updatePrice",
                data: $("#updatePriceForm").serialize() + "&serviceOrgId=" + _self.serviceOrgId,
                dataType: "json",
                success: function (res) {
                    $btn.button('reset');
                    if (res.success) {
                        alertSuccess("更新价格体系", res.message, function () {
                            $('#updateModal').modal("hide");
                            _self.serviceProjectPriceInit(_self.serviceOrgId, _self.serviceProjectId);
                        })
                    }
                    else {
                        alert2(res.message);
                    }
                }
            });

        },
        addPrice: function () {
            var $btn = $(this);
            $("#labelmsg").text('');
            var price = $("#addPriceForm input[name=price]").val();
            if (isNaN(price)) {
                alert("请输入数字");
                return false;
            }
            $btn.button('loading');
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/serviceOrg/price/addPrice",
                data: $("#addPriceForm").serialize() + "&id=" + _self.serviceProjectId + "&=" + _self.serviceOrgId,
                dataType: "json",
                success: function (res) {
                    $btn.button('reset');
                    if (res.success) {
                        alertSuccess("添加价格体系", res.message, function () {
                            $('#addModal').modal("hide");

                            _self.serviceProjectPriceInit(_self.serviceOrgId, _self.serviceProjectId);
                        })
                    }
                    else {
                        alert2(res.message);
                    }
                }
            });
        }
        ,
        deletePrice: function (e) {
            if ($(e).data("priceid") == null || $(e).data("priceid") == "") {
                alert2("请先添加价格体系");
            } else {
                var $btn = $(this);
                $btn.button('loading');
                $.ajax({
                    type: "POST",
                    url: window.apppath + "/admin/api/serviceOrg/price/deletePrice",
                    data: {id: $(e).data("priceid")},
                    dataType: "json",
                    success: function (res) {
                        $btn.button('reset');
                        if (res.success) {
                            alertSuccess("删除价格体系", res.message, function () {
                                $('#updateModal').modal("hide");
                                _self.serviceProjectPriceInit(_self.serviceOrgId, _self.serviceProjectId);
                            })
                        }
                        else {
                            alert2(res.message);
                        }
                    }
                });
            }
        },
        addServiceProject: function () {
            var serviceName = $("#addServiceProjectForm input[name=serviceName]").val();
            if (serviceName == null || serviceName == "") {
                $("#labelmsg").text('请输入服务项目名称').addClass("label-danger");
                return false;
            }
            var serviceUnit = $("#addServiceProjectForm select[name=serviceUnit] option:selected").val();
            if (serviceUnit == null || serviceUnit == "") {
                $("#labelmsg").text('请选择服务项目结算类型').addClass("label-danger");
                return false;
            }
            else {
                $.post(window.apppath + "/admin/api/dictionary/serviceProject/add", {
                    serviceType: _self.serviceTypeId,
                    serviceName: serviceName,
                    serviceUnit: serviceUnit,
                    status: 0
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        alertSuccess("提示信息", "申请成功", function () {
                        });
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }
        }
        ,
        showAddServiceProjectModal: function (e) {
            $('#addServiceProjectModal').modal({
                keyboard: true
            });
            $("#addServiceProjectForm input[name=serviceType]").val(_self.serviceType);
            $("#addServiceProjectForm input[name=serviceTypeId]").val(_self.serviceTypeId);
        },
        showAddModal: function (e) {
            $('#addModal').modal({
                keyboard: true
            });
            var title = $(e).data("title");
            var serviceProjectId = $(e).data("id");
            $("#addModalLabel").html(title);
            $("#addPriceForm input[name=id]").val(serviceProjectId);
        }
        ,
        showUpdateModal: function (e) {
            var title = $(e).data("title");
            var id = $(e).data("priceid");
            var price = $(e).data("price");
            var moreInfo = $(e).data("moreinfo");
            if (id == null || id == "") {
                alert2("请先添加价格体系");
            } else {
                $('#updateModal').modal({
                    keyboard: true
                });
                $("#updateModalLabel").html(title);
                $("#updatePriceForm input[name=id]").val(id);
                $("#updatePriceForm input[name=price]").val(price);
                $("#updatePriceForm input[name=moreInfo]").val(moreInfo);
            }
        }

    }
}
();