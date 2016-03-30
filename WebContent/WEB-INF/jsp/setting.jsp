<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>个人设置</title>

<link href="${basePath}/img/favicon.ico" rel="shortcut icon">

<link href="${basePath}/css/font.css" rel="stylesheet" />
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${basePath}/css/font-awesome.min.css" rel="stylesheet" />
<link href="${basePath}/css/bootkit.css" rel="stylesheet" />
<link href="${basePath}/css/jquery.mmenu.css" rel="stylesheet" />
<link href="${basePath}/css/style.css" rel="stylesheet" />
<link href="${basePath}/css/add-ons.min.css" rel="stylesheet" />
<link href="${basePath}/css/exam.css" rel="stylesheet" />

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
			<jsp:include page="common/topbar.jsp"/>
			<!-- End: Topbar -->
		</div>
	</div>
	<!-- End: Header -->
	<!-- Start: Container -->
	<div class="container-fluid content">
		<div class="row">
			<!-- Start: Sidebar -->
			<jsp:include page="common/sidebar.jsp"/>
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
								个人设置
							</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>个人设置</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				<div class="main_page">
					<div class="panel">
						<div class="panel-heading bk-bg-primary">
							<h6>
								<i class="fa fa-indent red"></i>
								个人设置
							</h6>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" id="settingForm"  onsubmit="return false;">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="nickName">用户昵称</label>
									<div class="col-sm-6">
										<input type="text" id="nickName" name="nickName" class="form-control input-sm"  value="${loginedUser.nickName}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="touxiang">头像</label>
									<div class="col-sm-6">
										<input type="file" id="touxiang" name="touxiang" />
									</div>
								</div>
								<button id="settingBtn" type="submit">提交</button>
							</form>
						</div>
					</div>
					<div class="panel">
						<div class="panel-heading bk-bg-primary">
							<h6>
								<i class="fa fa-indent red"></i>
								修改密码
							</h6>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" id="alterPassForm" name="alterPassForm" onsubmit="return false;">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="oldPass">旧密码</label>
									<div class="col-sm-6">
										<input type="password" id="oldPass" name="oldPass"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="newPass">新密码</label>
									<div class="col-sm-6">
										<input type="password" id="newPass" name="newPass" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="confirmPass">请再输入一遍密码</label>
									<div class="col-sm-6">
										<input type="password" id="confirmPass" name="confirmPass" />
									</div>
								</div>
								<button id="alterPassBtn" type="submit">提交</button>
							</form>
						</div>
					</div>
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
	<script src="${basePath}/js/system/ajax_upload.js"></script>
	<script src="${basePath}/js/system/search.js"></script>
	<script src="${basePath}/js/system/setting.js"></script>
	
 </body>
</html>
