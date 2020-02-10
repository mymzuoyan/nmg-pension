/**
 * Created by Administrator on 2016/9/29.
 */
var CustomerGroupAdd = function () {

    var _self = "";
    return {
        init: function () {
            _self = this;
            EographicArea.init();

            $("#btnPublish").click(function () {
                _self.addGroup();
            })
        },
        addGroup: function () {
            if (_self.checkSave()) {
                var area = "";
                var street = "";
                var community = "";
                if ($("#county").val() == "") {
                    area = $("#county option:selected").html();
                }
                if ($("#town").val() == "") {
                    street = $("#town option:selected").html();
                }
                if ($("#village").val() == "") {
                    community = $("#village option:selected").html();
                }


                $.post(window.apppath + "/admin/call/api/customer/group/add", {
                    name: $("input[name=name]").val(),
                    type: $("#type").val(),
                    tel: $("input[name=tel]").val(),
                    fax: $("input[name=fax ]").val(),
                    zip: $("input[name=zip]").val(),
                    addr: $("input[name=addr]").val(),
                    contactName: $("input[name=contactName]").val(),
                    contactPhone: $("input[name=contactPhone]").val(),
                    province: $("#province option:selected").html(),
                    city: $("#city option:selected").html(),
                    area: area,
                    street: street,
                    community: community,
                }, function (res) {
                    $("#btnPublish").button('reset');
                    if (res.success) {
                        $("#labelmsg").text(res.message).addClass("label-success");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        $("#labelmsg").text(res.message).addClass("label-danger");
                    }
                }, "json");
            }
        },
        checkSave: function () {
            var name = $("input[name=name]").val();
            var type = $("#type").val();
            var province = $("#province").val();
            var city = $("#city").val();
            var contactName = $("input[name=contactName]").val();
            var contactPhone = $("input[name=contactPhone]").val();
            var tel = $("input[name=tel]").val();
            if (name == null || name == "") {
                $("#labelmsg").text('请输入机构名称').addClass("label-danger");
                return false;
            }
            else if (type == null || type == "") {
                $("#labelmsg").text('请选择类型').addClass("label-danger");
                return false;
            }
            else if (contactName == null || contactName == "") {
                $("#labelmsg").text('请输入联系人').addClass("label-danger");
                return false;
            }
            else if (contactPhone == null || contactPhone == "") {
                $("#labelmsg").text('请输入联系电话').addClass("label-danger");
                return false;
            }
            else if(isNaN(contactPhone)){
                $("#labelmsg").text('请输入正确的联系电话').addClass("label-danger");
                return false;
            }
            else if (province == null || province == "-1") {
                $("#labelmsg").text('请选择省份').addClass("label-danger");
                return false;
            }
            else if (city == null || city == "-1") {
                $("#labelmsg").text('请选择城市').addClass("label-danger");
                return false;
            }
            if(tel!=""&&tel!=null)
            {
                if(isNaN(tel))
                {
                    $("#labelmsg").text('请输入正确的办公电话').addClass("label-danger");
                    return false;
                }
            }

            $("#labelmsg").text('').removeClass("label-danger");
            return true;
        },
    }
}();