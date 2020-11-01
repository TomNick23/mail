<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
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

		<link href="<%=path%>/admin/css/style.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="<%=path%>/js/popup.js"></script>
		<script language="JavaScript" src="<%=path%>/js/public.js"
			type="text/javascript"></script>
		<script language="javascript">
           function wenjianjiaDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/wenjianjia?type=wenjianjiaDel&id="+id;
               }
           }
           
           function wenjianjiaAdd()
           {
                 var url="<%=path%>/admin/wenjianjia/wenjianjiaAdd.jsp";
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
		   
		   function wenjianjiaDetail(id)
           {
                 var url="<%=path%>/wenjianjia?type=wenjianjiaDetail&id="+id;
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

			<div class="tools">

				<ul class="toolbar">
					<li class="click" onclick="wenjianjiaAdd();">
						<span><img src="<%=path%>/admin/images/t01.png" />
						</span>添加
					</li>
				</ul>


			</div>


			<table class="tablelist">
				<thead>
					<tr>
						<th>
							文件夹名称
						</th>

						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.wenjianjiaList}" var="wenjianjia"
						varStatus="sta">
						<tr>
							<td>
								${wenjianjia.name}
							</td>
							<td>
							<a href="<%=path %>/messageinfo?type=messageinfoByWenjian&id=${wenjianjia.id}"
									class="tablelink">查看</a>
									
							<c:if test="${wenjianjia.name!='发件箱' && wenjianjia.name!='收件箱'  && wenjianjia.name!='草稿箱'  && wenjianjia.name!='已删除'}">
							
								<a href="<%=path %>/admin/wenjianjia/wenjianjiaEdit.jsp?id=${wenjianjia.id}"
									class="tablelink">改名</a>
								<a href="#" onclick="wenjianjiaDel(${wenjianjia.id})"
									class="tablelink"> 删除</a>
									
							 </c:if>
							</td>
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







		</div>

		<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

	</body>
</html>
