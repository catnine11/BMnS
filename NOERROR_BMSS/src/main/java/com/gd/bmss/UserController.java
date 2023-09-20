package com.gd.bmss;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.mapper.IUserDao;
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
	
	@Autowired
	private IUserDao dao;
	
	/*
	 * 관리자페이지 이동
	 */
	@RequestMapping(value = "/adminPage.do")
	public String adminPage(Model model) {
		log.info("@@@@@@@@@@@@@@@관리자화면 이동@@@@@@@@@@@@@@@");
		List<UserVo> lists = dao.selectUser();
		model.addAttribute("lists",lists);
		return "adminPage";
	}
	
	/*
	 * 마이페이지 이동
	 */
	@GetMapping(value = "/myPage.do")
	public String myPage() {
		log.info("@@@@@@@@@@  마이페이지 이동");
		return "myPage";
	}
	
	
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
	public String regist(HttpServletResponse response,UserVo vo, HttpServletRequest req, HttpSession session) throws IOException {
		log.info("@@@@@@@@@@@@@회원가입폼 실행@@@@@@@@@@@@@@@@");
		String address = (String)req.getParameter("user_address")+"\t"+(String)req.getParameter("addressDetail");
		vo.setUser_address(address);
		 String verified = (String) session.getAttribute("verified");
		 log.info("@@@@@@@@@@@@@@@@전달받은 verified값 true or false : {}@@@@@@@@@@@@@@@@@@@", verified);
		        int m = service.emailCheck(req.getParameter("user_email"));
		        log.info("@@@@@@@@@@@@@@@전달받은 emailCheck 값 0 or other : {}@@@@@@@@@@@@@@@", m);
		        if(m == 0) {
		        	int n = service.joinUser(vo);
		        	log.info("@@@@@@@@@@@@@@@전달받은 joinUser값 0 or other : {}@@@@@@@@@@@@@@@", n);
		        if (n == 1) {
		            session.removeAttribute("verified");
		            return "redirect:/login.do";
		        } else {
		            response.setContentType("text/html; charset=utf-8;");
		            response.getWriter().println("<script>alert('회원가입에 실패 하셨습니다'); location.href='http://localhost:8080/NOERROR_BMSS';</script>");
		            return null;
		        }
		    }else {
		    	response.setContentType("text/html; charset=utf-8;");
		    	response.getWriter().println("<script>alert('이미 가입된 회원입니다\\n로그인 페이지로 이동합니다'); location.href='/NOERROR_BMSS/login.do';</script>");
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
	@PostMapping("/loginCheck.do")
	public String login(HttpSession session, Model model, HttpServletRequest req) {
//		String email = (String) model.getAttribute("user_email");
//		String pwd = (String) model.getAttribute("user_password");
		String email = req.getParameter("user_email");
		String pwd = req.getParameter("user_password");
		log.info("@Controller LoginController login 요청받은 값 [{}] [{}]", email,pwd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email",email);
		map.put("user_password", pwd);
		UserVo loginVo = service.login(map);
		if(loginVo == null) {
			return "loginForm";
		}else {
			session.setAttribute("loginVo", loginVo);
			model.addAttribute("loginVo",loginVo);
			return "redirect:/";
		}
	}
	
	/*/
	 * 세션확인
	 */
	@RequestMapping(value = "/afterLogin.do",method = RequestMethod.POST)
	public String loginSession(HttpSession session, HttpServletResponse response) throws IOException {
		if(session.getAttribute("loginVo") == null) {
			SpringUtils.servletAlert(response, "잘못된 접근입니다", "loginForm.do");
			return "";
		} else {
			return "redirect:/http://localhost:8080/NOERROR_BMSS";
		}
	}
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/*
	 * 이메일 찾기
	 */
	@RequestMapping(value = "/findEmail.do")
	public String findEmail() {
		log.info("@@@@@@@@@@@@@@@이메일 찾기 이동@@@@@@@@@@@@@@@");
		return "findEmail";
	}
}
