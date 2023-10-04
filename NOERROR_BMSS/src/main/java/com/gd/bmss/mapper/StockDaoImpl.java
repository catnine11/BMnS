package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.BookInfoVo;
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
	public int normalToStocks() {
			int n=sql.update(NS+"normalToStocks");
		return n; 
	}

	
	@Override
	public int addStock(StockVo seq) {
		int n =	sql.insert(NS+"addStock",seq);
		return n;
	}


	@Override
	public int stocksDel(List<String> stock_number) {
	int n=	sql.delete(NS+"stocksDel",stock_number);
		return n;
	}


	@Override
	public List<StockVo> getStocks() {
	List<StockVo>	list =sql.selectList(NS+"getStocks");
		return list;
	}
@Override
	public int priceChange(Map<String, String> map) {
		int n =sql.update(NS+"priceChange",map);
	return n;
	}


@Override
public boolean normalToStock(Book_StatusVo vo) {
		int n=sql.update(NS+"normalToStock",vo);
	return (n>0)?true:false;
}




@Override
public List<StockVo> booksDetail(String seq) {
List<StockVo> lists =	sql.selectList(NS+"booksDetail",seq);
	
	return lists;
}


@Override
public int addStocks(List<String> list) {
int n =	sql.insert(NS+"addStocks",list);
	return n;
}

@Override
	public List<StockVo> getInStock() {
	List<StockVo> list =		sql.selectList(NS+"getInStock");
	return list;
	}

/*
 * 유저가 판매 목록을 조회
 */
@Override
public List<BookInfoVo> getSellableStock() {
		List<BookInfoVo>	list	=sql.selectList(NS+"getSellableStock");
	return list;
}


@Override
public List<BookInfoVo> getSalesDetail(String seq) {
	
	return sql.selectList(NS+"getSalesDetail",seq);
}


@Override
public List<BookInfoVo> sellStockPaging(Map<String, Object> map) {
List<BookInfoVo> list	=sql.selectList(NS+"sellStockPaging",map);
	return list;
}


@Override
public List<StockVo> inStockPaging(Map<String, Object> map) {
	List<StockVo> list	=sql.selectList(NS+"inStockPaging",map);
	return list;
}

//@Override
//public List<StockVo> normalToStockst() {
//		sql.update(NS+"normalToStocks")	;
//	List<StockVo> updatedStockList = sql.selectList(NS + "normalToStocks");
//	return updatedStockList;
//}
}
