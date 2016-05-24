package com.hebut.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.hebut.entity.User;

public class PowerFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		// 需要权限过滤的url
		String[] Filter = new String[] {"/admin" };

		// 请求的uri
		String uri = request.getRequestURI();
		// 是否过滤
		boolean doFilter = false;
		for (String s : Filter) {
			if (uri.indexOf(s) != -1) {
				// 如果uri中包含过滤的uri，则进行过滤
				doFilter = true;
				break;
			}
		}
		if (doFilter) {
			// 执行过滤
			// 从session中获取登录者实体
			User loginedUser = (User) request.getSession().getAttribute("loginedUser");
			// 获取用户权限
			int power = loginedUser.getPower();
			if (power == 0) {
				// 如果session中不存在登录者实体，则弹出框提示重新登录
				// 设置request和response的字符集，防止乱码
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
				String loginPage = "/index";
				StringBuilder builder = new StringBuilder();
				builder.append("<script type=\"text/javascript\">");
				builder.append("alert('对不起,您的用户权限不够');");
				builder.append("window.top.location.href='");
				builder.append(loginPage);
				builder.append("';");
				builder.append("</script>");
				writer.print(builder.toString());
			} else {
				filterChain.doFilter(request, response);
			}
		} else {
			filterChain.doFilter(request, response);
		}
	}
}
