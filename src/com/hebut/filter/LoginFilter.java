package com.hebut.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.hebut.entity.User;

public class LoginFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		// 如果session中不存在登录者实体，则弹出框提示重新登录
		// 设置request和response的字符集，防止乱码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// 不过滤的uri
		String[] notFilter = new String[] { "/img", "/js", "/css", "/loginCheck", "/fonts", "/register", "/logout", "/addUser", "/download", "/donate"};

		// 请求的uri
		String uri = request.getRequestURI();
		// 是否过滤
		boolean doFilter = true;
		for (String s : notFilter) {
			if (uri.indexOf(s) != -1) {
				// 如果uri中包含不过滤的uri，则不进行过滤
				doFilter = false;
				break;
			}
		}
		if (doFilter) {
			// 执行过滤
			// 从session中获取登录者实体
			User loginedUser = (User) request.getSession().getAttribute("loginedUser");
			if (loginedUser == null && !uri.equals("/")) {
				PrintWriter writer = response.getWriter();
				String loginPage = "/";
				StringBuilder builder = new StringBuilder();
				builder.append("<script type=\"text/javascript\">");
				builder.append("alert('请登录！');");
				builder.append("window.top.location.href='");
				builder.append(loginPage);
				builder.append("';");
				builder.append("</script>");
				writer.print(builder.toString());
			} else if (loginedUser != null && uri.equals("/")) {
				// 如果session中存在登录者实体，当访问登录页面的时候自动跳转到考试系统
				request.setAttribute("loginedUser", loginedUser);
//				PrintWriter writer = response.getWriter();
//				StringBuilder builder = new StringBuilder();
//				builder.append("<script type=\"text/javascript\">");
//				builder.append("window.top.location.href='");
//				builder.append("/index");
//				builder.append("';");
//				builder.append("</script>");
//				writer.print(builder.toString());
				
				// 将请求转发给过滤器链上的下一个对象,如果下一个filter不存在,那么跳转到请求的资源
				filterChain.doFilter(request, response);
			} else if (loginedUser == null && uri.equals("/")) {
				filterChain.doFilter(request, response);
			} else if (loginedUser != null && !uri.equals("/")) {
				request.setAttribute("loginedUser", loginedUser);
				filterChain.doFilter(request, response);
			}
		} else {
			// 如果不执行过滤，则继续
			filterChain.doFilter(request, response);
		}

	}

}
