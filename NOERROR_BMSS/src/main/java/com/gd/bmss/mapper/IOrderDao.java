package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.OrderVo;

public interface IOrderDao {
	public int addOrder(OrderVo vo);
	 public List<OrderVo> getAllOrder();
	 public List<OrderVo> getDetailOrder(String id);
	 public int	updateAddr(Map<String, Object>map);
	 public int delOrder(String number);
	 public int delOrders(List<String>list);
}
