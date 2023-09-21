package com.gd.bmss;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.bmss.service.IBookManageService;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Book_StatusVo;

import lombok.extern.slf4j.Slf4j;

/**
 * 도서관리 컨트롤러
 * @author 남가람
 *
 */

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
	
	@PostMapping(value = "/bookListGenre.do")
	@ResponseBody
	public Map<String, Object> bookListGenre(Model model, @RequestParam String selectedGenre) {
		log.info("Welcome BookManageController 도서전체조회창-장르별 조회");
		log.info("Welcome BookManageController  선택된장르 {}", selectedGenre);
		List<BookInfoVo> genreLists = service.getAllBookUserGenre(selectedGenre);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectGenre", genreLists);
		return map;
	}
	
	/*
	 * 관리자의 장르별 전체 조회
	 */
	@GetMapping(value = "/bookListAdmin.do")
	public String bookListAdmin(Model model) {
		log.info("Welcome BookManageController 관리자의 도서전체조회창");
		List<BookInfoVo> lists = service.getAllBookAdmin();
		model.addAttribute( "lists", lists);
		
		return "bookListAdmin";
	}
	
	
	
	/*
	 * 상세조회-대출상태포함
	 */
	@GetMapping(value = "/bookDetail.do")
	public String bookDetailStatus(Model model, String book_code) {
		log.info("Welcome BookManageController 도서상세화면창 이동");
		log.info("Welcome BookManageController 북코드 {}",book_code );		BookInfoVo detail= service.getOneBookStatus(book_code);
//		List<Book_StatusVo> detailList = service.getOneBookStatus(book_code);
		model.addAttribute("detail", detail);
		System.out.println("\n\n" + detail);
		
		return "bookDetail";
	}
	
	/*
	 * 장르변경 chkBook, selectedChangeGenre
	 */
	@RequestMapping(value = "/changeGenre.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String changeGenre(Model model, String[] chkBook, String selectedChangeGenre) {
		log.info("Welcome BookManageController 장르변경 ");
		log.info("Welcome BookManageController 장르변경 parameter : {} {}", Arrays.toString(chkBook), selectedChangeGenre);
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("genre_code", selectedChangeGenre);
		map.put("codes", chkBook);
		
		service.changeGenre(map);
		
		List<BookInfoVo> updatedBookList = service.getAllBookAdmin(); 
	    model.addAttribute("lists", updatedBookList);
		
		return "redirect:/bookListAdmin.do";
	}
	
	
	/*
	 * 도서상태변경
	 */
	public String changeBStatus() {
		log.info("Welcome BookManageController 도서상태변경 ");
		
		return "redirect:/bookDetail.do";
	}
	
	

}
