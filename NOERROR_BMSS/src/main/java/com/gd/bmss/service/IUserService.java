package com.gd.bmss.service;

import java.util.Map;

import com.gd.bmss.vo.UserVo;

public interface IUserService {

	public int joinUser(UserVo vo);
	
	public int joinSocial(UserVo vo);
	
	public UserVo login(Map<String, Object> map);
	
}
