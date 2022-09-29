package com.project.aop;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component		// 스프링 빈으로 등록되기 위한 어노테이션 
@Aspect			// 해당 클래스가 Aspect를 구현한 것임을 나타냄 (aop 관련 클래스)
@Log4j
public class AnnoAdvice {
	/*
	@Pointcut("execution(* test*(..))")
	private void testPC() {}
	
	@Before("testPC()")
	public void before() {
		// 공통기능 구현 코드....
	}
	
	@Before("execution(* test*(..))")
	public void before() {
		// 공통기능 구현 코드....
	}*/
	
	@Around("execution(* com.board.service.TestService*.*(..))")
	public Object around(ProceedingJoinPoint j) throws Throwable {
		// Before
		log.info("********** BEFORE AROUND ***********");
		//log.info(Arrays.toString(j.getArgs()));
		
		Object[] args = j.getArgs(); 
		for(Object o : args) {
			if(o instanceof HttpServletRequest) {
				log.info("******** request 있네!!!!!!!!!");
				HttpServletRequest request = (HttpServletRequest)o; 
				request.getSession();
			}
		}
		
		Object obj = j.proceed();
		// After
		log.info("********** AFTER AROUND ***********");
		
		return obj; 
	}
	
	/*
	@AfterThrowing(pointcut="execution(* com.board.service.TestService*.*(..))", throwing="e")
	public void aftTh(Throwable e) { // 예외 발생 객체 
		log.info(e.getMessage());
	}*/
	
	
	
}
