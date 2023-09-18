package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.BorrowVo;
import com.gd.bmss.vo.ReserveVo;
import com.gd.bmss.vo.UserVo;

@Repository
public class BookLendingDaoImpl implements IBookLendingDao {

	@Autowired SqlSessionTemplate session;
	
	private static final String NS = "com.gd.bmss.mapper.BookLendingDaoImpl.";
	
	@Override
	public int insertBorrow(BorrowVo brw) {
		return session.insert(NS+"insertBorrow", brw);
	}

	@Override
	public List<Book_StatusVo> borrowNotOk() {
		return session.selectList(NS+"borrowNotOk");
	}

	@Override
	public UserVo isPenaltyUser(int user_id) {
		return session.selectOne(NS+"isPenaltyUser", user_id);
	}

	@Override
	public int countBorrow(int user_id) {
		return session.selectOne(NS+"countBorrow", user_id);
	}


	///////////////////////////////////
//	@Override
//	public Book_StatusVo borrowReserver(Map<String, Object> map) {
//		return session.selectOne(NS+"borrowForReserver", user_id);
//	}
	
	@Override
	public int deleteReserveAfterBorrow(int book_seq) {
		return session.delete(NS+"deleteReserveAfterBorrow", book_seq);
	}

	@Override
	public List<BorrowVo> getAllBorrowNow() {
		return session.selectList(NS+"getAllBorrowNow");
	}

	@Override
	public List<BorrowVo> getOneBorrowNow(int user_id) {
		return session.selectList(NS+"getOneBorrowNow", user_id);
	}

	@Override
	public List<BorrowVo> getMyBorrowNow(int user_id) {
		return session.selectList(NS+"getMyBorrowNow", user_id);
	}
	
	@Override
	public List<BorrowVo> getAllBorrow(int user_id) {
		return session.selectList(NS+"getAllBorrow", user_id);
	}

	@Override
	public List<BorrowVo> getMyAllBorrow(int user_id) {
		return session.selectList(NS+"getMyAllBorrow", user_id);
	}

	@Override
	public int returnBook(Map<String, Object> map) {
		return session.update(NS+"returnBook", map);
	}

	@Override
	public int renewBook(int book_seq) {
		return session.update(NS+"renewBook", book_seq);
	}

	@Override
	public int insertReserve(ReserveVo rsv) {
		return session.insert(NS+"insertReserve", rsv);
	}

	@Override
	public List<Book_StatusVo> reserveOk() {
		return session.selectList(NS+"reserveOk");
	}

	@Override
	public int countReserve(int user_id) {
		return session.selectOne(NS+"countReserve", user_id);
	}

	@Override
	public int cancelMyReserve(Map<String, Object> map) {
		return session.update(NS+"cancelMyReserve", map);
	}

	@Override
	public int CancelReserveForCron() {
		return session.update(NS+"CancelReserveForCron");
	}

	@Override
	public int deleteReserveForCron() {
		return session.update(NS+"deleteReserveForCron");
	}

	@Override
	public List<ReserveVo> getAllReserveNow() {
		return session.selectList(NS+"getAllReserveNow");
	}

	@Override
	public List<ReserveVo> getOneReserveNow(int user_id) {
		return session.selectList(NS+"getOneReserveNow", user_id);
	}

	@Override
	public int calPenalty(UserVo userVo) {
		return session.update(NS+"calPenalty", userVo);
	}

}
