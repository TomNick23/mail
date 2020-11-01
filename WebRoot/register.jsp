<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
 
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>邮箱注册</title>
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 
 
  <link rel="stylesheet" href="<%=path%>/css/normalize.css">
  <link rel="stylesheet" href="<%=path%>/css/reg.css">
  <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
  <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
  <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
</head>

<body class="regPage">
 
<div class="nav-logo"><a href="#"></a></div>
 
<div class="content">
  <div class="row">
    <div class="bg-fox icons"><i class="img-fox"></i></div>
    <div class="table-wraper">
      <ul class="nav nav-tabs icons">
        
        <li class="active"><a href="https://passport.sohu.com/signup?signupType=email&ppag=0"><i class="img-email"></i>邮箱注册</a></li>
      </ul>
      <div class="table-box icons">
        <form name="regForm" action="" method="post" class="regForm clearfix">
          <div class="control-group hide">
            <input type="text"><input type="password">
          </div>
          <div class="control-group email-index">
            <label class="ac-email"><span class="tit">邮箱账号</span><span class="ipt">
                    <div class="df-email">@cc.com</div>
                    <input type="text" value="" name="uname" tabindex="1" autocomplete="off"></span>
            </label>
            <div id="ppcard"></div>
            <div class="txt-info dobule-line">
              <p>注册邮箱，填写英文</p> 
            </div>
          </div>
          <div class="control-group">
            <label class="passport"><span class="tit">设置密码</span><span class="ipt">
                    <a href="javascript:;" class="shortcut" tabindex="-1"><i class="img-eyes"></i></a><input type="password" value="" name="upwd" tabindex="2" autocomplete="off"></span></label>
            <div class="txt-info dobule-line">
              <p>6-16位，英文（区分大小写）、数字或常用符号</p>
              <p class="pw-lev"> </p>
            </div>
          </div>
           
          <div class="control-group">
            <label class="passport"><span class="tit">昵称</span><span class="ipt">
                    <a href="javascript:;" class="shortcut" tabindex="-1"><i class="img-eyes"></i></a><input type="text" value="" name="nickname" tabindex="2" autocomplete="off"></span></label>
            <div class="txt-info dobule-line">
              <p> </p>
              <p class="pw-lev"> </p>
            </div>
          </div>
          
          <div class="control-group mg-top">
            <div class="pd-left btn-group"><span>
            <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
                    <input onclick="check1();" type="button" value="立即注册" class="btn btn-xlarge btn-yellow" tabindex="5"></span>
              <div class="txt-info"></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- footer.jade-->





<footer>
  <div class="footer-content txt-center">
   
    <p>Copyright © 2019. All Rights Reserved. 版权所有</p>
  </div>
</footer>

<!--[if lt IE 7]>
<script>$('.footer-content > p:first').addClass('pull-right');</script>
<![endif]-->
 </body></html>
	<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.regForm.uname.value=="")
			 {
			 	alert("请输入邮箱账号");
				document.regForm.uname.focus();
				return false;
			 }
			 if(document.regForm.upwd.value=="")
			 {
			 	alert("请输入密码");
				document.regForm.upwd.focus();
				return false;
			 }
			 if(document.regForm.nickname.value=="")
			 {
			 	alert("请输入昵称");
				document.regForm.nickname.focus();
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 loginService.register(document.regForm.uname.value,document.regForm.upwd.value,document.regForm.nickname.value,callback);
		}
		
		function callback(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("注册成功");
		        window.location.href="<%=path %>/login.jsp";
		    }
		    if(data=="yes")
		    {
		        alert("邮箱账号已存在");
		    }
		    
		}
	    </script>