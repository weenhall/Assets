<%@ page language="java" import="java.util.*,java.net.*"
	contentType="text/html; charset=utf-8"%>
<!--引入struts2的核心标签库-->
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>管理平台</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="platform for manage">
<meta name="author" content="ween">
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
	function checkForm() {
		var email = document.getElementById("email");
		var password = document.getElementById("password");
		if (email.innerHTML == null) {
			alert("邮箱不能为空");
		} else if (password.innerHTML == null) {
			alert("密码不能为空");
		} else {
			return true;
		}

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
	<%
		request.setCharacterEncoding("utf-8");
		String uemail = "";
		String password = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("uemail")) {
					uemail = URLDecoder.decode(c.getValue(), "utf-8");
				}
				if (c.getName().equals("password")) {
					password = URLDecoder.decode(c.getValue(), "utf-8");
				}
			}
		}
	%>
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
			</ul>
			<a class="brand" href="login.jsp"><span class="first"></span><span
				class="second">管理平台</span></a>
		</div>
	</div>






	<div class="row-fluid">
		<div class="dialog">
			<div class="block">
				<p class="block-heading">登录信息平台</p>
				<div class="block-body">
					<form action="<%=path%>/users/users_login.action" method="post" onclick="checkForm()"
						>
						<div id="email2" class=" control-group">
							<label class="control-label">您的常用邮箱地址：</label>
							<div class="controls">
								<input id="email" type="email" class="span12" name="uemail"
									value="<%=uemail%>" placeholder="请填写有效的邮箱地址"> <span
									class=" help-inline" id="email1"></span>
							</div>
						</div>
						<div id="password2" class="control-group">
							<label class="control-label">管理平台密码：</label>
							<div class="controls">
								<input id="password" type="password" class="span12"
									name="password" value="<%=password%>"
									placeholder="密码须以首字母开头并不少于6位"> <span
									class="help-inline" id="password1"></span>
							</div>
						</div>
						<div>
							<s:fielderror />
							<!-- 接受服务器端验证方法并显示表单验证的出错信息 -->
						</div>
						<div class="control-group">
							<div class="controls">

								<div id="sub1"
									style="padding: 2px; z-index: 100; display: inline-block; float: right;">
									<input id="sub" type="submit" name="submit" value="登录平台"
										 class="btn btn-primary">
								</div>
								<label class="remember-me"> <input type="checkbox"
									name="isUseCookie" checked="checked" /> 记住我
								</label>
								<div class="clearfix"></div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<p align="center">
				<a href="reg.jsp">点我注册</a>
			</p>
			<hr />
		</div>
	</div>





	<script src="../Resource/lib/bootstrap/js/bootstrap.js"></script>


</body>
</html>


