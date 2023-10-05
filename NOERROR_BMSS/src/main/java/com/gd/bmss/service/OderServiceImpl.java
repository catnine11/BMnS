package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.bmss.mapper.IOrderDao;
import com.gd.bmss.vo.OrderVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OderServiceImpl implements IOderService {

	@Autowired
	private IOrderDao dao;
	
	@Override
	public int addOrder(OrderVo vo) {
		log.info("회원이 주문목록에(장바구니) 도서를 추가하는 메소드 addOrder ");
		return dao.addOrder(vo);
	}

	@Override
	public List<OrderVo> getAllOrder() {
		log.info("관리자가 모든 유저들의 주문목록을 조회하는 메소드  getAllOrder");
		return dao.getAllOrder();
	}

	@Override
	public List<OrderVo> getDetailOrder(String id) {
		log.info(" 관리자가 유저의 ID <a>를 클릭해 한 유저의 주문 목록만 조회하는 메소드 getDetailOrder");
		return dao.getDetailOrder(id);
	}


	@Override
	public int delOrder(String number) {
		log.info("유저가 주문목록을 삭제하는 메소드 (단일삭제)delOrder");
		return dao.delOrder(number);
	}

	@Override
	public int delOrders(List<String> list) {
		log.info("유저가 주문목록을 삭제하는 메소드 (다중삭제)delOrder");

		return dao.delOrders(list);
	}

	@Override
	public List<OrderVo> getOrderUser(String seq) {
		log.info("유저가 주문대기 상태의 주문목록을 조회하는 메소드 delOrders ");
		return dao.getOrderUser(seq);
	}



}
