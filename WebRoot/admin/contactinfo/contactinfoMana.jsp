<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path%>/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});


          function contactinfoDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/contactinfo?type=contactinfoDel&id="+id;
               }
           }
           
           function contactinfoAdd()
           {
                 var url="<%=path %>/admin/contactinfo/contactinfoAdd.jsp";
				 window.location.href=url;
           }
 
		   function contactinfoDetail(id)
           {
                 var url="<%=path %>/contactinfo?type=contactinfoDetail&id="+id;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
           
           
</script>


</head>


<body>

 
  
    <div class="rightinfo">
    
    <div class="tools" >
    
    	<ul class="toolbar">
        <li class="click" onclick="contactinfoAdd()"><span><img src="<%=path%>/admin/images/t01.png"  /></span>添加</li>
        </ul>
     
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
       
        <th>姓名</th>
        <th>邮箱</th>
        <th>电话</th>
        <th>备注</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.contactinfoList}" var="contactinfo" varStatus="sta">
        <tr>
        <td>${contactinfo.name}</td>
        <td>${contactinfo.mailname}</td>
        <td>${contactinfo.telphone}</td>
        <td>${contactinfo.remark}</td>
     
        <td><a href="<%=path %>/admin/contactinfo/contactinfoEdit.jsp?id=${contactinfo.id}" class="tablelink">修改</a>     <a href="#" onclick="contactinfoDel(${contactinfo.id})" class="tablelink"> 删除</a></td>
        </tr> 
        </c:forEach>
         
        </tbody>
    </table>
    
   
    <!--div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div-->
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>

