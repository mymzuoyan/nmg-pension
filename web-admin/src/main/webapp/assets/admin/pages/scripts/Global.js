var Global={
    city:"鞍山",
    lat:"122.992747",
    lng:"41.117443"
}

/**
 * 改变#id的url属性
 */
function changeData(id, url) {
    $("#" + id).attr("url", url);
}

function showMessage(mes, url) {
    $("#alertMes").html(mes);
    $("#changeUrl").val(url);
    $('#alt-mge').show();
}


function formatTwo(str) {
    str = str + "";
    if (str.length == 1) {
        str = "0" + str;
    }
    return str;
}


function changeFrameUrl(url) {
    $("iframe").attr("src", window.apppath + url);
}

function updateAvatar(url) {
    $("#avatarImg").attr("src", url);
}

function initMenu() {
    $(".page-sidebar-menu li a").css("background-color", "#18739f");
    $(".sub-menu li a").css("background-color", "#4492ca");
}


function updateUnreadMessage() {
    Index.unReadSysMsgInit();
}

/**
 * 关闭tab
 */
function closeTab(id) {
    Addtabs.close("tab_" + id);
}

/**
 * 添加tab
 */
function addTab(id, title, url) {
    Addtabs.add({
        id: id,
        title: title,
        url: url,
        refresh: true
    })
}


/**
 * 更新tab
 */
function updateTab(id) {
    if ($("#tab_" + id).html() != null && $("#tab_" + id).html() != "") {
        $("#tab_" + id + " iframe").attr('src', $("#tab_" + id + " iframe").attr('src'));
    }
}

function alert(res) {
    $("#alertModal .alertModalMes").html(res);
    $('#alertModal').fadeIn();
}


function alertSuccess(title, res, callback) {
    $("#successModal .successModalMes").html(res);
    $("#successModal .successModalTitle").html(title);
    $("#successModal img").attr("src", "${pageContext.request.contextPath }/assets/admin/pages/img/success.png");
    $('#successModal').show();

    $("#successModal .confirm").unbind('click').click(function () {
        $("#successModal").hide();
        if (callback != null)
            callback();
    });

    $("#successModal .cancel").unbind('click').click(function () {
        $("#successModal").hide();
    })

}

function alertLoginSuccess(title, res, callback) {
    $("#successModal .successModalMes").html(res);
    $("#successModal .successModalTitle").html(title);
    $("#successModal img").attr("src", "${pageContext.request.contextPath }/assets/admin/pages/img/logo.png");
    $('#successModal').show();

    $("#successModal .confirm").unbind('click').click(function () {
        $("#successModal").hide();
        if (callback != null)
            callback();
    });

    $("#successModal .cancel").unbind('click').click(function () {
        $("#successModal").hide();
    })

}


function alert2(res, callback) {
    $("#alertModal2 .alertModalMes").html(res);
    $('#alertModal2').show();

    $("#alertModal2 .confirm").unbind('click').click(function () {
        $("#alertModal2").hide();
        if (callback != null)
            callback();
    });

    $("#alertModal2 .cancel").unbind('click').click(function () {
        $("#alertModal2").hide();
    })

}

function confirm3(res, btn1, btn2, callback1, callback2) {
    $("#confrimModal3 .alertModalMes").html(res);
    $('#confrimModal3').show();
    $("#confrimModal3 .btn1").html(btn1);
    $("#confrimModal3 .btn2").html(btn2);
    $("#confrimModal3 .confirm").unbind('click').click(function () {
        $("#confrimModal3").hide();
        if (callback1 != null)
            callback1();
    });

    $("#confrimModal3 .btn2").unbind('click').click(function () {
        $("#confrimModal3").hide();
        if (callback2 != null)
            callback2();
    })

}


function confirm4(res, btn1, btn2, callback1, callback2) {
    $("#confrimModal4 .alertModalMes").html(res);
    $('#confrimModal4').show();
    $("#confrimModal4 .btn1").html(btn1);
    $("#confrimModal4 .btn2").html(btn2);
    $("#confrimModal4 .confirm").unbind('click').click(function () {
        $("#confrimModal4").hide();
        if (callback1 != null)
            callback1();
    });

    $("#confrimModal4 .btn2").unbind('click').click(function () {
        $("#confrimModal4").hide();
        if (callback2 != null)
            callback2();
    })

}

function alert3(res, callback1, callback2) {
    $("#alertModal2 .alertModalMes").html(res);
    $('#alertModal2').show();

    $("#alertModal2 .confirm").unbind('click').click(function () {
        $("#alertModal2").hide();
        if (callback1 != null)
            callback1();
    });

    $("#alertModal2 .cancel").unbind('click').click(function () {
        $("#alertModal2").hide();
        if (callback2 != null)
            callback2();
    })

}

function confirm2(res, callback) {
    $("#confirmModal2 .confirmModalMes").html(res);
    $("#confirmModal2").show();
    $("#confirmModal2 .confirm").unbind('click').click(function () {
        $("#confirmModal2").hide();
        if (callback != null)
            callback();
    });

    $("#confirmModal2 .cancel").unbind('click').click(function () {
        $("#confirmModal2").hide();
    })
}

function alert(res, callback) {
    $("#alertModal .alertModalMes").html(res);
    $("#alertModal").fadeIn();
    $("#alertModal .btn").unbind('click').click(function () {
        $("#alertModal").fadeOut();
        if (callback != null)
            callback();
    })

}

function popIframe(url, width, height, callback) {
    popWin.showWin(url, width, height, callback);

}

function closePopIframe() {
    popWin.closeMask();
}
