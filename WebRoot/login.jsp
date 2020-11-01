<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html class="ng-scope">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=edge" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-store, must-revalidate" />
		<meta http-equiv="expires" content="0" />
		<title>校内电子邮件</title>
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/login.css" />
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
       <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
       <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

	</head>
	<body>

		<div class="frame ng-scope" ui-view="mailFrame" id="SkinClass"></div>

		<div class="content ng-scope" ui-view="mailContent" id="mailContent"></div>

		<div class="h100 ng-scope" ui-view="outMail">
			<div id="loginDiv" class="login pos-r ng-scope"
				ng-controller="loginCtrl">
				<style type="text/css">
body {
	overflow: auto
}

.login {
	transition: all .5s;
	-webkit-transition: all .5s
}

:
:-ms-clear, ::-ms-reveal {
	display: none
}

.area {
	width: 1000px;
	margin: 0 auto;
	position: relative;
	overflow: hidden
}

.out-body {
	height: 515px
}

.out-footer {
	margin: 0 auto;
	margin-top: 20px;
	text-align: center;
	line-height: 1.5
}

.out-footer .out-footer-space {
	margin-left: 16px
}

.out-header {
	height: 80px
}

#loginBody {
	width: 100%;
	height: 515px;
	transition: background .5s;
	-webkit-transition: background .5s
}

#theme {
	position: relative;
	clear: both;
	background-repeat: no-repeat;
	background-position: left top;
	transition: background .5s;
	-webkit-transition: background .5s
}

.themeCtrl {
	position: absolute;
	left: 50%;
	bottom: 12px;
	margin-right: -405px;
	text-align: right
}

.themeCtrl span {
	cursor: pointer;
	width: 6px;
	height: 6px;
	display: inline-block;
	border: 2px solid #bcbcbc;
	border-radius: 50%;
	margin: 2px 4px;
	filter: alpha(opacity = 80);
	-moz-opacity: .8;
	-khtml-opacity: .8;
	opacity: .8
}

.inside-box-shadow {
	-webkit-box-shadow: inset 0 1px 5px #dbdbdb;
	-moz-box-shadow: inset 0 1px 5px #dbdbdb;
	box-shadow: inset 0 1px 5px #dbdbdb
}

.login-box-shadow {
	-webkit-box-shadow: 0 0 0 rgba(23, 23, 23, .13), 0 0 0
		rgba(23, 23, 23, .13), 0 0 0 rgba(23, 23, 23, .13), 0 10px 10px
		rgba(23, 23, 23, .13);
	-moz-box-shadow: 0 0 0rgba ( 23, 23, 23, .13 ), 0 0 0
		rgba(23, 23, 23, .13), 0 0 0 rgba(23, 23, 23, .13), 0 10px 10px
		rgba(23, 23, 23, .13);
	box-shadow: 0 0 0 rgba(23, 23, 23, .13), 0 0 0 rgba(23, 23, 23, .13), 0
		0 0 rgba(23, 23, 23, .13), 0 5px 10px rgba(23, 23, 23, .13)
}

.logo-box {
	position: absolute;
	top: 30px
}

.logo-box img {
	width: 160px
}

.link-box {
	margin: 45px 20px 0 0;
	color: #666
}

.link-box a {
	display: inline-block;
	margin: 0 10px;
	color: #666;
	text-decoration: none
}

.form-background {
	text-align: center;
	width: 100%
}

.form-background img {
	width: 100%;
	height: 550px
}

.login-form {
	box-sizing: border-box;
	padding: 24px 30px 28px 30px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 340px;
	background: #fcfcfc;
	position: absolute;
	left: 63%;
	top: 55px;
	z-index: 9999
}

.login-form input {
	font: 16px/ 1 'microsoft yahei'
}

.login-form h2 {
	font-size: 18px;
	margin-bottom: 19px;
	font-weight: 200
}

.login-a {
	display: block;
	width: 63%;
	height: 480px;
	position: absolute;
	z-index: 10;
	outline: 0
}

.field {
	position: relative
}

.f-account,.f-pwd {
	padding-bottom: 19px
}

.f-forget {
	height: 20px;
	text-align: right
}

.f-forget a {
	color: #666
}

.ipt-box {
	border: 1px solid #ccc;
	background: #fff
}

.ipt-box input {
	border: none;
	padding: 0 10px;
	font-size: 14px
}

.btn-login,.ipt-box input {
	display: block
}

.ipt-box input {
	width: 100%;
	height: 45px;
	line-height: 45px
}

.btn-login {
	height: 60px;
	line-height: 67px;
	width: 289px;
	background-color: #FFF;
	border: none;
	color: #fff;
	cursor: pointer;
	position: relative;
	left: -7px;
	background-image: url(<%=path%>/images/login.afa0b0ef.png);
	outline: 0
}

.btn-login:hover {
	background-image: url(<%=path%>/images/login-focus.718711a8.png)
}

.fontFamily {
	font-family: "宋体", "Microsoft YaHei", "微软雅黑", helvetica,
		"Hiragino Sans GB" !important;
	font-weight: 700 !important
}

.account-tips {
	min-height: 10px;
	top: 32px;
	left: -1px;
	right: -1px;
	z-index: 1
}

.account-tips .tip-one {
	line-height: 30px;
	cursor: pointer;
	background: #EDEDED;
	padding-left: 10px
}

.account-tips .tip-one:hover {
	background: #DDD
}

.tipHolder {
	position: absolute;
	bottom: -1px;
	left: 0;
	right: 0;
	color: red;
	padding-left: 4px
}

.f-remember {
	margin: 2px 0 12px 0;
	color: #AEAEAE
}

.f-captcha {
	margin-bottom: 10px
}

.f-captcha .ipt-box {
	top: 0;
	right: 0;
	bottom: 0;
	left: 50%
}

.f-captcha img {
	cursor: pointer
}

.f-captcha input {
	height: 100%
}

.f-register {
	background-color: #E9E9E9
}

.f-register:hover {
	background-color: #F6F6F6
}

.f-href {
	color: #FF5959
}

input[type=checkbox] {
	position: relative;
	top: 2px
}

.f-register a {
	border: 1px solid #DFDFDF;
	text-align: center;
	height: 30px;
	line-height: 30px;
	font-size: 12px;
	color: #666;
	display: block;
	text-decoration: none
}

.passport hr {
	height: 1px;
	border: 0;
	margin-bottom: 28px;
	background: #bcbcbc
}

.passport p {
	padding-bottom: 22px
}

.passport .font-size-14 {
	font-size: 14px
}

.passport .heigh40 {
	height: 40px;
	line-height: 40px
}

.passport .width50 {
	width: 50%
}

.passport .number-of-times {
	float: right;
	color: #B8B8B8
}

.passport .pointer {
	cursor: pointer
}

.passport .button {
	height: 40px;
	padding-top: 40px
}

.passport .button span {
	display: inline-block;
	height: 100%;
	line-height: 40px;
	width: 130px;
	font-size: 14px;
	text-align: center;
	border-radius: 2px;
	background: #FF5F5F;
	color: #FFF
}

.passport .button .second {
	float: right;
	background: #B7B7B7
}

.passport .button .width100 {
	width: 100%
}

.passport .font14 {
	font-size: 14px
}

.passport .green {
	color: #35951B
}

.passport .red {
	color: #FF5F5F
}

.passport .blue {
	color: #1B9CD6
}

.passport .gray {
	color: #A3A3A3 !important
}

.passport .bottom60 {
	padding-bottom: 60px
}

.passport .bottom-auto {
	padding-bottom: 6px
}
</style>
				<div class="area out-header">
					<div class="logo-box fl-l">
						<img src="<%=path%>/images/logo-login.fb5abb6b.png" />
					</div>

				</div>
				<div id="loginBody" style="background-color:#a1c6f0;">
					<div id="theme" class="area out-body"
						style="background-image: url(<%=path%>/images/xinban.png);">
						<a class="login-a" id="adHref" href="javascript:void(0);"
							target="_blank"></a>
						<form name="ThisForm"  class="login-form login-box-shadow ng-pristine ng-valid">
							<h2>
								登录校内电子邮件
							</h2>
							<div class="field f-account">
								<div class="ipt-box pos-r">
									<input name="uname"
										class="addFocus ipt-account ng-pristine ng-valid inside-box-shadow"
										type="text" placeholder="请输入您的邮箱" />
									<div class="account-tips pos-a ng-hide">
										<!-- ngRepeat: one in accountTipsData track by $index -->
									</div>
								</div>
								<div class="tipHolder"></div>
							</div>
							<div class="field f-pwd">
								<div class="ipt-box">
									<input class="addFocus ng-pristine ng-valid" type="password" name="upwd"
										placeholder="请输入您的密码" />
								</div>
								<div class="tipHolder ng-binding"></div>
							</div>


							<div class="field">
							 <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
								<input type="button" onclick="check1();" class="btn-login fontFamily" value="登 录" />
							</div>

							<div class="field f-register">
								<a  target="_blank" href="<%=path%>/register.jsp">还没有邮箱？<span class="f-href">现在注册</span>
								</a>
							</div>
						</form>


					</div>
				</div>
				<div class="area out-footer">
					<div>
						Copyright &copy; 2019. All rights reserved. 版权所有
					</div>
					<div>
						<span>客服热线： 011-5238103760</span>
						<span class="out-footer-space">客服邮箱：webmaster@cc.com</span>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.ThisForm.uname.value=="")
			 {
			 	alert("请输入邮箱账号");
				document.ThisForm.uname.focus();
				return false;
			 }
			 if(document.ThisForm.upwd.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.upwd.focus();
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.ThisForm.uname.value,document.ThisForm.upwd.value,callback);
		}
		
		function callback(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		    
		}
	    </script>