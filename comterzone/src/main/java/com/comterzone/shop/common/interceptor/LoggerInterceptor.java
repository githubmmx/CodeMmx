package com.comterzone.shop.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//public class LoggerInterceptor implements HandlerInterceptor{
public class LoggerInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private Logger logger;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("====== interceptor 시작 =====");
		logger.debug(request.getRequestURI());
		
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("===== 메소드 종료 후 실행 ======");
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	
	
	
	
	
	
	/*
	 * @Override public boolean preHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler) throws Exception { // TODO
	 * Auto-generated method stub return HandlerInterceptor.super.preHandle(request,
	 * response, handler); }
	 * 
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { // TODO Auto-generated method stub
	 * HandlerInterceptor.super.postHandle(request, response, handler,
	 * modelAndView); }
	 * 
	 * @Override public void afterCompletion(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, Exception ex) throws Exception
	 * { // TODO Auto-generated method stub
	 * HandlerInterceptor.super.afterCompletion(request, response, handler, ex); }
	 */
	
}
