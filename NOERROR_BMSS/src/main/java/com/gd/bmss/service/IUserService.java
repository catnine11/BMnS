package com.gd.bmss.service;

import java.util.Map;

import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

public interface IUserService {

	public int joinUser(UserVo vo);
	
	public int joinSocial(SocialVo vo);
	
	public UserVo login(Map<String, Object> map);
	
	public int getSId(SocialVo vo);
	
	public int updateRetoken(SocialVo vo);
	
}
