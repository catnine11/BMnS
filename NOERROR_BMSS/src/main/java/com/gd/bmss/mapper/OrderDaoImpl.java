package com.gd.bmss.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.Book_StatusVo;

@Repository
public class OrderDaoImpl implements IOrderDao{
	private final String NS="com.gd.bmss.mapper.OrderDaoImpl.";
	
	
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
	public int addStock(List<String> seq) {
		int n =	sql.insert(NS+"addStock",seq);
		return n;
	}





	
	
	
}
