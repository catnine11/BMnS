package com.gd.bmss;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.bmss.service.IBookManageService;
import com.gd.bmss.vo.BookInfoVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BookManageController {
	
	@Autowired
	IBookManageService service;
	
	/*
	 * 크롤링
	 */
//	String url = "";
//	Document doc = Jsoup.connect(url).get();
	
	/////////////////////////////////////////
	
	/*
	 * 회원의 장르별 전체 조회
	 */
	@GetMapping(value = "/bookListUser.do")
	public String bookListUser(Model model) {
		log.info("Welcome BookManageController 도서전체조회-회원 bookListUser");
		List<BookInfoVo> lists = service.getAllBookUser();
		
//		for (BookInfoVo vo : lists) {
//			vo.get
//			
//		}
		model.addAttribute("lists", lists);
		
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
