package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.Book_StatusVo;
import com.gd.bmss.vo.StockVo;

@Repository
public class StockDaoImpl implements IStockDao {

	
private final String NS="com.gd.bmss.mapper.StockDaoImpl.";
	
	
	@Autowired
	private SqlSessionTemplate sql;


	@Override
	public List<Book_StatusVo> selectStockable() {
		List<Book_StatusVo>	lists=	sql.selectList(NS+"selectStockable");
		return lists;
	}


	@Override
	public int normalToStock(List<String> seq) {
			int n=sql.update(NS+"normalToStock",seq);
		return n; 
	}


	@Override
	public int addStock(StockVo seq) {
		int n =	sql.insert(NS+"addStock",seq);
		return n;
	}


	@Override
	public int sellAble(String stock_number) {
	int n =	sql.update(NS+"sellAble",stock_number);
		return n;
	}


	@Override
	public int sellAbleMany(List<Integer> stock_number) {
	int n =		sql.update(NS+"sellAbleMany",stock_number);
		return n ;
	}


	@Override
	public int stocksDel(Map<String, String[]> stock_number) {
	int n=	sql.delete(NS+"stocksDel",stock_number);
		return n;
	}

}
