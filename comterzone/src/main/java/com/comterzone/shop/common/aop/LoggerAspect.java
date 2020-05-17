package com.comterzone.shop.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;



public class LoggerAspect {

	@Autowired
	private Logger logger;
	
	//xml방식으로 구현하기!
	
	/* 공통실행 메소드 */
	//패턴에서 지정한 매소드가 실행전에 실행해야하는 메소드 구현
	public void before(JoinPoint joinpoint) {
		logger.debug("===== 메소드 실행전 =====");
		Signature sig=joinpoint.getSignature();
		String className=sig.getDeclaringTypeName();
		String methodName=sig.getName();
		logger.debug(className+methodName+"()");
		logger.debug("====== aop 종료 =====");
	}
	
	//around매소드 구현하기
	public Object loggerAdvice(ProceedingJoinPoint joinpoint) throws Throwable {
//		logger.debug("===== 메소드 실행전 =====");
		Signature sig=joinpoint.getSignature();
		String className=sig.getDeclaringTypeName();
		String methodName=sig.getName();
		logger.debug(className+methodName+"()");
		
		return joinpoint.proceed();//전/후 구분하는 지점!
//		
//		logger.debug("====== 실행 후 =====");
//		logger.debug(className+methodName+"()");
//		logger.debug("====== aop 종료 =====");
//		
		//return obj;
	}
	
	
}








