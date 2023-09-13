package com.gd.bmss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 회원관리 컨트롤러
 * @author KDH
 *
 */
@Controller
public class UserController {
	
	/*
	 * 약관동의 이동
	 */
	@RequestMapping(value = "join.do")
	public String joinUser() {
		
		return "joinPage";
	}
	@RequestMapping(value = "join2.do")
	public String joinGo() {
		
		return "joinPage2";
	}
	
}
