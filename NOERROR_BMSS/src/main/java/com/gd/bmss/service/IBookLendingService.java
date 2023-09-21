package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.BorrowVo;
import com.gd.bmss.vo.ReserveVo;
import com.gd.bmss.vo.UserVo;

public interface IBookLendingService {
	
	//대출신청
	public int insertBorrow(BorrowVo brw);
	
	//대출 불가 조건1. 도서상태가 대출중, 예약중, 상태가 일반 아님
	public List<Book_StatusVo> borrowNotOk();
	
	//대출 불가 조건 2. 연체회원인 경우
	public UserVo isPenaltyUser(int user_id);
		
	//회원의 대출가능 잔여권수 판단(현재 대출권수)
	public int countBorrow(int user_id);
	
//	public boolean isPenaltyUserT(int user_id);
	
	//대출신청(트랜잭션)
	public boolean requestBorrow(BorrowVo borrow);
		
	
		
	//예약자의 대출신청(트랜잭션 걸 것)
//	연체회원>예약자대출신청조건>대출가능잔여권수판단>대출신청>예약취소
//	public boolean borrowForReserver(Map<String, Object> map);	
	
	//관리자의 전체회원 대출현황 조회
	public List<BorrowVo> getAllBorrowNow();
	
	//관리자의 특정회원 대출현황 조회
	public List<BorrowVo> getOneBorrowNow(int user_id);
		
	//회원의 자신의 대출현황 조회
	public List<BorrowVo> myBorrowNow(int user_id);
		
	//관리자의 특정회원 대출내역 조회
	public List<BorrowVo> getOneBorrowHistory(int user_id);
		
	//회원의 자신의 대출내역 조회
	public List<BorrowVo> myBorrowHistory(int user_id);
		
	//반납신청
	public int returnBook(Map<String, Object> map);
		
	//연장신청
	public int renewBook(int book_seq);
		
	//예약신청
	public int insertReserve(ReserveVo rsv);
		
	//예약불가-연체회원(isPenaltyUser)
	//예약 가능조건 : 대출중, 예약x, 상태 일반
	public List<Book_StatusVo> reserveOk();
		
	//회원의 예약가능 잔여권수 판단(현재 예약권수)
	public int countReserve(int user_id);
		
	//회원의 예약취소
	public int cancelMyReserve(Map<String, Object> map);
		
	//스케줄러 예약자동취소 및 삭제(트랜잭션)
	public boolean CancelReserveCron();
		
	//관리자의 전체회원 예약현황조회
	public List<ReserveVo> getAllReserveNow();
		
	//회원의 자신의 예약현황 조회
	public List<ReserveVo>myReserveNow(int user_id);
		
	//연체시 패널티기간 산정
	public int calPenalty(UserVo userVo);

}
