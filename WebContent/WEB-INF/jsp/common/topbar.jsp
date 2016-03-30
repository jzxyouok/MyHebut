<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

			<!-- Start: Navbar Left -->
			<div class="navbar-left">
				<!-- Start: Search Form -->
				<form class="search navbar-form" action="/search" method="post"  onsubmit="return check_search()">
					<div class="input-group input-search">
						<input type="text" class="form-control" name="search" id="search" placeholder="关键字搜题...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- End: Search Form -->
			</div>
			<!-- End: Navbar Right -->
			<div class="navbar-right">
				<!-- Start: Userbox -->
				<div class="userbox">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<div class="profile-info">
							<span class="name">
								${loginedUser.nickName}
							</span>
						</div>
						<i class="fa custom-caret" style="color:#B0C1D3"></i>
					</a>
					<div class="dropdown-menu">
						<ul class="list-unstyled">
							<li class="dropdown-menu-header bk-bg-white bk-margin-top-15">
								<div class="progress progress-xs  progress-striped active">
									<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">100%</div>
								</div>
							</li>
							<li>
								<a href="/setting">
									<i class="fa fa-user"></i>
									个人设置
								</a>
							</li>
							<li>
								<a href="/logout">
									<i class="fa fa-power-off"></i>
									注销
								</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- End: Userbox -->
			</div>
			<!-- End: Navbar Right -->
