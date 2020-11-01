<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String applicationPath = basePath + "/" + "application";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校内电子邮件</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>


</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="#" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
  
    <div class="topright">    
    <ul>
   
    <li><a href="#" onclick="logonOut();">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${currentuser.uname}</span>
    
    </div>    
    
    </div>

</body>
</html>

<script>

 
//退出
function logonOut(){
	 parent.location = '<%=path%>/login.jsp';
	 self.close();
}

</script>
