<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="sidebar">
				<div class="sidebar-collapse">
					<!-- Start: Sidebar Header Logo-->
					<div class="sidebar-header">
						<img src="${basePath}/img/logo.png" class="img-responsive" alt="" />
					</div>
					<!-- End: Sidebar Header Logo-->
					<!-- Start: Sidebar Menu-->
					<div class="sidebar-menu">
						<nav id="menu" class="nav-main" role="navigation">
							<ul class="nav nav-sidebar">
								<div class="panel-body text-center">
									<div class="bk-avatar">
										<a href="/setting">
												<img src="http://myhebut.oss-cn-hangzhou.aliyuncs.com/touxiang/${loginedUser.avatar}.jpg" class="img-circle bk-img-60" alt="头像" />
										</a>
									</div>
									<div class="bk-padding-top-10">
										<i class="fa fa-circle text-success"></i>
										<small>${loginedUser.nickName}</small>
									</div>
								</div>
								<div class="divider2"></div>
								<li class="active">
									<a href="/index">
										<i class="fa fa-laptop" aria-hidden="true"></i>
										<span>首页</span>
									</a>
								</li>
								<li class="nav-parent">
									<a>
										<i class="fa fa-copy" aria-hidden="true"></i>
										<span>马原考试</span>
									</a>
									<ul class="nav nav-children">
										<li>
											<a href="/exam?subject=0">
												<span class="text">在线考试</span>
											</a>
										</li>
										<li>
											<a href="/note?subject=0">
												<span class="text">错题纠错</span>
											</a>
										</li>
										<li>
											<a href="/notePractice?subject=0">
												<span class="text">错题练习</span>
											</a>
										</li>
										<li>
											<a href="/randomPratice?subject=0">
												<span class="text">随机练习</span>
											</a>
										</li>
										<li>
											<a href="/questions?subject=0">
												<span class="text">章节练习</span>
											</a>
										</li>
										<li>
											<a href="/record?subject=0">
												<span class="text">考试记录</span>
											</a>
										</li>									
									</ul>
								</li>				
								<li class="nav-parent">
									<a>
										<i class="fa fa-copy" aria-hidden="true"></i>
										<span>毛概考试(上)</span>
									</a>
									<ul class="nav nav-children">
										<li>
											<a href="/exam?subject=1">
												<span class="text">在线考试</span>
											</a>
										</li>
										<li>
											<a href="/note?subject=1">
												<span class="text">错题纠错</span>
											</a>
										</li>
										<li>
											<a href="/notePractice?subject=1">
												<span class="text">错题练习</span>
											</a>
										</li>
										<li>
											<a href="/randomPratice?subject=1">
												<span class="text">随机练习</span>
											</a>
										</li>
										<li>
											<a href="/questions?subject=1">
												<span class="text">章节练习</span>
											</a>
										</li>
										<li>
											<a href="/record?subject=1">
												<span class="text">考试记录</span>
											</a>
										</li>									
									</ul>
								</li>
								<li class="nav-parent">
									<a>
										<i class="fa fa-copy" aria-hidden="true"></i>
										<span>毛概考试(下)</span>
									</a>
									<ul class="nav nav-children">
										<li>
											<a href="/exam?subject=2">
												<span class="text">在线考试</span>
											</a>
										</li>
										<li>
											<a href="/note?subject=2">
												<span class="text">错题纠错</span>
											</a>
										</li>
										<li>
											<a href="/notePractice?subject=2">
												<span class="text">错题练习</span>
											</a>
										</li>
										<li>
											<a href="/randomPratice?subject=2">
												<span class="text">随机练习</span>
											</a>
										</li>
										<li>
											<a href="/questions?subject=2">
												<span class="text">章节练习</span>
											</a>
										</li>
										<li>
											<a href="/record?subject=2">
												<span class="text">考试记录</span>
											</a>
										</li>									
									</ul>
								</li>
								<c:set var="power" value="${loginedUser.power}" /> 
								<c:if test="${power == 1}">
									<li class="nav-parent">
										<a>
											<i class="fa fa-copy" aria-hidden="true"></i>
											<span>后台管理</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="/admin/user">
													<span class="text">用户管理</span>
												</a>
											</li>
											<li>
												<a href="/admin/billboard">
													<span class="text">公告管理</span>
												</a>
											</li>
											<li>
												<a href="/admin/message">
													<span class="text">留言管理</span>
												</a>
											</li>					
										</ul>
									</li>	
									<li>
										<a href="/scoreSearch">
											<i class="fa fa-book" aria-hidden="true"></i>
											<span>成绩查询(免密码)</span>
										</a>					
									</li>
								</c:if> 
								<li>
									<a href="/message">
										<i class="fa fa-edit" aria-hidden="true"></i>
										<span>留言与建议</span>
									</a>					
								</li>
							</ul>
						</nav>
					</div>
					<!-- End: Sidebar Menu-->
				</div>
				<!-- Start: Sidebar Footer-->
				<div class="sidebar-footer">
				 	<ul class="sidebar-terms">
						<li><a href="/index">首页</a></li>
						<li><a href="/setting">个人设置</a></li>
						<li><a href="/message">留言</a></li>
						<li><a href="http://jwc.hebut.edu.cn/">教务处</a></li>
					</ul>
					<div class="copyright text-center">
						<small><i class="fa fa-coffee"></i>admin@myhebut.com</small>
					</div>
			
				</div>
				<!-- End: Sidebar Footer-->
			</div>