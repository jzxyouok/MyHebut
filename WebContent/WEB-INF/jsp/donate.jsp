<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body class="no-trans fixed-header-on">
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<header
		class="header fixed clearfix navbar navbar-fixed-top  other-header"
		style="position: relative;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-xs-7">
					<div class="header-left clearfix">
						<div class="logo smooth-scroll">
							<a href="#banner"> <img id="logo"
								src="${basePath}/img/logo-H.png" alt="Worthy"></a>
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
										<button type="button" class="navbar-toggle"
											data-toggle="collapse" data-target="#navbar-collapse-1">
											<span class="sr-only">Toggle navigation</span> <span
												class="icon-bar"></span> <span class="icon-bar"></span> <span
												class="icon-bar"></span>
										</button>
									</div>

									<div class="collapse navbar-collapse scrollspy smooth-scroll"
										id="navbar-collapse-1">
										<ul class="nav navbar-nav navbar-right">
											<li><a href="/">首页</a></li>
											<li><a href="download">源码下载</a></li>
											<li class="active"><a href="donate">打赏</a></li>
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
	<div class="container">
		<div style="text-align: center;">
			<h2>
				<span>非常感谢</span> 您对悦河工的支持
			</h2>
			<h4 style="line-height: 22px; font-weight: 500">
				大家共同学习，共同进步， <span>期待您与悦河工一起变得更好</span>
			</h4>
		</div>
		<div style="padding: 20px 0; text-align: center;">
			<h4>
				支付宝扫码打赏（ <span style="font-size: 40px;">任意金额</span> ）
			</h4>
			<img src="${basePath}/img/zhifubao.png" style="margin: auto">
			<h4>也可以向我的手机支付宝:18222969123&nbsp;&nbsp;&nbsp;直接进行打赏</h4>
			<h6>需要留言的可以直接写在转账的备注里(打赏名单中须匿名的同学请在留言中注明)~</h6>
		</div>
		<div class="panel panel-primary table-responsive">
			<div class="panel-heading">打赏人员名单：</div>
			<div class="panel-body">
				<p>多谢大家支持，下表按时间排列。</p>
			</div>
			<table class="table table-hover table-responsive"
				style="font-size: 13px;">
				<thead>
					<tr>
						<th>姓名</th>
						<th>金额</th>
						<th>留言</th>
						<th>时间</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="donate" items="${donates}" varStatus="status">
						<tr>
							<td style="color: green;">${donate.donateName}</td>
							<td>${donate.donateMoney}</td>
							<td>${donate.donateMessage}</td>
							<td>${donate.donateTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;悦河工在线考试系统和Android版是我独自开发的项目,没有专门的团队,更没有学校经费。
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;悦河工一直在努力做得更好，但网站每天的运作都会产生一定的开销，如果您对悦河工表示认同或对您有所帮助。请打赏作者来支持悦河工的持续开发。
			</p>

			<p>&nbsp;&nbsp;&nbsp;&nbsp; 打赏说明：</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp; 本站打赏活动皆属自愿，谢谢支持。（悦河工QQ交流群：461286050）
			</p>
		</div>
	</div>

	<footer style="margin: 30px 0 0 0">
		<a href="http://www.miitbeian.gov.cn/" class="beian">浙ICP备15043822号</a>
	</footer>

	<script src="${basePath}/js/common/jquery.min.js"></script>
	<script src="${basePath}/js/common/bootstrap.min.js"></script>
	<script src="${basePath}/js/common/jquery.appear.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>

	<script src="${basePath}/js/system/modernizr.js"></script>

</body>
</html>