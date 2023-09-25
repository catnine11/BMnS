package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.BookInfoVo;
import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.StockVo;

public interface IStockDao {
	
	public List<Book_StatusVo>selectStockable();
	public int addStock(StockVo book_seq);
	public int addStocks(List<String> list);
	public int normalToStocks();
	public List<StockVo>getInStock();
//	public List<StockVo> normalToStockst();
//	public List<StockVo> addStock(StockVo book_seq);
//	
	public List<BookInfoVo>getSellableStock();
	
	public int sellAble(Map<String, Object> map);
	public int sellAbleMany(List<Integer>stock_number );
	public int  stocksDel(List<String> stock_number);
	public List<StockVo>getStocks();
	public int priceChange(Map<String, String> map);
	
	public boolean normalToStock(Book_StatusVo vo);
	
	public List<StockVo> booksDetail(String seq);
	public List<BookInfoVo> getSalesDetail(String seq);
	
	
}
