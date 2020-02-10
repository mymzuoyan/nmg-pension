<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/4/19
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评估系统</title>
</head>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script>
    $(function () {

        function post(URL, PARAMS) {
            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";
            for (var x in PARAMS) {
                var opt = document.createElement("textarea");
                opt.name = x;
                opt.value = PARAMS[x];
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            return temp;
        }

        $.post("${pageContext.request.contextPath }/admin/api/user/getUserInfo", {}, function (res) {
            if (res != null) {
                console.log(res.url, "userrole:" + res.userrole, "city:" + res.city, "qu:" + res.qu, "userfrom:" + res.userfrom, "token:" + res.token);
                //'http://120.55.112.44/judge/user/ytlogin'
                post(res.url, {
                    userrole: res.userrole,
                    city: res.city,
                    qu: res.qu,
                    userfrom: res.userfrom,
                    token: res.token
                });
            }
        }, "json");
        //调用方法 如
    })
</script>
<body>

</body>
</html>
