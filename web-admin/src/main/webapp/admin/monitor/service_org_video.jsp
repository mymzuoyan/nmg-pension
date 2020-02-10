<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>实时视频</title>
    <style>
        body {
            margin: 0;
        }
        .player {
            width: 500px;
            height: 400px;
        }
        .divPlayer {
            float: left;
            margin: 10px;
        }
    </style>
</head>
<script>
</script>
<body>
<script src="${pageContext.request.contextPath }/assets/admin/pages/scripts/serviceSource/ezuikit.js"></script>
<input type="hidden" id="serviceOrgId" value="${orgId}">
<h2 style="text-align: center;">${orgName}</h2>
<script>
    window.apppath = "${pageContext.request.contextPath }";
    function getChannelId() {
        var serviceOrgId = document.getElementById("serviceOrgId").value;
        var ajax = new XMLHttpRequest();
        // 使用post请求
        ajax.open('post', window.apppath+"/admin/monitor/api/video/getChannelList");
        // 如果 使用post发送数据 必须 设置 如下内容
        // 修改了 发送给 服务器的 请求报文的 内容
        // 如果需要像 HTML 表单那样 POST 数据，请使用 setRequestHeader() 来添加 HTTP 头。然后在 send() 方法中规定您希望发送的数据：
        ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        // 发送
        // post请求 发送的数据 写在 send方法中
        // 格式 name=jack&age=18 字符串的格式
        ajax.send('orgId=' + serviceOrgId);

        // 注册事件
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4 && ajax.status == 200) {
                var res = eval("(" + ajax.responseText + ")");
                res = res.data;
                for (var i = 0; i < res.length; i++) {
                    var div = document.createElement('DIV');
                    div.className = 'divPlayer';
                    div.innerHTML = '<video id="myPlayer' + i + '" class="player" poster="" controls playsInline webkit-playsinline autoplay></video>';
                    document.body.appendChild(div);
                    var video = document.getElementById('myPlayer' + i);
                    video.src = res[i].channelId;
                    new EZUIPlayer('myPlayer' + i);
                }

            }
        }
    }
    getChannelId();
</script>
</body>
</html>