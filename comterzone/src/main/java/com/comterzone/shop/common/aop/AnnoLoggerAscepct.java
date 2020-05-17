package com.comterzone.shop.common.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.comterzone.shop.common.MyException;
import com.comterzone.shop.member.model.vo.Member;

//어노테이션 방식으로 AOP적용하기
@Component
@Aspect
public class AnnoLoggerAscepct {
	@Autowired
	private Logger logger;
	
	@Pointcut("execution(* com.comterzone.shop.member..*(..))")
	public void aopTest() {}
	
	@Around("aopTest()")
	public Object testAround(ProceedingJoinPoint join) throws Throwable {
		logger.debug("[before]");
		logger.debug("매개변수 확인");
		Object[] params=join.getArgs();
		for(Object o : params) {
			logger.debug("param : "+o);
		}
		Object obj=join.proceed();
		logger.debug("[after]");
		
		return obj;
	}
	
	//insert실행시 걸리는 시간 측정하기
	@Around("execution(* com.comterzone.shop..*Controller.insert*(..))")
	public Object chekcTime(ProceedingJoinPoint join){
		//로그인한 계정불러오기
		HttpSession session=(HttpSession)RequestContextHolder.currentRequestAttributes()
		.resolveReference(RequestAttributes.REFERENCE_SESSION);
		Member login=(Member)session.getAttribute("loginMember");
		if(login!=null&&!login.getUserId().equals("admin")) {
			throw new MyException("관리자가 아닙니다!");
		}
		
		StopWatch stop=new StopWatch();
		stop.start();
		
		Object obj=null;
		
		try {
			obj=join.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		stop.stop();
		logger.debug(join.getSignature().getName()+" -> 소요시간 : "+stop.getTotalTimeMillis()+"(ms)초" );
		return obj;
	}
	
}






