package com.test.bmss;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gd.bmss.mapper.IBookLendingDao;
import com.gd.bmss.mapper.IBookManageDao;
import com.gd.bmss.service.IBookLendingService;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.BorrowVo;
import com.gd.bmss.vo.ReserveVo;
import com.gd.bmss.vo.UserVo;
/**
 * @author 남가람
 * @since 2023.09.14.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BookModel_JUnitTest {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	IBookManageDao dao;
	
	@Autowired
	IBookLendingService service;
	
//	@Test
	public void test() {
		assertNotNull(session);
	}
	
//	@Test
	public void allUserTest() {
		List<BookInfoVo> lists = dao.getAllBookUser();
		System.out.println(lists);
		assertNotNull(lists);
	}
	
//	@Test
	public void allAdminTest() {
		List<BookInfoVo> lists = dao.getAllBookAdmin();
		System.out.println(lists);
		assertNotNull(lists);
	}
	
//	@Test
	public void detailTest() {
		BookInfoVo info = dao.getOneBook("1");
		System.out.println(info);
		assertNotNull(info);
	}
	
	@Test
	public void detailStatus() {
		BookInfoVo info = dao.getOneBookStatus("1");
		assertNotNull(info);
	}
	
//	@Test
	public void changeGenreTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("genre_code", "800");
		map.put("codes", new String[]{"32","33"});
		int n = dao.changeGenre(map);
		
		assertEquals(2, n);
	}
	
//	@Test
	public void changeStatusTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status_code", "D");
		String[] seqs = new String[]{"129","130"};
		map.put("seqs", seqs);
		
		int n = dao.changeBStatus(map);
		assertEquals(2, n);
	}
	
//	@Test
	public void updateBookTest() {
		BookInfoVo info = new BookInfoVo();
		info.setContent("목차");
		info.setIntro("책 소개");
		info.setReview("서평");
		info.setAuthorinfo("대단한 분임");
		info.setBook_code("58");
		
		int n = dao.updateBook(info);
		assertEquals(1, n);
	}
	
	//////////////////////////////////////////////////////
	
	
//	@Test
	public void insertBorrow() {
		BorrowVo vo = new BorrowVo();
		String start_date = "2023-09-13";
		String return_date = "2023-09-15";
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date start =  sdf.parse(start_date);
//		Date returnD =  sdf.parse(return_date);
		
		vo.setBorrow_title("노력의 배신");
		vo.setStart_date(start_date);
		vo.setReturn_date(return_date);
		vo.setUser_id("9");
		vo.setBook_seq("71");
		
		int n = service.insertBorrow(vo);
		assertEquals(1, n);
	}
	
//	@Test
	public void borrowNotOk() {
		List<Book_StatusVo> lists = service.borrowNotOk();
		assertNotNull(lists);
	}	
	
//	@Test
	public void isPenaltyUser() {
		UserVo vo = service.isPenaltyUser(15);
		assertNotNull(vo);
	}
	
//	@Test
	public void countBorrow() {
//		List<BorrowVo> lists = service.countBorrow(3);
		int n = service.countBorrow(7);
		assertEquals(2, n);
	}
	
//	@Test
	public void borrowForReserver() {
		
	}
	
//	@Test
	public void getAllBorrowNow() {
		List<BorrowVo> lists = service.getAllBorrowNow();
		assertNotNull(lists);
	}
	
//	@Test
	public void getOneBorrowNow() {
		List<BorrowVo> lists = service.getOneBorrowNow(3);
		assertNotNull(lists);
	}
	
//	@Test
	public void myBorrowNow() {
		int user_id = 3;
		List<BorrowVo> vo = service.myBorrowNow(user_id);
		
		assertNotNull(vo);
	}
	
//	@Test
	public void getOneBorrowHistory() {
		List<BorrowVo> lists = service.getOneBorrowHistory(3);
		assertNotNull(lists);
	}
	
//	@Test
	public void myBorrowHistory() {
		List<BorrowVo> lists = service.myBorrowHistory(3);
		assertNotNull(lists);
	}
	
//	@Test
	public void returnBook() {
		Map<String, Object> map = new HashMap<String, Object>();
		String[] seqs = new String[]{"71","106"};
		map.put("seqs", seqs);
		int n = service.returnBook(map);

//		List<String> seqs = new ArrayList<String>();
//		seqs.add("71");
//		seqs.add("106");
//		int n = service.returnBook(seqs);
		assertEquals(2, n);
	}
	
//	@Test
	public void renewBook() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("book_seq", "6");
//		int n = service.renewBook(map);
		int n = service.renewBook(7);
		assertEquals(1, n);
	}
	
//	@Test
	public void insertReserve() {
		ReserveVo vo = new ReserveVo();
		vo.setReserve_title("노력의 배신");
		vo.setReserve_date("2023-09-18");
		vo.setUser_id("13");
		vo.setBook_seq("71");
		int n = service.insertReserve(vo);
		assertEquals(1, n);
	}
	
//	@Test
	public void reserveOk() {
		List<Book_StatusVo> list = service.reserveOk();
		assertNotNull(list);
	}
	
//	@Test
	public void countReserve() {
		int n = service.countReserve(7);
		assertEquals(2, n);
	}
	
//	@Test
	public void cancelMyReserve() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", "13");
		map.put("book_seq", "71");
		int n = service.cancelMyReserve(map);
		assertEquals(1, n);
	}
	
//	@Test
	public void CancelReserveCron() {
		boolean isc = service.CancelReserveCron();
		assertTrue(isc);
	}
	
//	@Test
	public void getAllReserveNow() {
		List<ReserveVo> list = service.getAllReserveNow();
		assertNotNull(list);
	}
	
//	@Test
	public void myReserveNow() {
		List<ReserveVo> list = service.myReserveNow(4);
		assertNotNull(list);
	}
	
//	@Test
	public void calPenalty() {
		UserVo vo = new UserVo();
		vo.setUser_id(15);
		int n = service.calPenalty(vo);
		assertEquals(1, n);
	}
	
	
	
	

}
