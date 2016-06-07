<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>	
	<c:set var="subject" value="${subject}" /> 
	<c:if test="${subject == 0}">马原</c:if>
	<c:if test="${subject == 1}">毛概</c:if>
	考试记录
</title>

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
			<div class="main ">
				<!-- Start: Page Header -->
				<div class="page-header">
					<div class="pull-left">
						<ol class="breadcrumb visible-sm visible-md visible-lg">
							<li><a href="/index"><i class="icon fa fa-home"></i>Home</a></li>
							<li><a href="#"><i class="fa fa-file-text"></i>
							<c:set var="subject" value="${subject}" /> 
							<c:if test="${subject == 0}">马原</c:if>
							<c:if test="${subject == 1}">毛概(上)</c:if>
							<c:if test="${subject == 2}">毛概(下)</c:if>
							<c:if test="${subject == 3}">史纲</c:if></a></li>
							<li class="active"><i class="fa fa-tags"></i>排行榜</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>排行榜</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				<div class="main_page">
					<div class="row">					
						<div class="col-lg-12">                           
							<div class="panel">                                
								<div class="panel-heading bk-bg-primary">
									<h6 style="line-height:23px">
										<i class="fa fa-table red"></i>
										<span class="break"></span>
										排行榜
									</h6>
									<div class="panel-actions">
										<a href="#" class="btn-minimize control_panel_single"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>										
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>用户昵称</th>
													<th>考试耗时</th>
													<th>成绩</th>
													<th class="mobile_hide">得分率&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
													<th class="mobile_hide">&nbsp;&nbsp;&nbsp;&nbsp;</th>
													<th>名次</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="record" items="${rankRecords}" varStatus="status">
												<tr>
													<td>${record.nickName}</td>
													<td>${record.last_time}</td>
													<td>${record.score}</td>
													<td class="mobile_hide">
														<div class="progress">
															<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45"  style="width: ${record.percent};">
																${record.percent}
															</div>
														</div>
													</td>
													<td class="mobile_hide"></td>
													<td>	
														${status.count}
													</td>
												</tr>	
												</c:forEach>																
											</tbody>
										</table>
									</div>
								</div>
							</div> 
							<div class="panel">                                
								<div class="panel-heading bk-bg-primary">
									<h6 style="line-height:23px">
										<i class="fa fa-table red"></i>
										<span class="break"></span>
										我的考试记录(5分以下的成绩被视为无效成绩,系统将不进行记录)
									</h6>
									<div class="panel-actions">
										<a href="#" class="btn-minimize control_panel_single"><i
											class="fa fa-chevron-up"></i></a>
									</div>
								</div>										
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class="mobile_hide">用户昵称</th>
													<th>考试时间</th>
													<th>考试耗时</th>
													<th>成绩</th>
													<th class="mobile_hide">得分率&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
													<th class="mobile_hide">&nbsp;&nbsp;&nbsp;&nbsp;</th>
													<th>删除</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="record" items="${examRecords}" varStatus="status">
												<tr>
													<td class="mobile_hide">${loginedUser.nickName}</td>
													<td>${record.begin_time}</td>
													<td>${record.last_time}</td>
													<td>${record.score}</td>
													<td class="mobile_hide">
														<div class="progress">
															<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45"  style="width: ${record.percent};">
																${record.percent}
															</div>
														</div>
													</td>
													<td class="mobile_hide"></td>
													<td>	
														<form>
															<input value="${record.recordId}" name="recordId" id="recordId" style="display:none"/>										
															<a class="record_a delete_record">
															&nbsp;&nbsp;<i class="fa fa-trash-o fa-lg"></i>
														</a>
														</form>
														
													</td>
												</tr>	
												</c:forEach>																
											</tbody>
										</table>
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
	</div>
	<!--End: Container-->

	<script src="${basePath}/js/common/jquery.min.js"></script>
	<script src="${basePath}/js/common/bootstrap.min.js"></script>
	<script src="${basePath}/js/common/jquery.mmenu.min.js"></script>
	<script src="${basePath}/js/common/core.min.js"></script>
	<script src="${basePath}/js/common/commonFunc.js"></script>	
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/system/ajax_crud.js"></script>
	<script src="${basePath}/js/system/search.js"></script>

</body>
</html>
