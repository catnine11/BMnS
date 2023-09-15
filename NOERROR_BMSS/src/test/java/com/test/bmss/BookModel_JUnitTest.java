package com.test.bmss;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gd.bmss.mapper.IBookManageDao;
import com.gd.bmss.vo.BookInfoVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BookModel_JUnitTest {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	IBookManageDao dao;
	
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
		BookInfoVo info = dao.getOneBook("3");
		System.out.println(info);
		assertNotNull(info);
	}
	
	@Test
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
	

}
