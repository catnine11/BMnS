package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.bmss.mapper.IBookLendingDao;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.BorrowVo;
import com.gd.bmss.vo.ReserveVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookLendingServiceImpl implements IBookLendingService {

	@Autowired
	private IBookLendingDao dao;
	


	@Override
	public int insertBorrow(BorrowVo brw) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 대출신청 insertBorrow {}", brw);
		return dao.insertBorrow(brw);
	}


	@Override
	public List<Book_StatusVo> borrowNotOk() {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 대출불가조건 borrowNotOk");
		return dao.borrowNotOk();
	}


	@Override
	public UserVo isPenaltyUser(int user_id) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 연체회원여부 isPenaltyUser {}", user_id);
		return dao.isPenaltyUser(user_id);
	}


	@Override
	public int countBorrow(int user_id) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 대출권수 countBorrow {}", user_id);
		return dao.countBorrow(user_id);
	}


//	@Transactional(readOnly = true)
//	@Override
//	public boolean borrowForReserver(Map<String, Object> map) {
//		log.info("")
//	
//	int n = dao.borrowReserver();
//	int m = dao.deleteReserveAfterBorrow();
//		
//		return null;
//	}



	@Override
	public List<BorrowVo> getAllBorrowNow() {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 관리자의 전체회원 대출현황조회 getAllBorrowNow ");
		return dao.getAllBorrowNow();
	}


	@Override
	public List<BorrowVo> getOneBorrowNow(int user_id) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 관리자의 특정회원 대출현황 조회 getOneBorrowNow {}", user_id);
		return dao.getOneBorrowNow(user_id);
	}

	
	@Override
	public List<BorrowVo> getMyBorrowNow(int user_id) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 회원의 자신의 대출현황조회 getMyBorrowNow {}", user_id);
		return dao.getMyBorrowNow(user_id);
	}

	
	@Override
	public List<BorrowVo> getAllBorrow(int user_id) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 관리자의 특정회원 대출내역 조회 getAllBorrow {}", user_id);
		return dao.getAllBorrow(user_id);
	}


	@Override
	public List<BorrowVo> getMyAllBorrow(int user_id) { 
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 회원의 자신의 대출내역 조회 getMyAllBorrow {}", user_id);
		return dao.getMyAllBorrow(user_id);
	}


	@Override 
	public int returnBook(Map<String, Object> map) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 도서반납 returnBook{}", map);
		return dao.returnBook(map);
	}


	@Override
	public int renewBook(int book_seq) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 도서연장 renewBook {}", book_seq);
		return dao.renewBook(book_seq);
	}


	@Override
	public int insertReserve(ReserveVo rsv) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 예약신청 insertReserve {}", rsv);
		return dao.insertReserve(rsv);
	}


	@Override
	public List<Book_StatusVo> reserveOk() {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 예약가능 조건 reserveOk ");
		return dao.reserveOk();
	}


	@Override
	public int countReserve(int user_id) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 예약권수 countReserve {}", user_id);
		return dao.countReserve(user_id);
	}


	@Override
	public int cancelMyReserve(Map<String, Object> map) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 회원의 예약취소 cancelMyReserve {}", map);
		return dao.cancelMyReserve(map);
	}


	@Transactional(readOnly = true)
	@Override
	public boolean CancelReserveCron() {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 크론을 통한 자동예약취소 CancelReserveCron");
		
		int m = dao.CancelReserveForCron();
		int n = dao.deleteReserveForCron();
		
		return (n+m)>0? true:false;
	}


	@Override
	public List<ReserveVo> getAllReserveNow() {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 관리자의 전체회원 예약현황 조회 getAllReserveNow ");
		return dao.getAllReserveNow();
	}


	@Override
	public List<ReserveVo> getOneReserveNow(int user_id) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 특정회원 예약현황 조회 getOneReserveNow {}", user_id);
		return dao.getOneReserveNow(user_id);
	}


	@Override
	public int calPenalty(UserVo userVo) {
		log.info("@@@@@@@@@@@@BookLendingServiceImpl 패널티기간 산정 calPenalty {}", userVo);
		return dao.calPenalty(userVo);
	}

}
