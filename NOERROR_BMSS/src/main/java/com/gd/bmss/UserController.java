package com.gd.bmss;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.bmss.service.IUserService;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

/**
 * 회원관리 컨트롤러
 * @author KDH
 *
 */
@Controller
@Slf4j
public class UserController {
	
	@Autowired
	private IUserService service;
	
	/*
	 * 약관동의 이동
	 */
	@RequestMapping(value = "/join.do")
	public String joinUser() {
		log.info("@@@@@@@@@@@@@@@약관동의화면 이동@@@@@@@@@@@@@@@");
		return "joinPage";
	}
	/*
	 * 회원가입페이지 이동
	 */
	@RequestMapping(value = "/join2.do")
	public String joinGo() {
		log.info("@@@@@@@@@@@@@@@회원가입화면 이동@@@@@@@@@@@@@@@");
		return "joinPage2";
	}
	/*
	 * 회원가입폼, ->로그인폼 이동 or mainPage이동
	 */
	@RequestMapping(value = "/regist.do")
	public String regist(HttpServletResponse response,UserVo vo) throws IOException {
		int n = service.joinUser(vo);
		log.info("@@@@@@@@@@@@@@@전달받은 값 0 or other : {}@@@@@@@@@@@@@@@",n);
		if(n == 1) {
			return "redirect:/loginForm.do";
		}else {
			response.setContentType("text/html; charset=utf-8;");
			response.getWriter().println("<script>alert('회원가입에 실패 하셨습니다'); location.href='http://localhost:8080/noerrorbmss';</script>");
			return null;
		}
	}
	
	/*
	 * 로그인화면 이동, -> mainPage이동
	 */
	@RequestMapping(value = "/login.do")
	public String loginGo() {
		log.info("@@@@@@@@@@@@@@@로그인화면 이동@@@@@@@@@@@@@@@");
		return "loginForm";
	}
	
	/*
	 * 로그인폼
	 */
	
	
}
