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
		<link href="<%=path%>/admin/css/style.css" rel="stylesheet" type="text/css" />
		<script type='text/javascript' src='<%=path %>/admin/js/jquery.js'></script>
						 <script type="text/javascript" charset="utf-8" src="<%=path%>/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/js/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=path%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	</head>
	<%
		DB dbm = new DB();
		Connection conn = dbm.getCon();
		String id = request.getParameter("id");
		String sql = "select * from messageinfo where id='" + id + "'";
		PreparedStatement stat = conn.prepareStatement(sql);
		ResultSet rs = stat.executeQuery();
		rs.next();
	%>

	<body>

		<form action="<%=path %>/messageinfo?type=messageinfoUpdate" name="formAdd" method="post"> 
		<input name="id" id="id" type="hidden" class="dfinput" value="<%=rs.getInt("id")%>" />
		<input name="zt" id="zt" type="hidden" class="dfinput" value="<%=rs.getString("zt")%>" />
		<input name="content" id="content"  type="hidden"/>
		<div class="formbody">

			 
			<ul class="forminfo">
				<li>
					<label>
						收件人
					</label>
					<input name="touser" id="touser" type="text" class="dfinput" value="<%=rs.getString("touser")%>" />
					 
				</li>
				<li>
					<label>
						主题
					</label>
					<input name="title"  id="title" type="text" class="dfinput" value="<%=rs.getString("title")%>" />
				</li>
				
				 
				 
				<li>
					<label>
						邮件内容
					</label>
					<script id="container" type="text/plain" style="width:800px;height:300px;"></script>
				</li>
				
				
				<li>
					<label>
						发件人
					</label>
					<input name="fromu" value="${currentuser.uname}" readonly="readonly" type="text" class="dfinput" />  
				</li>
				
				<li>
					<label>
						&nbsp;
					</label>
					<input name=""  onclick="sendmail()"  type="button" class="btn" value="发送" />
					<input name=""  onclick="savemail()"  type="button" class="btn" value="存草稿" />
				</li>
			</ul>
		</div>
     </form>

	</body>
	
</html>
 <script language="javascript">
 
   var ue = UE.getEditor('container');
        
        ue.ready(function() {
		    //设置编辑器的内容
		    ue.setContent('<%=rs.getString("content")%>');
		    
		});
		
      function savemail(){
          var touser = $('#touser').val();
          var title = $('#title').val();
          var content = $('#content').val();
          document.getElementById("content").value = content;
          document.forms['formAdd'].action='<%=path %>/messageinfo?type=messageinfoUpdate&cz=1'; //修改草稿
          document.forms['formAdd'].submit();
      }
      
       function sendmail(){
          var touser = $('#touser').val();
          var title = $('#title').val();
           
             var content = ue.getContent();
          if(touser==null || '' == touser){
             alert("请先填写收件人");
             return;
          }
          if(title==null || '' == title){
             alert("请先填写主题");
             return;
          }
          if(content==null || '' == content){
             alert("请先填写内容");
             return;
          }
          document.getElementById("content").value = content;
          document.forms['formAdd'].action='<%=path %>/messageinfo?type=messageinfoUpdate&cz=2';
          document.forms['formAdd'].submit();
      }
  </script>
  
  <%
		if (rs != null)
			rs.close();
		if (stat != null)
			stat.close();
		if (conn != null)
			conn.close();
	%>