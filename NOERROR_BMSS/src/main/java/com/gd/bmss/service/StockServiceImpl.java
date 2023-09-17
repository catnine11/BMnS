package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.bmss.mapper.IStockDao;
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
	@Transactional
	@Override
	public List<Book_StatusVo> selectStockable() {
		log.info("재고목록 조회 메소드 selectStockable");
		return dao.selectStockable();
	}

	/**
	 * 일반 상태를 재고상태로 변경해주는  메소드
	 */
	@Transactional
	@Override
	public int normalToStocks() {
		log.info("재고 조건을 만족하는 도서들의 일반 상태를 재고상태로 변경해주는  메소드 normalToStock");
		return dao.normalToStocks();
	}

	/**
	 * 재고목록 조건에 일치하는 도서를 재고목록에 추가해주는  메소드 
	 */
	@Transactional
	@Override
	public int addStock(StockVo seq) {
		log.info(" 재고목록 조건에 일치하는 도서를 재고목록에 추가해주는  메소드 addStock");
		return dao.addStock(seq);
	}

//	
//	@Override
//	public int cronStock(StockVo seq) {	
//	int n =	dao.normalToStocks();
//		
//		return 0;
//	}

	
	
	
	
	/**
	 * 재고 목록중 판매가능 여부를 판매 가능으로 변경
	 */
	@Override
	public int sellAble(Map<String, Object> map) {
		log.info("판매여부 변경 메소드 N->Y");
		return dao.sellAble(map);
	}

	@Override
	public int sellAbleMany(List<Integer> stock_number) {

		return dao.sellAbleMany(stock_number);
	}

	@Override
	public int stocksDel(Map<String, String[]> stock_number) {
		log.info("재고 다중삭제 메소드 ");
		return dao.stocksDel(stock_number);
	}

	@Override
	public List<StockVo> getStocks() {
		log.info("재고 조회 메소드");
		return dao.getStocks();
	}

	@Override
	public int priceChange(Map<String, String> map) {
		log.info("도서 판매가격 변경 매소드 ");
		return dao.priceChange(map);
	}


	
}
