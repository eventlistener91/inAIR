package kr.or.ddit.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest 	sRequest 	= (HttpServletRequest)request;
		HttpServletResponse	sResponse 	= (HttpServletResponse)response;
		HttpSession 		session 	= sRequest.getSession();
		
		String requestURI = sRequest.getRequestURI();
		
		if(requestURI.contains("/login")){
			chain.doFilter(request, response);
			return;
		}
		if(requestURI.contains("/mainView")){
			chain.doFilter(request, response);
			return;
		}
		if(requestURI.contains("Home")){
			chain.doFilter(request, response);
			return;
		}
		
		if(requestURI.contains("/admin")){
			if(requestURI.contains("join") || requestURI.contains("main")){
				chain.doFilter(request, response);
				return;
			}

			
			if(session.getAttribute("LOGIN_ADMININFO") != null) {
				chain.doFilter(request, response);
				return;
			} else {
				sResponse.sendRedirect("/admin/main.do?message=" + URLEncoder.encode("로그인 후 이용 가능합니다.", "UTF-8"));
			}
		} else {
			if(session.getAttribute("LOGIN_MEMBERINFO") != null) {
				chain.doFilter(request, response);
				return;
			}
			
			if(!requestURI.contains("View") && !requestURI.contains("Form")){
				chain.doFilter(request, response);
				return;
			}
			
			   
			
			session.setAttribute("message", "로그인 후 이용 가능합니다.");
			String returnURL = sRequest.getServletPath().replace("Form", "List");
			returnURL = returnURL.replace("View", "List");
			returnURL = returnURL.replace("member", "freeboard");
			sResponse.sendRedirect(returnURL + "?message=" + URLEncoder.encode("로그인 후 이용 가능합니다.", "UTF-8"));
		}
		return;
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("Login Filter Started");
	}
}
