package kr.or.inair.global.exception;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.inair.aop.Loggable;

import org.slf4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class CustomExceptionResolver extends SimpleMappingExceptionResolver {
	@Loggable
	private Logger logger;

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
										 HttpServletResponse response, 
										 Object handler, 
										 Exception ex) {
		//클라이언트가 서버 요청시 해당 요청 처리를 위한 경량화된 스레드가 생성 및 활용 
		String currentThread = Thread.currentThread().getName();
		
		//전송방식 GET|POST
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		String exceptionOccuredBeanClazz = handlerMethod.getBean().getClass().getName();
		String exceptionOccuredMethod = handlerMethod.getMethod().getName();
		
		int lineNum = ex.getStackTrace()[0].getLineNumber(); // getStackTrace() 익센셥 정보를 배열로 반환한다. 
		String exceptionClazz = ex.getClass().getName();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		
		logger.error("에러발생 : {} | 클래스 : {} | 메서드 : {} | 익셉션 : {} | 라인번호 : {} | 일시 : {}",
					  currentThread,
					  exceptionOccuredBeanClazz,
					  exceptionOccuredMethod,
					  exceptionClazz,
					  lineNum,
					  dateFormat.format(new Date()));
		
		return super.resolveException(request, response, handler, ex);
	}
	
	
}
