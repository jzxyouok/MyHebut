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
	错题练习
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
							<li class="active"><i class="fa fa-pencil-square"></i>错题练习</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>错题练习</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				<div class="main_page">
					<form class="exam-form" action="/questionsCorrect" method="post">
					错题练习：
					<div class="panel">
						<div class="panel-heading bk-bg-primary">
							<h6><i class="fa fa-signal red"></i>单选题</h6>
							<div class="panel-actions">
								<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						
						<div class="panel-body panel_single">
							<ol class="list-group">
								<c:forEach var="question" items="${singleQuestionNotes}"
									varStatus="status">
									<li class="list-group-item">
										<p>${status.count}.${question.question.content}</p> <label><input
											type="radio" name="${status.index}_single" value="A">
											A.&nbsp;&nbsp;${question.question.answerA}</label><br> <label><input
											type="radio" name="${status.index}_single" value="B">
											B.&nbsp;&nbsp;${question.question.answerB}</label><br> <label><input
											type="radio" name="${status.index}_single" value="C">
											C.&nbsp;&nbsp;${question.question.answerC}</label><br> <label><input
											type="radio" name="${status.index}_single" value="D">
											D.&nbsp;&nbsp;${question.question.answerD}</label><br> 
											<c:set var="answerE"  value="${question.question.answerE}"/>
											<c:if test="${not empty answerE}">	
												<label><input type="radio" name="${status.index}_single" value="E">
												E.&nbsp;&nbsp;${question.question.answerE}</label><br> 
											</c:if>
											<input value="${question.questionId}" name="${status.index}_id_single" style="display: none" />
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
								<c:forEach var="question" items="${MultipleQuestionNotes}"
									varStatus="status">
									<li class="list-group-item">
										<p>${status.count}.${question.question.content}</p> <label><input
										type="checkbox" name="${status.index}_multiple" value="A">
										A.&nbsp;&nbsp;${question.question.answerA}</label><br> <label><input
										type="checkbox" name="${status.index}_multiple" value="B">
										B.&nbsp;&nbsp;${question.question.answerB}</label><br> <label><input
										type="checkbox" name="${status.index}_multiple" value="C">
										C.&nbsp;&nbsp;${question.question.answerC}</label><br> <label><input
										type="checkbox" name="${status.index}_multiple" value="D">
										D.&nbsp;&nbsp;${question.question.answerD}</label><br> 
										<c:set var="answerE"  value="${question.question.answerE}"/>
										<c:if test="${not empty answerE}">	
										  	<label><input type="checkbox" name="${status.index}_multiple" value="E">
											E.&nbsp;&nbsp;${question.question.answerE}</label><br>
										</c:if>
										<input value="${question.questionId}" name="${status.index}_id_multiple" style="display: none" />
									</li>
								</c:forEach>
							</ol>
						</div>
					</div>
					<div class="auto-add">
						<label> <input type="checkbox" name="auto" value="2" />
							<input type="checkbox" name="auto" value="0" checked="checked"
							style="display: none" /> 自动删除错题(选中后系统将自动把答对的试题从错题集中删除) <br>
						</label>
					</div>
					<input type="text" value="${singleQuestionNotes.size()}" id="singleAmount" name="singleAmount" style="display: none">
					<input type="text" value="${MultipleQuestionNotes.size()}" id="multipleAmount" name="multipleAmount" style="display: none">
					<input type="checkbox" name="auto" value="0" checked="checked" style="display:none"/>
					<input type="text" value="${subject}" name="subject" style="display: none">
					<button class="btn btn-success" type="submit">提交试卷</button>
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
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/common/commonFunc.js"></script>
	<script src="${basePath}/js/system/optimize.js"></script>
	<script src="${basePath}/js/system/search.js"></script>
</body>
</html>
