<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
 
<title>	
	搜索结果
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
							<li class="active"><i class="fa  fa-search"></i>搜索结果</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>搜索结果</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				<div class="main_page">
					<form class="exam-form" action="/questionsCorrect" method="post">
					<div class="panel-body section">
							<c:if test="${subject == 0}">马原</c:if>
							<c:if test="${subject == 1}">毛概(上)</c:if>
							<c:if test="${subject == 2}">毛概(下)</c:if>
							<c:if test="${subject == 3}">史纲</c:if>
							搜索结果：
							<button type="button" id="highlight-answer" class="btn btn-primary">所有题目正确答案高亮显示</button>
					</div>
					<div class="panel">
						<div class="panel-heading bk-bg-primary">
							<h6><i class="fa fa-signal red"></i>单选题</h6>
							<div class="panel-actions">
								<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						
						<div class="panel-body panel_single">
							<ol class="list-group">
								<c:forEach var="question" items="${singleQuestions}" varStatus="status">
								<li  class="list-group-item">
								<div class="row">
									<div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">
										<p>${status.count}. ${question.content}</p>
										<label id="${status.index}_single_A"><input type="radio" name="${status.index}_single" value="A">
										A.&nbsp;&nbsp;${question.answerA}</label><br>
										<label id="${status.index}_single_B"><input type="radio" name="${status.index}_single" value="B">
										B.&nbsp;&nbsp;${question.answerB}</label><br>
										<label id="${status.index}_single_C"><input type="radio" name="${status.index}_single" value="C">
										C.&nbsp;&nbsp;${question.answerC}</label><br>
										<label id="${status.index}_single_D"><input type="radio" name="${status.index}_single" value="D">
										D.&nbsp;&nbsp;${question.answerD}</label><br>
										<input type="text" value="${question.answerT}" id="${status.index}_single_T" style="display: none">
										<input value="${question.questionId}" name="${status.index}_id_single" style="display: none" /> 
									</div>
									<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 show_answerT">
										<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">显示正确答案 <span class="caret"></span></button>
										<ul class="dropdown-menu answerT" role="menu">
											<li><a>${question.answerT}</a></li>
										</ul>
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
								<c:forEach var="question" items="${multipleQuestions}" varStatus="status">
								<li  class="list-group-item">
								<div class="row">
									<div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">
										<p>${status.count}. ${question.content}</p>
										<label id="${status.index}_multiple_A"><input type="checkbox" name="${status.index}_multiple" value="A">
										A.&nbsp;&nbsp;${question.answerA}</label><br>
										<label id="${status.index}_multiple_B"><input type="checkbox" name="${status.index}_multiple" value="B">
										B.&nbsp;&nbsp;${question.answerB}</label><br>
										<label id="${status.index}_multiple_C"><input type="checkbox" name="${status.index}_multiple" value="C">
										C.&nbsp;&nbsp;${question.answerC}</label><br>
										<label id="${status.index}_multiple_D"><input type="checkbox" name="${status.index}_multiple" value="D">
										D.&nbsp;&nbsp;${question.answerD}</label><br>
										<input type="text" value="${question.answerT}" id="${status.index}_multiple_T" style="display: none">
										<input value="${question.questionId}" name="${status.index}_id_multiple" style="display: none" /> 										
									</div>
									<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 show_answerT">
										<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">显示正确答案 <span class="caret"></span></button>
										<ul class="dropdown-menu answerT" role="menu">
											<li><a>${question.answerT}</a></li>
										</ul>
									</div>
								</div>	
								</li>
								</c:forEach>				
							</ol>
						</div>
					</div>
					<div class="auto-add">
						<label>
							<input type="checkbox" name="auto" value="1" />
							<input type="checkbox" name="auto" value="0" checked="checked" style="display:none"/>
							自动添加错题(选中后系统将自动把答错的所有试题添加到错题集)
							<br>
							注意：使用该功能后,提交试卷过程中可能会多花上几秒的等待时间,属于正常现象
						</label>
					</div>	
					<input type="text" value="${singleQuestions.size()}" name="singleAmount" id="singleAmount" style="display: none">
					<input type="text" value="${multipleQuestions.size()}" name="multipleAmount" id="multipleAmount" style="display: none">
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
	<script src="${basePath}/js/common/jquery.highlight.js"></script>
	<script src="${basePath}/js/common/core.min.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/common/commonFunc.js"></script>	
	<script src="${basePath}/js/system/search.js"></script>
	<script src="${basePath}/js/system/highlight_answer_green.js"></script>
	<script src="${basePath}/js/system/optimize.js"></script>
	
	<script>
		$(document).ready(function(){
	 		$(".exam-form").highlight("${keyword}");
		});
	</script>
	
</body>
</html>
