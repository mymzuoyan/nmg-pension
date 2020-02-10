<%@ page contentType="text/plain;charset=UTF-8" language="java" %><%
    String []oldVers={"1.4.5","1.2.5","1.2.1"};
    String []appNames={"serviceAdmin","serviceUser","serviceObject"};
    String appVer=request.getParameter("appVer");
    String appType=request.getParameter("appType");
    int type=Integer.parseInt(appType);
    String realPath = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    if(!appVer.equals(oldVers[type])) {
        out.print(realPath+"/file/app/"+appNames[type]+".apk");
    }else{
        out.println("");
    }%>
