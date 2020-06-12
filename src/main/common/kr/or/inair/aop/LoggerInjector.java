package kr.or.inair.aop;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.ReflectionUtils.FieldCallback;

/*
 	스프링 프레임웍이 설정파일에 선언된 빈 또는 어노테이션 선언으로 빈으로 등록되는 모든 빈들을 
 	BeanPostProcessor를 구현한 DefaultBeanPostProcessor가 빈등록 작업 수행.
 	빈 등록시 작업 : DefaultBeanPostProcessor와 
 				LoggerInjector이 빈 등록 작업 동시 수행 
*/
@Component
public class LoggerInjector implements BeanPostProcessor {

	@Override
	public Object postProcessBeforeInitialization(final Object currentRegistBean, String currentRegistBeanName)
			throws BeansException {
		
		//1.postProcessBeforeInitialization() : 빈 등록시 마다 콜백
		//2.ReflectionUtils.doWithFields() : 해당 빈으로 등록되는 빈 클래스내 전역변수의 갯수만큼 콜백 
		//3.doWith(Field arg0) : 전역변수 주입 
		ReflectionUtils.doWithFields(currentRegistBean.getClass(), new FieldCallback() {
			
			@Override
			public void doWith(Field field) throws IllegalArgumentException,
					IllegalAccessException {
				//public 전역 변수  또는 private 전역변수 => public 번환 
				ReflectionUtils.makeAccessible(field);
				
				//전역변수 상단에 @Loggable 선언 여부 
				if(field.getAnnotation(Loggable.class) != null){// 선언되어있는거 다 가져올거면 getAnnotations()
					Logger logger = LoggerFactory.getLogger(currentRegistBean.getClass());
					field.set(currentRegistBean, logger); //logger : 실제 주입되어야하는 값 
				}
			}
				
		});
		
		// 빈등록 대상 선언된(xml 설정 파일 내 빈 또는 어노테이션이 선언 빈 등록 대상 클래스) 빈의 빈 등록 전 콜백 
		
		// 비지니스 로직 => 빈으로 등록 되는 전체 빈 클래스에 공통 수행되어야하는 코드 
		
		// return null; 빈등록 작업 정시 
		// return 빈 등록 대상 빈 클래스; 빈 등록 정상 처리 
		return currentRegistBean;
	}
	
	@Override
	public Object postProcessAfterInitialization(Object registedBean, String registedBeanName)
			throws BeansException {
		// 빈등록 대상 선언된(xml 설정 파일 내 빈 또는 어노테이션이 선언 빈 등록 대상 클래스) 빈의 빈 등록 후 콜백 
		
		// 비지니스 로직 => 빈으로 등록 되는 전체 빈 클래스에 공통 수행되어야하는 코드 
		
		// return null; 빈등록 작업 정시 
		// return 빈 등록 대상 빈 클래스; 빈 등록 정상 처리 
		return registedBean;
	}


}
