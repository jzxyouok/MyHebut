<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="${basePath}/css/index.css" rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
	<div class="container-fluid header">
		<div class="row">
			<div
				class="col-md-4 col-sm-4 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
				<div class="left-header">
					<h2>Hebut政治课考试系统</h2>
					<p>众里寻他千百度，蓦然回首，那人却在灯火阑珊处</p>
				</div>
			</div>
			<div
				class="col-md-2 col-sm-2 col-xs-12 col-md-offset-1 col-sm-offset-1">
				<div class="row">
					<div
						class="col-md-12 col-sm-12 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
						<div class="login_register right-header">
							<div id="login" class="login">
								<form id="loginForm" method="post">
									<div class="form-group">
										<span class="text-left">登录</span> <span
											class="text-right change-register"> 注册账户 <i
											class="fa fa-arrow-circle-right"></i>
										</span>
									</div>
									<div class="form-group">
										<input name="userName" id="userName" type="text"
											class="form-control" placeholder="用户名" />
									</div>
									<div class="form-group">
										<input name="userPass" id="userPass" type="password"
											class="form-control" placeholder="密码" />
									</div>
									<div class="form-group">
										<button type="button"
											class="btn btn-primary btn-block loginBtn">登录</button>
									</div>
								</form>
							</div>
							<div id="register" style="display: none">
								<form id="registerForm" name="registerForm"
									class="form-horizontal" onsubmit="return false;">
									<div class="form-group">
										<span class="text-left">注册账户</span> <span
											class="text-right change-login"> 登录 <i
											class="fa fa-arrow-circle-right"></i>
										</span>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="userName"
											name="userName" placeholder="请输入登录用户名">
									</div>
									<div class="form-group">
										<input type="password" class="form-control" id="userPass"
											name="userPass" placeholder="请输入密码">
									</div>
									<div class="form-group">
										<input type="password" class="form-control"
											id="confirmUserPass" name="confirmUserPass"
											placeholder="请再输入密码进行确认">
									</div>
									<div class="form-group">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="请输入邮箱">
									</div>
									<div class="form-group">
										<button type="submit"
											class="btn btn-primary btn-block registerBtn">注册</button>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="container content">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="introduction">
					<img src="${basePath}/img/1.png" alt="" style="height: 100px">
					<h6>
						<b>刷题库</b>
					</h6>
					<p>题库来源于任课老师</p>
					<p>在线考试、随机练习任你选择</p>
				</div>
			</div>
			<div class="col-md-4  col-sm-4 col-xs-12">
				<div class="introduction">
					<img src="${basePath}/img/2.png" alt="" style="height: 100px">
					<h6>
						<b>纠错题</b>
					</h6>
					<p>将考试错题加入错题集</p>
					<p>方便对错题进行强化复习</p>
				</div>
			</div>
			<div class="col-md-4  col-sm-4 col-xs-12">
				<div class="introduction">
					<img src="${basePath}/img/3.png" alt="" style="height: 100px">
					<h6>
						<b>搜考题</b>
					</h6>
					<p>通过关键字</p>
					<p>搜索题目或答案中包含关键字的考题</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="introduction">
					<img src="${basePath}/img/4.png" alt="" style="height: 100px">
					<h6>
						<b>存记录</b>
					</h6>
					<p>每次考试系统自动帮你记录</p>
					<p>历史错题、考试得分轻松查</p>
				</div>
			</div>
			<div class="col-md-4  col-sm-4 col-xs-12">
				<div class="introduction">
					<img src="${basePath}/img/5.png" alt="" style="height: 100px">
					<h6>
						<b>查成绩</b>
					</h6>
					<p>凭学号免密码查各科成绩及学分</p>
					<p>(暂不开放)</p>
				</div>
			</div>
			<div class="col-md-4  col-sm-4 col-xs-12">
				<div class="introduction">
					<img src="${basePath}/img/6.png" alt="" style="height: 100px">
					<h6>
						<b>提建议</b>
					</h6>
					<p>为了更好的服务</p>
					<p>本站需要您宝贵的意见</p>
				</div>
			</div>
		</div>
	</div>

	<footer >
		<a href="http://www.miitbeian.gov.cn/" class="beian">浙ICP备15043822号</a>
	</footer>

	<script src="${basePath}/js/common/jquery.min.js"></script>
	<script src="${basePath}/js/common/bootstrap.min.js"></script>
	<script src="${basePath}/js/common/commonFunc.js"></script>
	<script src="${basePath}/js/common/bootstrapValidator.min.js"></script>
	<script src="${basePath}/js/common/baidu.js"></script>
	
	<script src="${basePath}/js/system/validator.js"></script>
	<script src="${basePath}/js/system/login.js"></script>
	<script src="${basePath}/js/system/register.js"></script>
	<script src="${basePath}/js/system/placeholder.js"></script>
	<script src="${basePath}/js/system/div_change.js"></script>

</body>
</html>