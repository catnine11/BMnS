package com.gd.bmss.mapper;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gd.bmss.vo.OrderVo;

@Repository
public class OrderDaoImpl implements IOrderDao{
	private final String NS="com.gd.bmss.mapper.OrderDaoImpl.";

	@Autowired
	private SqlSessionTemplate sql;
	@Override
	public int addOrder(OrderVo vo) {
		int n =sql.insert(NS+"addOrder",vo);
		return n;
	}
	@Override
	public List<OrderVo> getAllOrder() {
		List<OrderVo> list	=sql.selectList(NS+"getAllOrder");
		
		return list;
	}
	@Override
	public List<OrderVo> getDetailOrder(String id) {
		List<OrderVo> list	=sql.selectList(NS+"getDetailOrder",id);
		return list;
	}
	@Override
	public int updateAddr(Map<String, Object> map) {
			int n=sql.update(NS+"updateAddr",map);
			return n;
	}
	@Override
	public int delOrder(String number) {
	int n=	sql.delete(NS+"delOrder",number);
		return n;
	}
	@Override
	public int delOrders(List<String> list) {
		int n= sql.delete(NS+"delOrders",list) ;
		return n;
	}
	





	
	
	
}
