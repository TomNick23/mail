<%@ page language="java" pageEncoding="UTF-8"%>
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
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="<%=path%>/admin/css/style.css" rel="stylesheet"
			type="text/css" />
	</head>

	<body>

		<form action="<%=path %>/contactinfo?type=contactinfoAdd" name="formAdd" method="post"> 
		<div class="formbody">

			<div class="formtitle">
				<span>添加联系人</span>
			</div>

			<ul class="forminfo">
				<li>
					<label>
						姓名
					</label>
					<input name="name" type="text" class="dfinput" />
					 
				</li>
				<li>
					<label>
						邮箱
					</label>
					<input name="mailname" type="text" class="dfinput" />
					 
				</li>
				
				<li>
					<label>
						电话
					</label>
					<input name="telphone" type="text" class="dfinput" />
					 
				</li>
				
				 
				 
				<li>
					<label>
						备注
					</label>
					<textarea name="remark" cols="" rows="" class="textinput"></textarea>
				</li>
				<li>
					<label>
						&nbsp;
					</label>
					<input name=""  onclick="check()"  type="submit" class="btn" value="确认保存" />
				</li>
			</ul>


		</div>
     </form>

	</body>
</html>


