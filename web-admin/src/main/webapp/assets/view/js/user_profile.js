/**
 * Created by CoderQiang on 2017/5/16.
 */
var UserProfile = function () {
    var _self = "";
    var ELDER_MAX = 10;
    return {
        init: function () {
            _self = this;
            _self.linkElderInit();

        },
        linkElderInit: function () {
            //获取关联老人列表
            $.post(window.apppath + "/view/api/user/getLinkElderList", {}, function (res) {
                if (res.success == 1) {
                    var data = res.data;
                    var count = 0;
                    var html = "";
                    for (var i in data) {
                        html += _self.createHtml(data[i]);
                        count++;
                    }
                    if (count == 0) {
                        html = "暂时没有关联老人，请立即关联老人。"
                    }
                    else {
                        $("#link_elder_count").html(count);
                        $("#link_elder_max").html(ELDER_MAX - count);
                    }
                    $("#link_elder_list").html(html);

                }
            }, "json");
        },
        deleteElder: function (id) {
            confirm2("确认删除该老人", function () {
                $.post(window.apppath + "/view/api/user/deleteLinkElder", {
                    id: id
                }, function (res) {
                    if (res.success) {
                        $("#elderDiv" + id).remove();
                    }
                }, 'json');
            })
        },
        createHtml: function (data) {
            var sex = data.elderSex == "1" ? '男' : '女';
            var idcardNo = data.elderCardNo;
            if (idcardNo.length == 15) {
                idcardNo = idcardNo.replace(idcardNo.substr(8, 6), "******");
            } else {
                idcardNo = idcardNo.replace(idcardNo.substr(10, 6), "******");
            }
            var html = ['<div class="oldMan_datalis" id="elderDiv' + data.id + '">',
                '                            <table>',
                '                                <thead>',
                '                                <tr>',
                '                                    <td colspan="4">',
                '                                        <h4 class="lf">' + data.elderName + '</h4>',
                '                                        <a href="javascript:void(0)" class="colse rt" onclick="UserProfile.deleteElder(' + data.id + ')">×</a>',
                '                                    </td>',
                '                                </tr>',
                '                                </thead>',
                '                                <tbody>',
                '                                <tr>',
                '                                    <td>姓名：</td>',
                '                                    <td>' + data.elderName + '</td>',
                '                                    <td>性别：</td>',
                '                                    <td>' + sex + '</td>',
                '                                </tr>',
                '                                <tr>',
                '                                    <td>年龄：</td>',
                '                                    <td>' + data.elderAge + '</td>',
                '                                    <td>证件：</td>',
                '                                    <td>' + idcardNo + '</td>',
                '                                </tr>',
                '                                <tr>',
                '                                    <td>地址：</td>',
                '                                    <td colspan="3">' + data.elderAddress + '</td>',
                '                                </tr>',
                '                                <tr>',
                '                                    <td>联系方式：</td>',
                '                                    <td>' + data.elderMobile + '</td>',
                '                                    <td colspan="2">',
                '                                        <div class="rt data_set"><a href="' + window.apppath + '/user/update_linkElder.html/' + data.id + '">编辑</a></div>',
                '                                        <div class="rt data_set"><a href="javascript:void(0)" onclick="UserProfile.showQrCode(\'' + data.qrcode + '\')" >二维码</a></div>',
                '                                    </td>',
                '                                </tr>',
                '                                </tbody>',
                '                            </table>',
                '                        </div>'].join("");
            return html;
        },
        showQrCode: function (code) {
            $('#qrcode').html("");
            $("#qrcode").qrcode(code);
            showQrCode();
        }
    }
}();