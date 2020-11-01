<%@ page language="java" import="java.util.*,java.sql.*,com.dao.*"
	pageEncoding="UTF-8"%>
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
		<link href="<%=path%>/admin/css/style.css" rel="stylesheet"
			type="text/css" />
	</head>
	<%
		DB dbm = new DB();
		Connection conn = dbm.getCon();
		String id = request.getParameter("id");
		String sql = "select * from wenjianjia where id='" + id + "'";
		PreparedStatement stat = conn.prepareStatement(sql);
		ResultSet rs = stat.executeQuery();
		rs.next();
	%>

	<body>

		<form action="<%=path %>/wenjianjia?type=wenjianjiaUpdate" name="formAdd" method="post"> 
		<input type="hidden" name="id" size="60" value="<%=id%>"/>
		<input type="hidden" name="uid" size="60" value="<%=rs.getString("uid") %>"/>
		<div class="formbody">

			<div class="formtitle">
				<span>修改文件夹</span>
			</div>

			<ul class="forminfo">
				<li>
					<label>
						文件夹名称
					</label>
					<input name="name" value="<%=rs.getString("name") %>" type="text" class="dfinput" />
					 
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
	<%
		if (rs != null)
			rs.close();
		if (stat != null)
			stat.close();
		if (conn != null)
			conn.close();
	%>
</html>
