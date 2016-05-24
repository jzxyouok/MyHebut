<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>悦河工</title>

<link href="${basePath}/img/favicon.ico" rel="shortcut icon">

<link href="${basePath}/css/font.css" rel="stylesheet" />
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${basePath}/css/font-awesome.min.css" rel="stylesheet" />
<link href="${basePath}/css/animations.css" rel="stylesheet" />
<link href="${basePath}/css/myhebut.css" rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body class="no-trans">
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"> <i class="icon-up-open-big"></i>
		</div>

		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-xs-7">
						<div class="header-left clearfix">
							<div class="logo smooth-scroll">
								<a href="#banner">
									<img id="logo" src="${basePath}/img/logo.png" alt="Worthy"></a>
							</div>

							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name">悦河工</div>
								<div class="site-slogan">&nbsp;Just Be Yourself</div>
							</div>

						</div>
					</div>
					<div class="col-md-8 col-xs-5">
						<div class="header-right clearfix">
							<div class="main-navigation animated">
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>
										</div>

										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li class="active">
													<a href="/">首页</a>
												</li>
												<li>
													<a href="download">源码下载</a>
												</li>
												<li>
													<a href="donate">捐赠</a>
												</li>
											</ul>
										</div>

									</div>
								</nav>
							</div>
						</div>

					</div>
				</div>
			</div>
		</header>

		<div id="banner" class="banner">
			<div class="banner-caption" >
				<div class="container object-non-visible" data-animation-effect="fadeIn">
					<div class="row">

						<div class="col-lg-4 col-lg-offset-1 col-md-5 col-md-offset-1 banner-phone">
							<img src="${basePath}/img/phone-find-index.png"></div>
						<div class="col-lg-6 col-md-6 banner-right">
							<p class="banner-title">
								<img src="${basePath}/img/title.png"/>
								<div class="divider"></div>
							</p>
							<p class="banner-content">
								<img src="${basePath}/img/content.png"/>
								<div class="divider"></div>
							</p>
							<div class="advertise">
								<div class="row" >
									<div class="col-sm-6 col-xs-12 xs-center">
										<a class="myhebut-btn"> <i class="fa fa-android fa-lg"></i>
											&nbsp;&nbsp;Android版下载
										</a>
									</div>
									<div class="col-sm-6 col-xs-12 xs-center xs-hide">
										<p>
											<a class="myhebut-btn" id="show-code" href="javascript:;" rel="${basePath}/img/code.png">
												<i class="fa fa-qrcode fa-lg"></i>
												&nbsp;&nbsp;扫码下载
											</a>

										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 xs-center">
										<a class="myhebut-btn" id="enter-exam">
											<i class="fa fa-hand-o-right fa-lg"></i>
											&nbsp;&nbsp;进入在线考试系统
										</a>
									</div>
									<input id="loginedUser" value="${loginedUser}" style="display:none"/>
								</div>
							</div>

						</div>
						<div class="col-lg-2 col-md-3 col-md-offset-0 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3 login_register">
							<div id="login" class="login" >
								<form id="loginForm" method="post">
									<div class="form-group">
										<span class="text-left">登录</span>
										<span class="text-right change-register">
											注册账户
											<i class="fa fa-arrow-circle-right"></i>
										</span>
									</div>
									<div class="form-group">
										<input name="userName" id="userName" type="text"
									class="form-control" placeholder="用户名"/>
									</div>
									<div class="form-group">
										<input name="userPass" id="userPass" type="password"
									class="form-control" placeholder="密码"/>
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-primary btn-block loginBtn">登录</button>
									</div>
								</form>
							</div>
							<div id="register" style="display:none">
								<form id="registerForm" name="registerForm" class="form-horizontal" onsubmit="return false;">
									<div class="form-group">
										<span class="text-left">注册账户</span>
										<span class="text-right change-login">
											登录
											<i class="fa fa-arrow-circle-right"></i>
										</span>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入登录用户名"></div>
									<div class="form-group">
										<input type="password" class="form-control" id="userPass" name="userPass" placeholder="请输入密码"></div>
									<div class="form-group">
										<input type="password" class="form-control" id="confirmUserPass" name="confirmUserPass" placeholder="请再输入密码进行确认"></div>
									<div class="form-group">
										<input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱"></div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary btn-block registerBtn">注册</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="section clearfix object-non-visible" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row content-group">
					<div class="col-md-6 explain">
						<h2>考试内容全覆盖</h2>
						<p>马原毛概，随机章节模拟测试，给你一个定制的考试宝典！</p>
						<p>还有排行榜，你，是学霸吗?</p>
					</div>
					<div class="col-md-6 img-box">
						<img src="${basePath}/img/phone-exam.png" alt=""></div>
				</div>
			</div>
		</div>

		<div class="section clearfix object-non-visible gray-background" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row content-group img-left">
					<div class="col-md-6 explain">
						<h2>热门服务全聚合</h2>
						<p>想查成绩，查公交，还是想点歌，不再东翻西找</p>
						<p>拒绝繁琐！一个app,你想要的，它都有。</p>
					</div>
					<div class="col-md-6 img-box">
						<img src="${basePath}/img/phone-index.png" alt=""></div>
				</div>
			</div>
		</div>

		<div class="section clearfix object-non-visible" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row content-group">
					<div class="col-md-6 explain">
						<h2>校内资讯全网通</h2>
						<p>教务处通知失物招领贴吧交流一网打尽，你永远是最先知道的！</p>
						<p>它，就是你的小灵通。</p>
					</div>
					<div class="col-md-6 img-box">
						<img src="${basePath}/img/phone-find.png" alt=""></div>
				</div>
			</div>
		</div>
		<footer>
			<a href="http://www.miitbeian.gov.cn/" target="_blank">浙ICP备15043822号</a>
		</footer>

	<script src="${basePath}/js/common/jquery.min.js"></script>
	<script src="${basePath}/js/common/bootstrap.min.js"></script>
	<script src="${basePath}/js/common/commonFunc.js"></script>
	<script src="${basePath}/js/common/bootstrapValidator.min.js"></script>
	<script src="${basePath}/js/common/jquery-powerFloat.js"></script>
	<script src="${basePath}/js/common/jquery.appear.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>

	<script src="${basePath}/js/system/validator.js"></script>
	<script src="${basePath}/js/system/login.js"></script>
	<script src="${basePath}/js/system/register.js"></script>
	<script src="${basePath}/js/system/placeholder.js"></script>
	<script src="${basePath}/js/system/modernizr.js"></script>
	<script src="${basePath}/js/system/template.js"></script>

</body>
</html>