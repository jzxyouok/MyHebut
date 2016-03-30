package com.hebut.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PathFilter implements Filter {

	private FilterConfig config;

	private static final String basePath = "basePath";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.config = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		// 所有jsp页面引用的js、css均从这里提供根路径，页面只需以jstl取值即可"${basePath}"
		request.setAttribute("basePath", config.getInitParameter(basePath));
		filterChain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}

}
