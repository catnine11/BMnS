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

import com.gd.bmss.mapper.IOrderDao;
import com.gd.bmss.mapper.ISearchDao;
import com.gd.bmss.mapper.IStockDao;
import com.gd.bmss.service.IStockService;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.OrderVo;
import com.gd.bmss.vo.StockVo;
import com.gd.bmss.vo.UserVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class OrderModel_JUnitTest {
	@Autowired
	private SqlSessionTemplate sql;
	
	@Autowired
	private IStockDao dao;
	
	@Autowired
	private IStockService service;
	
	@Autowired
	private ISearchDao sdao;
	
	
	@Autowired
	private IOrderDao odao;
	
//	@Test
	public void test() {
		
	}
//	@Test
	public void selectStockable() {
	List<Book_StatusVo>lists=	service.selectStockable();
	

	assertNotNull(lists);
	}
	
//	@Test
	public void normalToStocks() {
		
		
//		List<String> list = new ArrayList<String>();
//			for (Book_StatusVo bookseq : lists) {
//				String bookSeq = bookseq.getBook_seq();
//			list.add(bookSeq);
//	
//			}
			int n =dao.normalToStocks();
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
//	int m=	service.normalToStocks(list);
		
//		System.out.println(m);
	}
//	@Test
	public void sellAble() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status","N");
		map.put("num","1");
		dao.sellAble(map);
		
	}
//	@Test
	public void sellAbleMany() {
		List<Integer> stock_number = new ArrayList<Integer>();
		
		stock_number.add(7);
		stock_number.add(8);
		stock_number.add(9);
		dao.sellAbleMany(stock_number);
	}
	
//	@Test
	public void stocksDel() {
		String[] chks = {"10","20","30"};
		Map<String, String[]> map =new HashMap<String, String[]>();
		map.put("nums",chks);
//		int n =dao.stocksDel(map);
//		assertEquals(3, n);
	}
	
//	@Test
	public void getStocks() {
		
		
		List<StockVo>	list	=dao.getStocks();
		assertNotNull(list);
	}
	
//	@Test
	public void priceChange() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("price", "10000");
		map.put("number", "1");
		dao.priceChange(map);
	}
//	@Test
	public void normalToStock() {
		Book_StatusVo vo = new Book_StatusVo();
		vo.setBook_seq("11");
		vo.setStatus_code("D");
		dao.normalToStock(vo);
		 
		 
	}
	
//	@Test
	public void addOrder() {
		OrderVo vo = new OrderVo();
		vo.setStock_number(11);
		vo.setUser_id(2);
		
		odao.addOrder(vo);
	}
	
//	@Test
	public void getAllOrder () {
		List<OrderVo> list	=odao.getAllOrder();
	assertNotNull(list);
	}

		

//	@Test
	public void getDetailOrder () {
		List<OrderVo> list	=odao.getDetailOrder("2");
		assertNotNull(list);
	}

//	@Test
	public void updateAddr () {
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("address", "우리집애 왜왔니");
		map.put("id", 2);
		odao.updateAddr(map);
		
	}
	
//	@Test
	public void delOrder() {
		
	int n=	odao.delOrder("1");
		assertEquals(1, n);
	}
	
	
//	@Test
	public void delOrders() {
		List<String> list = new ArrayList<String>();
		list.add("2");
		list.add("3");
		
			odao.delOrders(list);
		
	}
	
	

//	@Test
	public void booksDetail() {
		
		
List<StockVo> list	=dao.booksDetail("7");

			assertNotNull(list);
		
	}
	
//	@Test
	public void getOrderUser() {
		
	List<OrderVo>	list=odao.getOrderUser("2");
	
		assertNotNull(list);
	
	}
	
	
//	@Test
	public void searchBooks() {
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("column", "TITLE");
	map.put("title", "위화도");
	
	List<BookInfoVo> list	=sdao.searchBooks(map);
		
		assertEquals(1, list.size());
	
	}
	
//	@Test
	public void seachUser() {
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_name", "관리자");
		map.put("user_email", "social");
		
		List<UserVo> list	=sdao.searchUser(map);			
			
		assertNotNull(list);
		
		}
	
	
	
//	@Test
	public void Cron2() {
		
		List<Book_StatusVo> lists = service.selectStockable();
		StockVo vo = new StockVo();//insert 
		for (Book_StatusVo book_seq : lists) {
			String bookSeq=	book_seq.getBook_seq();
			vo.setBook_seq(Integer.parseInt(bookSeq));
			int n =	service.addStock(vo);
		}
//	int m=	service.normalToStocks(list);
		
//		System.out.println(m);
	}
	
	@Test 
	public void getSellableStock() {
	List<StockVo>	list=	dao.getSellableStock();
		assertNotNull(list);
	}
	

	
	
}
