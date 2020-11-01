<%@ page language="java" import="java.util.*,java.sql.*,com.dao.*"
	pageEncoding="UTF-8"%>
<%@page import="com.orm.Userinfo;"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		
		<link href="<%=path%>/admin/css/style.css" rel="stylesheet" type="text/css" />
		 <link href="<%=path%>/admin/css/select.css" rel="stylesheet" type="text/css" />

		<script type='text/javascript' src='<%=path %>/admin/js/jquery.js'></script>
		<script type="text/javascript" src="<%=path %>/admin/js/select-ui.min.js"></script>
				 <script type="text/javascript">
$(document).ready(function(e) {

	$(".select3").uedSelect({
		width : 152
	});
});
</script>
	</head>
	 
	<body>

		<form action="<%=path %>/messageinfo?type=messageinfoMove" name="formAdd" method="post"> 
		<input  name="mid" type="hidden" class="dfinput" value="${mid}" />
		
		<input   name="menu" type="hidden" class="dfinput" value="${menu}" />
		<input   name="oldwjjid" type="hidden" class="dfinput" value="${wjjid}" />
		<div class="formbody">

			 
			<ul class="forminfo">
				<li>
					<label>
						移动到文件夹
					</label>
					<div class="vocation">
    <select class="select3" name="wjjid">
    <c:forEach var="wjj" items="${wjjList}">
       <option value="${wjj.id}">${wjj.name}</option>
    </c:forEach>
   
    </select>
    </div>
					 
				</li>
				 
				
				<li>
					<label>
						&nbsp;
					</label>
					<input name=""  onclick="sendmove()"  type="button" class="btn" value="移动" />
				 
				</li>
			</ul>


		</div>
     </form>

	</body>
 
</html>
 <script language="javascript">
      function sendmove(){
         
          document.forms['formAdd'].action='<%=path %>/messageinfo?type=messageinfoMove';  
          document.forms['formAdd'].submit();
      }
      
       
  </script>