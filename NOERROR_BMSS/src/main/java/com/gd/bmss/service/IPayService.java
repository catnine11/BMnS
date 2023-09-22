package com.gd.bmss.service;

import java.util.List;
import java.util.Map;

import com.gd.bmss.vo.PayVo;
import com.gd.bmss.vo.UserVo;

public interface IPayService {

	public int insertPayInfoTrans(Map<String, Object> map, UserVo id);
	
	public int okPayStatusChange(String id);
	
	public List<UserVo> selectStatusNum2(int seq);
	
	public PayVo selectPayInfo(int seq);
	
	public int getPay();
	
	public List<UserVo> getAllPay(int id);
	
}
