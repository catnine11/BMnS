package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.StockVo;

public interface IStockService {
	

		/**
		 * 크론을 위한 메소드  실행순서 
		 * 1 selectStockable,addStock,3normalToStock
		 * @return
		 */
	public List<Book_StatusVo>selectStockable();
	public int addStock(StockVo seq);
	public int normalToStocks();
	
	/**
	 *  cronStock selectStockable과 normalToStocks를 합친것 
	 *  현재문제 업데이트보다 insert가 먼저 되야하는데 insert 도 selectStockable 이 필요함
	 * 
	 * 	 */
//	public int cronStock(StockVo seq);
	
	public int sellAble(Map<String, Object> map);
	public int sellAbleMany(List<Integer>stock_number );
	public int  stocksDel(Map<String, String[]> stock_number);
	public List<StockVo>getStocks();
	public int priceChange(Map<String, String> map);
	/**
	 * 일반 상태를 재고상태로 변경해주는  메소드
	 */

	

}
