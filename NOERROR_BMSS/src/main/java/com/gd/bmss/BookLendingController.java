package com.gd.bmss;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.bmss.service.IBookLendingService;

import lombok.extern.slf4j.Slf4j;

/**
 *  대출관리 컨트롤러
 * @author 남가람
 *
 */

@Controller
@Slf4j
public class BookLendingController {
	
	@Autowired
	private IBookLendingService service;

	
	/*
	 * 내 서재 이동
	 */
	@GetMapping(value = "/myLibrary.do")
	public String myLibrary() {
		log.info("@@@@@@@@@@ BookLendingController 내 서재 이동");
		return "myLibrary";
	}
	
	/*
	 * 대출현황조회
	 */
	
	
	/*
	 * 대출내역조회
	 */

}
