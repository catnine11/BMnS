package com.test.bmss;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gd.bmss.mapper.IOrderDao;
import com.gd.bmss.service.IOderService;
import com.gd.bmss.vo.Book_StatusVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class OrderModel_JUnitTest {
	@Autowired
	private SqlSessionTemplate Sqlsession;
	
	@Autowired
	private IOrderDao dao;
	@Autowired
	private IOderService service;
	
//	@Test
	public void test() {
		
	}
//	@Test
	public void selectStockable() {
	List<Book_StatusVo>lists=	dao.selectStockable();
	

	assertNotNull(lists);
	}
	
//	@Test
	public void normalToStock() {
		
		List<Book_StatusVo>lists=	dao.selectStockable();
		List<String> list = new ArrayList<String>();
			for (Book_StatusVo bookseq : lists) {
				String bookSeq = bookseq.getBook_seq();
			list.add(bookSeq);
		int n =dao.normalToStock(list);
			System.out.println(n);
		
			}
			
		
		
	}
	@Test
	public void addStock() {
		List<Book_StatusVo> lists = dao.selectStockable();
		List<String> list =new ArrayList<String>();
		for (Book_StatusVo book_seq : lists) {
			
			String bookSeq=book_seq.getBook_seq();
	
			list.add(bookSeq);
		int n =	dao.addStock(list);
		System.out.println(n);
			
		}
		
	}
	
}
