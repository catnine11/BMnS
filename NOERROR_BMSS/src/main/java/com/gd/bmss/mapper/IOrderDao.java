package com.gd.bmss.mapper;

import java.util.List;

import com.gd.bmss.vo.Book_StatusVo;

public interface IOrderDao {
	

	public List<Book_StatusVo>selectStockable();
	public int normalToStock(List<String>seq);
	public int addStock(List<String> seq);
	
	//리스트로 

}
