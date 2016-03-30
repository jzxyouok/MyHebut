<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>留言管理</title>

<link href="${basePath}/img/favicon.ico" rel="shortcut icon">

<link href="${basePath}/css/font.css" rel="stylesheet" />
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${basePath}/css/font-awesome.min.css" rel="stylesheet" />
<link href="${basePath}/css/bootkit.css" rel="stylesheet" />
<link href="${basePath}/css/jquery.mmenu.css" rel="stylesheet" />
<link href="${basePath}/css/style.css" rel="stylesheet" />
<link href="${basePath}/css/add-ons.min.css" rel="stylesheet" />
<link href="${basePath}/css/message.css" rel="stylesheet" />

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
								<i class="fa fa-envelope-o"></i>
								答疑
							</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>答疑</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				 <div class="main_page">
					
					<ul class="list-group margin-top">
						<h3>问题列表</h3>
						<c:forEach var="message" items="${messages}" varStatus="status">
							<li class="list-group-item advice-item">
							<p>${message.content}</p>
							<p class="reply">
								<c:set var="reply" value="${message.reply}" />
								<c:if test="${empty reply}">
									<span style="color:#721A1A">网站回复:(暂时无回复,请耐心等候,站长看到您的建议与提问会第一时间回复.)</span>
								</c:if> 
								<c:if test="${not empty reply}">
									 网站回复：${reply}
								</c:if> 
							</p>
							<p>${message.create_time}
								<span style="float: right">
									<a href="#" onclick="addReply(${message.messageId})">回复</a>
								</span>
							</p>	
							</li>
						</c:forEach>
					</ul>
					<!-- Start: 添加回复弹出框 -->
					<button id="showReply" type="button" data-toggle="modal"
						data-target="#modelQuestion" style="display: none"></button>
					<div class="modal fade" id="modelQuestion" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="width: 500px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">添加回复</h4>
								</div>
								<div class="modal-body">
									<form id="newReply" class="form-horizontal">
										<div class="form-group">
											<label for="reply" class="col-sm-2 control-label">回复</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="reply" name="reply">
											</div>
										</div>
										<input type="text" class="form-control" id="messageId" name="messageId" style="display:none">
									</form>
								</div>
								<div class="modal-footer">
									<button id="submitReply" type="button" class="btn btn-primary">提交</button>
									<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End: 添加回复弹出框 -->
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
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/common/commonFunc.js"></script>
	<script src="${basePath}/js/system/admin.js"></script>
	
</body>
</html>
