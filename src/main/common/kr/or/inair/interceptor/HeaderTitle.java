package kr.or.inair.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.inair.utiles.URIHandlerMapper;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HeaderTitle extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response, 
							 Object handler) throws Exception {
		
		String servletPath = ((HttpServletRequest) request).getServletPath();
	      
	    Map<String, String> contenTitleMap = URIHandlerMapper.getContentTitleMap();
	      
	    if(contenTitleMap.containsKey(servletPath)){
	    	String[] contentTitle = contenTitleMap.get(servletPath).split("/");
	    	request.setAttribute("contentTitle", contentTitle[0]);
	    	request.setAttribute("active", contentTitle[1]);
	    }
		return super.preHandle(request, response, handler);
	}
	
	
	
}
