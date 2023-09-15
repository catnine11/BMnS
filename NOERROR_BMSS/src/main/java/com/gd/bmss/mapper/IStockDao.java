package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.StockVo;

public interface IStockDao {
	
	public List<Book_StatusVo>selectStockable();
	public int normalToStock(List<String>book_seq);
	public int addStock(StockVo book_seq);
	public int sellAble(String stock_number);
	public int sellAbleMany(List<Integer>stock_number );
	public int  stocksDel(Map<String, String[]> stock_number);
	

}
