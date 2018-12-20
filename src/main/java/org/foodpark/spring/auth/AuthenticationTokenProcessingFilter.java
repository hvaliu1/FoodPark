package org.foodpark.spring.auth;


import org.foodpark.spring.model.Authentication;
import org.foodpark.spring.service.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet
public class AuthenticationTokenProcessingFilter extends GenericFilterBean {

	@Autowired
	private AuthenticationService authService;
	
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {


        final HttpServletResponse httpResponse = (HttpServletResponse) response;
        final HttpServletRequest httpRequest = (HttpServletRequest) request;


        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new GrantedAuthorityImpl("ROLE_ADMIN"));
        String authToken = httpRequest.getHeader("Authorization");
        String method = httpRequest.getMethod();


        if (authToken != null/* && "bearer".equalsIgnoreCase(authToken.split(" ", 2)[0].toString())*/) {
            //authToken = authToken.substring(7);
            Authentication authentication = authService.validateToken(authToken);

            if (authentication != null ) {
                        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
                        chain.doFilter(request, response);
                    } else {

                        httpResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized: Authentication token is not valid.");
                    }


        }  else if (httpRequest.getServletPath().contains("/auth/save")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        }else if (httpRequest.getServletPath().contains(".jsp")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        } else if (httpRequest.getServletPath().contains(".html")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        } else if (httpRequest.getServletPath().contains("swagger-resources")||httpRequest.getServletPath().contains("v2/api-docs")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        } else if (httpRequest.getServletPath().contains(".js")||httpRequest.getServletPath().contains(".css")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        } else if (httpRequest.getServletPath().contains(".png")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        } else if (httpRequest.getServletPath().contains("woff2") || httpRequest.getServletPath().contains("woff") || httpRequest.getServletPath().contains("ttf")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        } else if (method.equalsIgnoreCase("OPTIONS")) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("user", "password", authorities));
            chain.doFilter(request, response);
        } else {
            httpResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized: Authentication token not found.");
        }
    }

}