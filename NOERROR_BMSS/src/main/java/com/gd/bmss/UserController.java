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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.mapper.IUserDao;
import com.gd.bmss.service.IBookLendingService;
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
		log.info("@@@@@@@@@@@@@@@관리자화면 이동@@@@@@@@@@@@@@@@");
		List<UserVo> lists = dao.selectUser();
		model.addAttribute("lists",lists);
		return "adminPage";
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
		            response.getWriter().println("<script>alert('회원가입에 실패 하셨습니다'); location.href='http://localhost:8099/NOERROR_BMSS';</script>");
		            return null;
		        }
		    }else {
		    	response.setContentType("text/html; charset=utf-8;");
		    	response.getWriter().println("<script>alert('이미 가입된 회원입니다\\n로그인 페이지로 이동합니다'); location.href='./login.do';</script>");
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
	public String login(HttpSession session, Model model,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		String email = req.getParameter("user_email");
		String pwd = req.getParameter("user_password");
		log.info("@Controller LoginController login 요청받은 값 [{}] [{}]", email,pwd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email",email);
		map.put("user_password", pwd);
		UserVo loginVo = service.login(map);
		if(loginVo == null) {
			SpringUtils.servletAlert(resp, "이메일 또는 비밀번호를 확인해 주세요", "login.do");
			return null;
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
			SpringUtils.servletAlert(response, "잘못된 접근입니다", "login.do");
			return "";
		} else {
			return "redirect:/http://localhost:8099/NOERROR_BMSS";
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
	/*
	 * 비밀번호찾기/초기화
	 */
	@RequestMapping(value = "/findPassword.do")
	public String findPassword() {
		log.info("@@@@@@@@@@@@@@@비밀번호 찾기 이동@@@@@@@@@@@@@@@");
		return "findPassword";
	}
	
	/*
	 * 내정보
	 */
	@RequestMapping(value = "/detailUser.do")
	public String detailUser() {
		log.info("@@@@@@@@@@@@@@@내정보 이동@@@@@@@@@@@@@@@");
		return "detailUser";
	}
	/*
	 * 정보수정
	 */
	@RequestMapping(value = "/modifyUser.do")
	public String modifyUser() {
		log.info("@@@@@@@@@@@@@@@정보수정 이동@@@@@@@@@@@@@@@");
		return "modifyUser";
	}
	@RequestMapping(value = "/pwdChk.do")
	@ResponseBody
	public String modifyInfo(HttpSession session, @RequestParam String password) {
		log.info("@@@@@@@@@@@@@@@@전달받은 패스워드 : {}@@@@@@@@@@@@@@@@@@@@@@@",password);
		UserVo a = (UserVo)session.getAttribute("loginVo");
		
		log.info(a.getUser_password());
		if(password.equals(a.getUser_password())) {
			return "good";
		}else {
			
			return "bad";
		}
	}
	@RequestMapping(value = "/modifyInfo.do")
	public String modifyInfo(String passwordD, HttpServletResponse response,String password, String address, String ModifyAddrD,HttpSession session) throws IOException {
		log.info("@@@@@@@@@@@@@@@@ 정보수정폼 modifyInfo 이동 @@@@@@@@@@@@@@@@@@@@@@@");
		UserVo loginVo = (UserVo) session.getAttribute("loginVo");
		loginVo.setUser_password(password);
		loginVo.setUser_address(address+"\t"+ModifyAddrD);
		UserVo a = (UserVo) session.getAttribute("loginVo");
		loginVo.setUser_id(a.getUser_id());
		log.info("@@@@@@@@@@@@@@@@@@@@ Password 입력값  : {}@@@@@@@@@@@@@@@@@@@@@@@@@", loginVo.getUser_password());
		if(loginVo.getUser_password() == "") {
			loginVo.setUser_password(passwordD);
			log.info("@@@@@@@@@@@@@@@@@@@@ Password 입력값  : {}@@@@@@@@@@@@@@@@@@@@@@@@@", loginVo.getUser_password());
			int n = service.updateUser(loginVo);
		log.info("@@@@@@@@@@@@@@@@@@@@ updateUser 입력값 1or OTHER  : {}@@@@@@@@@@@@@@@@@@@@@@@@@", n);
		if(n>0) {
			session.setAttribute("loginVo", loginVo);
			response.setContentType("text/html; charset=utf-8;");
	    	response.getWriter().println("<script>alert('회원정보가 수정되었습니다'); location.href='./detailUser.do';</script>");
			return null;
		}else {
			response.setContentType("text/html; charset=utf-8;");
	    	response.getWriter().println("<script>alert('오류가 발생했습니다 다시 시도해 주세요'); location.href='./detailUser.do';</script>");
	    	return null;
		}
	}else {
		int n = service.updateUser(loginVo);
		log.info("@@@@@@@@@@@@@@@@@@@@ updateUser 입력값 1or OTHER  : {}@@@@@@@@@@@@@@@@@@@@@@@@@", n);
		if(n>0) {
			session.setAttribute("loginVo", loginVo);
			response.setContentType("text/html; charset=utf-8;");
	    	response.getWriter().println("<script>alert('회원정보가 수정되었습니다'); location.href='./detailUser.do';</script>");
			return null;
		}else {
			response.setContentType("text/html; charset=utf-8;");
	    	response.getWriter().println("<script>alert('오류가 발생했습니다 다시 시도해 주세요'); location.href='./detailUser.do';</script>");
	    	return null;
		}
	}
	}
	
	/*
	 * 회원탈퇴
	 */
	@RequestMapping(value = "/deleteUser.do")
	public String deleteUser(HttpServletResponse resp) throws IOException {
		log.info("@@@@@@@@@@@@@@@회원탈퇴 이동@@@@@@@@@@@@@@@");
		resp.setContentType("text/html; charset=utf-8;");
    	resp.getWriter().println("<script>alert('회원탈퇴를 진행 하시겠습니까?'); location.href='./delUserForm.do';</script>");
		return null;
	}
	@RequestMapping(value = "/delUserForm.do")
	public String delUserForm() {
		log.info("@@@@@@@@@@@@@@@회원탈퇴폼 이동@@@@@@@@@@@@@@@");
		return "deleteUser";
	}
	@RequestMapping(value = "/deleteUserForm.do")
	public String deleteUserForm(HttpSession session, HttpServletResponse resp) throws IOException {
		log.info("@@@@@@@@@@@@@@@회원탈퇴폼 실행 @@@@@@@@@@@@@@@");
		UserVo loginVo = (UserVo) session.getAttribute("loginVo");
		int n = loginVo.getUser_id();
		List<UserVo> result = service.getNotDelUser(n);
		log.info("@@@@@@@@@@@@@@@ result 값 : {}@@@@@@@@@@@@@@@",service.getNotDelUser(n));
		if(!result.isEmpty() && 
			    !result.get(0).getBorwVo().isEmpty() && 
			    !result.get(0).getResvVo().isEmpty() &&
			    "Y".equalsIgnoreCase(result.get(0).getBorwVo().get(0).getBorrow_status()) &&
			    "Y".equalsIgnoreCase(result.get(0).getResvVo().get(0).getReserve_status())) {
//			log.info("@@@@@@@@@@@@@@@ status 값 : {}, /// {}@@@@@@@@@@@@@@@",result.get(0).getBorwVo().get(0).getBorrow_status(),result.get(0).getResvVo().get(0).getReserve_status());
			resp.setContentType("text/html; charset=utf-8;");
			resp.getWriter().println("<script>alert('회원탈퇴중 오류가 발생했습니다. 연체 또는 대출된 도서가 있습니다'); location.href='./detailUser.do';</script>");
			return null;
		}else {
			int m = service.deleteUser(n);
			log.info("@@@@@@@@@@@@@@@ m 값 : {}@@@@@@@@@@@@@@@",m);
			if(m>0) {
				session.removeAttribute("loginVo");
				resp.setContentType("text/html; charset=utf-8;");
				resp.getWriter().println("<script>alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.'); location.href='http://localhost:8099/NOERROR_BMSS';</script>");
				return null;
			}else {
				resp.setContentType("text/html; charset=utf-8;");
				resp.getWriter().println("<script>alert('회원탈퇴중 오류가 발생했습니다. 연체 또는 대출된 도서가 있습니다'); location.href='./detailUser.do';</script>");
				return null;
			}
			
		}
	}
	}
