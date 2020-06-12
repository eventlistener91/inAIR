package kr.or.inair.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;

@Controller("logPrintAspectClazz")
public class LogPrintAspectClazz {
	@Loggable
	private static Logger logger;
	
	// advice : 시점
	// joinpoint 호출 전에 aspect(로그 출력 코드) weaving
	public void theWholeJoinpointCallBefore(JoinPoint joinpoint){
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 
		// 패키지.빈클래스명 반환 
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 호출되었습니다.", 
					 className, joinpointName);
	}
	
	// joinpoint 종료 후에 aspect(로그 출력 코드) weaving
	public void theWholeJoinpointCallAfter(JoinPoint joinpoint){
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 
		// 패키지.빈클래스명 반환 
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 종료되었습니디.", 
				className, joinpointName);
	}

	// joinpoint 익셉션 발생(메서드 종료) 이후에 aspect(로그 출력 코드) weaving
	public void theWholeJoinpointCallThrowing(JoinPoint joinpoint, Exception ex){
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 
		// 패키지.빈클래스명 반환 
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 호출 후 {} 익셉션이 발생되었습니다.", 
				className, joinpointName, ex.getMessage());
	}
	
	// joinpoint 호줄 전/종료 후에 aspect(로그 출력 코드) weaving
	public Object theWholeJoinpointCallAround(ProceedingJoinPoint joinpoint) throws Throwable{
		// aspect가 weaving될 대상 joinpoint(메서드)를 포함하는 빈 클래스의 
		// 패키지.빈클래스명 반환 
		String className = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		logger.debug("target bean class : {} | joinpoint : {}가 호출 되고......", 
				className, joinpointName);
		
		//경계필요
		//상단은 해당 joinpoint 호출전에 weaving되는 aspect 구성
		//해당 joinpoint(메서드) return 값
		Object returnValue = joinpoint.proceed();
		//하단은 해당 joinpoint 호출전에 weaving되는 aspect 구성 
		
		logger.debug("target bean class : {} | joinpoint : {}가 종료되었습니다.", 
				className, joinpointName);
	
		return returnValue;
	}
}
