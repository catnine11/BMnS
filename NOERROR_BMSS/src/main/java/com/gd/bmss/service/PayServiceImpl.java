package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.bmss.mapper.IPayDao;
import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PayServiceImpl implements IPayService {

	@Autowired
	private IPayDao dao;
	
	@Override
	@Transactional(readOnly = true)
	public int insertPayInfoTrans(Map<String, Object> map,UserVo id) {
		log.info("@@@@@@@@@@@@@@@@@@@ 결제정보 입력, 결제대기상태 변경 insertPayInfoTrans @@@@@@@@@@@@@@@@@@@");
		int n = dao.insertPayInfo(map);
		log.info("@@@@@@@@@@@@@인서트 성공?{}@@@@@@@@@@@@@@",n);
		int m = dao.payStatusChange(id);
		log.info("@@@@@@@@@@@@@업데이트 성공?{}@@@@@@@@@@@@@@",m);
		return (n>0 || m>0)?dao.getPay():0;
	}

	@Override
	public int okPayStatusChange(String id) {
		log.info("@@@@@@@@@@@@@@@@@@@ 결제완료상태 변경 okPayStatusChange @@@@@@@@@@@@@@@@@@@");
		return dao.okPayStatusChange(id);
	}

	@Override
	public List<UserVo> selectStatusNum2(int seq) {
		log.info("@@@@@@@@@@@@@@@@@@@ 관리자->회원결제대기상태 조회 selectStatusNum2 @@@@@@@@@@@@@@@@@@@");
		return dao.selectStatusNum2(seq);
	}
	
	@Override
	public PayVo selectPayInfo(int seq) {
		log.info("@@@@@@@@@@@@@@@@@@@ 현재결제내역조회 selectPayInfo @@@@@@@@@@@@@@@@@@@");
		return dao.selectPayInfo(seq);
	}

	@Override
	public int getPay() {
		return dao.getPay();
	}
	
	@Override
	public List<UserVo> getAllPay(int id) {
		log.info("@@@@@@@@@@@@@@@@@@@ 결제내역리스트조회 getAllPay @@@@@@@@@@@@@@@@@@@");
		return dao.getAllPay(id);
	}

}
