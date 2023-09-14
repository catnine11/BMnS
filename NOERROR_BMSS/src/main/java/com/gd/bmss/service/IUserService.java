package com.gd.bmss.service;

import com.gd.bmss.vo.UserVo;

public interface IUserService {

	public int joinUser(UserVo vo);
	
	public int joinSocial(UserVo vo);
	
}
