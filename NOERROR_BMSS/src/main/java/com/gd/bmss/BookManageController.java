package com.gd.bmss;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BookManageController {
	
	/*
	 * 크롤링
	 */
//	String url = "";
//	Document doc = Jsoup.connect(url).get();
	
	/////////////////////////////////////////
	
	/*
	 * 회원의 장르별 전체 조회
	 */
	@GetMapping(value = "/allBookU.do")
	public String bookListUser() {
		
		return "bookListUser";
	}
	
	/*
	 * 관리자의 장르별 전체 조회
	 */
	
	
	/*
	 * 상세조회
	 */
	
	
	/*
	 * 장르변경
	 */
	
	
	/*
	 * 도서상태변경
	 */
	
	

}
