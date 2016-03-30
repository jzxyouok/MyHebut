<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>用户管理</title>

<link href="${basePath}/img/favicon.ico" rel="shortcut icon">

<link href="${basePath}/css/font.css" rel="stylesheet" />
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${basePath}/css/font-awesome.min.css" rel="stylesheet" />
<link href="${basePath}/css/bootkit.css" rel="stylesheet" />
<link href="${basePath}/css/jquery.mmenu.css" rel="stylesheet" />
<link href="${basePath}/css/style.css" rel="stylesheet" />
<link href="${basePath}/css/add-ons.min.css" rel="stylesheet" />
<link href="${basePath}/css/exam.css" rel="stylesheet" />
<link href="${basePath}/css/admin.css" rel="stylesheet" />


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<!-- Start: Header -->
	<div class="navbar" role="navigation">
		<div class="container-fluid container-nav">
			<!-- Start: Navbar Action -->
			<ul class="nav navbar-nav navbar-actions navbar-left">
				<li class="visible-md visible-lg"><a href="#"
					id="main-menu-toggle"> <i class="fa fa-th-large"></i>
				</a></li>
				<li class="visible-xs visible-sm"><a href="#" id="sidebar-menu">
						<i class="fa fa-navicon"></i>
				</a></li>
			</ul>
			<!-- End: Navbar Action -->
			<!-- Start: Topbar -->
			<jsp:include page="../common/topbar.jsp" />
			<!-- End: Topbar -->
		</div>
	</div>
	<!-- End: Header -->
	<!-- Start: Container -->
	<div class="container-fluid content">
		<div class="row">
			<!-- Start: Sidebar -->
			<jsp:include page="../common/sidebar.jsp" />
			<!-- End: Sidebar -->

			<!-- Start: Main Page -->
			<div class="main">
				<!-- Start: Page Header -->
				<div class="page-header">
					<div class="pull-left">
						<ol class="breadcrumb visible-sm visible-md visible-lg">
							<li><a href="/index"> <i class="icon fa fa-home"></i>
									Home
							</a></li>
							<li class="active"><i class="fa fa-laptop"></i> 用户管理</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>用户管理</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->
				<div class="main_page">
					<form action="/admin/searchUser" method="post" id="queryform">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label for="nickName">用户昵称</label> 
									<input type="text" value="${nickName}" class="form-control" id="nickName" name="nickName">
									<input type="text" value="1" id="page_now" name="page_now" style="display:none">									
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<button type="submit" class="btn btn-primary search" style="margin-top: 23px">搜索</button>
								</div>
							</div>
						</div>
					</form>
					<div class="table-responsive">
						<table class="table table-hover table-condensed">
							<caption>用户管理</caption>
							<thead>
								<tr>
									<th>用户id</th>
									<th>登录用户名</th>
									<th>登录密码</th>
									<th>用户昵称</th>
									<th>用户邮箱</th>
									<th>用户权限</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${users}" varStatus="status">
									<tr>
										<th>${user.userId}</th>
										<th>${user.userName}</th>
										<th>${user.userPass}</th>
										<th>${user.nickName}</th>
										<th>${user.email}</th>
										<th><c:set var="power" value="${user.power}" /> 
										<c:if test="${power == 0}">
											   普通用户
										</c:if> 
										<c:if test="${power == 1}">
											  管理员
										</c:if></th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<jsp:include page="../common/query.jsp" />
				</div>
				<!-- End: Main Content -->
			</div>
			<!-- End: Main Page -->
		</div>
	</div>
	<!--End: Container-->

	<script src="${basePath}/js/common/jquery.min.js"></script>
	<script src="${basePath}/js/common/bootstrap.min.js"></script>
	<script src="${basePath}/js/common/jquery.mmenu.min.js"></script>
	<script src="${basePath}/js/common/core.min.js"></script>
	<script src="${basePath}/js/common/commonFunc.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/system/admin.js"></script>
	<script src="${basePath}/js/system/query.js"></script>

</body>
</html>
