<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<!--引入struts2的核心标签库-->
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>管理平台</title>
<meta content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="../Resource/lib/bootstrap/css/bootstrap.css"
	rel="stylesheet" />
<link href="../Resource/lib/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet" />


<link rel="stylesheet" type="text/css"
	href="../Resource/stylesheets/theme.css">
<link rel="stylesheet"
	href="../Resource/lib/font-awesome/css/font-awesome.css">

<script src="../Resource/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
function checkForm(form)
{
	if(form.uemail.value==''){
		$('#email1').text('请输入邮箱!').css('color','red');
		form.uemail.focus;
		return false;
	}else if(!/[\w!#$%&'+/=?^_`{|}~-]+(?:.[\w!#$%&'+/=?^_`{|}~-]+)@(?:[\w](?:[\w-][\w])?.)+\w?/.test(form.uemail.value)){
		$('#email1').text('请输入合法邮箱!').css('color','red');
		return false;
	}else{
		$('#email1').text('');
	}
	if(form.username.value==''){
	    $('#name1').text('请输入姓名!').css('color','red');
		form.username.focus;
		return false;
	}else{
		$('#name1').text('');
	}
	if(form.cardnum.value==''){
		$('#idcard1').text('请输入身份证号!').css('color','red');
		form.cardnum.focus;
		return false;
	}else if(!/^\d{15}|\d{18}$/.test(form.cardnum.value)){
		$('#idcard1').text('身份证号错误!').css('color','red');
		return false;
	}else{
		$('#idcard1').text('');
	}
	if(form.phone.value==''){
		$('#phone1').text('请输入手机号!').css('color','red');
		form.phone.focus;
		return false;
	}else if(!/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test(form.phone.value)){
		$('#phone1').text('手机号错误!').css('color','red');
		return false;
	}else{
		$('#phone1').text('');
	}
	if(form.password.value==''){
		$('#password1').text('请输入密码!').css('color','red');
		form.password.focus;
		return false;
	}else if(!/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/.test(form.password.value)){
		$('#password1').text('密码为字母开头不少于6位!').css('color','red');
		form.password.focus;
		return false;
	}
	else {
		$('#password1').text('');
	}
	if(form.password.value!==form.password1.value){
		$('#npassword1').text('两次输入密码不一致').css('color','red');
		return false;
	}else{
		$('#npassword1').text('');
	}
	if(form.check.value==0){
		$('#check1').text('点击同意进行注册！').css('color','red');
		return false;
	}
	document.regForm.submit();
}
</script>

<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="lib/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
	<!--<![endif]-->

	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
			</ul>
			<a class="brand" href="index.html"><span class="first"></span><span
				class="second">管理平台</span></a>
		</div>
	</div>






	<div class="row-fluid">
		<div class="dialog">
			<div class="block">
				<p class="block-heading">注册用户信息</p>
				<div class="block-body">
					<form action="<%=path%>/users/reg_doReg.action" method="post" name="regForm">
					  <div class=" control-group" id="email2">
							<label class="control-label">Email(登录名)：</label>
							<div class="controls">
								<input type="email" id="email" class="span12" name="uemail"
									placeholder="请填写有效的邮箱地址"> <span class=" help-inline"
									id="email1"></span>
							</div>
						</div>
						<div class="control-group" id="name2">
							<label class="control-label">您的真实姓名：</label>
							<div class="controls">
								<input type="text" id="name" class="span12" name="username"
									placeholder="请填写您的真实姓名"> <span class=" help-inline"
									id="name1"></span>
							</div>
						</div>
						<div class=" control-group" id="idcard2">
							<label class="control-label">您的身份证号码：</label>
							<div class="controls">
								<input type="text" id="idcard" class="span12" name="cardnum"
									placeholder="请填写您本人的身份证号码"> <span class=" help-inline"
									id="idcard1"></span>
							</div>
						</div>

						<div class=" control-group" id="phone2">
							<label class="control-label">您的手机号码：</label>
							<div class="controls">
								<input type="text" id="phone" class="span12" name="phonenum"
									placeholder="请填写您的手机号码"> <span class=" help-inline"
									id="phone1"></span>
							</div>
						</div>
						<div class=" control-group" id="password2">
							<label class="control-label">您的密码：</label>
							<div class="controls">
								<input type="text" id="password" class="span12" name="password"
									placeholder="密码须以首字母开头并不少于6位"> <span
									class=" help-inline" id="password1"></span>
							</div>
						</div>
						<div class=" control-group" id="npassword2">
							<label class="control-label">确认密码：</label>
							<div class="controls">
								<input type="text" class="span12" id="npassword"
									name="password1" placeholder="请确认您输入的密码与之前输入的一致"> <span
									class=" help-inline" id="npassword1"></span>
							</div>
						</div>

						<div id="sub1"
							style="padding:2px; z-index:100;display:inline-block; float:right;">
							<input id="sub" type="button" name="submit1" value="注册系统用户"
								class="btn btn-primary" onclick="checkForm(this.form)">
							<input type="reset" class="btn  btn-primary" value="重置"/><hr/>
							已有帐号?<a href="<%=path%>/users/login.jsp">立即登录</a><hr/>
						</div>
						<div class=" control-group" id="check2">
							<label class="remember-me">
								<div class="controls">
									<input type="checkbox" id="check" value="0" onclick="this.value=(this.value==0?1:0)"> 我同意注册
									
							</label><span class=" help-inline" id="check1"></span>
					</form>
				</div>
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
	</div>
	</div>






	<script src="../Resource/lib/bootstrap/js/bootstrap.js"></script>

</body>
</html>


