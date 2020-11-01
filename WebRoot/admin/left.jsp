<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String applicationPath = basePath + "/" + "application";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	 
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>操作菜单
    </div>
    	<ul class="menuson">
        
        
        <li><cite></cite><a href="<%=path %>/admin/messageinfo/messageinfoAdd.jsp" target="rightFrame">写信</a><i></i></li>
        <li><cite></cite><a href="<%=path %>/messageinfo?type=messageinfoList&menu=3" target="rightFrame">收件箱</a><i></i></li>
        <li><cite></cite><a href="<%=path %>/messageinfo?type=messageinfoList&menu=2" target="rightFrame">发件箱</a><i></i></li>
        <li><cite></cite><a href="<%=path %>/contactinfo?type=contactinfoMana" target="rightFrame">通讯录</a><i></i></li>
        <li><cite></cite><a href="<%=path %>/messageinfo?type=messageinfoList&menu=1" target="rightFrame">草稿箱</a><i></i></li>
        <li><cite></cite><a href="<%=path %>/messageinfo?type=messageinfoList&menu=4" target="rightFrame">已删除</a><i></i></li>
        <li><cite></cite><a href="<%=path %>/wenjianjia?type=wenjianjiaMana" target="rightFrame">文件夹</a><i></i></li>
        </ul>    
    </dd>
        
    
    
    
    </dl>
    
</body>
</html>

