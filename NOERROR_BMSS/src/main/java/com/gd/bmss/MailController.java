package com.gd.bmss;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoEmptyResponseException;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.exception.NurigoUnknownException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;
import retrofit2.http.GET;

@Controller
@Slf4j
public class MailController {

	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping(value = "/emailChk.do")
	public String mail() {
		log.info("@@@@@@@@@@@@@@@MailController emailChk  화면 이동@@@@@@@@@@@@@@@@@");
		return "mailForm";
	}
	
	@PostMapping(value = "/sendRandomCode.do")
	@ResponseBody
	public String sendRandomCode(@RequestParam String email, HttpSession session) {
	    String randomCode = randomCode();

	    MimeMessage message = mailSender.createMimeMessage();
	    try {
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	        messageHelper.setFrom("rlaekgnssla20@naver.com");
	        messageHelper.setTo(email);
	        messageHelper.setSubject("Bmss 책check 이메일 인증 코드");

	        String content = "인증 번호 : \t\t" + randomCode + " \n\n"
	        							+ "인증번호를 인증번호 확인란에 작성해 주세요";
	        messageHelper.setText(content, false);

	        mailSender.send(message);
	        session.setAttribute("randomCode", randomCode);
	        return "Success";

	    } catch (MessagingException e) {
	        e.printStackTrace();
	        return "Error";
	    }
	}
	private String randomCode() {
	    int code = (int) (Math.random() * 9000) + 1000;
	    return String.valueOf(code);
	}
	
	@PostMapping(value = "/verifyCode.do")
	@ResponseBody
	public String verifyCode(@RequestParam String confirmNum, HttpSession session) {
	    String storedCode = (String) session.getAttribute("randomCode");

	    if (storedCode != null && storedCode.equals(confirmNum)) {
	        session.removeAttribute("randomCode");
	        session.removeAttribute("email");

	        return "Success";
	    } else {
	        return "Error";
	    }
	}

	@GetMapping(value = "/phoneChk.do")
	public String phoneChk() {
		log.info("@@@@@@@@@@@@@@@MailController phoneChk  화면 이동@@@@@@@@@@@@@@@@@");
		return "phoneForm";
	}

	@RequestMapping(value = "/phoneChkForm.do")
	@ResponseBody
	public String phoneChkFormm(@RequestParam(value ="phone",required=false) String phone ,HttpSession session) {
		DefaultMessageService msgService = NurigoApp.INSTANCE.initialize("NCS52YUDRI4OLSDD", "RGVUWQOOA3HUXEID6NI5GOMXGLF5MQD5", "https://api.coolsms.co.kr");
		Message message = new Message();
		String randomCode = randomCode();
		String msgText = "NOERROR 책check 인증번호는\t" + randomCode +"\t 입니다 \n\n 인증번호를 입력해 주세요";
		message.setFrom("01094792650");
		message.setTo("01094792650");
		message.setText(msgText);
		
		try {
			msgService.send(message);
			session.setAttribute("randomCode", randomCode);
			session.setAttribute("phone", phone);
	        return "Success";
		} catch (NurigoMessageNotReceivedException e) {
			System.out.println("@@@@@@@@@@@@@"+ e.getFailedMessageList() + "@@@@@@@@@@@@@@@@");
			System.out.println("@@@@@@@@@@@@@" + e.getMessage() + "@@@@@@@@@@@@@@");
			return "Error";
		} catch (Exception e) {
			System.out.println("@@@@@@@@@@@@@" + e.getMessage() + "@@@@@@@@@@@@@@");
		} 
		return "Error";
	}
	
	@PostMapping(value = "/confirm.do")
	@ResponseBody
	public String confirm(@RequestParam String confirmNum, HttpSession session) {
		 String storedCode = (String) session.getAttribute("randomCode");

		    if (storedCode != null && storedCode.equals(confirmNum)) {
		        session.removeAttribute("randomCode");
		        session.removeAttribute("phone");

		        return "Success";
		    } else {
		        return "Error";
		    }
	}
	
}
