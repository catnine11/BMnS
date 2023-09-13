package com.gd.bmss.mapper;

import com.gd.bmss.vo.SocialVo;
import com.gd.bmss.vo.UserVo;

public interface IUserDao {

	//회원가입
		public int joinUser(UserVo vo);
		
		public int joinSocial(SocialVo vo);
		
}
