<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<!--引入struts2的核心标签库-->
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if(session.getAttribute("loginUserName")==null){
		response.sendRedirect("Users_login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>资产管理平台</title>

<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="../Resource/lib/bootstrap/css/bootstrap.css"
	rel="stylesheet" />
<link href="../Resource/lib/bootstrap/css/bwizard.min.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="../Resource/stylesheets/theme.css">
<link rel="stylesheet"
	href="../Resource/lib/font-awesome/css/font-awesome.css">

<script src="../Resource/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<link href="../Resource/lib/bootstrap/css/bwizard.min.css"
	rel="stylesheet" />

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
      <script src="../Resource/lib/html5.js"></script>
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
<link href="../Resource/css/pagination.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="../Resource/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../Resource/js/jquery.pagination.js"></script>
<script type="text/javascript">

// 点击分页按钮以后触发的动作
function handlePaginationClick(new_page_index, pagination_container) {
    $("#stuForm").attr("action", "<%=path%>/assets/asset_show?pageNum="+ (new_page_index + 1));
		$("#stuForm").submit();
		return false;
	}

	$(function() {
		$("#News-Pagination").pagination(${result.totalRecord}, {items_per_page : ${result.pageSize}, // 每页显示多少条记录
			current_page : ${result.currentPage} - 1, // 当前显示第几页数据
			num_display_entries : 8, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数1,2......8,9
			callback : handlePaginationClick
		});
	});
</script>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<!--<![endif]-->

	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
				<li><a href="#"
					class="hidden-phone visible-tablet visible-desktop" role="button">设置</a></li>
				<li id="fat-menu" class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-user"></i> <span>${sessionScope.loginUserName}</span>
						<i class="icon-caret-down"></i>
				</a>

					<ul class="dropdown-menu">

						<li><a tabindex="-1" href="#">能力图表</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" class="visible-phone" href="#">个人设置</a></li>
						<li class="divider visible-phone"></li>
						<li><a tabindex="-1"
							href="<%=path%>/users/users_logout.action">退出平台</a></li>
					</ul></li>

			</ul>
			<a class="brand" href="#"><span class="first"></span><span
				class="second">资产管理平台</span></a>
		</div>
	</div>
	<div class="sidebar-nav">
		<form class="search form-inline">
			<input type="search" placeholder="查找相关功能...">
		</form>
		<a href="#1" class="nav-header" data-toggle="collapse"><i
			class="icon-briefcase"></i>日常管理</a>
		<ul id="1" class="nav nav-list collapse">
			<li><a href="<%=path%>/assets/asset_show.action">资产卡片管理</a></li>
			<li><a href="<%=path%>/assets/addAssets.jsp">资产录入</a></li>

		</ul>
		<a href="#2" class="nav-header" data-toggle="collapse"><i
			class="icon-briefcase"></i>资产盘点</a>
		<ul id="2" class="nav nav-list collapse">
			<li><a href="#">盘点汇总</a></li>
			<li><a href="#">盘点查询</a></li>
		</ul>
		<a href="#3" class="nav-header" data-toggle="collapse"><i
			class="icon-briefcase"></i>系统管理</a>
		<ul id="3" class="nav nav-list collapse">
			<li><a href="#">操作员/权限</a></li>
			<li><a href="#">部门/人员信息</a></li>
		</ul>
	</div>

	<div class="content">

		<div class="header"></div>

		<div class="container-fluid">
		<div>
			<form action="<%=path%>/assets/asset_show.action"   id="stuForm"  method="post">
				请输入资产名称：
				<input type="text" name="aname" id="stu_name" style="width:120px" value="${aname}">
				&nbsp;&nbsp;
				<input type="submit" value="查询">
			</form>
		</div>		
		<hr/>
			资产信息列表：<hr/>
			<table class="default" width="100%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<tr class="title">
					<td>1：资产ID</td>
					<td>2：资产名称</td>
					<td>3：资产数量</td>
					<td>4：保管人</td>
					<td>5：单位</td>
					<td>6:资产类别</td>
					<td>7:使用部门</td>
					<td>8:资产描述</td>
					<td>9:操作</td>
				</tr>
				<c:if test="${fn:length(result.dataList) eq 0 }">
			        <span style="color:red">未查询到相关信息！</span>
		        </c:if>
				<!-- 遍历开始 -->
				<c:if test="${fn:length(result.dataList) gt 0 }">			
					<c:forEach items="${result.dataList }" var="a">
						<tr>
							<td><c:out value="${a.aid }"></c:out></td>			
							<td><c:out value="${a.aname}"></c:out></td>
							<td><c:out value="${a.anum}"></c:out></td>
							<td><c:out value="${a.akeeper}"></c:out></td>
							<td><c:out value="${a.aunit}"></c:out></td>
							<td><c:out value="${a.atype}"></c:out></td>
							<td><c:out value="${a.adepart}"></c:out></td>
							<td><c:out value="${a.adescripe}"></c:out></td>
							<td><a
							href="<%=path%>/assets/asset_input.action?aid=${a.aid}"
							onclick="javascript: return confirm('确认要修改吗？');"><span style=" border:hidden">修改</span></a>
							<a
							href="<%=path%>/assets/asset_delete.action?aid=${a.aid}"
							onclick="javascript: return confirm('确认要删除吗？');"><span style=" border:outset">删除</span></a></td>
						</tr>
					</c:forEach>
					<br>
				</c:if>
			</table>
			<!-- 分页按钮区域 -->
			<hr/>
			 共${result.totalRecord }条记录&nbsp;&nbsp;&nbsp;&nbsp;当前第${result.currentPage }/${result.totalPage }页&nbsp;&nbsp;
			 <p id="News-Pagination"></p><!-- 显示分页栏 -->
			<footer>
				<hr>

				<center>
					<p>
						&copy; 2013 <a href="" target="_blank"></a>
					</p>
				</center>
			</footer>
		</div>

	</div>
	</div>




</body>
<script src="../Resource/lib/bootstrap/js/bootstrap.js"></script>

</html>
