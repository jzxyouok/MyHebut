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
	单选题随机练习
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
							<li><a href="#"><i class="fa fa-file-text"></i>随机练习</a></li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>${section}</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->	
				<div class="main_page">
					<div class="bdsharebuttonbox">
						<a href="#" class="bds_more" data-cmd="more">你的分享宣传是我开发最大的动力：</a><a
							href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a
							href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a
							href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a
							href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
					</div>
					<div class="panel">
						<div class="panel-heading bk-bg-primary">
							<h6>
								<i class="fa fa-indent red"></i>
								Time and tide wait for no man.
							</h6>
						</div>
						<div class="panel-body">
							<form class="form-horizontal exam-form" id="randomForm">
			
								<ol class="list-group">
									<c:forEach var="question" items="${questions}"
										varStatus="status">
										<li class="list-group-item" id="${status.index}_question" style="display: none">
											<p>${question.content}</p> 
												<label><input type="radio" name="${status.index}_answer" value="A">
													A.&nbsp;&nbsp;${question.answerA}</label>
													<i class="fa fa-times" aria-hidden="true" style="color:red;display: none"></i>
													<i class="fa fa-check" aria-hidden="true" style="color:green;display: none"></i>
												<br><br>
												<label><input type="radio" name="${status.index}_answer" value="B">
													B.&nbsp;&nbsp;${question.answerB}</label>
													<i class="fa fa-times" aria-hidden="true" style="color:red;display: none"></i>
													<i class="fa fa-check" aria-hidden="true" style="color:green;display: none"></i>
												<br><br>
												<label><input type="radio" name="${status.index}_answer" value="C">
													C.&nbsp;&nbsp;${question.answerC}</label>
													<i class="fa fa-times" aria-hidden="true" style="color:red;display: none"></i>
													<i class="fa fa-check" aria-hidden="true" style="color:green;display: none"></i>
												<br><br>
												<label><input type="radio" name="${status.index}_answer" value="D">
													D.&nbsp;&nbsp;${question.answerD}</label>
													<i class="fa fa-times" aria-hidden="true" style="color:red;display: none"></i>
													<i class="fa fa-check" aria-hidden="true" style="color:green;display: none"></i>
												<br><br>
											
												<input value="${question.answerT}" id="${status.index}_answerT" style="display: none" />
												<input value="${question.questionId}" id="${status.index}_id" style="display: none" />
										</li>
									</c:forEach>
									<li class="list-group-item" id="info" style="display: none">
											<p>题目一轮全部刷完啦</p> 							
									</li>
								</ol>
							</form>
							<div class="row">
								<div class="col-sm-2 col-sm-offset-0 col-xs-3 col-xs-offset-0 random-button" >
									<button type="button" class="confirm btn btn-sm btn-primary">确定</button>
								</div>

								<div class="col-sm-2 col-sm-offset-0 col-xs-3 col-xs-offset-0 random-button" >
									<button type="button" class="next btn btn-sm btn-primary">下一题</button>
								</div>
					
								<div class="col-sm-2 col-sm-offset-0 col-xs-6 col-xs-offset-0 random-button" >
									<form style="margin-top: -11px;">
										<input type="text" name="questionId" id="questionId" style="display:none"/>
										<input type="text" name="answerF" id="answerF" style="display:none"/>
										<button class="btn btn-sm btn-primary add_wrongQuestion" type="button">
											<i class="fa fa-star"></i>
											添加到错题集
										</button>
									</form>
								</div>
							</div>
							<input value="${questionsAmount}" id="questionAmount" style="display: none" />
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
	<script src="${basePath}/js/common/bootstrapValidator.min.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>
	<script src="${basePath}/js/common/share.js"></script>

	<script src="${basePath}/js/common/commonFunc.js"></script>	
	<script src="${basePath}/js/system/optimize.js"></script>
	<script src="${basePath}/js/system/search.js"></script>
	<script src="${basePath}/js/system/random_single_questions.js"></script>
	
</body>
</html>
