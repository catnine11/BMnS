package com.gd.bmss.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class DaoAop {
	
	@Pointcut("execution(public * com.gd.bmss.mapper.*Dao*.*(..))")
	public void daoLoggerPointCut() {
		
	}
	
	@Before("daoLoggerPointCut()")
	public void before(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.warn("@@@@@@@@@@@@@@ 메소드 실행 전 @@@@@@@@@@@@@@");
		Object[] objs = j.getArgs();
		
		if(objs != null) {
			logger.warn("@@@@@@@@@@@@@@ {} @@@@@@@@@@@@@@", j.getSignature().getName());

			for(int i=0; i< objs.length; i++) {
				logger.warn(i+"번째 arg : \t"+String.valueOf(objs[i]));
			}
		
			logger.warn("@@@@@@@@@@@@@@ {} @@@@@@@@@@@@@@", j.getSignature().getName());
		}
	}
	
	@AfterReturning("daoLoggerPointCut()")
	public void afterReturning(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.warn("종료:\t {}", j.getSignature().getName());
	}
	
	@AfterThrowing(value="daoLoggerPointCut()", throwing = "e")
	public void afterThrowing(JoinPoint j, Exception e) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.warn("@@@@@@@@@@@@@@ 에러에러에러 : \t {} @@@@@@@@@@@@@@", j.getSignature().getName());
		logger.warn("@@@@@@@@@@@@@@ 에러에러에러 : \t {} @@@@@@@@@@@@@@", e.getMessage());
	}
}
