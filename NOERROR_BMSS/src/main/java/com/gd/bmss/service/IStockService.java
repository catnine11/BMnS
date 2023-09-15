package com.gd.bmss.service;

import java.util.List;

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
	public int normalToStock(List<String>seq);
	public int sellAble(String  stock_number);

}
