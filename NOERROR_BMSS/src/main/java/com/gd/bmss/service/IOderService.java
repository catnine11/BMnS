package com.gd.bmss.service;

import java.util.List;

import com.gd.bmss.vo.OrderVo;

public interface IOderService {

	public int addOrder(OrderVo vo);
	 public List<OrderVo> getAllOrder();
	 public List<OrderVo> getDetailOrder(String id);
	 public int delOrder(String number);
	 public int delOrders(List<String>list);
	 public List<OrderVo> getOrderUser(String seq);


}
