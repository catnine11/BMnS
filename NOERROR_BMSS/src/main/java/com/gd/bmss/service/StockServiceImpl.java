package com.gd.bmss.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.IStockDao;
import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.StockVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StockServiceImpl implements IStockService {
	
	@Autowired
	private IStockDao dao;
	/**
	 * 재고목록의 조건을 만족하는 도서를 조회하는 메소드
	 */
	@Override
	public List<Book_StatusVo> selectStockable() {
		log.info("재고목록 조회 메소드 selectStockable");
		return dao.selectStockable();
	}

	/**
	 * 일반 상태를 재고상태로 변경해주는  메소드
	 */
	@Override
	public int normalToStocks() {
		log.info("재고 조건을 만족하는 도서들의 일반 상태를 재고상태로 변경해주는  메소드 normalToStock");
		return dao.normalToStocks();
	}

	/**
	 * 재고목록 조건에 일치하는 도서를 재고목록에 추가해주는  메소드 
	 */
	@Override
	public int addStock(StockVo seq) {
		log.info(" 재고목록 조건에 일치하는 도서를 재고목록에 추가해주는  메소드 addStock");
		return dao.addStock(seq);
	}

	
	

	@Override
	public int stocksDel(List<String>  stock_number) {
		log.info("관리자 재고 다중삭제 메소드  stocksDel");
		return dao.stocksDel((List<String>) stock_number);
	}

	@Override
	public List<StockVo> getStocks() {
		log.info("관리자 재고 조회 메소드 getStocks");
		return dao.getStocks();
	}

	@Override
	public int priceChange(Map<String, String> map) {
		log.info("도서 판매가격 변경 매소드 priceChange ");
		return dao.priceChange(map);
	}

	@Override
	public int cron() {
		log.info("재고대상 목록으로 도서가 추가되는 스케쥴러  cron");
		List<Book_StatusVo> lists = dao.selectStockable();
		StockVo vo = new StockVo();//insert
		int cnt=0;
		for (Book_StatusVo book_seq : lists) {
			String bookSeq=	book_seq.getBook_seq();
			vo.setBook_seq(Integer.parseInt(bookSeq));
			dao.addStock(vo);
			cnt++;
		}
		
		
		return cnt;
	}

	@Override
	public List<StockVo> getInStock() {
		log.info(" 관리자가 재고 대상 도서목록을 조회하는 메소드 getInStock");
		return dao.getInStock();
	}

	@Override
	public List<BookInfoVo> getSellableStock() {
		log.info("회원이 판매중인 도서목록을 조회하는 메소드(동일한 이름의 도서 제거) getSellableStock");
		return dao.getSellableStock();
	}

	@Override
	public boolean normalToStock(Book_StatusVo vo) {
		log.info("관리자가 일반 상태의 도서를 재고 상태로 변경하는 메소드 normalToStock");
		return dao.normalToStock(vo);
	}

	@Override
	public List<StockVo> booksDetail(String seq) {
		log.info("관리자가 재고상태인 도서목록을 조회하는 메소드(동일도서 조회 SPA) booksDetail");
		return dao.booksDetail(seq);
	}

	@Override
	public List<BookInfoVo> getSalesDetail(String seq) {
		log.info("회원이 판매중인 도서목록을 상세 조회하는 메소드(동일도서 조회) getSalesDetail");
		return dao.getSalesDetail(seq);
	}

	@Override
	public List<BookInfoVo> sellStockPaging(Map<String, Object> map) {
		log.info("회원이 판매중인 도서목록을 조회하는 메소드(동일한 이름의 도서 제거)+페이징 sellStockPaging");
		return dao.sellStockPaging(map);
	}

	@Override
	public List<StockVo> inStockPaging(Map<String, Object> map) {
		log.info("관리자가 재고 대상 도서목록을 조회하는 메소드 inStockPaging");
		return dao.inStockPaging(map);
	}


	
}
