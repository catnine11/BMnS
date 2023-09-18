package com.gd.bmss;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		log.info("Welcome BookManageController 회원의 도서전체조회창 이동");
		List<BookInfoVo> lists = service.getAllBookUser();
		model.addAttribute("lists", lists);
		
		return "bookListUser";
	}
	
	@PostMapping(value = "/bookListUserGenre.do")
	public String bookListUserGenre(Model model, @RequestParam("selectedGenre") String selectedGenre) {
		log.info("Welcome BookManageController 회원의 도서전체조회창-장르별 조회 이동");
		List<BookInfoVo> genreLists = service.getAllBookUserGenre(selectedGenre);
		model.addAttribute(genreLists);
		
		return "bookListUser";
	}
	
	/*
	 * 관리자의 장르별 전체 조회
	 */
	
	
	/*
	 * 상세조회
	 */
	@GetMapping(value = "/bookDetail.do")
	public String bookDetail(Model model) {
		log.info("Welcome BookManageController 도서상세화면창 이동");
		
		
		return "bookDetail";
	}
	
	/*
	 * 장르변경
	 */
	
	
	/*
	 * 도서상태변경
	 */
	
	

}
