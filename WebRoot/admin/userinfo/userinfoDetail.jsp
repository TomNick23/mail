<%@ page language="java" import="java.util.*,java.sql.*,com.dao.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
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
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	</head>
<%
				DB dbm = new DB();
				Connection conn = dbm.getCon();
				String id = request.getParameter("id");
				String sql = "select * from userinfo where id='" + id + "'";
				PreparedStatement stat = conn.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();
				rs.next();
			%>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/userinfo?type=userinfoUpdate" name="formAdd" method="post">
				<input type="hidden" name="id" size="60" value="<%=id%>"/>
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="4" background="<%=path %>/img/tbg.gif">&nbsp;商品管理&nbsp;</td>
						</tr>
						
						
																										    			             <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
    						    <td width="25%" bgcolor="#FFFFFF" align="right">
    						         用户名：
    						    </td>
    						    <td width="75%" bgcolor="#FFFFFF" align="left">
    						          <%=rs.getString("uname") %> 
    						    </td>
    						</tr>
		                    													    			             <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
    						    <td width="25%" bgcolor="#FFFFFF" align="right">
    						         密码：
    						    </td>
    						    <td width="75%" bgcolor="#FFFFFF" align="left">
    						          <%=rs.getString("upwd") %> 
    						    </td>
    						</tr>
		                    													    			             <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
    						    <td width="25%" bgcolor="#FFFFFF" align="right">
    						         昵称：
    						    </td>
    						    <td width="75%" bgcolor="#FFFFFF" align="left">
    						          <%=rs.getString("nickname") %> 
    						    </td>
    						</tr>
		                    											 
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="返回" onclick="javascript:window.histroy.go(-1);"/>&nbsp; 
						       
						    </td>
						</tr>
					 </table>
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
