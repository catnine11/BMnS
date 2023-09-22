package com.gd.bmss.mapper;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.UserVo;

public interface IPayDao {
	
	//결제정보 입력
	public int insertPayInfo(Map<String, Object> map);
	//결제시 결제대기상태 변경
	public int payStatusChange(UserVo id);
	//관리자승인시 결제완료 변경
	public int okPayStatusChange(String id);
	//관리자 결제대기상태 조회
	public List<UserVo> selectStatusNum2(int seq);
	//현재결제내역조회
	public PayVo selectPayInfo(int seq);
	//PayVo의 max(seq)조회
	public int getPay();
	//결제내역조회리스트
	public List<UserVo> getAllPay(int id);
}
