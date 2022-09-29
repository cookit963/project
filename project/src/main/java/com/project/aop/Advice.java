package com.project.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

// 공통기능 구현해놓을 클래스 
//@Component  // @Controller @Service
@Log4j
public class Advice {

	public void before() {
		log.info("==================== before advice ======== ");
		log.info("==================== before advice ======== ");
		log.info("==================== before advice ======== ");
	}
	
	public void afterAop() {
		log.info("==================== afterAop advice ======== ");
		log.info("==================== afterAop advice ======== ");
	}
	
	public void afterReturning(Throwable th) {
		log.info("==================== afterReturning advice ======== ");
		log.info("==================== afterReturning advice ======== ");
	}
	
	public void afterThrowing() {
		log.info("==================== afterThrowing advice ======== ");
		log.info("==================== afterThrowing advice ======== ");
	}
	
	/*
	 around advice 메서드 구현방법 
	 첫번째 매개변수 ProceedingJoinPoint j 지정 
	 리턴타입 Object 타입으로, 가던길가라(타겟으로~) j.proceed() 호출하여 
	 리턴받은값을 리턴해주는 형태로 작성 해야함. 
	*/
	public Object around(ProceedingJoinPoint j) throws Throwable {
		log.info("==================== around before 발생!!!! ======== ");
		
		Object obj = j.proceed();  // 가던길 가라~~~ 
		
		log.info("==================== around after 발생!!!! ======== ");
		return obj;
	}
	
	
	
	
	
}
