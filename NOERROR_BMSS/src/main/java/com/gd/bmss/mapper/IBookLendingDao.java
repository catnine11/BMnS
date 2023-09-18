package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.BorrowVo;
import com.gd.bmss.vo.ReserveVo;
import com.gd.bmss.vo.UserVo;
/**
 * 대출관리 인터페이스
 * @author 남가람
 * @since 2023.09.15.
 */
public interface IBookLendingDao {

	//대출신청
	public int insertBorrow(BorrowVo brw);
	
	//대출 불가 조건1. 도서상태가 대출중, 예약중, 상태가 일반 아님
	public List<Book_StatusVo> borrowNotOk();
	
	//대출 불가 조건 2. 연체회원인 경우
	public UserVo isPenaltyUser(int user_id);
	
	//회원의 대출가능 잔여권수 판단(현재 대출권수)
	public int countBorrow(int user_id);
	
	//예약자의 대출신청(트랜잭션 걸 것)
//	public Book_StatusVo borrowReserver(Map<String, Object> map);
	
	//예약대출 후 예약취소(트랜잭션 것 것)
	public int deleteReserveAfterBorrow(int book_seq);
	
	//관리자의 전체회원 대출현황 조회
	public List<BorrowVo> getAllBorrowNow();
	
	//관리자의 특정회원 대출현황 조회
	public List<BorrowVo> getOneBorrowNow(int user_id);
	
	//회원의 자신의 대출현황 조회
	public List<BorrowVo> getMyBorrowNow(int user_id);
	
	//관리자의 특정회원 대출내역 조회
	public List<BorrowVo> getAllBorrow(int user_id);
	
	//회원의 자신의 대출내역 조회
	public List<BorrowVo> getMyAllBorrow(int user_id);
	
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
	
	//스케줄러 자동 취소(트랜잭션)
	public int CancelReserveForCron();
	
	//스케줄러 예약취소 자동삭제(트랜잭션)
	public int deleteReserveForCron();
	
	//관리자의 전체회원 예약현황조회
	public List<ReserveVo> getAllReserveNow();
	
	//회원의 자신의 예약현황 조회
	public List<ReserveVo> getOneReserveNow(int user_id);
	
	//연체시 패널티기간 산정
	public int calPenalty(UserVo userVo);
	
	
}
