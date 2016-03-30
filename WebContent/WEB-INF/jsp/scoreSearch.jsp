<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>Hebut在线考试系统</title>

<link href="${basePath}/img/favicon.ico" rel="shortcut icon">

<link href="${basePath}/css/font.css" rel="stylesheet" />
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${basePath}/css/font-awesome.min.css" rel="stylesheet" />
<link href="${basePath}/css/bootkit.css" rel="stylesheet" />
<link href="${basePath}/css/jquery.mmenu.css" rel="stylesheet" />
<link href="${basePath}/css/style.css" rel="stylesheet" />
<link href="${basePath}/css/add-ons.min.css" rel="stylesheet" />
<link href="${basePath}/css/exam.css" rel="stylesheet" />
<link href="${basePath}/css/score.css" rel="stylesheet" />

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
			<jsp:include page="common/topbar.jsp" />
			<!-- End: Topbar -->
		</div>
	</div>
	<!-- End: Header -->
	<!-- Start: Container -->
	<div class="container-fluid content">
		<div class="row">
			<!-- Start: Sidebar -->
			<jsp:include page="common/sidebar.jsp" />
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
							<li class="active"><i class="fa fa-book"></i> 成绩查询</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>成绩查询</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->
				<div class="main_page">
					<div class="row">
						<div class="container">
							<div class="login-container">
								<h1>成绩查询</h1>
								<form action="" method="post" id="submitForm">
									<input type="text" name="stuId" id="stuId" placeholder="请输入学号">
									<c:set var="loginStatus" scope="session" value="${loginStatus}" />
									<c:if test="${loginStatus != true}">
										<input type="text" name="authCode" id="authCode"
											placeholder="请输入验证码">
										<div id="authCode-div">
											<img
												src="http://myhebut.oss-cn-hangzhou.aliyuncs.com/yzm/${loginedUser.userName}/yzm.png">
										</div>
									</c:if>
									<button type="button" id="submitBtn">Search</button>
									<div class="error">
										<span>+</span>
									</div>
								</form>

							</div>
						</div>

						<div id="errorMsg"></div>
						<div class="container">
							<div class="score_table">
								<div class="row">
									<div class="col-sm-6">
										<div class="stu_msg">
											<table class="table table-hover">
												<caption>成绩单</caption>
												<tr>
													<td>姓名</td>
													<td id="stuMsg_0"></td>
												</tr>
												<tr>
													<td>学号</td>
													<td id="stuMsg_1"></td>
												</tr>
												<tr>
													<td>专业</td>
													<td id="stuMsg_2"></td>
												</tr>
												<tr>
													<td>已获总学分数</td>
													<td id="stuMsg_3"></td>
												</tr>
											</table>
											<button class="back" onclick="window.location.reload()">继续查找~</button>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="score_msg">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>科目</th>
														<th>学分</th>
														<th>成绩</th>
													</tr>
												</thead>
												<tbody id="score_list"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- End: Main Content -->
		</div>
		<!-- End: Main Page -->
	</div>
	<!--Start: Container-->

	<script src="${basePath}/js/common/jquery.min.js"></script>
	<script src="${basePath}/js/common/bootstrap.min.js"></script>
	<script src="${basePath}/js/common/jquery.mmenu.min.js"></script>
	<script src="${basePath}/js/common/core.min.js"></script>
	<script src="${basePath}/js/common/commonFunc.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/system/score_search.js"></script>
	<script src="${basePath}/js/system/general.js"></script>
	
</body>
</html>
