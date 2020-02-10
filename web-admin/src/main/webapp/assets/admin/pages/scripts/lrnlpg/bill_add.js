/**
 * Created by MaiBenBen on 2017/1/9.
 */
var BillAdd = function () {

    var _self = "";
    return {
        //main function to initiate the module
        form: "",
        error: "",
        success: "",
        "grid": "",
        init: function () {
            _self = this;
            _self.form = $('#addElderForm');
            _self.error = $('.alert-danger', _self.form);
            _self.success = $('.alert-success', _self.form);
            _self.wizardInit();
            if ($("#elderId").val() != null && $("#elderId").val() != "") {
                _self.relationshipInit();
            }

            $('#elderInfo_add').find('.button-previous').hide();
            $('#elderInfo_add .button-submit').click(function () {
                _self.reloadCardNumber();
                var ultimateBalance= parseFloat($("#tab3 input[name=ultimateBalance]").val());
                if(ultimateBalance<0){
                    alert("余额不足!")
                    return false;
                }
                var submitForm = $('#submitForm');
                //同步提交
                $.ajax({
                    type: "post",
                    url: window.apppath + "/admin/api/power/bill/settlement",
                    dataType: "json",   //返回格式为json
                    data: submitForm.serialize(),
                    async: false,
                    success: function (res) {
                        if (res.success) {
                            alert(res.message)
                            window.parent.updateTab('bill_list');
                            window.parent.closeTab('tab_bill_add');
                        } else {
                            alert(res.message)
                        }
                    }
                });
            }).hide();

        },
        wizardInit: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }
            // default form wizard
            $('#elderInfo_add').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    return false;
                    /*
                     success.hide();
                     error.hide();
                     if (form.valid() == false) {
                     return false;
                     }
                     handleTitle(tab, navigation, clickedIndex);
                     */
                },
                onNext: function (tab, navigation, index) {
                    _self.success.hide();
                    _self.error.hide();
                    if (index == 1) {
                        var cardNumber = $("#tab1 input[name=cardNumber]").val();
                        if (cardNumber == null || cardNumber == "") {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>请刷卡');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }
                        else if ($("#tab1 input[name=elderlyName]").val() == null || $("#tab1 input[name=elderlyName]").val() == "") {
                            _self.error.html('<button class="close" data-dismiss="alert"></button>卡号无效!请重新刷卡');
                            _self.error.show();
                            Metronic.scrollTo(_self.error, -200);
                            return false;
                        }else if ($("#tab1 input[name=orgId]").val() == null || $("#tab1 input[name=orgId]").val() == "") {
                                _self.error.html('<button class="close" data-dismiss="alert"></button>消费组织无效');
                                _self.error.show();
                                Metronic.scrollTo(_self.error, -200);
                                return false;
                        } else{
                            _self.serviceTypeInit();
                        }
                    }

                    if (index == 2) {
                        if($("#listTableBodyorder tr").length==0){
                            alert("消费项目不能为空")
                            return false;
                        }else{
                            $("#listTableBodyorder2").html("");
                            var currentBalance=$("#tab1 input[name=currentBalance]").val();
                            $("#tab3 input[name=cardNumber]").val($("#tab1 input[name=cardNumber]").val());
                            $("#tab3 input[name=flowNumber]").val($("#tab1 input[name=flowNumber]").val());
                            $("#tab3 input[name=oldManCardId]").val($("#tab1 input[name=oldManCardId]").val());
                            $("#tab3 input[name=elderlyId]").val($("#tab1 input[name=elderlyId]").val());
                            $("#tab3 input[name=orgName]").val($("#tab1 input[name=orgName]").val());
                            $("#tab3 input[name=orgId]").val($("#tab1 input[name=orgId]").val());
                            $("#tab3 input[name=elderlyName]").val($("#tab1 input[name=elderlyName]").val());
                            $("#tab3 input[name=currentBalance]").val(currentBalance);
                            var count =0;
                            var price=0;
                            $("#listTableBodyorder .orderObjectCount").each( function(n,element) {
                                count+=parseInt($(this).val());
                                price+=parseInt($(this).val())*parseFloat($(this).attr("data-price"));
                                var html="<tr>" +
                                    "    <td>" +
                                    $(this).attr("data-price")+
                                    "    </td>" +
                                    "    <td>" +
                                    $(this).attr("data-title")+
                                    "    </td>" +
                                    "    <td>" +
                                    "<input  name='orders["+n+"].unitPrice'    value=\""+$(this).attr("data-price")+"\" style='display: none'>" +
                                    "<input  name='orders["+n+"].serObjectId'    value=\""+$(this).attr("id")+"\" style='display: none'>" +
                                    "<input  name='orders["+n+"].objectName'    value=\""+$(this).attr("data-title")+"\" style='display: none'>" +
                                    "<input data-price='"+$(this).attr("data-price")+"' name='orders["+n+"].obcount'  class='orderObjectCount' style='width: 20px'  value=\""+$(this).val()+"\" readonly>" +
                                    "    </td>" +
                                    "    <td>" +
                                    "<input  name='orders["+n+"].obprice'   style='width: 35px'  value=\""+(parseInt($(this).val())*parseFloat($(this).attr("data-price")))+"\" readonly>" +
                                    "    </td>" +
                                    "</tr>";
                                $("#listTableBodyorder2").append(html);
                            });
                            $("#tab3 input[name=count]").val(count);
                            $("#tab3 input[name=price]").val(price);
                            $("#tab3 input[name=ultimateBalance]").val((parseFloat(currentBalance)-price).toFixed(2));
                        }
                    }
                    _self.handleTitle(tab, navigation, index);
                },
                onPrevious: function (tab, navigation, index) {
                    _self.success.hide();
                    _self.error.hide();

                    _self.handleTitle(tab, navigation, index);
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#elderInfo_add').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });
        },
        handleTitle: function (tab, navigation, index) {
            var total = navigation.find('li').length;
            var current = index + 1;
            $('.step-title', $('#elderInfo_add')).text('Step ' + (index + 1) + ' of ' + total);
            jQuery('li', $('#elderInfo_add')).removeClass("done");
            var li_list = navigation.find('li');
            for (var i = 0; i < index; i++) {
                jQuery(li_list[i]).addClass("done");
            }

            if (current == 1) {
                $('#elderInfo_add').find('.button-previous').hide();
            } else {
                $('#elderInfo_add').find('.button-previous').show();
            }
            if (current >= total) {
                $('#elderInfo_add').find('.button-next').hide();
                $('#elderInfo_add').find('.button-submit').show();
            } else {
                $('#elderInfo_add').find('.button-next').show();
                $('#elderInfo_add').find('.button-submit').hide();
            }
            Metronic.scrollTo($('.page-title'));
        },
        // validateOrgName: function () {
        //     var orgName = $("#tab1 input[name=orgName]").val();
        //     if (orgName == null || orgName == "") {
        //     _self.error.html('<button class="close" data-dismiss="alert"></button>请输入消费所在组织');
        //     _self.error.show();
        //     Metronic.scrollTo(_self.error, -200);
        //     return false;
        //     }
        //     $.ajax({
        //         type: "POST",
        //         url: window.apppath + "/admin/api/institution/findServiceOrgByInstitutionName",
        //         data: {institutionName: orgName},
        //         dataType: "json",
        //         async: false,
        //         success: function (res) {
        //             if (res.success) {
        //                 $("#tab1 input[name=orgId]").val(res.data.id);
        //                 _self.error.hide();
        //             } else {
        //                 $("#tab1 input[name=orgId]").val("");
        //                 _self.error.html('<button class="close" data-dismiss="alert"></button>查无此消费组织');
        //                 _self.error.show();
        //                 Metronic.scrollTo(_self.error, -200);
        //             }
        //
        //         }
        //     });
        // },
        findOldManCardId: function () {
            var cardNumber = $("#tab1 input[name=cardNumber]").val();
            if (cardNumber == null || cardNumber == "") {
                _self.error.html('<button class="close" data-dismiss="alert"></button>请输入卡号');
                _self.error.show();
                Metronic.scrollTo(_self.error, -200);
                return false;
            }
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/power/oldmancard/findOldManCardByCardNumber",
                data: {cardId: cardNumber,status:0},
                dataType: "json",
                async: false,
                success: function (res) {
                    if (res.success) {
                        $("#tab1 input[name=oldManCardId]").val(res.data.id);
                        $("#tab1 input[name=currentBalance]").val(res.data.money);
                        $("#tab1 input[name=elderlyId]").val(res.data.oldManId);
                        $("#tab1 input[name=elderlyName]").val(res.data.oldManName);
                    } else {
                        $("#tab1 input[name=oldManCardId]").val("");
                        $("#tab1 input[name=elderlyId]").val("");
                        $("#tab1 input[name=elderlyName]").val("");
                        $("#tab1 input[name=currentBalance]").val();
                        _self.error.html('<button class="close" data-dismiss="alert"></button>此卡号无效');
                        _self.error.show();
                        Metronic.scrollTo(_self.error, -200);
                    }

                }
            });
        },
        serviceTypeInit: function () {
            var orgId1=$("#tab1 input[name=orgId]").val();
            var orgId2=$("#tab2 input[name=orgId]").val();
            if(orgId1==orgId2){
                return false;
            }else{
                $("#tab2 input[name=orgId]").val(orgId1);
                $('#tree-service-type').jstree("destroy");
                $('#tree-service-project').jstree("destroy");
                $("#listTableBody").html("");
                $("#addPriceDiv").hide();
                $("#orderobjectDiv").hide();
                $("#listTableBodyorder").html("");
            }
            _self.serviceOrgId=orgId1;
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
                            '<a class="btn default btn-xs green-stripe update" data-title="' + data[j].serviceProjectName + '" data-id="' + data[j].id + '" data-priceid="' + data[j].id + '" data-price="' + data[j].price + '" data-moreinfo="' + data[j].moreInfo + '"onclick="BillAdd.addObject(this);" >添加</a>' +
                            '<a class="btn default btn-xs green-stripe update" data-title="' + data[j].serviceProjectName + '" data-id="' + data[j].id + '" data-priceid="' + data[j].id + '" data-price="' + data[j].price + '" data-moreinfo="' + data[j].moreInfo + '"onclick="BillAdd.removeObject(this);" >移除</a>' +
                            '</td>' +
                            '</tr>';
                    }
                }
                $("#listTableBody").html(html);
                $("#addPriceDiv").show();
                $("#orderobjectDiv").show();
            }, 'json')
        },
        addObject: function (obj) {
            var dataId=$(obj).attr("data-id");
            var dataTitle=$(obj).attr("data-title");
            var dataPrice=$(obj).attr("data-price");
            // var dataMoreinfo=$(obj).attr("data-moreinfo");
            if($("#listTabletrue #"+dataId).val()){
                $("#listTabletrue #"+dataId).val(parseInt($("#listTabletrue #"+dataId).val())+1);
            }else{
                var html="<tr>" +
                    "    <td>" +
                    dataPrice+
                    "    </td>" +
                    "    <td>" +
                    dataTitle+
                    "    </td>" +
                    "    <td>" +
                    "<input data-price='"+dataPrice+"' data-title='"+dataTitle+"'  class='orderObjectCount' style='width: 25px' id=\""+dataId+"\" value=\"1\" readonly>" +
                    "    </td>" +
                    "</tr>";
                $("#listTableBodyorder").append(html);
            }
        },
        removeObject: function (obj) {
            var dataId=$(obj).attr("data-id");
            if($("#listTabletrue #"+dataId).val()){
                if(parseInt($("#listTabletrue #"+dataId).val())>1){
                    $("#listTabletrue #"+dataId).val(parseInt($("#listTabletrue #"+dataId).val())-1);
                }else{
                    var input=$("#listTabletrue #"+dataId);
                    $(input).parent().parent().remove();
                }
            }
        },
        reloadCardNumber: function () {
            var cardNumber = $("#tab3 input[name=cardNumber]").val();
            if (cardNumber == null || cardNumber == "") {
                alert("请输入卡号")
                return false;
            }
            $.ajax({
                type: "POST",
                url: window.apppath + "/admin/api/power/oldmancard/findOldManCardByCardNumber",
                data: {cardId: cardNumber,status:0},
                dataType: "json",
                async: false,
                success: function (res) {
                    if (res.success) {
                        $("#tab3 input[name=oldManCardId]").val(res.data.id);
                        $("#tab3 input[name=currentBalance]").val(res.data.money);
                        $("#tab3 input[name=elderlyId]").val(res.data.oldManId);
                        $("#tab3 input[name=elderlyName]").val(res.data.oldManName);
                        $("#tab3 input[name=ultimateBalance]").val(parseFloat(res.data.money)-parseFloat($("#tab3 input[name=price]").val()));
                    } else {
                        $("#tab3 input[name=oldManCardId]").val("");
                        $("#tab3 input[name=elderlyId]").val("");
                        $("#tab3 input[name=elderlyName]").val("");
                        $("#tab3 input[name=currentBalance]").val();
                        alert("此卡号无效")
                        return false;
                    }
                }
            });
    }
    };
}();