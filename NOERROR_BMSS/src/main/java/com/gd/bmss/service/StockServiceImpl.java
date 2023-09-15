package com.gd.bmss.service;

import java.util.List;

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
	public int normalToStock(List<String> seq) {
		log.info("일반 상태를 재고상태로 변경해주는  메소드 normalToStock");
		return dao.normalToStock(seq);
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

	/**
	 * 재고 목록중 판매가능 여부를 판매 가능으로 변경
	 */
	@Override
	public int sellAble(String stock_number) {
		log.info("판매여부 변경 메소드 N->Y");
		return dao.sellAble(stock_number);
	}

	
	
}
