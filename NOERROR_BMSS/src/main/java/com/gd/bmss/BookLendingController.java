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

import com.gd.bmss.mapper.IBookLendingDao;
import com.gd.bmss.service.IBookLendingService;
import com.gd.bmss.vo.BorrowVo;
import com.gd.bmss.vo.ReserveVo;

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
	
	@Autowired
	private IBookLendingDao dao;

	
	/*
	 * 내 서재 이동
	 */
	@GetMapping(value = "/myLibrary.do")
	public String myLibrary() {
		log.info("@@@@@@@@@@ BookLendingController 내 서재 이동");
		return "myLibrary";
	}	
	
	/*
	 * 관리자의 대출조회창 이동
	 */
	@GetMapping(value = "/borrowUserList.do")
	public String borrowUserList() {
		log.info("@@@@@@@@@@ BookLendingController 내 서재 이동");
		return "borrowUserList";
	}
	
	/*
	 * 회원의 대출현황조회 myBorrowNow
	 */
	@GetMapping(value = "/myBorrowNow.do")
	public String myBorrowNow(Model model, int user_id) {
//	public Map<String, Object> myBorrowNow(Model model, int user_id) {
		log.info("@@@@@@@@@@ BookLendingController 회원의 대출현황 조회");
		
		List<BorrowVo> borrowList =service.myBorrowNow(user_id);
		model.addAttribute("borrowNow", borrowList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		
//		return map;
		return "myLibrary";
	}
	
	/*
	 * 회원의 대출내역조회 myBorrowHistory
	 */
	@GetMapping(value = "/myBorrowHistory.do")
	public String myBorrowHistory(Model model, int user_id) {
		log.info("@@@@@@@@@@ BookLendingController 회원의 대출내역 조회");

		List<BorrowVo> borrowList =service.myBorrowHistory(user_id);
		model.addAttribute("borrowHistory", borrowList);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_id", user_id);
		
		return "myLibrary";
	}
	
	/*
	 * 관리자의 전체회원 대출현황조회 getAllBorrowNow
	 */
	@GetMapping(value = "/borrowAllUserNow.do")
	public String BorrowAllUserNow(Model model) {
		log.info("@@@@@@@@@@ BookLendingController 관리자의 전체회원 대출현황 조회");
		
		List<BorrowVo> borrowList = service.getAllBorrowNow();
		model.addAttribute("borrowNow", borrowList);
		
		return "borrowUserList";
	}
	
	/*
	 * 관리자의 특정회원 대출현황조회 getOneBorrowNow
	 */
	@GetMapping(value = "/borrowOneUserNow.do")
	public String BorrowOneUserNow(Model model, int user_id) {
		log.info("@@@@@@@@@@ BookLendingController 관리자의 특정회원 대출현황 조회");
		
		List<BorrowVo> borrowList = service.getOneBorrowNow(user_id);
		model.addAttribute("borrowOneNow", borrowList);
		
		return "borrowUserList";
	}
	
	/*
	 * 관리자의 특정회원 대출내역조회 getOneBorrowHistory
	 */
	@GetMapping(value = "/borrowOneUserHistory.do")
	public String BorrowOneUserHistory(Model model, int user_id) {
		log.info("@@@@@@@@@@ BookLendingController 관리자의 특정회원 대출내역 조회");
		List<BorrowVo> borrowList = service.getOneBorrowHistory(user_id);
		model.addAttribute("borrowOneAll", borrowList);
		
		return "borrowUserList";
	}
	
	/*
	 * 연체회원 조회 isPenaltyUser
	 */
		
	
	/*
	 * 연체회원 패널티 산정 calPenalty
	 */
	
	
	/*
	 * 회원의 대출신청 insertBorrow
	 * //연체회원여부 확인할것
	 */
	@PostMapping(value = "/requestBorrow.do")
	public String requestBorrow(String title, String user_id, String book_seq) {
		log.info("@@@@@@@@@@ BookLendingController 회원의 대출신청");
		
		BorrowVo borrow = new BorrowVo();
		borrow.setBorrow_title(title);
		borrow.setUser_id(user_id);
		borrow.setBook_seq(book_seq);
		System.out.println("title:"+title+", user_id:"+user_id+", book_seq:"+book_seq);
		
		int n = service.insertBorrow(borrow);
		
		
		
		return "bookDetail";
	}
	
	
	/*
	 * 대출불가 조건(도서상태가 대출중, 예약중, 상태가 일반 아님) borrowNotOk
	 */
//	public String 
	
	
	/*
	 * 회원의 대출가능 잔여권수 판단 countBorrow
	 */
	
	
	/*
	 * 예약자의 대출신청 및 예약취소 borrowForReserver
	 */
	
	
	/*
	 * 반납신청 returnBook
	 */
	@RequestMapping(value = "/returnBook.do", method = {RequestMethod.POST, RequestMethod.GET})
//	public String returnBook(String[] chkBooks) {
	public Map<String, Object> returnBook(String[] chkBooks) {
		log.info("@@@@@@@@@@ BookLendingController 관리자의 반납처리");
		log.info("@@@@@@@@@@ BookLendingController 반납 parameter : {}", Arrays.toString(chkBooks));
//		log.info("@@@@@@@@@@ BookLendingController 반납 parameter : {}", chkBooks);

//		int n = service.returnBook(chkBooks);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chkBooks", chkBooks);
		service.returnBook(map);
		
		
		return map;
//		return "borrowUserList";
	}
	
	/*
	 * 연장신청 renewBook
	 */
	@PostMapping(value = "/renew.do")
	public String renew(int book_seq) {
		log.info("@@@@@@@@@@ BookLendingController 회원의 연장신청");
		
		int n = service.renewBook(book_seq);
		if(n>0) {
			
			return "myLibrary";
		}else {
			return null;
		}
		
	}
	
	
	/*
	 * 관리자의 전체회원 예약현황조회 getAllReserveNow
	 */
	
	
	/*
	 * 회원의 예약현황조회 myReserveNow
	 */
	@GetMapping(value = "/myReserve.do")
	public String myReserveNow(Model model, int user_id) {
		log.info("@@@@@@@@@@ BookLendingController 회원의 예약현황 조회");

		List<ReserveVo> reserveList =service.myReserveNow(user_id);
		model.addAttribute("reserveList", reserveList);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_id", user_id);
		
		return "myLibrary";
	}
	
	
	/*
	 * 회원의 예약신청 insertReserve
	 * 	//연체회원여부 확인할것
	 */
	
	
	/*
	 * 예약가능 조건(예약, 대출확인 여부) reserveOk
	 */
	
	
	/*
	 * 회원의 잔여예약 권수 countReserve
	 */
	
	
	/*
	 * 회원의 예약취소 cancelMyReserve
	 */
	@PostMapping(value = "/cancelMyReserve.do")
	public String cancelMyReserve(int book_seq, int user_id) {
		log.info("@@@@@@@@@@ BookLendingController 회원의 예약취소");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("book_seq", book_seq);
		map.put("user_id", user_id);
		
		int n = service.cancelMyReserve(map);
		if(n>0) {
			
			return "myLibrary";
		}else {
			return null;
		}
		
	}
	
	
	/*
	 * 스케줄러 예약 자동취소 및 자동삭제 CancelReserveCron
	 */
	
	

}
