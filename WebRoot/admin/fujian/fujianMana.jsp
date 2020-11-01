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
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
        <script language="javascript">
           function fujianDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/fujian?type=fujianDel&id="+id;
               }
           }
           
           function fujianAdd()
           {
                 var url="<%=path %>/admin/fujian/fujianAdd.jsp";
				 window.location.href=url;
           }
           function over(picPath)
	       {
			  if (picPath=="")picPath="/img/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }
		   
		   function fujianDetail(id)
           {
                 var url="<%=path %>/fujian?type=fujianDetail&id="+id;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="42" background="<%=path %>/img/tbg.gif">&nbsp;商品管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					
											<td></td>
											<td>邮件编号</td>
											<td>附件名称</td>
											<td>附件URL</td>
										<td width="7%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.fujianList}" var="fujian" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF">
			
					 
											<td bgcolor="#FFFFFF" align="center">${fujian.id}</td>
											<td bgcolor="#FFFFFF" align="center">${fujian.mid}</td>
											<td bgcolor="#FFFFFF" align="center">${fujian.fjname}</td>
											<td bgcolor="#FFFFFF" align="center">${fujian.fjurl}</td>
										
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="fujianDel(${fujian.id})"/>|
						<a class="pn-loperator" href="<%=path %>/admin/fujian/fujianEdit.jsp?id=${fujian.id}">修改</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		    <table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="fujianAdd()" />
			    </td>
			  </tr>
		    </table>
		    
		    <div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
				<TABLE id="tipTable" border="0" bgcolor="#ffffee">
					<TR align="center">
						<TD><img id="photo" src="" height="150" width="150"></TD>
					</TR>
				</TABLE>
			</div>
	</body>
</html>
