<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>	
	批改结果
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
					<a href="#" id="sidebar-menu" class="hide_panel"> <i class="fa fa-navicon"></i>
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
							<li><a href="/index"><i class="icon fa fa-home"></i>Home</a></li>
							<li><a href="#"><i class="fa fa-file-text"></i>		
							<c:set var="subject" value="${subject}" /> 
							<c:if test="${subject == 0}">马原</c:if>
							<c:if test="${subject == 1}">毛概(上)</c:if>
							<c:if test="${subject == 2}">毛概(下)</c:if>
							<c:if test="${subject == 3}">史纲</c:if></a></li>
							<li class="active"><i class="fa fa-tags"></i>批改结果</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>批改结果</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				<div class="main_page">
					得分： ${score}
					批改结果： 答错 ${singleWrongQuestions.size()}道单选题, ${multipleWrongQuestions.size()}道多选题.错题如下。
					<div class="panel">
						<div class="panel-heading bk-bg-primary">
							<h6><i class="fa fa-signal red"></i>单选题</h6>
							<div class="panel-actions">
								<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						
						<div class="panel-body panel_single">
							<ol class="list-group">
								<c:forEach var="question" items="${singleWrongQuestions}" varStatus="status">
								<li  class="list-group-item">
									<div class="row">
										<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
											<p>${question.examId}. ${question.content}</p> 
											A.&nbsp;&nbsp;${question.answerA} <br> 
											B.&nbsp;&nbsp;${question.answerB} <br> 
											C.&nbsp;&nbsp;${question.answerC} <br> 
											D.&nbsp;&nbsp;${question.answerD} <br>
											<c:set var="answerE"  value="${question.answerE}"/>
											<c:if test="${not empty answerE}">	
												E.&nbsp;&nbsp;${question.answerE}<br>
											</c:if>
											<div class="answer">
												<span class="error-answer">你的选择：${question.answerF}</span>
												 &nbsp; &nbsp; &nbsp; 
												<span class="true-answer">正确答案：${question.answerT}</span>
											</div>
										</div>
										<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
										<form>
											<input value="${question.questionId}" name="questionId" id="questionId" style="display:none"/>										
											<input value="${question.answerF}" name="answerF" id="answerF" style="display:none"/>
											<input value="${subject}" name="subject" id="subject" style="display:none"/>
											<button class="btn btn-sm btn-primary add_wrongQuestion" type="button">
												<i class="fa fa-star"></i>
												添加到错题集
											</button>
										</form>
										</div>
									</div>	
								</li>
							</c:forEach>						
							</ol>
						</div>
					</div>
					<div class="panel">
						<div class="panel-heading bk-bg-primary">
							<h6><i class="fa fa-signal red"></i>多选题</h6>
							<div class="panel-actions">
								<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						
						<div class="panel-body panel_multiple">
							<ol class="list-group">
								<c:forEach var="question" items="${multipleWrongQuestions}" varStatus="status">
									<li  class="list-group-item">
										<div class="row">
											<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
												<p>${question.examId}. ${question.content}</p> 
												A.&nbsp;&nbsp;${question.answerA} <br> 
												B.&nbsp;&nbsp;${question.answerB} <br> 
												C.&nbsp;&nbsp;${question.answerC} <br> 
												D.&nbsp;&nbsp;${question.answerD} <br>
												<c:set var="answerE"  value="${question.answerE}"/>
												<c:if test="${not empty answerE}">	
													E.&nbsp;&nbsp;${question.answerE}<br>
												</c:if>
											<div class="answer">
												<span class="error-answer">你的选择：${question.answerF}</span>
												 &nbsp; &nbsp; &nbsp; 
												<span class="true-answer">正确答案：${question.answerT}</span>
											</div>
										</div>
										<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
										<form>
											<input value="${question.questionId}" name="questionId" id="questionId" style="display:none"/>
											<input value="${question.answerF}" name="answerF" id="answerF" style="display:none"/>
											<input value="${subject}" name="subject" id="subject" style="display:none"/>										
											<button class="btn btn-sm btn-primary add_wrongQuestion" type="button">
												<i class="fa fa-trash-o"></i>
												添加到错题集
											</button>
										</form>
										</div>
									</div>	
									</li>
								</c:forEach>							
							</ol>
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
	<script src="${basePath}/js/system/optimize.js"></script>
	<script src="${basePath}/js/system/search.js"></script>
</body>
</html>
