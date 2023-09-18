package com.gd.bmss;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

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
	
//	@PostMapping(value = "/mailSender.do")
//	public String mailSender(@RequestParam Map<String, String> mailMap) {
//		log.info("MailController mailSender.do 전송값 {}", mailMap);
//		
//		// 발신의 메일주소가 반드시 MimeMessage 객체에 입력되어있어야함
//		String setFrom = "rlaekgnssla20@naver.com";
//		
//		// 메일 내용을 전송하기 위한 객체 MiMeMessage
//		MimeMessage message = mailSender.createMimeMessage();
//		
//		// MimemessageHelper 전송을 처리해주는 객체 , MimeMessage(송신서버정보),첨부파일여부 t/f또는 0/1, 글자인코딩
//		try {
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//			messageHelper.setFrom(setFrom);// 보내는 사람이메일 . 생략하면 안됨
//			messageHelper.setTo(mailMap.get("email"));
//			messageHelper.setSubject(mailMap.get("title")); // 생략가능
//			messageHelper.setEncodeFilenames(true); // 첨부파일명 인코딩
//			String randomCode = randomCode();
//			//본문의 내용
//			// true 글자를 HTMl형식을 바인딩
//	        String content = mailMap.get("content") + "<br>인증코드: " + randomCode;
//	        messageHelper.setText(content, true);
//			
//			//첨부파일 처리
////			MimeMessageHelper의 옵션중에서 두번째 옵션(multipart) true
//			FileSystemResource fileResource = new FileSystemResource("C:\\eclipse_spring\\나선욱.png");
//			messageHelper.addAttachment("쓰고싶은이름써.png", fileResource);
//			
//			System.out.println(mailSender.toString());
//			
//			mailSender.send(message);
//			return "Success";
//
//	    } catch (MessagingException e) {
//	        e.printStackTrace();
//	        return "Error";
//	    }
//	}
	@PostMapping(value = "/sendRandomCode.do")
	@ResponseBody
	public String sendRandomCode(@RequestParam String email) {
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
}
