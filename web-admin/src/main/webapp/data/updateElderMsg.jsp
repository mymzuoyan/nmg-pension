<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lb" uri="/WEB-INF/lb" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>更新老人</title>
</head>
<body>
    <input type="button" value="1" id="clickMe1"/>
    <input type="button" value="1" id="clickMe2"/>
</body>
<script src="${pageContext.request.contextPath}/assets/data/js/jquery.min.js"></script>
<script>
    $(function(){
        var fun=function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/allData/updateElderMsg",
                type:"post",
                dataType:"json",
                data:{index:$("#clickMe1").val(),isDeath:1},
                success:function(result){
                    if(result=='success'){
                        $("#clickMe1").val(parseInt($("#clickMe1").val())+1);
                        if($("#clickMe1").val()<150){
                            fun();
                        }
                    }
                }
            });
        }
        var fun1=function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/allData/updateElderMsg",
                type:"post",
                dataType:"json",
                data:{index:$("#clickMe2").val(),isDeath:0},
                success:function(result){
                    if(result=='success'){
                        $("#clickMe2").val(parseInt($("#clickMe2").val())+1);
                        if($("#clickMe2").val()<30){
                            fun1();
                        }
                    }
                }
            });
        }
        fun();
        fun1();
    })

</script>
</html>