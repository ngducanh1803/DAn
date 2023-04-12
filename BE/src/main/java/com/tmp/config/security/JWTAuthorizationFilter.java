package com.tmp.config.security;

import com.tmp.service.impl.JWTTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class JWTAuthorizationFilter extends GenericFilterBean {

	@Autowired
	private JWTTokenService jwtTokenService;

	@Override
	public void doFilter(
			ServletRequest servletRequest, 
			ServletResponse servletResponse, 
			FilterChain filterChain) throws IOException, ServletException {
	
		Authentication authentication = jwtTokenService.parseTokenToUserInformation((HttpServletRequest) servletRequest);
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		filterChain.doFilter(servletRequest, servletResponse);
	}
}

