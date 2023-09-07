package com.min.edu;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HelloController {

	@RequestMapping(value = "/main.do" ,method=RequestMethod.GET)
	public String home() {
		log.info("Welcome HomeCtrl {}", "home");
		return "home";
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.POST)
	public String encTest(String name, Model model) {
		log.info("Welcome HomeCtrl {}", "home");
		log.info("Home에 POST로 전달받은 파라미터 {}", name);
		model.addAttribute("name","테스트중입니다. 안녕하세요<br>"+ name+"님, 반갑습니다.");
		return "home";
	}

	
}
