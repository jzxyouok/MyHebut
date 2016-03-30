<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>公告管理</title>

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
				<li class="visible-md visible-lg">
					<a href="#" id="main-menu-toggle"> <i class="fa fa-th-large"></i>
					</a>
				</li>
				<li class="visible-xs visible-sm">
					<a href="#" id="sidebar-menu"> <i class="fa fa-navicon"></i>
					</a>
				</li>
			</ul>
			<!-- End: Navbar Action -->
			<!-- Start: Topbar -->
			<jsp:include page="../common/topbar.jsp"/>
			<!-- End: Topbar -->
		</div>
	</div>
	<!-- End: Header -->
	<!-- Start: Container -->
	<div class="container-fluid content">
		<div class="row">
			<!-- Start: Sidebar -->
			<jsp:include page="../common/sidebar.jsp"/>
			<!-- End: Sidebar -->

			<!-- Start: Main Page -->
			<div class="main">
				<!-- Start: Page Header -->
				<div class="page-header">
					<div class="pull-left">
						<ol class="breadcrumb visible-sm visible-md visible-lg">
							<li>
								<a href="/index">
									<i class="icon fa fa-home"></i>
									Home
								</a>
							</li>
							<li class="active">
								<i class="fa fa-user"></i>
								系统公告
							</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>系统公告</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				<div class="main_page">
					<table class="table table-hover">
						<caption>系统公告管理</caption>
						<thead>
							<tr>
								<th>公告标题</th>
								<th>公告发布时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boards}" varStatus="status">
								<tr>
									<th><a onclick="javascript:window.location='/detail?boardId=${board.boardId}'">${board.title}</a></th>
									<th>${board.create_time}</th>
									<th><a href="#" onclick="deleteBoard(${board.boardId})">删除</a></th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr style="border:1px solid #CBCBCB;margin: 40px 0">
					<form id="newBoard">
						<h3 style="font-weight: bold">发布新的公告</h3>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-4">
									<input type="text" class="form-control" name="title" placeholder="请输入公告标题">
								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea type="text" name="detail" class="form-control bk-noradius billboard-textarea" placeholder="请输入公告内容"></textarea>
						</div>
						<button class="btn btn-primary submitBoard" id="submitBoard">发布</button>
					</form>
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
	<script src="${basePath}/js/common/ajaxfileupload.js"></script>
	<script src="${basePath}/js/common/bootstrapValidator.min.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/system/validator.js"></script>
	<script src="${basePath}/js/common/commonFunc.js"></script>
	<script src="${basePath}/js/system/admin.js"></script>
	
 </body>
</html>
