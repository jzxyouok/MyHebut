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

<title>Hebut在线考试系统</title>

<link href="${basePath}/img/favicon.ico" rel="shortcut icon">

<link href="${basePath}/css/font.css" rel="stylesheet" />
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${basePath}/css/font-awesome.min.css" rel="stylesheet" />
<link href="${basePath}/css/bootkit.css" rel="stylesheet" />
<link href="${basePath}/css/jquery.mmenu.css" rel="stylesheet" />
<link href="${basePath}/css/style.css" rel="stylesheet" />
<link href="${basePath}/css/add-ons.min.css" rel="stylesheet" />
<link href="${basePath}/css/billboard.css" rel="stylesheet" />

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
							<li class="active"><i class="fa fa-laptop"></i> 首页</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>首页</h2>
					</div>
				</div>
				<!-- End: Page Header -->
				<!-- Start: Main Content -->
				<div class="main_page">
					<div class="bdsharebuttonbox">
						<a href="#" class="bds_more" data-cmd="more">你的分享宣传是我开发最大的动力：</a><a
							href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a
							href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a
							href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a
							href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友">QQ好友</a>
					</div>
					<table class="table table-hover">
						<caption>公告</caption>
						<thead>
							<tr>
								<th>公告标题</th>
								<th>公告发布时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boards}" varStatus="status">
								<tr>
									<th><a
										onclick="javascript:window.location='/detail?boardId=${board.boardId}'">${board.title}</a></th>
									<th>${board.create_time}</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>

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
	<script src="${basePath}/js/common/share.js"></script>

	<script src="${basePath}/js/system/optimize.js"></script>
	<script src="${basePath}/js/system/search.js"></script>

</body>
</html>
