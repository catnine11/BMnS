package com.test.bmss;

import static org.junit.Assert.*;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gd.bmss.mapper.IStockDao;
import com.gd.bmss.service.IStockService;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.StockVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class OrderModel_JUnitTest {
	@Autowired
	private SqlSessionTemplate Sqlsession;
	
	@Autowired
	private IStockDao dao;
	
	@Autowired
	private IStockService service;
	
//	@Test
	public void test() {
		
	}
//	@Test
	public void selectStockable() {
	List<Book_StatusVo>lists=	service.selectStockable();
	

	assertNotNull(lists);
	}
	
//	@Test
	public void normalToStock() {
		
		List<Book_StatusVo>lists=	service.selectStockable();
		List<String> list = new ArrayList<String>();
			for (Book_StatusVo bookseq : lists) {
				String bookSeq = bookseq.getBook_seq();
			list.add(bookSeq);
	
			}
			int n =dao.normalToStock(list);
			System.out.println(n);
				
		
		
	}
//	@Test
	public void addStock() {
	    List<Book_StatusVo> lists = service.selectStockable();
	    StockVo vo = new StockVo();
	    for (Book_StatusVo bookStatus : lists) {
	        String bookSeq = bookStatus.getBook_seq();
	       vo.setBook_seq(Integer.parseInt(bookSeq)); 
	      
	       int n = dao.addStock(vo);
	       System.out.println(n);
	    }
	}
//	@Test
	public void cron() {
		
		List<Book_StatusVo> lists = service.selectStockable();
		StockVo vo = new StockVo();//insert 
		List<String> list = new ArrayList<String>();//update
		for (Book_StatusVo book_seq : lists) {
			String bookSeq=	book_seq.getBook_seq();
			vo.setBook_seq(Integer.parseInt(bookSeq));
		int n =	service.addStock(vo);
			System.out.println(n);
			list.add(bookSeq);
		}
	int m=	service.normalToStock(list);
		
		System.out.println(m);
	}
//	@Test
	public void sellAble() {
		dao.sellAble("5");
		
	}
//	@Test
	public void sellAbleMany() {
		List<Integer> stock_number = new ArrayList<Integer>();
		stock_number.add(7);
		stock_number.add(8);
		stock_number.add(9);
		dao.sellAbleMany(stock_number);
	}
	
	@Test
	public void stocksDel() {
		String[] chks = {"10","20","30"};
		Map<String, String[]> map =new HashMap<String, String[]>();
		map.put("nums",chks);
		int n =dao.stocksDel(map);
		assertEquals(3, n);
	}
	
	
	
}
