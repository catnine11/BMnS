package com.gd.bmss.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gd.bmss.SpringUtils;

import lombok.extern.slf4j.Slf4j;
/*
 * Admin Session확인
 */
@Slf4j
public class AdminCheckInterceptor implements AsyncHandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("@@@@@@@@@@@@@@@@@인터셉터 시작, Admin Session 확인 존재 true / 없으면 false logout.do 호출@@@@@@@@@@@@@@@@@");
		if(request.getSession().getAttribute("loginVo") != "A" || request.getSession().getAttribute("loginVo") == null) {
			log.info("@@@@@@@@@@@@@@@@관리자만 접속가능합니다. @@@@@@@@@@@@@@@@@@@");
			SpringUtils.servletAlert(response, "접근이 제한된 페이지 입니다.", "logout.do");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("@@@@@@@@@@@@인터셉터 종료@@@@@@@@@@@@");
		
		AsyncHandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("!@#!@#!@#인터셉터 View 렌더링이 끝난 후!@#!@#!@#");
		AsyncHandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("!@#!@#!@#비동기(ResponseBody)식 호출되었을 때 실행!@#!@#!@#");
		AsyncHandlerInterceptor.super.afterConcurrentHandlingStarted(request, response, handler);
	}
}
